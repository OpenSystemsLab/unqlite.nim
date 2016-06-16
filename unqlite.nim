## # This file was automatically generated.  Do not edit (Except for compile time directives)!

## #
## #  Symisc UnQLite: An Embeddable NoSQL (Post Modern) Database Engine.
## #  Copyright (C) 2012-2013, Symisc Systems http://unqlite.org/
## #  Version 1.1.6
## #  For information on licensing, redistribution of this file, and for a DISCLAIMER OF ALL WARRANTIES
## #  please contact Symisc Systems via:
## #        legal@symisc.net
## #        licensing@symisc.net
## #        contact@symisc.net
## #  or visit:
## #       http://unqlite.org/licensing.html
## #
## #
## #  Copyright (C) 2012, 2013 Symisc Systems, S.U.A.R.L [M.I.A.G Mrad Chems Eddine <chm@symisc.net>].
## #  All rights reserved.
## #
## #  Redistribution and use in source and binary forms, with or without
## #  modification, are permitted provided that the following conditions
## #  are met:
## #  1. Redistributions of source code must retain the above copyright
## #     notice, this list of conditions and the following disclaimer.
## #  2. Redistributions in binary form must reproduce the above copyright
## #     notice, this list of conditions and the following disclaimer in the
## #     documentation and/or other materials provided with the distribution.
## #
## #  THIS SOFTWARE IS PROVIDED BY SYMISC SYSTEMS ``AS IS'' AND ANY EXPRESS
## #  OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
## #  WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR
## #  NON-INFRINGEMENT, ARE DISCLAIMED.  IN NO EVENT SHALL SYMISC SYSTEMS
## #  BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
## #  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
## #  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
## #  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
## #  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
## #  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
## #  IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
## #
## # $SymiscID: unqlite.h v1.1 UNIX|WIN32/64 2012-11-02 02:10 stable <chm@symisc.net> $


{.compile: "private/unqlite.c".}

## # Standard UnQLite return values
const
  UNQLITE_OK* = 0

## # Beginning of error codes

const
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

## # end-of-error-codes

## #
## #  Database Handle Configuration Commands.
## #
## #  The following set of constants are the available configuration verbs that can
## #  be used by the host-application to configure an UnQLite database handle.
## #  These constants must be passed as the second argument to [unqlite_config()].
## #
## #  Each options require a variable number of arguments.
## #  The [unqlite_config()] interface will return UNQLITE_OK on success, any other
## #  return value indicates failure.
## #  For a full discussion on the configuration verbs and their expected
## #  parameters, please refer to this page:
## #       http://unqlite.org/c_api/unqlite_config.html
## #

const
  UNQLITE_CONFIG_JX9_ERR_LOG* = 1
  UNQLITE_CONFIG_MAX_PAGE_CACHE* = 2
  UNQLITE_CONFIG_ERR_LOG* = 3
  UNQLITE_CONFIG_KV_ENGINE* = 4
  UNQLITE_CONFIG_DISABLE_AUTO_COMMIT* = 5
  UNQLITE_CONFIG_GET_KV_NAME* = 6

## #
## #  UnQLite/Jx9 Virtual Machine Configuration Commands.
## #
## #  The following set of constants are the available configuration verbs that can
## #  be used by the host-application to configure the Jx9 (Via UnQLite) Virtual machine.
## #  These constants must be passed as the second argument to the [unqlite_vm_config()]
## #  interface.
## #  Each options require a variable number of arguments.
## #  The [unqlite_vm_config()] interface will return UNQLITE_OK on success, any other return
## #  value indicates failure.
## #  There are many options but the most importants are: UNQLITE_VM_CONFIG_OUTPUT which install
## #  a VM output consumer callback, UNQLITE_VM_CONFIG_HTTP_REQUEST which parse and register
## #  a HTTP request and UNQLITE_VM_CONFIG_ARGV_ENTRY which populate the $argv array.
## #  For a full discussion on the configuration verbs and their expected parameters, please
## #  refer to this page:
## #       http://unqlite.org/c_api/unqlite_vm_config.html
## #

const
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

## #
## #  Storage engine configuration commands.
## #
## #  The following set of constants are the available configuration verbs that can
## #  be used by the host-application to configure the underlying storage engine (i.e Hash, B+tree, R+tree).
## #  These constants must be passed as the first argument to [unqlite_kv_config()].
## #  Each options require a variable number of arguments.
## #  The [unqlite_kv_config()] interface will return UNQLITE_OK on success, any other return
## #  value indicates failure.
## #  For a full discussion on the configuration verbs and their expected parameters, please
## #  refer to this page:
## #       http://unqlite.org/c_api/unqlite_kv_config.html
## #

const
  UNQLITE_KV_CONFIG_HASH_FUNC* = 1
  UNQLITE_KV_CONFIG_CMP_FUNC* = 2

## #
## #  Global Library Configuration Commands.
## #
## #  The following set of constants are the available configuration verbs that can
## #  be used by the host-application to configure the whole library.
## #  These constants must be passed as the first argument to [unqlite_lib_config()].
## #
## #  Each options require a variable number of arguments.
## #  The [unqlite_lib_config()] interface will return UNQLITE_OK on success, any other return
## #  value indicates failure.
## #  Notes:
## #  The default configuration is recommended for most applications and so the call to
## #  [unqlite_lib_config()] is usually not necessary. It is provided to support rare
## #  applications with unusual needs.
## #  The [unqlite_lib_config()] interface is not threadsafe. The application must insure that
## #  no other [unqlite_*()] interfaces are invoked by other threads while [unqlite_lib_config()]
## #  is running. Furthermore, [unqlite_lib_config()] may only be invoked prior to library
## #  initialization using [unqlite_lib_init()] or [unqlite_init()] or after shutdown
## #  by [unqlite_lib_shutdown()]. If [unqlite_lib_config()] is called after [unqlite_lib_init()]
## #  or [unqlite_init()] and before [unqlite_lib_shutdown()] then it will return UNQLITE_LOCKED.
## #  For a full discussion on the configuration verbs and their expected parameters, please
## #  refer to this page:
## #       http://unqlite.org/c_api/unqlite_lib.html
## #

const
  UNQLITE_LIB_CONFIG_USER_MALLOC* = 1
  UNQLITE_LIB_CONFIG_MEM_ERR_CALLBACK* = 2
  UNQLITE_LIB_CONFIG_USER_MUTEX* = 3
  UNQLITE_LIB_CONFIG_THREAD_LEVEL_SINGLE* = 4
  UNQLITE_LIB_CONFIG_THREAD_LEVEL_MULTI* = 5
  UNQLITE_LIB_CONFIG_VFS* = 6
  UNQLITE_LIB_CONFIG_STORAGE_ENGINE* = 7
  UNQLITE_LIB_CONFIG_PAGE_SIZE* = 8

## #
## #  These bit values are intended for use in the 3rd parameter to the [unqlite_open()] interface
## #  and in the 4th parameter to the xOpen method of the [unqlite_vfs] object.
## #

const
  UNQLITE_OPEN_READONLY* = 0x00000001
  UNQLITE_OPEN_READWRITE* = 0x00000002
  UNQLITE_OPEN_CREATE* = 0x00000004
  UNQLITE_OPEN_EXCLUSIVE* = 0x00000008
  UNQLITE_OPEN_TEMP_DB* = 0x00000010
  UNQLITE_OPEN_NOMUTEX* = 0x00000020
  UNQLITE_OPEN_OMIT_JOURNALING* = 0x00000040
  UNQLITE_OPEN_IN_MEMORY* = 0x00000080
  UNQLITE_OPEN_MMAP* = 0x00000100

## #
## #  Synchronization Type Flags
## #
## #  When UnQLite invokes the xSync() method of an [unqlite_io_methods] object it uses
## #  a combination of these integer values as the second argument.
## #
## #  When the UNQLITE_SYNC_DATAONLY flag is used, it means that the sync operation only
## #  needs to flush data to mass storage.  Inode information need not be flushed.
## #  If the lower four bits of the flag equal UNQLITE_SYNC_NORMAL, that means to use normal
## #  fsync() semantics. If the lower four bits equal UNQLITE_SYNC_FULL, that means to use
## #  Mac OS X style fullsync instead of fsync().
## #

const
  UNQLITE_SYNC_NORMAL* = 0x00000002
  UNQLITE_SYNC_FULL* = 0x00000003
  UNQLITE_SYNC_DATAONLY* = 0x00000010

## #
## #  File Locking Levels
## #
## #  UnQLite uses one of these integer values as the second
## #  argument to calls it makes to the xLock() and xUnlock() methods
## #  of an [unqlite_io_methods] object.
## #

const
  UNQLITE_LOCK_NONE* = 0
  UNQLITE_LOCK_SHARED* = 1
  UNQLITE_LOCK_RESERVED* = 2
  UNQLITE_LOCK_PENDING* = 3
  UNQLITE_LOCK_EXCLUSIVE* = 4


## #
## #  Flags for the xAccess VFS method
## #
## #  These integer constants can be used as the third parameter to
## #  the xAccess method of an [unqlite_vfs] object.  They determine
## #  what kind of permissions the xAccess method is looking for.
## #  With UNQLITE_ACCESS_EXISTS, the xAccess method
## #  simply checks whether the file exists.
## #  With UNQLITE_ACCESS_READWRITE, the xAccess method
## #  checks whether the named directory is both readable and writable
## #  (in other words, if files can be added, removed, and renamed within
## #  the directory).
## #  The UNQLITE_ACCESS_READWRITE constant is currently used only by the
## #  [temp_store_directory pragma], though this could change in a future
## #  release of UnQLite.
## #  With UNQLITE_ACCESS_READ, the xAccess method
## #  checks whether the file is readable.  The UNQLITE_ACCESS_READ constant is
## #  currently unused, though it might be used in a future release of
## #  UnQLite.
## #

const
  UNQLITE_ACCESS_EXISTS* = 0
  UNQLITE_ACCESS_READWRITE* = 1
  UNQLITE_ACCESS_READ* = 2


## #
## #  Possible seek positions.
## #

const
  UNQLITE_CURSOR_MATCH_EXACT* = 1
  UNQLITE_CURSOR_MATCH_LE* = 2
  UNQLITE_CURSOR_MATCH_GE* = 3


## #
## #  UnQLite journal file suffix.
## #

## #
## #  Call Context - Error Message Serverity Level.
## #
## #  The following constans are the allowed severity level that can
## #  passed as the second argument to the [unqlite_context_throw_error()] or
## #  [unqlite_context_throw_error_format()] interfaces.
## #  Refer to the official documentation for additional information.
## #

const
  UNQLITE_CTX_ERR* = 1
  UNQLITE_CTX_WARNING* = 2
  UNQLITE_CTX_NOTICE* = 3

## #
## #  C-API-REF: Please refer to the official documentation for interfaces
## #  purpose and expected parameters.
## #
## # Database Engine Handle

type
  unqlite* {.pure, final, importc: "unqlite", header: "../private/unqlite.h".} = object
  unqlite_vm* {.pure, final, importc, header: "../private/unqlite.h".} = object
  unqlite_value* {.pure, final, importc, header: "../private/unqlite.h".} = object
  unqlite_kv_cursor* {.pure, final, importc, header: "../private/unqlite.h".} = object
  unqlite_context* {.pure, final, importc, header: "../private/unqlite.h".} = object

proc unqlite_open*(ppDB: ptr ptr unqlite; zFilename: cstring; iMode: cuint): cint {.
    importc: "unqlite_open", header: "../private/unqlite.h".}
proc unqlite_config*(pDb: ptr unqlite; nOp: cint): cint {.varargs,
    importc: "unqlite_config", header: "../private/unqlite.h".}
proc unqlite_close*(pDb: ptr unqlite): cint {.importc: "unqlite_close",
    header: "../private/unqlite.h".}
## # Key/Value (KV) Store Interfaces

proc unqlite_kv_store*(pDb: ptr unqlite; pKey: string; nKeyLen: cint; pData: string;
                      nDataLen: int64): cint {.importc: "unqlite_kv_store",
    header: "../private/unqlite.h".}
proc unqlite_kv_append*(pDb: ptr unqlite; pKey: pointer; nKeyLen: cint; pData: pointer;
                       nDataLen: int64): cint {.
    importc: "unqlite_kv_append", header: "../private/unqlite.h".}
proc unqlite_kv_store_fmt*(pDb: ptr unqlite; pKey: pointer; nKeyLen: cint;
                          zFormat: cstring): cint {.varargs,
    importc: "unqlite_kv_store_fmt", header: "../private/unqlite.h".}
proc unqlite_kv_append_fmt*(pDb: ptr unqlite; pKey: pointer; nKeyLen: cint;
                           zFormat: cstring): cint {.varargs,
    importc: "unqlite_kv_append_fmt", header: "../private/unqlite.h".}
proc unqlite_kv_fetch*(pDb: ptr unqlite; pKey: pointer; nKeyLen: cint; pBuf: pointer;
    pBufLen: ptr int64): cint {.importc: "unqlite_kv_fetch",
                                    header: "../private/unqlite.h".}
  ## # in|out
proc unqlite_kv_fetch_callback*(pDb: ptr unqlite; pKey: pointer; nKeyLen: cint;
    xConsumer: proc (a2: pointer; a3: cuint; a4: pointer): cint; pUserData: pointer): cint {.
    importc: "unqlite_kv_fetch_callback", header: "../private/unqlite.h".}
proc unqlite_kv_delete*(pDb: ptr unqlite; pKey: pointer; nKeyLen: cint): cint {.
    importc: "unqlite_kv_delete", header: "../private/unqlite.h".}
proc unqlite_kv_config*(pDb: ptr unqlite; iOp: cint): cint {.varargs,
    importc: "unqlite_kv_config", header: "../private/unqlite.h".}
## # Document (JSON) Store Interfaces powered by the Jx9 Scripting Language

proc unqlite_compile*(pDb: ptr unqlite; zJx9: cstring; nByte: cint;
                     ppOut: ptr ptr unqlite_vm): cint {.importc: "unqlite_compile",
    header: "../private/unqlite.h".}
proc unqlite_compile_file*(pDb: ptr unqlite; zPath: cstring; ppOut: ptr ptr unqlite_vm): cint {.
    importc: "unqlite_compile_file", header: "../private/unqlite.h".}
proc unqlite_vm_config*(pVm: ptr unqlite_vm; iOp: cint): cint {.varargs,
    importc: "unqlite_vm_config", header: "../private/unqlite.h".}
proc unqlite_vm_exec*(pVm: ptr unqlite_vm): cint {.importc: "unqlite_vm_exec",
    header: "../private/unqlite.h".}
proc unqlite_vm_reset*(pVm: ptr unqlite_vm): cint {.importc: "unqlite_vm_reset",
    header: "../private/unqlite.h".}
proc unqlite_vm_release*(pVm: ptr unqlite_vm): cint {.importc: "unqlite_vm_release",
    header: "../private/unqlite.h".}
proc unqlite_vm_dump*(pVm: ptr unqlite_vm; xConsumer: proc (a2: pointer; a3: cuint;
    a4: pointer): cint; pUserData: pointer): cint {.importc: "unqlite_vm_dump",
    header: "../private/unqlite.h".}
proc unqlite_vm_extract_variable*(pVm: ptr unqlite_vm; zVarname: cstring): ptr unqlite_value {.
    importc: "unqlite_vm_extract_variable", header: "../private/unqlite.h".}
## #  Cursor Iterator Interfaces

proc unqlite_kv_cursor_init*(pDb: ptr unqlite; ppOut: ptr ptr unqlite_kv_cursor): cint {.
    importc: "unqlite_kv_cursor_init", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_release*(pDb: ptr unqlite; pCur: ptr unqlite_kv_cursor): cint {.
    importc: "unqlite_kv_cursor_release", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_seek*(pCursor: ptr unqlite_kv_cursor; pKey: pointer;
                            nKeyLen: cint; iPos: cint): cint {.
    importc: "unqlite_kv_cursor_seek", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_first_entry*(pCursor: ptr unqlite_kv_cursor): cint {.
    importc: "unqlite_kv_cursor_first_entry", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_last_entry*(pCursor: ptr unqlite_kv_cursor): cint {.
    importc: "unqlite_kv_cursor_last_entry", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_valid_entry*(pCursor: ptr unqlite_kv_cursor): cint {.
    importc: "unqlite_kv_cursor_valid_entry", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_next_entry*(pCursor: ptr unqlite_kv_cursor): cint {.
    importc: "unqlite_kv_cursor_next_entry", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_prev_entry*(pCursor: ptr unqlite_kv_cursor): cint {.
    importc: "unqlite_kv_cursor_prev_entry", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_key*(pCursor: ptr unqlite_kv_cursor; pBuf: pointer;
                           pnByte: ptr cint): cint {.
    importc: "unqlite_kv_cursor_key", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_key_callback*(pCursor: ptr unqlite_kv_cursor; xConsumer: proc (
    a2: pointer; a3: cuint; a4: pointer): cint; pUserData: pointer): cint {.
    importc: "unqlite_kv_cursor_key_callback", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_data*(pCursor: ptr unqlite_kv_cursor; pBuf: pointer;
                            pnData: ptr int64): cint {.
    importc: "unqlite_kv_cursor_data", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_data_callback*(pCursor: ptr unqlite_kv_cursor; xConsumer: proc (
    a2: pointer; a3: cuint; a4: pointer): cint; pUserData: pointer): cint {.
    importc: "unqlite_kv_cursor_data_callback", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_delete_entry*(pCursor: ptr unqlite_kv_cursor): cint {.
    importc: "unqlite_kv_cursor_delete_entry", header: "../private/unqlite.h".}
proc unqlite_kv_cursor_reset*(pCursor: ptr unqlite_kv_cursor): cint {.
    importc: "unqlite_kv_cursor_reset", header: "../private/unqlite.h".}
## # Manual Transaction Manager

proc unqlite_begin*(pDb: ptr unqlite): cint {.importc: "unqlite_begin",
    header: "../private/unqlite.h".}
proc unqlite_commit*(pDb: ptr unqlite): cint {.importc: "unqlite_commit",
    header: "../private/unqlite.h".}
proc unqlite_rollback*(pDb: ptr unqlite): cint {.importc: "unqlite_rollback",
    header: "../private/unqlite.h".}
## # Utility interfaces

proc unqlite_util_load_mmaped_file*(zFile: cstring; ppMap: ptr pointer;
                                   pFileSize: ptr int64): cint {.
    importc: "unqlite_util_load_mmaped_file", header: "../private/unqlite.h".}
proc unqlite_util_release_mmaped_file*(pMap: pointer; iFileSize: int64): cint {.
    importc: "unqlite_util_release_mmaped_file", header: "../private/unqlite.h".}
proc unqlite_util_random_string*(pDb: ptr unqlite; zBuf: cstring; buf_size: cuint): cint {.
    importc: "unqlite_util_random_string", header: "../private/unqlite.h".}
proc unqlite_util_random_num*(pDb: ptr unqlite): cuint {.
    importc: "unqlite_util_random_num", header: "../private/unqlite.h".}
## # In-process extending interfaces

proc unqlite_create_function*(pVm: ptr unqlite_vm; zName: cstring; xFunc: proc (
    a2: ptr unqlite_context; a3: cint; a4: ptr ptr unqlite_value): cint;
                             pUserData: pointer): cint {.
    importc: "unqlite_create_function", header: "../private/unqlite.h".}
proc unqlite_delete_function*(pVm: ptr unqlite_vm; zName: cstring): cint {.
    importc: "unqlite_delete_function", header: "../private/unqlite.h".}
proc unqlite_create_constant*(pVm: ptr unqlite_vm; zName: cstring; xExpand: proc (
    a2: ptr unqlite_value; a3: pointer); pUserData: pointer): cint {.
    importc: "unqlite_create_constant", header: "../private/unqlite.h".}
proc unqlite_delete_constant*(pVm: ptr unqlite_vm; zName: cstring): cint {.
    importc: "unqlite_delete_constant", header: "../private/unqlite.h".}
## # On Demand Object allocation interfaces

proc unqlite_vm_new_scalar*(pVm: ptr unqlite_vm): ptr unqlite_value {.
    importc: "unqlite_vm_new_scalar", header: "../private/unqlite.h".}
proc unqlite_vm_new_array*(pVm: ptr unqlite_vm): ptr unqlite_value {.
    importc: "unqlite_vm_new_array", header: "../private/unqlite.h".}
proc unqlite_vm_release_value*(pVm: ptr unqlite_vm; pValue: ptr unqlite_value): cint {.
    importc: "unqlite_vm_release_value", header: "../private/unqlite.h".}
proc unqlite_context_new_scalar*(pCtx: ptr unqlite_context): ptr unqlite_value {.
    importc: "unqlite_context_new_scalar", header: "../private/unqlite.h".}
proc unqlite_context_new_array*(pCtx: ptr unqlite_context): ptr unqlite_value {.
    importc: "unqlite_context_new_array", header: "../private/unqlite.h".}
proc unqlite_context_release_value*(pCtx: ptr unqlite_context;
                                   pValue: ptr unqlite_value) {.
    importc: "unqlite_context_release_value", header: "../private/unqlite.h".}
## # Dynamically Typed Value Object Management Interfaces

proc unqlite_value_int*(pVal: ptr unqlite_value; iValue: cint): cint {.
    importc: "unqlite_value_int", header: "../private/unqlite.h".}
proc unqlite_value_int64*(pVal: ptr unqlite_value; iValue: int64): cint {.
    importc: "unqlite_value_int64", header: "../private/unqlite.h".}
proc unqlite_value_bool*(pVal: ptr unqlite_value; iBool: cint): cint {.
    importc: "unqlite_value_bool", header: "../private/unqlite.h".}
proc unqlite_value_null*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_null", header: "../private/unqlite.h".}
proc unqlite_value_double*(pVal: ptr unqlite_value; Value: cdouble): cint {.
    importc: "unqlite_value_double", header: "../private/unqlite.h".}
proc unqlite_value_string*(pVal: ptr unqlite_value; zString: cstring; nLen: cint): cint {.
    importc: "unqlite_value_string", header: "../private/unqlite.h".}
proc unqlite_value_string_format*(pVal: ptr unqlite_value; zFormat: cstring): cint {.
    varargs, importc: "unqlite_value_string_format", header: "../private/unqlite.h".}
proc unqlite_value_reset_string_cursor*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_reset_string_cursor", header: "../private/unqlite.h".}
proc unqlite_value_resource*(pVal: ptr unqlite_value; pUserData: pointer): cint {.
    importc: "unqlite_value_resource", header: "../private/unqlite.h".}
proc unqlite_value_release*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_release", header: "../private/unqlite.h".}
## # Foreign Function Parameter Values

proc unqlite_value_to_int*(pValue: ptr unqlite_value): cint {.
    importc: "unqlite_value_to_int", header: "../private/unqlite.h".}
proc unqlite_value_to_bool*(pValue: ptr unqlite_value): cint {.
    importc: "unqlite_value_to_bool", header: "../private/unqlite.h".}
proc unqlite_value_to_int64*(pValue: ptr unqlite_value): int64 {.
    importc: "unqlite_value_to_int64", header: "../private/unqlite.h".}
proc unqlite_value_to_double*(pValue: ptr unqlite_value): cdouble {.
    importc: "unqlite_value_to_double", header: "../private/unqlite.h".}
proc unqlite_value_to_string*(pValue: ptr unqlite_value; pLen: ptr cint): cstring {.
    importc: "unqlite_value_to_string", header: "../private/unqlite.h".}
proc unqlite_value_to_resource*(pValue: ptr unqlite_value): pointer {.
    importc: "unqlite_value_to_resource", header: "../private/unqlite.h".}
proc unqlite_value_compare*(pLeft: ptr unqlite_value; pRight: ptr unqlite_value;
                           bStrict: cint): cint {.importc: "unqlite_value_compare",
    header: "../private/unqlite.h".}
## # Setting The Result Of A Foreign Function

proc unqlite_result_int*(pCtx: ptr unqlite_context; iValue: cint): cint {.
    importc: "unqlite_result_int", header: "../private/unqlite.h".}
proc unqlite_result_int64*(pCtx: ptr unqlite_context; iValue: int64): cint {.
    importc: "unqlite_result_int64", header: "../private/unqlite.h".}
proc unqlite_result_bool*(pCtx: ptr unqlite_context; iBool: cint): cint {.
    importc: "unqlite_result_bool", header: "../private/unqlite.h".}
proc unqlite_result_double*(pCtx: ptr unqlite_context; Value: cdouble): cint {.
    importc: "unqlite_result_double", header: "../private/unqlite.h".}
proc unqlite_result_null*(pCtx: ptr unqlite_context): cint {.
    importc: "unqlite_result_null", header: "../private/unqlite.h".}
proc unqlite_result_string*(pCtx: ptr unqlite_context; zString: cstring; nLen: cint): cint {.
    importc: "unqlite_result_string", header: "../private/unqlite.h".}
proc unqlite_result_string_format*(pCtx: ptr unqlite_context; zFormat: cstring): cint {.
    varargs, importc: "unqlite_result_string_format", header: "../private/unqlite.h".}
proc unqlite_result_value*(pCtx: ptr unqlite_context; pValue: ptr unqlite_value): cint {.
    importc: "unqlite_result_value", header: "../private/unqlite.h".}
proc unqlite_result_resource*(pCtx: ptr unqlite_context; pUserData: pointer): cint {.
    importc: "unqlite_result_resource", header: "../private/unqlite.h".}
## # Dynamically Typed Value Object Query Interfaces

proc unqlite_value_is_int*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_int", header: "../private/unqlite.h".}
proc unqlite_value_is_float*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_float", header: "../private/unqlite.h".}
proc unqlite_value_is_bool*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_bool", header: "../private/unqlite.h".}
proc unqlite_value_is_string*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_string", header: "../private/unqlite.h".}
proc unqlite_value_is_null*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_null", header: "../private/unqlite.h".}
proc unqlite_value_is_numeric*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_numeric", header: "../private/unqlite.h".}
proc unqlite_value_is_callable*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_callable", header: "../private/unqlite.h".}
proc unqlite_value_is_scalar*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_scalar", header: "../private/unqlite.h".}
proc unqlite_value_is_json_array*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_json_array", header: "../private/unqlite.h".}
proc unqlite_value_is_json_object*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_json_object", header: "../private/unqlite.h".}
proc unqlite_value_is_resource*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_resource", header: "../private/unqlite.h".}
proc unqlite_value_is_empty*(pVal: ptr unqlite_value): cint {.
    importc: "unqlite_value_is_empty", header: "../private/unqlite.h".}
## # JSON Array/Object Management Interfaces

proc unqlite_array_fetch*(pArray: ptr unqlite_value; zKey: cstring; nByte: cint): ptr unqlite_value {.
    importc: "unqlite_array_fetch", header: "../private/unqlite.h".}
proc unqlite_array_walk*(pArray: ptr unqlite_value; xWalk: proc (
    a2: ptr unqlite_value; a3: ptr unqlite_value; a4: pointer): cint; pUserData: pointer): cint {.
    importc: "unqlite_array_walk", header: "../private/unqlite.h".}
proc unqlite_array_add_elem*(pArray: ptr unqlite_value; pKey: ptr unqlite_value;
                            pValue: ptr unqlite_value): cint {.
    importc: "unqlite_array_add_elem", header: "../private/unqlite.h".}
proc unqlite_array_add_strkey_elem*(pArray: ptr unqlite_value; zKey: cstring;
                                   pValue: ptr unqlite_value): cint {.
    importc: "unqlite_array_add_strkey_elem", header: "../private/unqlite.h".}
proc unqlite_array_count*(pArray: ptr unqlite_value): cint {.
    importc: "unqlite_array_count", header: "../private/unqlite.h".}
## # Call Context Handling Interfaces

proc unqlite_context_output*(pCtx: ptr unqlite_context; zString: cstring; nLen: cint): cint {.
    importc: "unqlite_context_output", header: "../private/unqlite.h".}
proc unqlite_context_output_format*(pCtx: ptr unqlite_context; zFormat: cstring): cint {.
    varargs, importc: "unqlite_context_output_format", header: "../private/unqlite.h".}
proc unqlite_context_throw_error*(pCtx: ptr unqlite_context; iErr: cint; zErr: cstring): cint {.
    importc: "unqlite_context_throw_error", header: "../private/unqlite.h".}
proc unqlite_context_throw_error_format*(pCtx: ptr unqlite_context; iErr: cint;
                                        zFormat: cstring): cint {.varargs,
    importc: "unqlite_context_throw_error_format", header: "../private/unqlite.h".}
proc unqlite_context_random_num*(pCtx: ptr unqlite_context): cuint {.
    importc: "unqlite_context_random_num", header: "../private/unqlite.h".}
proc unqlite_context_random_string*(pCtx: ptr unqlite_context; zBuf: cstring;
                                   nBuflen: cint): cint {.
    importc: "unqlite_context_random_string", header: "../private/unqlite.h".}
proc unqlite_context_user_data*(pCtx: ptr unqlite_context): pointer {.
    importc: "unqlite_context_user_data", header: "../private/unqlite.h".}
proc unqlite_context_push_aux_data*(pCtx: ptr unqlite_context; pUserData: pointer): cint {.
    importc: "unqlite_context_push_aux_data", header: "../private/unqlite.h".}
proc unqlite_context_peek_aux_data*(pCtx: ptr unqlite_context): pointer {.
    importc: "unqlite_context_peek_aux_data", header: "../private/unqlite.h".}
proc unqlite_context_result_buf_length*(pCtx: ptr unqlite_context): cuint {.
    importc: "unqlite_context_result_buf_length", header: "../private/unqlite.h".}
proc unqlite_function_name*(pCtx: ptr unqlite_context): cstring {.
    importc: "unqlite_function_name", header: "../private/unqlite.h".}
## # Call Context Memory Management Interfaces

proc unqlite_context_alloc_chunk*(pCtx: ptr unqlite_context; nByte: cuint;
                                 ZeroChunk: cint; AutoRelease: cint): pointer {.
    importc: "unqlite_context_alloc_chunk", header: "../private/unqlite.h".}
proc unqlite_context_realloc_chunk*(pCtx: ptr unqlite_context; pChunk: pointer;
                                   nByte: cuint): pointer {.
    importc: "unqlite_context_realloc_chunk", header: "../private/unqlite.h".}
proc unqlite_context_free_chunk*(pCtx: ptr unqlite_context; pChunk: pointer) {.
    importc: "unqlite_context_free_chunk", header: "../private/unqlite.h".}
## # Global Library Management Interfaces

proc unqlite_lib_config*(nConfigOp: cint): cint {.varargs,
    importc: "unqlite_lib_config", header: "../private/unqlite.h".}
proc unqlite_lib_init*(): cint {.importc: "unqlite_lib_init", header: "../private/unqlite.h".}
proc unqlite_lib_shutdown*(): cint {.importc: "unqlite_lib_shutdown",
                                  header: "../private/unqlite.h".}
proc unqlite_lib_is_threadsafe*(): cint {.importc: "unqlite_lib_is_threadsafe",
                                       header: "../private/unqlite.h".}
proc unqlite_lib_version*(): cstring {.importc: "unqlite_lib_version",
                                    header: "../private/unqlite.h".}
proc unqlite_lib_signature*(): cstring {.importc: "unqlite_lib_signature",
                                      header: "../private/unqlite.h".}
proc unqlite_lib_ident*(): cstring {.importc: "unqlite_lib_ident",
                                  header: "../private/unqlite.h".}
proc unqlite_lib_copyright*(): cstring {.importc: "unqlite_lib_copyright",
                                      header: "../private/unqlite.h".}
