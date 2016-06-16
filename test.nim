import unqlite

var
 i, rc: int
 db: ptr unqlite

echo unqlite_lib_copyright()

rc = unqlite_open(addr db, "test.db", UNQLITE_OPEN_CREATE)

if rc != UNQLITE_OK:
  echo "error: ", rc

var key = "test"
var data = "hello world"

rc = unqlite_kv_store(db, key, -1, data, 11)
if rc != UNQLITE_OK:
  echo "error: ", rc


#rc = unqlite_kv_store_fmt(pDb,"date",-1,"Current date: %d:%d:%d",2013,06,07);
# if( rc != UNQLITE_OK ){
#   //Insertion fail, Hande error (See below)
#   return;
# }

rc = unqlite_close(db)
if rc != UNQLITE_OK:
  echo "error: ", rc
