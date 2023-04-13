import streamlit as st
import pandas as pd
import pyodbc

server = 'LAPTOP-9CQAHHJ1'
database = 'FinalProject'
driver = 'ODBC Driver 17 for SQL Server'
conn = pyodbc.connect('DRIVER={'+driver+'};SERVER='+server+';DATABASE='+database+';Trusted_Connection=yes;')
cursor = conn.cursor()


st.title('Bus Tour Database Management System')
st.subheader('Bus')


def create_bus(manufacturer, Seating_capacity, maximum_speed, fuel_type, fuel_efficiency):
    try:
        cursor.execute("INSERT INTO Bus (manufacturer, Seating_capacity, maximum_speed, fuel_type, fuel_efficiency) VALUES (?, ?, ?, ?, ?)", manufacturer, Seating_capacity, maximum_speed, fuel_type, fuel_efficiency)
        conn.commit()
        st.success("Bus details successfully added!")
    except Exception as e:
        st.error(f"Error creating Bus: {e}")

def read_bus(busid):
    try:
        cursor.execute("SELECT * FROM Bus WHERE bus_id = ?", busid)
        result = cursor.fetchone()
        if result:
            df = pd.DataFrame([list(result)], columns=['bus_id', 'manufacturer', 'Seating_capacity', 'maximum_speed', 'fuel_type', 'fuel_efficiency'])
            st.table(df)
        else:
            st.warning("Bus not found.")
    except Exception as e:
        st.error(f"Error reading Bus: {e}")

def update_bus(busid, manufacturer, Seating_capacity, maximum_speed, fuel_type, fuel_efficiency):
    try:
        cursor.execute("UPDATE Bus SET manufacturer = ?, Seating_capacity = ?, maximum_speed = ?, fuel_type = ?, fuel_efficiency = ? WHERE bus_id = ?", manufacturer, Seating_capacity, maximum_speed, fuel_type, fuel_efficiency, busid)
        conn.commit()
        st.success("Bus updated!")
    except Exception as e:
        st.error(f"Error updating Bus: {e}")

def delete_bus(busid):
    try:
        cursor.execute("DELETE FROM Bus WHERE bus_id = ?", busid)
        conn.commit()
        st.success("Bus deleted!")
    except Exception as e:
        st.error(f"Error deleting Bus: {e}")

def read_buses():
    try:
        cursor.execute("SELECT * FROM Bus")
        result = cursor.fetchall()
        # print(result)
        if result:
            for row in result:
                df  = pd.DataFrame([list(row)], columns=['bus_id', 'manufacturer', 'Seating_capacity', 'maximum_speed', 'fuel_type', 'fuel_efficiency'])
                st.table(df)
        else:
            st.warning("No Buses available")
    except Exception as e:
        st.error(f"Error reading Bus: {e}")


option = st.radio('Select the operation', ["Create", "Read", "Update", "Delete", "Read All"])

if option == "Create":
    manufacturer = st.text_input("Manufacturer:")
    Seating_capacity = st.number_input("Seating Capacity:")
    maximum_speed = st.number_input("Maximum Speed:", min_value=10)
    fuel_type = st.text_input("Fuel Type:")
    fuel_efficiency = st.text_input("Fuel Efficiency:")
    if st.button("Create Bus"):
        create_bus(manufacturer, Seating_capacity, maximum_speed, fuel_type, fuel_efficiency)

elif option == "Read":
    busid = st.number_input("Enter Bus ID:")
    if st.button("View Bus"):
        read_bus(busid)

elif option == "Update":
    busid = st.number_input("Enter Bus ID:")
    manufacturer = st.text_input("Manufacturer Name:")
    Seating_capacity = st.number_input("Seating capacity:")
    maximum_speed = st.number_input("Maximum Speed:")
    fuel_type = st.text_input("Fuel Type:")
    fuel_efficiency = st.text_input("Fuel Efficiency:")
    if st.button("Update Bus"):
        update_bus(busid, manufacturer, Seating_capacity, maximum_speed, fuel_type, fuel_efficiency)

elif option == "Delete":
    busid = st.number_input("Enter Bus ID:")
    if st.button("Delete Bus"):
        delete_bus(busid)

elif option == "Read All":
    if st.button("View Buses"):
        read_buses()