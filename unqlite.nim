{.compile: "private/unqlite.c".}

## # Standard UnQLite return values
const
  UNQLITE_OK* = 0
  UNQLITE_NOMEM* = -1           ## # Out of memory
  UNQLITE_ABORT* = -10          ## # User callback request an operation abort
  UNQLITE_IOERR* = -2           ## # IO error
  UNQLITE_CORRUPT* = -24        ## # Corrupted pointer
  UNQLITE_LOCKED* = -4          ## # Locked operatio
  UNQLITE_BUSY* = -14           ## # Busy operation
  UNQLITE_DONE* = -28           ## # Not an error
  UNQLITE_PERM* = -19           ## # Permission error
  UNQLITE_NOTIMPLEMENTED* = -17 ## # Operation not implemented
  UNQLITE_NOTFOUND* = -6         ## # Item not found
  UNQLITE_NOOP* = -20            ## # No-op
  UNQLITE_INVALID* = -9          ## # Invalid parameter
  UNQLITE_EOF* = -18             ## # End of input
  UNQLITE_UNKNOWN* = -13         ## # Unknown error
  UNQLITE_LIMIT* = -7            ## # Limit reached
  UNQLITE_EXISTS* = -11          ## # Item exists
  UNQLITE_EMPTY* = -3            ## # Empty field
  UNQLITE_COMPILE_ERR* = (- 70)  ## # Compilation error
  UNQLITE_VM_ERR* = (- 71)       ## # Virtual machine error
  UNQLITE_FULL* = (- 73)         ## # Full database (unlikely)
  UNQLITE_CANTOPEN* = (- 74)     ## # Unable to open the database file
  UNQLITE_READ_ONLY* = (- 75)    ## # Read only Key/Value storage engine
  UNQLITE_LOCKERR* = (- 76)      ## # Locking protocol error

  UNQLITE_CONFIG_JX9_ERR_LOG* = 1
  UNQLITE_CONFIG_MAX_PAGE_CACHE* = 2
  UNQLITE_CONFIG_ERR_LOG* = 3
  UNQLITE_CONFIG_KV_ENGINE* = 4
  UNQLITE_CONFIG_DISABLE_AUTO_COMMIT* = 5
  UNQLITE_CONFIG_GET_KV_NAME* = 6

  UNQLITE_VM_CONFIG_OUTPUT* = 1
  UNQLITE_VM_CONFIG_IMPORT_PATH* = 2
  UNQLITE_VM_CONFIG_ERR_REPORT* = 3
  UNQLITE_VM_CONFIG_RECURSION_DEPTH* = 4
  UNQLITE_VM_OUTPUT_LENGTH* = 5
  UNQLITE_VM_CONFIG_CREATE_VAR* = 6
  UNQLITE_VM_CONFIG_HTTP_REQUEST* = 7
  UNQLITE_VM_CONFIG_SERVER_ATTR* = 8
  UNQLITE_VM_CONFIG_ENV_ATTR* = 9
  UNQLITE_VM_CONFIG_EXEC_VALUE* = 10
  UNQLITE_VM_CONFIG_IO_STREAM* = 11
  UNQLITE_VM_CONFIG_ARGV_ENTRY* = 12
  UNQLITE_VM_CONFIG_EXTRACT_OUTPUT* = 13

  UNQLITE_KV_CONFIG_HASH_FUNC* = 1
  UNQLITE_KV_CONFIG_CMP_FUNC* = 2

  UNQLITE_LIB_CONFIG_USER_MALLOC* = 1
  UNQLITE_LIB_CONFIG_MEM_ERR_CALLBACK* = 2
  UNQLITE_LIB_CONFIG_USER_MUTEX* = 3
  UNQLITE_LIB_CONFIG_THREAD_LEVEL_SINGLE* = 4
  UNQLITE_LIB_CONFIG_THREAD_LEVEL_MULTI* = 5
  UNQLITE_LIB_CONFIG_VFS* = 6
  UNQLITE_LIB_CONFIG_STORAGE_ENGINE* = 7
  UNQLITE_LIB_CONFIG_PAGE_SIZE* = 8

  UNQLITE_OPEN_READONLY* = 0x00000001
  UNQLITE_OPEN_READWRITE* = 0x00000002
  UNQLITE_OPEN_CREATE* = 0x00000004
  UNQLITE_OPEN_EXCLUSIVE* = 0x00000008
  UNQLITE_OPEN_TEMP_DB* = 0x00000010
  UNQLITE_OPEN_NOMUTEX* = 0x00000020
  UNQLITE_OPEN_OMIT_JOURNALING* = 0x00000040
  UNQLITE_OPEN_IN_MEMORY* = 0x00000080
  UNQLITE_OPEN_MMAP* = 0x00000100

  UNQLITE_SYNC_NORMAL* = 0x00000002
  UNQLITE_SYNC_FULL* = 0x00000003
  UNQLITE_SYNC_DATAONLY* = 0x00000010

  UNQLITE_LOCK_NONE* = 0
  UNQLITE_LOCK_SHARED* = 1
  UNQLITE_LOCK_RESERVED* = 2
  UNQLITE_LOCK_PENDING* = 3
  UNQLITE_LOCK_EXCLUSIVE* = 4

  UNQLITE_ACCESS_EXISTS* = 0
  UNQLITE_ACCESS_READWRITE* = 1
  UNQLITE_ACCESS_READ* = 2

  UNQLITE_CURSOR_MATCH_EXACT* = 1
  UNQLITE_CURSOR_MATCH_LE* = 2
  UNQLITE_CURSOR_MATCH_GE* = 3

  UNQLITE_CTX_ERR* = 1
  UNQLITE_CTX_WARNING* = 2
  UNQLITE_CTX_NOTICE* = 3

type
  unqlite* = distinct pointer
  unqlite_vm* = distinct pointer
  unqlite_value* = distinct pointer
  unqlite_kv_cursor* = distinct pointer
  unqlite_context* = distinct pointer


{.pragma: lib, importc, header: "../private/unqlite.h".}

proc unqlite_open*(ppDB: ptr unqlite; zFilename: string; iMode: uint): int {.lib.}
proc unqlite_config*(pDb: unqlite; nOp: int): int {.varargs, lib.}
proc unqlite_close*(pDb: unqlite): int {.lib.}
## # Key/Value (KV) Store Interfaces

proc unqlite_kv_store*(pDb: unqlite; pKey: string; nKeyLen: int; pData: auto;
                      nDataLen: int): int {.lib.}
proc unqlite_kv_append*(pDb: unqlite; pKey: string; nKeyLen: int; pData: auto;
                       nDataLen: int): int {.lib.}
proc unqlite_kv_store_fmt*(pDb: unqlite; pKey: pointer; nKeyLen: int;
                          zFormat: string): int {.varargs,lib.}
proc unqlite_kv_append_fmt*(pDb: unqlite; pKey: pointer; nKeyLen: int;
                           zFormat: string): int {.varargs,lib.}
proc unqlite_kv_fetch*(pDb: unqlite; pKey: string; nKeyLen: int; pBuf: auto;
    pBufLen: ptr int): int {.lib.}
  ## # in|out
proc unqlite_kv_fetch_callback*(pDb: unqlite; pKey: pointer; nKeyLen: int;
    xConsumer: proc (a2: pointer; a3: uint; a4: pointer): int; pUserData: pointer): int {.lib.}
proc unqlite_kv_delete*(pDb: unqlite; pKey: string; nKeyLen: int): int {.lib.}
proc unqlite_kv_config*(pDb: unqlite; iOp: int): int {.varargs,lib.}
## # Document (JSON) Store Interfaces powered by the Jx9 Scripting Language

proc unqlite_compile*(pDb: unqlite; zJx9: string; nByte: int;
                     ppOut: ptr unqlite_vm): int {.lib.}
proc unqlite_compile_file*(pDb: unqlite; zPath: string; ppOut: unqlite_vm): int {.lib.}
proc unqlite_vm_config*(pVm: unqlite_vm; iOp: int): int {.varargs,lib.}
proc unqlite_vm_exec*(pVm: unqlite_vm): int {.lib.}
proc unqlite_vm_reset*(pVm: unqlite_vm): int {.lib.}
proc unqlite_vm_release*(pVm: unqlite_vm): int {.lib.}
proc unqlite_vm_dump*(pVm: unqlite_vm; xConsumer: proc (a2: pointer; a3: uint;
    a4: pointer): int; pUserData: pointer): int {.lib.}
proc unqlite_vm_extract_variable*(pVm: unqlite_vm; zVarname: string): unqlite_value {.lib.}
## #  Cursor Iterator Interfaces

proc unqlite_kv_cursor_init*(pDb: unqlite; ppOut: unqlite_kv_cursor): int {.lib.}
proc unqlite_kv_cursor_release*(pDb: unqlite; pCur: unqlite_kv_cursor): int {.lib.}
proc unqlite_kv_cursor_seek*(pCursor: unqlite_kv_cursor; pKey: pointer;
                            nKeyLen: int; iPos: int): int {.lib.}
proc unqlite_kv_cursor_first_entry*(pCursor: unqlite_kv_cursor): int {.lib.}
proc unqlite_kv_cursor_last_entry*(pCursor: unqlite_kv_cursor): int {.lib.}
proc unqlite_kv_cursor_valid_entry*(pCursor: unqlite_kv_cursor): int {.lib.}
proc unqlite_kv_cursor_next_entry*(pCursor: unqlite_kv_cursor): int {.lib.}
proc unqlite_kv_cursor_prev_entry*(pCursor: unqlite_kv_cursor): int {.lib.}
proc unqlite_kv_cursor_key*(pCursor: unqlite_kv_cursor; pBuf: pointer;
                           pnByte: ptr int): int {.lib.}
proc unqlite_kv_cursor_key_callback*(pCursor: unqlite_kv_cursor; xConsumer: proc (
    a2: pointer; a3: uint; a4: pointer): int; pUserData: pointer): int {.lib.}
proc unqlite_kv_cursor_data*(pCursor: unqlite_kv_cursor; pBuf: pointer;
                            pnData: ptr int): int {.lib.}
proc unqlite_kv_cursor_data_callback*(pCursor: unqlite_kv_cursor; xConsumer: proc (
    a2: pointer; a3: uint; a4: pointer): int; pUserData: pointer): int {.lib.}
proc unqlite_kv_cursor_delete_entry*(pCursor: unqlite_kv_cursor): int {.lib.}
proc unqlite_kv_cursor_reset*(pCursor: unqlite_kv_cursor): int {.lib.}
## # Manual Transaction Manager

proc unqlite_begin*(pDb: unqlite): int {.lib.}
proc unqlite_commit*(pDb: unqlite): int {.lib.}
proc unqlite_rollback*(pDb: unqlite): int {.lib.}
## # Utility interfaces

proc unqlite_util_load_mmaped_file*(zFile: string; ppMap: ptr pointer;
                                   pFileSize: ptr int): int {.lib.}
proc unqlite_util_release_mmaped_file*(pMap: pointer; iFileSize: int): int {.lib.}
proc unqlite_util_random_string*(pDb: unqlite; zBuf: string; buf_size: uint): int {.lib.}
proc unqlite_util_random_num*(pDb: unqlite): uint {.lib.}
## # In-process extending interfaces

proc unqlite_create_function*(pVm: unqlite_vm; zName: string; xFunc: proc (
    a2: unqlite_context; a3: int; a4: unqlite_value): int;
                             pUserData: pointer): int {.lib.}
proc unqlite_delete_function*(pVm: unqlite_vm; zName: string): int {.lib.}
proc unqlite_create_constant*(pVm: unqlite_vm; zName: string; xExpand: proc (
    a2: unqlite_value; a3: pointer); pUserData: pointer): int {.lib.}
proc unqlite_delete_constant*(pVm: unqlite_vm; zName: string): int {.lib.}
## # On Demand Object allocation interfaces

proc unqlite_vm_new_scalar*(pVm: unqlite_vm): unqlite_value {.lib.}
proc unqlite_vm_new_array*(pVm: unqlite_vm): unqlite_value {.lib.}
proc unqlite_vm_release_value*(pVm: unqlite_vm; pValue: unqlite_value): int {.lib.}
proc unqlite_context_new_scalar*(pCtx: unqlite_context): unqlite_value {.lib.}
proc unqlite_context_new_array*(pCtx: unqlite_context): unqlite_value {.lib.}
proc unqlite_context_release_value*(pCtx: unqlite_context;
                                   pValue: unqlite_value) {.lib.}
## # Dynamically Typed Value Object Management Interfaces

proc unqlite_value_int*(pVal: unqlite_value; iValue: int): int {.lib.}
proc unqlite_value_int64*(pVal: unqlite_value; iValue: int): int {.lib.}
proc unqlite_value_bool*(pVal: unqlite_value; iBool: int): int {.lib.}
proc unqlite_value_null*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_double*(pVal: unqlite_value; Value: cdouble): int {.lib.}
proc unqlite_value_string*(pVal: unqlite_value; zString: string; nLen: int): int {.lib.}
proc unqlite_value_string_format*(pVal: unqlite_value; zFormat: string): int {.
    varargs,lib.}
proc unqlite_value_reset_string_cursor*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_resource*(pVal: unqlite_value; pUserData: pointer): int {.lib.}
proc unqlite_value_release*(pVal: unqlite_value): int {.lib.}
## # Foreign Function Parameter Values

proc unqlite_value_to_int*(pValue: unqlite_value): int {.lib.}
proc unqlite_value_to_bool*(pValue: unqlite_value): int {.lib.}
proc unqlite_value_to_int64*(pValue: unqlite_value): int {.lib.}
proc unqlite_value_to_double*(pValue: unqlite_value): cdouble {.lib.}
proc unqlite_value_to_string*(pValue: unqlite_value; pLen: ptr int): string {.lib.}
proc unqlite_value_to_resource*(pValue: unqlite_value): pointer {.lib.}
proc unqlite_value_compare*(pLeft: unqlite_value; pRight: unqlite_value;
                           bStrict: int): int {.lib.}
## # Setting The Result Of A Foreign Function

proc unqlite_result_int*(pCtx: unqlite_context; iValue: int): int {.lib.}
proc unqlite_result_int64*(pCtx: unqlite_context; iValue: int): int {.lib.}
proc unqlite_result_bool*(pCtx: unqlite_context; iBool: int): int {.lib.}
proc unqlite_result_double*(pCtx: unqlite_context; Value: cdouble): int {.lib.}
proc unqlite_result_null*(pCtx: unqlite_context): int {.lib.}
proc unqlite_result_string*(pCtx: unqlite_context; zString: string; nLen: int): int {.lib.}
proc unqlite_result_string_format*(pCtx: unqlite_context; zFormat: string): int {.
    varargs,lib.}
proc unqlite_result_value*(pCtx: unqlite_context; pValue: unqlite_value): int {.lib.}
proc unqlite_result_resource*(pCtx: unqlite_context; pUserData: pointer): int {.lib.}
## # Dynamically Typed Value Object Query Interfaces

proc unqlite_value_is_int*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_is_float*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_is_bool*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_is_string*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_is_null*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_is_numeric*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_is_callable*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_is_scalar*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_is_json_array*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_is_json_object*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_is_resource*(pVal: unqlite_value): int {.lib.}
proc unqlite_value_is_empty*(pVal: unqlite_value): int {.lib.}
## # JSON Array/Object Management Interfaces

proc unqlite_array_fetch*(pArray: unqlite_value; zKey: string; nByte: int): unqlite_value {.lib.}
proc unqlite_array_walk*(pArray: unqlite_value; xWalk: proc (
    a2: unqlite_value; a3: unqlite_value; a4: pointer): int; pUserData: pointer): int {.lib.}
proc unqlite_array_add_elem*(pArray: unqlite_value; pKey: unqlite_value;
                            pValue: unqlite_value): int {.lib.}
proc unqlite_array_add_strkey_elem*(pArray: unqlite_value; zKey: string;
                                   pValue: unqlite_value): int {.lib.}
proc unqlite_array_count*(pArray: unqlite_value): int {.lib.}
## # Call Context Handling Interfaces

proc unqlite_context_output*(pCtx: unqlite_context; zString: string; nLen: int): int {.lib.}
proc unqlite_context_output_format*(pCtx: unqlite_context; zFormat: string): int {.
    varargs,lib.}
proc unqlite_context_throw_error*(pCtx: unqlite_context; iErr: int; zErr: string): int {.lib.}
proc unqlite_context_throw_error_format*(pCtx: unqlite_context; iErr: int;
                                        zFormat: string): int {.varargs,lib.}
proc unqlite_context_random_num*(pCtx: unqlite_context): uint {.lib.}
proc unqlite_context_random_string*(pCtx: unqlite_context; zBuf: string;
                                   nBuflen: int): int {.lib.}
proc unqlite_context_user_data*(pCtx: unqlite_context): pointer {.lib.}
proc unqlite_context_push_aux_data*(pCtx: unqlite_context; pUserData: pointer): int {.lib.}
proc unqlite_context_peek_aux_data*(pCtx: unqlite_context): pointer {.lib.}
proc unqlite_context_result_buf_length*(pCtx: unqlite_context): uint {.lib.}
proc unqlite_function_name*(pCtx: unqlite_context): string {.lib.}
## # Call Context Memory Management Interfaces

proc unqlite_context_alloc_chunk*(pCtx: unqlite_context; nByte: uint;
                                 ZeroChunk: int; AutoRelease: int): pointer {.lib.}
proc unqlite_context_realloc_chunk*(pCtx: unqlite_context; pChunk: pointer;
                                   nByte: uint): pointer {.lib.}
proc unqlite_context_free_chunk*(pCtx: unqlite_context; pChunk: pointer) {.lib.}
## # Global Library Management Interfaces

proc unqlite_lib_config*(nConfigOp: int): int {.varargs,lib.}
proc unqlite_lib_init*(): int {.lib.}
proc unqlite_lib_shutdown*(): int {.lib.}
proc unqlite_lib_is_threadsafe*(): int {.lib.}
proc unqlite_lib_version*(): string {.lib.}
proc unqlite_lib_signature*(): string {.lib.}
proc unqlite_lib_ident*(): string {.lib.}
proc unqlite_lib_copyright*(): string {.lib.}



type
  UnQLite* = object
    db: unqlite
    isMemory: bool
    isOpen: bool
    filename: string
    flags: uint

  UnQLiteError* = Exception

proc open*(self: var UnQLite)
proc close*(self: var UnQLite)

proc newUnQLite*(filename = ":mem:", flags = UNQLITE_OPEN_CREATE, open = false): UnQLite =
  result.filename = filename
  result.flags = flags.uint
  result.isMemory = filename == ":mem:"
  if open:
    result.open()

proc getPtr*(self: UnQLite): unqlite =
  return self.db

proc check(ret: int) =
  if ret == UNQLITE_OK:
    return

  var msg: string

  case ret:
  of -1:
    msg = "Out of memory"
  of -10:
    msg = "User callback request an operation abort"
  of -2:
    msg = "IO error"
  of -24:
    msg = "Corrupted pointer"
  of -4:
    msg = "Locked operation"
  of -14:
    msg = "Busy operation"
  of -28:
    msg = "Not an error"
  of -19:
    msg = "Permission error"
  of -17:
    msg ="Operation not implemented"
  of -6:
    msg = "Item not found"
  of -20:
    msg = "No-op"
  of -9:
    msg = "Invalid parameter"
  of -18:
    msg = "End of input"
  of -13:
    msg = "Unknown error"
  of -7:
    msg = "Limit reached"
  of -11:
    msg = "Item exists"
  of -3:
    msg = "Empty field"
  of -70:
    msg = "Compilation error"
  of -71:
    msg = "Virtual machine error"
  of -73:
    msg = "Full database (unlikely)"
  of -74:
    msg = "Unable to open the database file"
  of -75:
    msg = "Read only Key/Value storage engine"
  of -76:
    msg = "Locking protocol error"
  else:
    msg = "Unknown error"

  raise newException(UnQLiteError, msg)

proc error(ret: int) =
  check(ret)


proc open(self: var UnQLite) =
  if self.isOpen:
    self.close()

  check(unqlite_open(addr self.db, self.filename, self.flags))

  self.isOpen = true

proc close*(self: var UnQLite) =
  if self.isOPen:
    check(unqlite_close(self.db))
    self.isOpen = false

proc disableAutoCommit*(self: UnQLite) =
   if not self.isMemory:
     let ret = unqlite_config(self.db, UNQLITE_CONFIG_DISABLE_AUTO_COMMIT)
     if ret != UNQLITE_OK:
       raise newException(LibraryError, "'Error disabling autocommit for in-memory database")

proc store*(self: UnQLite, key: string, value: auto, vLen = -1) =
  when value is string:
    let vl = if vLen >= 0: vLen else: value.len
    check(unqlite_kv_store(self.db, key, -1, value, vl))
  else:
    let val = $value
    let vl = if vLen >= 0: vLen else: val.len
    check(unqlite_kv_store(self.db, key, -1, val, vl))

proc fetch*(self: UnQLite, key: string): string =
  var
    buf = ""
    bufSize: int

  check(unqlite_kv_fetch(self.db, key, -1, buf, addr bufSize))
  buf[0..<bufSize]

proc delete*(self: UnQLite, key: string) =
  check(unqlite_kv_delete(self.db, key, -1))

proc append*(self: UnQLite, key, value: string) =
  check(unqlite_kv_append(self.db, key, -1, value, value.len))

proc exists*(self: UnQLite, key: string): bool =
  var
    buf: string
    bufSize: ptr int
  let ret = unqlite_kv_fetch(self.db, key, -1, buf, bufSize)
  if ret == UNQLITE_OK:
    return true
  if ret == UNQLITE_NOT_FOUND:
    return false

  error(ret)
