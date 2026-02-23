import os
import mysql.connector
from mysql.connector import errorcode

from dotenv import dotenv_values
secrets = dotenv_values("c:/csd/csd-310/module-9/.env")
config = {
    "user": secrets["USER"],
    "password": secrets["PASSWORD"],
    "host": secrets["HOST"],
    "database": secrets["DATABASE"],
    "raise_on_warnings": True
}
try:
    db = mysql.connector.connect(**config)
    cursor = db.cursor()
    print("\n-- DISPLAYING Owner RECORDS --")
    cursor.execute("SELECT Owner_ID, First_Name, Last_Name, Phone_number, Address, City, Postal_Code, Email  FROM owners")
    owners = cursor.fetchall()
    for owners in owners:
        print(f"Owner ID: {owners[0]}")
        print(f"First Name: {owners[1]}")
        print(f"Last Name: {owners[2]}")
        print(f"Phone Number: {owners[3]}")
        print(f"Address: {owners[4]}")
        print(f"City: {owners[5]}")
        print(f"Postal Code: {owners[6]}")
        print(f"Email: {owners[7]}\n")

    print("\n-- DISPLAYING Employee RECORDS --")
    cursor.execute("SELECT employee_id, first_name, last_name, role_ID, dept_ID, address, city, postal_code, email FROM employees")
    employees = cursor.fetchall()
    for employees in employees:
        print(f"Employee ID: {employees[0]}")
        print(f"First Name: {employees[1]}")
        print(f"Last Name: {employees[2]}")
        print(f"role_ID: {employees[3]}")
        print(f"Dept ID: {employees[4]}")
        print(f"Address: {employees[5]}")
        print(f"City: {employees[6]}")
        print(f"Postal Code: {employees[7]}")
        print(f"Email: {employees[8]}\n")

    print("\n-- DISPLAYING Roles RECORDS --")
    cursor.execute("SELECT role_ID, role_title FROM roles")
    roles = cursor.fetchall()
    for roles in roles:
        print(f"Role ID: {roles[0]}")
        print(f"Role Title: {roles[1]}\n")

    print("\n-- DISPLAYING Departments RECORDS --")
    cursor.execute("SELECT department_ID, dept_name FROM departments")
    departments = cursor.fetchall()
    for departments in departments:
        print(f"Department ID: {departments[0]}")
        print(f"Department Name: {departments[1]}\n")

    print("\n-- DISPLAYING Suppliers RECORDS --")
    cursor.execute(
        "SELECT supplier_id, supplier_name, component_supplied, delivery_date, contact_name, phone_number, address, city, postal_code FROM suppliers")
    suppliers = cursor.fetchall()
    for suppliers in suppliers:
        print(f"Supplier ID: {suppliers[0]}")
        print(f"Supplier Name: {suppliers[1]}")
        print(f"Component Supplied: {suppliers[2]}")
        print(f"Delivery Date: {suppliers[3]}")
        print(f"Contact Name: {suppliers[4]}")
        print(f"Phone Number: {suppliers[5]}")
        print(f"Address: {suppliers[6]}")
        print(f"City: {suppliers[7]}")
        print(f"Postal Code: {suppliers[8]}\n")

    print("\n-- DISPLAYING Wine RECORDS --")
    cursor.execute("SELECT wine_ID, wine_name, brand, vintage, price_perCase FROM wine")
    wine = cursor.fetchall()
    for wine in wine:
        print(f"Wine ID: {wine[0]}")
        print(f"Wine Name: {wine[1]}")
        print(f"Brand: {wine[2]}")
        print(f"Vintage: {wine[3]}")
        print(f"Price Per Case: {wine[4]}\n")

    print("\n-- DISPLAYING Inventory RECORDS --")
    cursor.execute("SELECT inventory_ID, wine_ID, quantity_onHand, location, last_restockedDate, reorder_level FROM inventory")
    inventory = cursor.fetchall()
    for inventory in inventory:
        print(f"Inventory ID: {inventory[0]}")
        print(f"Wine ID: {inventory[1]}")
        print(f"Quantity On Hand: {inventory[2]}")
        print(f"Location: {inventory[3]}")
        print(f"Last Restocked Date: {inventory[4]}")
        print(f"Reorder Level: {inventory[5]}\n")

    print("\n-- DISPLAYING Distributors RECORDS --")
    cursor.execute("SELECT distributor_ID, wine_ID, distributor_name, quantity_shipped, shipment_date, contact_name, phone_number, region_served FROM distributors")
    distributors = cursor.fetchall()
    for distributors in distributors:
        print(f"Distributor ID: {distributors[0]}")
        print(f"Wine ID: {distributors[1]}")
        print(f"Distributor Name: {distributors[2]}")
        print(f"Quantity Shipped: {distributors[3]}")
        print(f"Shipment Date: {distributors[4]}")
        print(f"Contact Name: {distributors[5]}")
        print(f"Phone Number: {distributors[6]}")
        print(f"Region Served: {distributors[7]}\n")
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print(" The supplied username or password are invalid")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print(" The specified database does not exist")
    else:
       print(err)
finally:
     db.close()