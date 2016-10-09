import sys
from PyQt5 import QtGui, QtQml, QtCore

if __name__ == "__main__":
	app = QtGui.QGuiApplication(sys.argv)
	engine = QtQml.QQmlApplicationEngine()
	engine.load(QtCore.QUrl("qml/app.qml"))

	sys.exit(app.exec_())
