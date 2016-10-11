import sys
import requests, json 
from PyQt5 import QtGui, QtQml, QtCore, QtWidgets
from PyQt5.QtCore import QAbstractListModel, QModelIndex, QStringListModel, QVariant, pyqtSlot, QObject



class TodoModel(QtCore.QAbstractListModel):

#-----------------------------------------------------
	def __init__(self, parent=None):
		super().__init__(parent)
		self.notes = []
		self.url   = "http://localhost:5000/todo"

#-----------------------------------------------------

	def rowCount(self,parent=QModelIndex()):
		return len(self.notes)
#-----------------------------------------------------

	def data(self, index,role):
		if not index.isValid():
			return QVariant()

		if index.row() < len(self.notes) :
			return QVariant()

		if role == QtCore.Qt.DisplayRole:
			return self.notes[index.row()].title

		if role == QtCore.Qt.CheckStateRole:
			return self.notes[index.row()].checked

		return QVariant()
#-----------------------------------------------------

	@pyqtSlot(int,result=QVariant)
	def get(self, index):
		if index < len(self.notes):
			return self.notes[index]
		return None
#-----------------------------------------------------

	@pyqtSlot(int,str,QVariant)
	def set(self, index, key, value):
		if index < len(self.notes):
			print("change ", key, value)
			self.notes[index][key] = value
			
		
#-----------------------------------------------------
	@pyqtSlot()
	def sync(self):
		print("sync")
		self.update()


#-----------------------------------------------------
	@pyqtSlot()
	def update(self):
		print("update")
		self.beginResetModel()
		self.notes.clear()
		try:
			resp = requests.get(url=self.url)
			data = resp.json()
		except:
			print("error getting data")
			return 

		self.notes = data["results"]

		self.endResetModel()



#-----------------------------------------------------
	@pyqtSlot()
	def add(self, title):
		try:
			resp = requests.post(self.url, data={"title":title})
		except Exeption as e:
			print(e)
			return 

		if resp.json().get("success") == True:
			self.beginResetModel()
			self.notes.append({"title":title, "checked": False})
			self.endResetModel()
	




if __name__ == "__main__":



	app = QtGui.QGuiApplication(sys.argv)
	engine = QtQml.QQmlApplicationEngine()

	
	test = QStringListModel()
	test.setStringList(["sacha","boby","test","allo"])

	model = TodoModel()
	print(model.roleNames())
	print(model.roleNames())

	
	engine.rootContext().setContextProperty("todoModel",model)
	engine.load(QtCore.QUrl("qml/app.qml"))

	sys.exit(app.exec_())
