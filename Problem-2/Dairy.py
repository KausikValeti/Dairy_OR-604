# -*- coding: utf-8 -*-
"""
Created on Fri Sep  6 12:13:45 2019

@author: vkaus
"""

import pandas as pd
from gurobipy import *
import sqlite3

conn = sqlite3.connect('dairy.db')
cursor=conn.cursor()
data1=[]
data1=pd.read_csv(r'feedstock.csv')
data1.rename(columns={'Calving Month':'cal_month','Feed Cost ($/yr)':'feed_cost'},inplace=True)
data1['feed_cost']=data1['feed_cost'].str.replace('[\$,]','',regex=True).astype(float)
data1 = data1.values.tolist()

data2=[]
data2=pd.read_csv(r'demand_price.csv')
data2.rename(columns={'Month':'demand_month','demand (gal)':'milk_demand','price ($/gal)':'milk_sales_price'},inplace=True)
data2['milk_sales_price']=data2['milk_sales_price'].str.replace('[\$,]','',regex=True).astype(float)
data2 = data2.values.tolist()

data3=[]
data3=pd.read_csv(r'production.csv')
data3.rename(columns={'Unnamed: 0':'cal_months', 'Unnamed: 13':'0'},inplace=True)
data3.drop(['cal_months','0'],axis=1,inplace=True)
data3=data3.values.tolist()


cursor.execute('CREATE TABLE IF NOT EXISTS tblfeedstock(cal_month integer,feed_cost float)')
cursor.executemany('INSERT INTO tblfeedstock VALUES(?,?)',data1)

cursor.execute('CREATE TABLE IF NOT EXISTS tbldemandprice(demand_month integer,milk_demand integer,milk_sales_price float)')
cursor.executemany('INSERT INTO tbldemandprice VALUES(?,?,?)',data2)

cursor.execute('CREATE TABLE IF NOT EXISTS tblproduction(D_1 float,D_2 float,D_3 float,D_4 float,D_5 float,D_6 float,D_7 float,D_8 float,D_9 float,D_10 float,D_11 float,D_12 float)')
cursor.executemany('INSERT INTO tblproduction VALUES(?,?,?,?,?,?,?,?,?,?,?,?)',data3)

cursor.execute('SELECT feed_cost FROM tblfeedstock')
rows_fc = cursor.fetchall()
cursor.execute('SELECT cal_month FROM tblfeedstock')
rows_cm = cursor.fetchall()
cursor.execute('SELECT demand_month FROM tbldemandprice')
rows_dm=cursor.fetchall()
cursor.execute('SELECT milk_demand FROM tbldemandprice')
rows_md=cursor.fetchall()
cursor.execute('SELECT milk_sales_price FROM tbldemandprice')
rows_msp=cursor.fetchall()
cursor.execute('SELECT * FROM tblproduction')
rows_p=cursor.fetchall()
conn.commit()
conn.close()


abc=dict()


from itertools import chain
rows_fc=list(chain.from_iterable(rows_fc))
rows_cm=list(chain.from_iterable(rows_cm))
rows_md=list(chain.from_iterable(rows_md))
rows_msp=list(chain.from_iterable(rows_msp))
rows_dm=list(chain.from_iterable(rows_dm))
rows_p=pd.DataFrame(list(rows_p))

abc['feed_cost'] = rows_fc
abc['milk_demand'] = rows_md
abc['milk_sales_price'] = rows_msp
abc['milk_production']=rows_p

abc

#Creating a Model
dairy=Model()
dairy.update()

#Creating Indexes

cal_months = range(1,13)
demand_months= range(1,13)

days = {1:31, 2:28, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30, 12:31}

#Decision  

no_of_cows={}
excess_milk_gallons={}
shortage_milk_gallons={}

for c in cal_months:
    no_of_cows[c]=dairy.addVar(obj=abc['feed_cost'][c-1],vtype=GRB.CONTINUOUS,name=f'xcows_C{c}')
    
    
for d in demand_months:
    excess_milk_gallons[d]=dairy.addVar(obj=0.2*abc['milk_sales_price'][d-1],vtype=GRB.CONTINUOUS,name=f'excess_C{d}')
    
    
for d in demand_months:
    shortage_milk_gallons[d]=dairy.addVar(obj=abc['milk_sales_price'][d-1],vtype=GRB.CONTINUOUS,name=f'shortage_C{d}')
       
    
#Constraints

my_const={}
    
for d in demand_months:
    cname=f'milk_d_{d}'
    my_const[cname]=dairy.addConstr(quicksum(abc['milk_production'][c-1][d-1]*days[d]*no_of_cows[c] for c in cal_months) -  excess_milk_gallons[d] + shortage_milk_gallons[d] == abc['milk_demand'][d-1],name=cname)
            
    
dairy.update()
dairy.write('dairy.lp')  
dairy.optimize()
dairy.write('dairy.sol')


if dairy.Status == GRB.OPTIMAL:
    conn = sqlite3.connect('dairy.db')
    cursor=conn.cursor()
    dairy_sol=[]
    for v in no_of_cows:
        if no_of_cows[v].x >0:
            a=(v, no_of_cows[v].x)
            dairy_sol.append(a)


cursor.execute('CREATE TABLE IF NOT EXISTS tbldairy(Calving_Month integer, No_of_Cows float)')
cursor.executemany('INSERT INTO tbldairy VALUES(?,?)', dairy_sol)
cursor.execute('SELECT * FROM tbldairy')
rows = cursor.fetchall() 
print(rows)
conn.commit()
conn.close()




