import torch
import math 

from torchvision import datasets
from torch.utils.data import DataLoader
from facenet_pytorch import MTCNN,InceptionResnetV1



class Face_Recognition:
    
    def __init__(self):

        self.device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
        
        # face detection
        self.mtcnn  = MTCNN(image_size=160, margin=0, min_face_size=40,select_largest=False, device=self.device)
        
        # facial recognition
        self.facenet = InceptionResnetV1(pretrained='vggface2').eval().to(self.device)
        
        # load known faces data
        self.Saved_Data = torch.load('Jolo_Recognition/Model/data.pt', map_location='cpu')
        self.Embeding_List = self.Saved_Data[0]
        self.Name_List = self.Saved_Data[1]
    
    # convert threshold to percent 
    def __face_distance_to_conf(self,face_distance, face_match_threshold):
        if face_distance > face_match_threshold:
            range = (1.0 - face_match_threshold)
            linear_val = (1.0 - face_distance) / (range * 2.0)
            return linear_val
        else:
            range = face_match_threshold
            linear_val = 1.0 - (face_distance / (range * 2.0))
            return linear_val + ((1.0 - linear_val) * math.pow((linear_val - 0.5) * 2, 0.2)) 
                   
    # for face recognition
    def Face_Compare(self, Dataset_Folder="Jolo_Recognition/Registered-Faces", image=None,threshold=0.6):
        try:

            face2, prob = self.mtcnn(image, return_prob=True)
            
             # check if there is a detected face and has probability of 90%
            if face2 is None and prob < 0.90:
                return
            
            face2 = self.facenet(face2.unsqueeze(0))
            
            # define a function to collate data
            def collate_fn(x):
                return x[0]
            
            # locate the dataset of known faces
            dataset = datasets.ImageFolder(Dataset_Folder)

            # load the folder name in dataset
            label_names = {i: c for c, i in dataset.class_to_idx.items()}

            # load the dataset
            loader = DataLoader(dataset, batch_size=5, collate_fn=collate_fn,pin_memory=True)

            # create empty lists for storing embeddings and names
            name_list = []
            embedding_list = []

            for images, label in loader:

                with torch.no_grad():

                    # for facial detection level 2 --- Using MTCNN model
                    face, prob = self.mtcnn(images, return_prob=True)

                    # check if there is a detected face and has probability of 90%
                    if face is not None and prob > 0.90:
                        
                        # calculate face distance
                        emb = self.facenet(face.unsqueeze(0))

                        embedding_list.append(emb.detach())
                        name_list.append(label_names[label])
                        
                        dist = torch.dist(emb, face2).item()
                        
                        percent = self.__face_distance_to_conf(face_distance=dist,face_match_threshold=threshold) * 100
                    
                        
                        if dist < threshold:
                            return (label_names[label], percent)

            return ("No match detected", percent)

        except Exception as e:
            print(f"spam_detection - Error occurred while training the model: {str(e)}")
            return ("No match detected", None)


