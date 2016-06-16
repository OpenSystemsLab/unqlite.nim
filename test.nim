import unqlite



var db = newUnQLite("test.db")
db.open()


db.store("test", "hello world")

db.close()
