from flask import Flask, jsonify, request
import mongoengine as mongo 
from models import Note

mongo.connect("tododb")
app = Flask(__name__)


@app.route("/todo",methods = ['GET','POST'])
def notes():
	print (request.method)
	if request.method == 'GET':
		result = [note.export_data() for note in Note.objects.all()]
		return jsonify({"success":True, "results": result}) 

	if request.method == 'POST':
		
		try:
			note = Note()
			note.import_data(request.json)
			note.save()
		except Exception as ex:
			return jsonify({"success":False, "message":"cannot save note : " + str(ex)})
		
		return jsonify({"success":True, "results": str(note.id)})


@app.route("/todo/<object_id>")
def get_note(object_id):
	try : 
		note = Note.objects.get(pk = object_id)
	except : 
		return jsonify({"success":False, "message": "cannot find the note"})

	return jsonify(note.export_data())

@app.route("/todo/<object_id>", methods=["DELETE"])
def delete_note(object_id):
	try : 
		note = Note.objects.get(pk = object_id)
	except : 
		return jsonify({"success":False, "message":"cannot find the note"})

	note.delete()
	return jsonify({"success":"true"})






@app.route("/")
def hello():
    return "Hello World!"

if __name__ == "__main__":
    app.run(debug=True)