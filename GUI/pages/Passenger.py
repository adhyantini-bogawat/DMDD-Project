import streamlit as st
import pandas as pd
import pyodbc

server = 'LAPTOP-9CQAHHJ1'
database = 'FinalProject'
driver = 'ODBC Driver 17 for SQL Server'
conn = pyodbc.connect('DRIVER={'+driver+'};SERVER='+server+';DATABASE='+database+';Trusted_Connection=yes;')
cursor = conn.cursor()


st.title('Bus Tour Database Management System')
st.subheader('Passenger')

# Define CRUD functions
def create_passenger(fname, lname, address, street_name, city, state, country, zipcode, phone, emailid, dob, gender, username, password):
    try:
        cursor.execute("INSERT INTO Passenger (fname, lname, address, street_name, city, state, country, zipcode, phone, emailid, dob, gender, username, password) VALUES (?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?)", fname, lname, address, street_name, city, state, country, zipcode, phone, emailid, dob, gender, username, password)
        conn.commit()
        st.success("Passenger Information Added Succesfully!")
    except Exception as e:
        st.error(f"Error creating Passenger: {e}")

def read_passenger(passengerid):
    try:
        cursor.execute("SELECT * FROM Passenger WHERE passenger_id = ?", passengerid)
        result = cursor.fetchone()
        if result:
            df = pd.DataFrame([list(result)], columns=['Passenger ID', 'fname', 'lname', 'address', 'street_name', 'city', 'state', 'country', 'zipcode', 'phone', 'emailid', 'dob', 'gender', 'username', 'password'])
            st.table(df)
        else:
            st.warning("Passenger information not found.")
    except Exception as e:
        st.error(f"Error reading passenger information: {e}")

def update_passenger(passengerid, fname, lname, address, street_name, city, state, country, zipcode, phone, emailid, dob, gender, username, password):
    try:
        cursor.execute("UPDATE Passenger SET fname = ?, lname = ?, address = ?, street_name = ?, city = ?, state = ?, country = ?, zipcode = ?, phone = ?, emailid = ?, dob = ? , gender = ? , username = ? , password = ?  WHERE passenger_id = ?", fname, lname, address, street_name, city, state, country, zipcode, phone, emailid, dob, gender, username, password, passengerid)
        conn.commit()
        st.success("Passenger information updated!")
    except Exception as e:
        st.error(f"Error updating passenger information: {e}")

def delete_passenger(passengerid):
    try:
        cursor.execute("DELETE FROM Passenger WHERE passenger_id = ?", passengerid)
        conn.commit()
        st.success("Passenger information deleted!")
    except Exception as e:
        st.error(f"Error deleting passenger information: {e}")

def find_by_name(name):
    try:
        cursor.execute("SELECT * FROM Passenger WHERE fname = ? OR lname = ?", name, name)
        result = cursor.fetchall()
        # print(result)
        if result:
            for row in result:
                df = pd.DataFrame([list(row)], columns=['Passenger ID', 'fname', 'lname', 'address', 'street_name', 'city', 'state', 'country', 'zipcode', 'phone', 'emailid', 'dob', 'gender', 'username', 'password'])
                st.table(df)
        else:
            st.warning("Passenger information not found.")
    except Exception as e:
        st.error(f"Error reading passenger information: {e}")


option = st.radio('Select the operation', ["Create", "Read", "Update", "Delete", "Read Passenger By Name"])

if option == "Create":
    fname = st.text_input("First Name")
    lname = st.text_input("Last Name")
    address = st.text_input("Address")
    street_name = st.text_input("Street Name")
    city = st.text_input("City")
    state  = st.text_input("State")
    country = st.text_input("Country")
    zipcode = st.number_input("Zipcode")
    phone = st.number_input("Phone")
    emailid = st.text_input("Email ID")
    dob = st.date_input("Date of Birth")
    gender = st.text_input("Gender")
    username = st.text_input("Username")
    password = st.text_input("Password")
    if st.button("Create Passenger"):
        create_passenger(fname, lname, address, street_name, city, state, country, zipcode, phone, emailid, dob, gender, username, password)

elif option == "Read":
    passengerid = st.text_input("Enter Passenger ID:")
    if st.button("View Passenger"):
        read_passenger(passengerid)

elif option == "Update":
    passengerid = st.number_input("Enter Passenger ID:")
    fname = st.text_input("First Name")
    lname = st.text_input("Last Name")
    address = st.text_input("Address")
    street_name = st.text_input("Street Name")
    city = st.text_input("City")
    state  = st.text_input("State")
    country = st.text_input("Country")
    zipcode = st.number_input("Zipcode")
    phone = st.number_input("Phone")
    emailid = st.text_input("Email ID")
    dob = st.date_input("Date of Birth")
    gender = st.text_input("Gender")
    username = st.text_input("Username")
    password = st.text_input("Password")
    if st.button("Update Passenger"):
        update_passenger(passengerid, fname, lname, address, street_name, city, state, country, zipcode, phone, emailid, dob, gender, username, password)

elif option == "Delete":
    passengerid = st.text_input("Enter Passenger ID:")
    if st.button("Delete Passenger"):
        delete_passenger(passengerid)

elif option == "Read Passenger By Name":
    fname = st.text_input("Enter name:")
    if st.button("Find Passengers"):
        find_by_name(fname)