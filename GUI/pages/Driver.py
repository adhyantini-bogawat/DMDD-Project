import streamlit as st
import pandas as pd
import pyodbc

server = 'LAPTOP-9CQAHHJ1'
database = 'FinalProject'
driver = 'ODBC Driver 17 for SQL Server'
conn = pyodbc.connect('DRIVER={'+driver+'};SERVER='+server+';DATABASE='+database+';Trusted_Connection=yes;')
cursor = conn.cursor()


st.title('Bus Tour Database Management System')
st.subheader('Driver')

# Define CRUD functions
def create_driver(bus_id, name, house_no, street_name, zipcode, phone, dob, license_id, driving_exp):
    insert_query = cursor.execute("INSERT INTO Driver (bus_id, name, house_no, street_name, zipcode, phone, dob, license_id, driving_exp) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", bus_id, name, house_no, street_name, zipcode, phone, dob, license_id, driving_exp)
    # values = (emp_fname, emp_lname, emp_email, emp_phone, emp_street_address, emp_house_no, emp_city, emp_state, emp_zip, emp_gender, emp_designation)
    # cursor.execute(insert_query, values)
    conn.commit()
    st.success("Driver details successfully added!")

def view_driver(driver_id):
    cursor.execute("SELECT * FROM Driver WHERE driver_id = ?", driver_id)
    result = cursor.fetchone()
    if result:
        df = pd.DataFrame([list(result)], columns=['Driver ID', 'Bus Driven', 'Name', 'House No', 'Street Name', 'Zipcode', 'Phone', 'Date of Birth', 'Age', 'License ID', 'Driving Experience'])
        st.table(df)
    else:
        st.warning("Driver not found.")

def update_driver(driver_id, bus_id, name, house_no, street_name, zipcode, phone, dob, license_id, driving_exp):
    update_query = "UPDATE Driver SET bus_id = ?, name = ?, house_no = ?, street_name = ?, zipcode = ?, phone = ?, dob = ?, license_id = ?, driving_exp = ? WHERE driver_id = ?"
    values = (bus_id, name, house_no, street_name, zipcode, phone, dob, license_id, driving_exp, driver_id)
    cursor.execute(update_query, values)
    conn.commit()
    st.success("Driver updated successfully!")

def delete_driver(driver_id):
    delete_query = "DELETE FROM Driver WHERE driver_id = ?"
    cursor.execute(delete_query, (driver_id))
    conn.commit()
    st.warning("Driver details deleted successfully")


option = st.radio('Select the operation', ["Create", "Read", "Update", "Delete"])

if option == "Create":
    bus_id = st.number_input("Bus ID:")
    name = st.text_input("Name:")
    house_no = st.text_input("House Number:")
    street_name = st.text_input("Street Name:")
    zipcode = st.number_input("Zipcode:")
    phone = st.number_input("Phone:")
    dob = st.date_input("Date of Birth:")
    license_id = st.text_input("License ID:")
    driving_exp = st.number_input("Driving Experience:")

    if st.button("Add Driver"):
        create_driver(bus_id, name, house_no, street_name, zipcode, phone, dob, license_id, driving_exp)

elif option == "Read":
    driver_id = st.text_input("Enter Driver ID:")
    if st.button("View"):
        view_driver(driver_id)


elif option == "Update":
    driver_id = st.number_input("Driver ID:")
    bus_id = st.number_input("Bus ID:")
    name = st.text_input("Name:")
    house_no = st.text_input("House Number:")
    street_name = st.text_input("Street Name:")
    zipcode = st.number_input("Zipcode:")
    phone = st.number_input("Phone:")
    dob = st.date_input("Date of Birth:")
    license_id = st.text_input("License ID:")
    driving_exp = st.number_input("Driving Experience:")
    if st.button("Update"):
        update_driver(driver_id, bus_id, name, house_no, street_name, zipcode, phone, dob, license_id, driving_exp)

elif option == "Delete":
    driver_id = st.number_input("Enter Driver ID:")
    if st.button("Delete"):
        delete_driver(driver_id)