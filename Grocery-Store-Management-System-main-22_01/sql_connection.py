import datetime
import mysql.connector

__cnx = None


def get_sql_connection():
    print("Opening mysql connection")
    global __cnx

    if __cnx is None:
        __cnx = mysql.connector.connect(
            user='root', password='your_password', database='your_database_name')
#use your password and database name.
    return __cnx
    
