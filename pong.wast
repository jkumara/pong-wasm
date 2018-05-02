(module
 (import "env" "memory" (memory $0 256))
 (import "env" "memoryBase" (global $memoryBase i32))
 (global $STACKTOP (mut i32) (i32.const 0))
 (global $STACK_MAX (mut i32) (i32.const 0))
 (global $_i i32 (i32.const 5242880))
 (global $fp$_pong i32 (i32.const 1))
 (export "__post_instantiate" (func $__post_instantiate))
 (export "_pong" (func $_pong))
 (export "_i" (global $_i))
 (export "fp$_pong" (global $fp$_pong))
 (func $_pong (; 0 ;) (result i32)
  (local $0 i32)
  (i32.store
   (tee_local $0
    (i32.add
     (get_global $memoryBase)
     (i32.const 5242880)
    )
   )
   (tee_local $0
    (i32.add
     (i32.load
      (get_local $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.xor
   (i32.and
    (get_local $0)
    (i32.const 1)
   )
   (i32.const 1)
  )
 )
 (func $runPostSets (; 1 ;)
  (nop)
 )
 (func $__post_instantiate (; 2 ;)
  (set_global $STACKTOP
   (get_global $memoryBase)
  )
  (set_global $STACK_MAX
   (i32.add
    (get_global $STACKTOP)
    (i32.const 5242880)
   )
  )
  (call $runPostSets)
 )
)
