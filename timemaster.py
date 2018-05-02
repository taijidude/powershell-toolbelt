#Das hier wird die Portierung von Timemaster auf Python
#parameter auswerten
import sys
import argparse
import sqlite3
from datetime import datetime

class DatabaseConnection: 
	def getNewId(self): 
		con = sqlite3.connect('tracking-data.db')
		con.close()
	
	def saveTask(self, task):
		print('Task wird gespeichert')
		
class Task: 
	def __init__(self, taskname, start, id):
		self.id = id
		self.taskname = taskname
		self.start = start
		self.stop = None
		
	def stopTracking(self):
		self.stop = datetime.today().time()
	
	def toString(self): 
		#Wenn die Variable gestoppt existiert, 
		if self.stop is None:
			print('test')
		return 'Beschreibung: '+self.taskname + ' ' + self.start

parser = argparse.ArgumentParser(description='Timemaster: Zeiterfassung für die Kommandozeile')
parser.add_argument('-t', '--task',required=True,nargs=1,dest='task')
args = parser.parse_args()
taskName = args.task[0] 
now = datetime.today()
task = Task(taskName, str(now), 1)
print(task.toString())
task.stopTracking()
print(task.toString())
con = DatabaseConnection()
con.saveTask(task)