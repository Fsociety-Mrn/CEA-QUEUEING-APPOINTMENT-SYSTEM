import os
import jwt
import os
from time import sleep
from datetime import datetime, timedelta
from dotenv import load_dotenv


"""
TOKEN FORMAT
{

    "sub": "username"
    "aud": "orders"
    
    "iss": "http://localhost"
    "iat": "issue at the time
    "exp": "expiration of the token"
    "scope": "read"
}
"""


class JWT:
    def __init__(self):
        load_dotenv()
        self.SECRET_KEY = os.environ.get("SECRET")
        
    # Generate the ID JWT token
    def generate_ID_token(self,payload={},algorithm="HS256"):
        token_encoded = jwt.encode(payload, self.SECRET_KEY, algorithm=algorithm)
        return token_encoded
    
    # Generate the refresh JWT token
    def generate_refresh_token(self,payload=None,algorithm="HS256", days=7):
        
        # Note: refresh token valid for 7 to 30 days
        payload=payload
        
        # issuer
        payload["iss"] = "http://localhost"
        
        # issue at the time
        payload["iat"] = datetime.utcnow()
        
        # expiration
        payload["exp"] = datetime.utcnow() + timedelta(days=days)
        
        # scope
        payload["scope"] = "read and write"
        
        # jwt token generated
        token_encoded = jwt.encode(payload, self.SECRET_KEY, algorithm=algorithm)
        return token_encoded
    
        
    # Generate the access JWT token
    def generate_access_token(self,payload={},algorithm="HS256",minutes=15):
        
        # Note: refresh token valid for 7 to 30 days
        payload=payload
        
        # issuer
        payload["iss"] = "http://localhost"
        
        # issue at the time
        payload["iat"] = datetime.utcnow()
        
        # add expiration
        payload["exp"] = datetime.utcnow() + timedelta(minutes=minutes)
        
        # scope
        payload["scope"] = "read and write"
        
        # jwt token generated
        token_encoded = jwt.encode(payload, self.SECRET_KEY, algorithm=algorithm)
        return token_encoded
    
    # verify jwt token
    def verify_jwt_token(self,token=None,algorithms="HS256"):

        # Verify the JWT token and return the payload if valid.

        try:
            payload = jwt.decode(token, self.SECRET_KEY, algorithms=algorithms)
            print("verify_jwt_token: " , payload)
            
            return {
                    "status": False,
                    "message": "token is valid",
                    "decoded data: " : payload
                }
            
        except jwt.ExpiredSignatureError:
            # Token has expired
            print("Token has expired.")
            
            return {
                "status": True,
                "message": "token is expired"
            }
            
        except jwt.InvalidTokenError:
            
            # Token is invalid
            print("Invalid token.")
            
            return {
                "status": True,
                "message": "invalid token"
            }
        
        
# access = JWT().generate_access_token(payload={"data":"helllofriend"})
# print(access)