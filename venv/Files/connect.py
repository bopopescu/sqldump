#!/usr/bin/python


import mysql.connector
from mysql.connector import MySQLConnection, CMySQLConnection


def con():
    mysql.connector.connect(user='root', password='',
                            host='127.0.0.1',
                            database='baufuchs')
    print("Connection established")


con()
