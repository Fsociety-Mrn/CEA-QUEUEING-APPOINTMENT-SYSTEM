import mysql.connector
import shutil
import os
from datetime import datetime

class MySQL_Database:
    def __init__(self):
        
        self.host = "localhost"
        self.user = "root"
        self.password = ""
        self.database = "queue"

    # Connection to the database
    # data = mysql.connector.connect(host=host, user=user, password=password, database=database)
    # cursor = data.cursor()  

    # Connection query to the database
    def __connection(self):
        try:
            connection_result = mysql.connector.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.database
            )
            cursor = connection_result.cursor()
            cursor.execute("SELECT VERSION()")
            result = cursor.fetchone()
            print(result)

            return connection_result

        except mysql.connector.Error as err:
            print("connection error:", err)
            return None
        
    # show all tables
    def __listOfTables(self, table_name):
        conn = self.__connection()
        cursor = conn.cursor()
        cursor.execute("SHOW TABLES")

        tables = [row[0] for row in cursor.fetchall()]
        cursor.close()
        conn.close()

        return table_name in tables

    # str(datetime.today().strftime('%Y-%m-%d'))
    def __create_table(self,table_name):
        try:
   
            conn = self.__connection()
            cursor = conn.cursor()
            
            cursor.execute(f"CREATE TABLE `{table_name}` (`id` INT NOT NULL AUTO_INCREMENT , `uid` VARCHAR(30000) NOT NULL , `name` VARCHAR(30000) NOT NULL , `timein` VARCHAR(30000) NOT NULL , `status` VARCHAR(30000) NOT NULL , PRIMARY KEY (`id`));")
            print("New table created")
            
            cursor.close()
            conn.close()
            
            return True
        except mysql.connector.Error as Err:
            print("__create_table: ",Err)
            return False
        
    # read specific data
    def __read_specific_Data(self,tableName,id_value,uid_value,status):
        try:

            conn = self.__connection()
            cursor = conn.cursor()

  
            # Delete the specified record from the HISTORY table
            read_query = f"SELECT * FROM `{tableName}` WHERE id = %s AND uid = %s"
            cursor.execute(read_query, (id_value, uid_value))
            data = cursor.fetchone()

            if data:
                cursor.close()
                conn.close()
                
                data = list(data)
                data[8] = status
                return tuple(data[1:])
        
            cursor.close()
            conn.close()
            print("No data")
            return None

        except mysql.connector.Error as err:
            
            print("Error:", err)
            cursor.close()
            conn.close()
            return None
        
    # read specific data
    def __read_specific_data_user(self,name):
        try:

            conn = self.__connection()
            cursor = conn.cursor()

            read_query = f"SELECT * FROM `users` WHERE id = %s"
            cursor.execute(read_query, (1,))
            data = cursor.fetchone()
            print(data)
            if data:
                cursor.close()
                conn.close()
                return data
        
            cursor.close()
            conn.close()
            print("No data")
            return None

        except mysql.connector.Error as err:
            
            print("Error:", err)
            cursor.close()
            conn.close()
            return None

    # insert specific data
    def __insert_specific_Data(self,tableName,Data):
        try:

            conn = self.__connection()
            cursor = conn.cursor()

            # Execute INSERT query
            insert_query = f"INSERT INTO `{tableName}` (`id`, `name`, `section`, `department`, `course`, `professor`, `date`, `uid`, `status`) VALUES (NULL, %s, %s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(insert_query, Data)

            # Commit the transaction
            conn.commit()
        
            cursor.close()
            conn.close()
            print("data inserted")
            return True

        except mysql.connector.Error as err:
            
            print("Error:", err)
            cursor.close()
            conn.close()
            return False
    
    # delete specific data
    def __delete_specific_Data(self,tableName,id_value,uid_value):
        try:

            conn = self.__connection()
            cursor = conn.cursor()

  
            # Delete the specified record from the HISTORY table
            delete_query = f"DELETE FROM `{tableName}` WHERE id = %s AND uid = %s"

            cursor.execute(delete_query, (id_value, uid_value))
            conn.commit()

            if cursor.rowcount > 0:
                cursor.close()
                conn.close()
                print("Data deleted successfully!")
                return "Data deleted successfully!"
        
            cursor.close()
            conn.close()
            print("No matching record found.")
            return "No matching record found."

        except mysql.connector.Error as err:
            
            print("Error:", err)
            cursor.close()
            conn.close()
            return err

    # create table for history
    def create_table_history(self,stereo):
        print("create table")
              
    def facial_login(self,name):
        print("hellofriend")
    
    # Login as admin
    def login_as_admin(self, username=None, password=None):
        try:
            conn = self.__connection()
            cursor = conn.cursor()
        
            # Check if username exists
            cursor.execute("SELECT `id` FROM users WHERE username=%s", (username,))
            user_id = cursor.fetchone()
        
            if not user_id:
                cursor.close()
                conn.close()
                return False,"user not found"
            
            # Consume the result set
            cursor.fetchall()
        
            # Check if password is correct
            cursor.execute("SELECT `id`,`username`,`name`,`birthday`,`sex`,`age` FROM users WHERE username=%s AND password=%s", (username, password))
            user_data = cursor.fetchone()  # Fetch the row if it exists


            if user_data:
           
                cursor.close()
                conn.close()
                return True,"login successful",user_data

            cursor.close()
            conn.close()
            return False,"invalid password",None
        
        except Exception as Err:
            print("login_as_admin:", Err)
            
            cursor.close()
            conn.close()
            
            return False,"invalid password",None
    
    # READ the appointment table
    def read_appointment(self,table):
        try:
            conn = self.__connection()
            cursor = conn.cursor(dictionary=True)
        
            # Select all rows from the HISTORY table
            select_query = f"SELECT * FROM `{table}`"
            cursor.execute(select_query)

            # Fetch all rows from the result set
            rows = cursor.fetchall()
            
            

            # Convert rows to array
             # Transform rows into JSON-like dictionaries
            data_list = [{
                'id': row['id'],
                'name': row['name'],
                'section': row['section'],
                'department': row['department'],
                'course': row['course'],
                'professor': row['professor'],
                'date': row['date'],
                'uid': row['uid'],
                'status': row['status']
            } for row in rows]

            cursor.close()
            conn.close()

            # Return the JSON response
            return rows

        except mysql.connector.Error as err:
            print("Error:", err)
            cursor.close()
            conn.close()
            return None

    # UPDATE the appointment table
    def update_appointment(self,uid_value,id_value,status):
        data = self.__read_specific_Data(
            tableName="fillup",
            uid_value=uid_value,
            id_value=id_value,
            status=status)
        
        self.__insert_specific_Data(Data=data,tableName="proceed")
        self.__delete_specific_Data(tableName="fillup",id_value=id_value,uid_value=uid_value)
    
    # create prof attendance 
    def create_table_or_insert(self,name):
        try:
            
            card_uid = self.__read_specific_data_user(name=name)

            date_today =str(datetime.today().strftime('%Y-%m-%d'))
            time_now = str(datetime.now().strftime("%I:%M %p"))
        
            # create table
            if not self.__listOfTables(table_name=date_today):
                self.__create_table(table_name=date_today)
        
            conn = self.__connection()
            cursor = conn.cursor()
            
            # Check if prof is already login
            cursor.execute(f"SELECT `id` FROM `{date_today}` WHERE name=%s", (str(name),))
            user_id = cursor.fetchone()
            
            print(user_id)
            if user_id:
                cursor.close()
                conn.close()
                print("use already login")
                return "user already login"
            
            # Consume the result set
            cursor.fetchall()
                
            # Execute INSERT query
            insert_query = f"INSERT INTO `{date_today}` (`id`, `uid`, `name`, `timein`, `status`) VALUES (NULL, %s, %s, %s, %s)"
            cursor.execute(insert_query, (name,card_uid[1],time_now,"In Office"))

            # Commit the transaction
            conn.commit()
        
            cursor.close()
            conn.close()
            print("data inserted")
            
            # insert table
            return "insert table successfully"
        except Exception as e:
            print("insert: ",e)
            return "error occur"

        
        
    
# data = MySQL_Database().read_specific_Data(tableName="fillup", id_value=26, uid_value="9Q")
# print(data)

MySQL_Database().create_table_or_insert(name="Hello Friend")

# MySQL_Database().delete_Data(tableName="fillup",id_value=26,uid_value="9Q")

