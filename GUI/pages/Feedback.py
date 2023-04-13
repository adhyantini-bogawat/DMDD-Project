import streamlit as st
import pandas as pd
import pyodbc

server = 'LAPTOP-9CQAHHJ1'
database = 'FinalProject'
driver = 'ODBC Driver 17 for SQL Server'
conn = pyodbc.connect('DRIVER={'+driver+'};SERVER='+server+';DATABASE='+database+';Trusted_Connection=yes;')
cursor = conn.cursor()


st.title('Bus Transportation Database Management System')
st.subheader('Feedback')

def create_feedback(ticket_id, comment, rating):
    try:
        cursor.execute("INSERT INTO Feedback (ticket_id, comment, rating) VALUES (?, ?, ?)", 
                       (ticket_id, comment, rating))
        conn.commit()
        st.success("Feedback added successfully!")
    except:
        conn.rollback()
        st.error("Error: Could not add feedback, please try again later.")

def read_feedback(ticketid):
    try:
        cursor.execute("SELECT * FROM Feedback WHERE ticket_id = ?", ticketid)
        result = cursor.fetchall()
        # print(result)
        if result:
            for row in result:
                df = pd.DataFrame([list(row)], columns=['Feedback ID', 'Ticket ID', 'Comment', 'Rating'])
                st.table(df)
        else:
            st.warning("No feedback found for the requested ticket ID")
    except Exception as e:
        st.error(f"Could not fetch feedback, please try again later: {e}")


# Define the Streamlit app interface
option = st.radio('Select the operation', ["Create", "Read"])

if option == "Create":
    ticket_id = st.number_input("Enter Ticket ID")
    comment = st.text_input("Comment")
    rating = st.slider('Rating', 0, 5, disabled=False)
    if st.button("Create feedback"):
        create_feedback(ticket_id, comment, rating)
        
elif option == "Read":
    ticketid = st.text_input("Enter Ticket ID:")
    if st.button("View Feedback"):
        read_feedback(ticketid)
