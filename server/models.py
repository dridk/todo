from mongoengine import * 


class Note(Document):
	title   = StringField(required=True, max_lengh=255)
	checked = BooleanField(required=True, default=False)

	def export_data(self):
		return {
		"id": str(self.id),
		"title" : self.title,
		"checked" : self.checked
		}

	def import_data(self, data):

		self.title   = data.get("title")
		self.checked = bool(data.get("checked", False))
