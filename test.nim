import unqlite

var db = newUnQLite(":mem:", open = true)

var
  key = ""
  value = ""

try:
#  for x in 1..100:
#    discard unqlite_util_random_string(db.getPtr(), key, 30)
#    discard unqlite_util_random_string(db.getPtr(), value, 255)
#    db.store(key, value, 255)
   db.store("test", "Hello world")
   echo db.fetch("test")
finally:
  db.close()
