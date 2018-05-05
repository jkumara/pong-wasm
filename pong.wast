(module
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (import "env" "memory" (memory $0 256))
 (import "env" "memoryBase" (global $memoryBase i32))
 (import "env" "_drawLine" (func $_drawLine (param i32 i32 i32 i32)))
 (import "env" "_fillRect" (func $_fillRect (param i32 i32 i32 i32)))
 (import "env" "_fillText" (func $_fillText (param i32 i32 i32)))
 (import "env" "_setFillStyle" (func $_setFillStyle (param i32 i32 i32)))
 (import "env" "_setLineDash" (func $_setLineDash (param i32 i32)))
 (import "env" "_setLineWidth" (func $_setLineWidth (param i32)))
 (import "env" "_setStrokeStyle" (func $_setStrokeStyle (param i32 i32 i32)))
 (import "env" "_setTextSize" (func $_setTextSize (param i32)))
 (global $STACKTOP (mut i32) (i32.const 0))
 (global $STACK_MAX (mut i32) (i32.const 0))
 (global $_ball i32 (i32.const 100))
 (global $_black i32 (i32.const 5243008))
 (global $_line i32 (i32.const 44))
 (global $_player1 i32 (i32.const 60))
 (global $_player2 i32 (i32.const 80))
 (global $_walls i32 (i32.const 12))
 (global $_white i32 (i32.const 0))
 (global $fp$_checkCollisions i32 (i32.const 12))
 (global $fp$_clamp i32 (i32.const 3))
 (global $fp$_doesCollide i32 (i32.const 5))
 (global $fp$_drawCourt i32 (i32.const 11))
 (global $fp$_drawObject i32 (i32.const 8))
 (global $fp$_drawScores i32 (i32.const 9))
 (global $fp$_isInBounds i32 (i32.const 4))
 (global $fp$_moveBall i32 (i32.const 7))
 (global $fp$_movePlayer i32 (i32.const 6))
 (global $fp$_resetGame i32 (i32.const 10))
 (global $fp$_setFill i32 (i32.const 1))
 (global $fp$_setStroke i32 (i32.const 2))
 (global $fp$_tick i32 (i32.const 13))
 (data (get_global $memoryBase) "\ff\00\00\00\ff\00\00\00\ff\00\00\00\00\00\00\00\00\00\00\00 \03\00\00\10\00\00\00\00\00\00\00H\02\00\00 \03\00\00\10\00\00\00\90\01\00\00\00\00\00\00\90\01\00\00X\02\00\00\00\00\00\00\0c\01\00\00\10\00\00\00@\00\00\00\00\00\00\00\10\03\00\00\0c\01\00\00\10\00\00\00@\00\00\00\00\00\00\00\88\01\00\00\10\00\00\00\10\00\00\00\10\00\00\00\00\00\80?\00\00\80?\00\00\16C")
 (export "__post_instantiate" (func $__post_instantiate))
 (export "_checkCollisions" (func $_checkCollisions))
 (export "_clamp" (func $_clamp))
 (export "_doesCollide" (func $_doesCollide))
 (export "_drawCourt" (func $_drawCourt))
 (export "_drawObject" (func $_drawObject))
 (export "_drawScores" (func $_drawScores))
 (export "_isInBounds" (func $_isInBounds))
 (export "_moveBall" (func $legalstub$_moveBall))
 (export "_movePlayer" (func $legalstub$_movePlayer))
 (export "_resetGame" (func $_resetGame))
 (export "_setFill" (func $_setFill))
 (export "_setStroke" (func $_setStroke))
 (export "_tick" (func $legalstub$_tick))
 (export "_ball" (global $_ball))
 (export "_black" (global $_black))
 (export "_line" (global $_line))
 (export "_player1" (global $_player1))
 (export "_player2" (global $_player2))
 (export "_walls" (global $_walls))
 (export "_white" (global $_white))
 (export "fp$_checkCollisions" (global $fp$_checkCollisions))
 (export "fp$_clamp" (global $fp$_clamp))
 (export "fp$_doesCollide" (global $fp$_doesCollide))
 (export "fp$_drawCourt" (global $fp$_drawCourt))
 (export "fp$_drawObject" (global $fp$_drawObject))
 (export "fp$_drawScores" (global $fp$_drawScores))
 (export "fp$_isInBounds" (global $fp$_isInBounds))
 (export "fp$_moveBall" (global $fp$_moveBall))
 (export "fp$_movePlayer" (global $fp$_movePlayer))
 (export "fp$_resetGame" (global $fp$_resetGame))
 (export "fp$_setFill" (global $fp$_setFill))
 (export "fp$_setStroke" (global $fp$_setStroke))
 (export "fp$_tick" (global $fp$_tick))
 (func $_setFill (; 8 ;) (param $0 i32)
  (call $_setFillStyle
   (i32.load
    (get_local $0)
   )
   (i32.load offset=4
    (get_local $0)
   )
   (i32.load offset=8
    (get_local $0)
   )
  )
 )
 (func $_setStroke (; 9 ;) (param $0 i32)
  (call $_setStrokeStyle
   (i32.load
    (get_local $0)
   )
   (i32.load offset=4
    (get_local $0)
   )
   (i32.load offset=8
    (get_local $0)
   )
  )
 )
 (func $_clamp (; 10 ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (select
   (get_local $2)
   (select
    (i32.sub
     (get_local $3)
     (get_local $1)
    )
    (get_local $0)
    (i32.gt_s
     (i32.add
      (get_local $1)
      (get_local $0)
     )
     (get_local $3)
    )
   )
   (i32.lt_s
    (get_local $0)
    (get_local $2)
   )
  )
 )
 (func $_isInBounds (; 11 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 f32)
  (local $3 i32)
  (if (result i32)
   (f32.gt
    (tee_local $2
     (f32.load
      (get_local $0)
     )
    )
    (f32.convert_s/i32
     (tee_local $3
      (i32.load
       (get_local $1)
      )
     )
    )
   )
   (if (result i32)
    (f32.lt
     (get_local $2)
     (f32.convert_s/i32
      (i32.add
       (i32.load offset=8
        (get_local $1)
       )
       (get_local $3)
      )
     )
    )
    (if (result i32)
     (f32.gt
      (tee_local $2
       (f32.load offset=4
        (get_local $0)
       )
      )
      (f32.convert_s/i32
       (tee_local $0
        (i32.load offset=4
         (get_local $1)
        )
       )
      )
     )
     (f32.lt
      (get_local $2)
      (f32.convert_s/i32
       (i32.add
        (i32.load offset=12
         (get_local $1)
        )
        (get_local $0)
       )
      )
     )
     (i32.const 0)
    )
    (i32.const 0)
   )
   (i32.const 0)
  )
 )
 (func $_doesCollide (; 12 ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 f32)
  (local $7 i32)
  (local $8 f32)
  (local $9 f32)
  (set_local $2
   (get_global $STACKTOP)
  )
  (set_global $STACKTOP
   (i32.sub
    (get_global $STACKTOP)
    (i32.const -64)
   )
  )
  (set_local $3
   (i32.add
    (get_local $2)
    (i32.const 40)
   )
  )
  (set_local $4
   (i32.add
    (get_local $2)
    (i32.const 32)
   )
  )
  (f32.store
   (get_local $2)
   (tee_local $8
    (f32.convert_s/i32
     (tee_local $7
      (i32.load
       (get_local $0)
      )
     )
    )
   )
  )
  (f32.store offset=4
   (get_local $2)
   (tee_local $9
    (f32.convert_s/i32
     (tee_local $5
      (i32.load offset=4
       (get_local $0)
      )
     )
    )
   )
  )
  (f32.store offset=8
   (get_local $2)
   (tee_local $6
    (f32.convert_s/i32
     (i32.add
      (i32.load offset=8
       (get_local $0)
      )
      (get_local $7)
     )
    )
   )
  )
  (f32.store offset=12
   (get_local $2)
   (get_local $9)
  )
  (f32.store offset=16
   (get_local $2)
   (get_local $6)
  )
  (f32.store offset=20
   (get_local $2)
   (tee_local $6
    (f32.convert_s/i32
     (i32.add
      (i32.load offset=12
       (get_local $0)
      )
      (get_local $5)
     )
    )
   )
  )
  (f32.store offset=24
   (get_local $2)
   (get_local $8)
  )
  (f32.store offset=28
   (get_local $2)
   (get_local $6)
  )
  (set_local $0
   (i32.const 0)
  )
  (loop $while-in
   (block $while-out
    (if
     (i32.ge_s
      (get_local $0)
      (i32.const 4)
     )
     (block
      (set_local $0
       (i32.const 0)
      )
      (br $while-out)
     )
    )
    (i32.store
     (get_local $4)
     (i32.load
      (tee_local $5
       (i32.add
        (get_local $2)
        (i32.shl
         (get_local $0)
         (i32.const 3)
        )
       )
      )
     )
    )
    (i32.store offset=4
     (get_local $4)
     (i32.load offset=4
      (get_local $5)
     )
    )
    (i32.store
     (get_local $3)
     (i32.load
      (get_local $1)
     )
    )
    (i32.store offset=4
     (get_local $3)
     (i32.load offset=4
      (get_local $1)
     )
    )
    (i32.store offset=8
     (get_local $3)
     (i32.load offset=8
      (get_local $1)
     )
    )
    (i32.store offset=12
     (get_local $3)
     (i32.load offset=12
      (get_local $1)
     )
    )
    (set_local $0
     (i32.add
      (get_local $0)
      (i32.const 1)
     )
    )
    (br_if $while-in
     (i32.eqz
      (call $_isInBounds
       (get_local $4)
       (get_local $3)
      )
     )
    )
    (set_local $0
     (i32.const 1)
    )
   )
  )
  (set_global $STACKTOP
   (get_local $2)
  )
  (get_local $0)
 )
 (func $_movePlayer (; 13 ;) (param $0 i32) (param $1 i32) (param $2 f32)
  (local $3 i32)
  (i32.store
   (tee_local $3
    (i32.add
     (get_local $0)
     (i32.const 4)
    )
   )
   (call $_clamp
    (i32.add
     (i32.load
      (get_local $3)
     )
     (i32.mul
      (i32.trunc_s/f32
       (f32.mul
        (f32.div
         (get_local $2)
         (f32.const 1e3)
        )
        (f32.const 400)
       )
      )
      (get_local $1)
     )
    )
    (i32.load offset=12
     (get_local $0)
    )
    (i32.const 16)
    (i32.const 584)
   )
  )
 )
 (func $_moveBall (; 14 ;) (param $0 i32) (param $1 f32)
  (local $2 i32)
  (local $3 i32)
  (set_local $3
   (i32.trunc_s/f32
    (f32.add
     (f32.mul
      (f32.load offset=20
       (get_local $0)
      )
      (tee_local $1
       (f32.convert_s/i32
        (i32.trunc_s/f32
         (f32.mul
          (f32.div
           (get_local $1)
           (f32.const 1e3)
          )
          (f32.load offset=24
           (get_local $0)
          )
         )
        )
       )
      )
     )
     (f32.convert_s/i32
      (i32.load
       (tee_local $2
        (i32.add
         (get_local $0)
         (i32.const 4)
        )
       )
      )
     )
    )
   )
  )
  (i32.store
   (get_local $0)
   (i32.trunc_s/f32
    (f32.add
     (f32.mul
      (f32.load offset=16
       (get_local $0)
      )
      (get_local $1)
     )
     (f32.convert_s/i32
      (i32.load
       (get_local $0)
      )
     )
    )
   )
  )
  (i32.store
   (get_local $2)
   (get_local $3)
  )
 )
 (func $_drawObject (; 15 ;) (param $0 i32)
  (local $1 i32)
  (set_local $1
   (get_global $STACKTOP)
  )
  (set_global $STACKTOP
   (i32.add
    (get_global $STACKTOP)
    (i32.const 16)
   )
  )
  (i32.store
   (get_local $1)
   (i32.load
    (get_global $memoryBase)
   )
  )
  (i32.store offset=4
   (get_local $1)
   (i32.load offset=4
    (get_global $memoryBase)
   )
  )
  (i32.store offset=8
   (get_local $1)
   (i32.load offset=8
    (get_global $memoryBase)
   )
  )
  (call $_setFill
   (get_local $1)
  )
  (call $_fillRect
   (i32.load
    (get_local $0)
   )
   (i32.load offset=4
    (get_local $0)
   )
   (i32.load offset=8
    (get_local $0)
   )
   (i32.load offset=12
    (get_local $0)
   )
  )
  (set_global $STACKTOP
   (get_local $1)
  )
 )
 (func $_drawScores (; 16 ;)
  (call $_setTextSize
   (i32.const 64)
  )
  (call $_fillText
   (i32.load offset=76
    (get_global $memoryBase)
   )
   (i32.const 304)
   (i32.const 80)
  )
  (call $_fillText
   (i32.load offset=96
    (get_global $memoryBase)
   )
   (i32.const 464)
   (i32.const 80)
  )
 )
 (func $_resetGame (; 17 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (i32.store
   (tee_local $3
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
   )
   (i32.add
    (i32.load
     (get_local $3)
    )
    (i32.const 1)
   )
  )
  (i32.store
   (get_local $1)
   (i32.const 392)
  )
  (i32.store offset=4
   (get_local $1)
   (i32.const 16)
  )
  (f32.store offset=16
   (get_local $1)
   (f32.convert_s/i32
    (get_local $2)
   )
  )
  (f32.store offset=20
   (get_local $1)
   (f32.const 1)
  )
  (f32.store offset=24
   (get_local $1)
   (f32.const 150)
  )
 )
 (func $_drawCourt (; 18 ;)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (set_local $0
   (get_global $STACKTOP)
  )
  (set_global $STACKTOP
   (i32.add
    (get_global $STACKTOP)
    (i32.const 16)
   )
  )
  (i32.store
   (get_local $0)
   (i32.load
    (i32.add
     (get_global $memoryBase)
     (i32.const 5243008)
    )
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.load
    (i32.add
     (get_global $memoryBase)
     (i32.const 5243012)
    )
   )
  )
  (i32.store offset=8
   (get_local $0)
   (i32.load
    (i32.add
     (get_global $memoryBase)
     (i32.const 5243016)
    )
   )
  )
  (call $_setFill
   (get_local $0)
  )
  (call $_fillRect
   (i32.const 0)
   (i32.const 0)
   (i32.const 800)
   (i32.const 600)
  )
  (i32.store
   (get_local $0)
   (i32.load
    (get_global $memoryBase)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.load offset=4
    (get_global $memoryBase)
   )
  )
  (i32.store offset=8
   (get_local $0)
   (i32.load offset=8
    (get_global $memoryBase)
   )
  )
  (call $_setFill
   (get_local $0)
  )
  (loop $while-in
   (if
    (i32.ne
     (get_local $1)
     (i32.const 2)
    )
    (block
     (i32.store
      (get_local $0)
      (i32.load
       (tee_local $2
        (i32.add
         (i32.add
          (get_global $memoryBase)
          (i32.const 12)
         )
         (i32.shl
          (get_local $1)
          (i32.const 4)
         )
        )
       )
      )
     )
     (i32.store offset=4
      (get_local $0)
      (i32.load offset=4
       (get_local $2)
      )
     )
     (i32.store offset=8
      (get_local $0)
      (i32.load offset=8
       (get_local $2)
      )
     )
     (i32.store offset=12
      (get_local $0)
      (i32.load offset=12
       (get_local $2)
      )
     )
     (call $_drawObject
      (get_local $0)
     )
     (set_local $1
      (i32.add
       (get_local $1)
       (i32.const 1)
      )
     )
     (br $while-in)
    )
   )
  )
  (i32.store
   (get_local $0)
   (i32.load
    (get_global $memoryBase)
   )
  )
  (i32.store offset=4
   (get_local $0)
   (i32.load offset=4
    (get_global $memoryBase)
   )
  )
  (i32.store offset=8
   (get_local $0)
   (i32.load offset=8
    (get_global $memoryBase)
   )
  )
  (call $_setStroke
   (get_local $0)
  )
  (call $_setLineDash
   (i32.const 8)
   (i32.const 8)
  )
  (call $_setLineWidth
   (i32.const 8)
  )
  (call $_drawLine
   (i32.load offset=44
    (get_global $memoryBase)
   )
   (i32.load offset=48
    (get_global $memoryBase)
   )
   (i32.load offset=52
    (get_global $memoryBase)
   )
   (i32.load offset=56
    (get_global $memoryBase)
   )
  )
  (set_global $STACKTOP
   (get_local $0)
  )
 )
 (func $_checkCollisions (; 19 ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (set_local $3
   (get_global $STACKTOP)
  )
  (set_global $STACKTOP
   (i32.add
    (get_global $STACKTOP)
    (i32.const 32)
   )
  )
  (set_local $4
   (i32.add
    (get_local $3)
    (i32.const 16)
   )
  )
  (set_local $7
   (i32.add
    (get_local $0)
    (i32.const 20)
   )
  )
  (loop $while-in
   (if
    (i32.ne
     (get_local $5)
     (i32.const 2)
    )
    (block
     (i32.store
      (get_local $3)
      (i32.load
       (get_local $0)
      )
     )
     (i32.store offset=4
      (get_local $3)
      (i32.load offset=4
       (get_local $0)
      )
     )
     (i32.store offset=8
      (get_local $3)
      (i32.load offset=8
       (get_local $0)
      )
     )
     (i32.store offset=12
      (get_local $3)
      (i32.load offset=12
       (get_local $0)
      )
     )
     (i32.store
      (get_local $4)
      (i32.load
       (tee_local $6
        (i32.add
         (i32.add
          (get_global $memoryBase)
          (i32.const 12)
         )
         (i32.shl
          (get_local $5)
          (i32.const 4)
         )
        )
       )
      )
     )
     (i32.store offset=4
      (get_local $4)
      (i32.load offset=4
       (get_local $6)
      )
     )
     (i32.store offset=8
      (get_local $4)
      (i32.load offset=8
       (get_local $6)
      )
     )
     (i32.store offset=12
      (get_local $4)
      (i32.load offset=12
       (get_local $6)
      )
     )
     (if
      (call $_doesCollide
       (get_local $3)
       (get_local $4)
      )
      (f32.store
       (get_local $7)
       (f32.neg
        (f32.load
         (get_local $7)
        )
       )
      )
     )
     (set_local $5
      (i32.add
       (get_local $5)
       (i32.const 1)
      )
     )
     (br $while-in)
    )
   )
  )
  (i32.store
   (get_local $3)
   (i32.load
    (get_local $0)
   )
  )
  (i32.store
   (tee_local $6
    (i32.add
     (get_local $3)
     (i32.const 4)
    )
   )
   (i32.load
    (tee_local $8
     (i32.add
      (get_local $0)
      (i32.const 4)
     )
    )
   )
  )
  (i32.store
   (tee_local $9
    (i32.add
     (get_local $3)
     (i32.const 8)
    )
   )
   (i32.load
    (tee_local $10
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
    )
   )
  )
  (i32.store
   (tee_local $11
    (i32.add
     (get_local $3)
     (i32.const 12)
    )
   )
   (i32.load
    (tee_local $12
     (i32.add
      (get_local $0)
      (i32.const 12)
     )
    )
   )
  )
  (i32.store
   (get_local $4)
   (i32.load offset=60
    (get_global $memoryBase)
   )
  )
  (i32.store
   (tee_local $13
    (i32.add
     (get_local $4)
     (i32.const 4)
    )
   )
   (i32.load
    (i32.sub
     (get_global $memoryBase)
     (i32.const -64)
    )
   )
  )
  (i32.store
   (tee_local $14
    (i32.add
     (get_local $4)
     (i32.const 8)
    )
   )
   (i32.load offset=68
    (get_global $memoryBase)
   )
  )
  (i32.store
   (tee_local $15
    (i32.add
     (get_local $4)
     (i32.const 12)
    )
   )
   (i32.load offset=72
    (get_global $memoryBase)
   )
  )
  (set_local $5
   (call $_doesCollide
    (get_local $3)
    (get_local $4)
   )
  )
  (i32.store
   (get_local $3)
   (i32.load
    (get_local $0)
   )
  )
  (i32.store
   (get_local $6)
   (i32.load
    (get_local $8)
   )
  )
  (i32.store
   (get_local $9)
   (i32.load
    (get_local $10)
   )
  )
  (i32.store
   (get_local $11)
   (i32.load
    (get_local $12)
   )
  )
  (i32.store
   (get_local $4)
   (i32.load offset=80
    (get_global $memoryBase)
   )
  )
  (i32.store
   (get_local $13)
   (i32.load offset=84
    (get_global $memoryBase)
   )
  )
  (i32.store
   (get_local $14)
   (i32.load offset=88
    (get_global $memoryBase)
   )
  )
  (i32.store
   (get_local $15)
   (i32.load offset=92
    (get_global $memoryBase)
   )
  )
  (if
   (i32.or
    (get_local $5)
    (tee_local $4
     (call $_doesCollide
      (get_local $3)
      (get_local $4)
     )
    )
   )
   (block
    (f32.store
     (tee_local $6
      (i32.add
       (get_local $0)
       (i32.const 16)
      )
     )
     (f32.neg
      (f32.load
       (get_local $6)
      )
     )
    )
    (f32.store
     (tee_local $6
      (i32.add
       (get_local $0)
       (i32.const 24)
      )
     )
     (f32.add
      (f32.load
       (get_local $6)
      )
      (f32.const 25)
     )
    )
    (if
     (i32.and
      (i32.ne
       (get_local $1)
       (i32.const 0)
      )
      (get_local $5)
     )
     (f32.store
      (get_local $7)
      (f32.mul
       (f32.load
        (get_local $7)
       )
       (f32.convert_s/i32
        (get_local $1)
       )
      )
     )
    )
    (if
     (i32.and
      (i32.ne
       (get_local $2)
       (i32.const 0)
      )
      (get_local $4)
     )
     (f32.store
      (get_local $7)
      (f32.mul
       (f32.load
        (get_local $7)
       )
       (f32.convert_s/i32
        (get_local $2)
       )
      )
     )
    )
   )
  )
  (if
   (i32.lt_s
    (tee_local $1
     (i32.load
      (get_local $0)
     )
    )
    (i32.const 0)
   )
   (call $_resetGame
    (i32.add
     (get_global $memoryBase)
     (i32.const 80)
    )
    (get_local $0)
    (i32.const 1)
   )
   (if
    (i32.gt_s
     (i32.add
      (i32.load offset=8
       (get_local $0)
      )
      (get_local $1)
     )
     (i32.const 800)
    )
    (call $_resetGame
     (i32.add
      (get_global $memoryBase)
      (i32.const 60)
     )
     (get_local $0)
     (i32.const -1)
    )
   )
  )
  (set_global $STACKTOP
   (get_local $3)
  )
 )
 (func $_tick (; 20 ;) (param $0 f32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (set_local $3
   (get_global $STACKTOP)
  )
  (set_global $STACKTOP
   (i32.add
    (get_global $STACKTOP)
    (i32.const 16)
   )
  )
  (call $_drawCourt)
  (call $_drawScores)
  (call $_checkCollisions
   (i32.add
    (get_global $memoryBase)
    (i32.const 100)
   )
   (get_local $1)
   (get_local $2)
  )
  (call $_movePlayer
   (i32.add
    (get_global $memoryBase)
    (i32.const 60)
   )
   (get_local $1)
   (get_local $0)
  )
  (call $_movePlayer
   (i32.add
    (get_global $memoryBase)
    (i32.const 80)
   )
   (get_local $2)
   (get_local $0)
  )
  (call $_moveBall
   (i32.add
    (get_global $memoryBase)
    (i32.const 100)
   )
   (get_local $0)
  )
  (i32.store
   (get_local $3)
   (i32.load offset=100
    (get_global $memoryBase)
   )
  )
  (i32.store
   (tee_local $1
    (i32.add
     (get_local $3)
     (i32.const 4)
    )
   )
   (i32.load offset=104
    (get_global $memoryBase)
   )
  )
  (i32.store
   (tee_local $2
    (i32.add
     (get_local $3)
     (i32.const 8)
    )
   )
   (i32.load offset=108
    (get_global $memoryBase)
   )
  )
  (i32.store
   (tee_local $4
    (i32.add
     (get_local $3)
     (i32.const 12)
    )
   )
   (i32.load offset=112
    (get_global $memoryBase)
   )
  )
  (call $_drawObject
   (get_local $3)
  )
  (i32.store
   (get_local $3)
   (i32.load offset=60
    (get_global $memoryBase)
   )
  )
  (i32.store
   (get_local $1)
   (i32.load
    (i32.sub
     (get_global $memoryBase)
     (i32.const -64)
    )
   )
  )
  (i32.store
   (get_local $2)
   (i32.load offset=68
    (get_global $memoryBase)
   )
  )
  (i32.store
   (get_local $4)
   (i32.load offset=72
    (get_global $memoryBase)
   )
  )
  (call $_drawObject
   (get_local $3)
  )
  (i32.store
   (get_local $3)
   (i32.load offset=80
    (get_global $memoryBase)
   )
  )
  (i32.store
   (get_local $1)
   (i32.load offset=84
    (get_global $memoryBase)
   )
  )
  (i32.store
   (get_local $2)
   (i32.load offset=88
    (get_global $memoryBase)
   )
  )
  (i32.store
   (get_local $4)
   (i32.load offset=92
    (get_global $memoryBase)
   )
  )
  (call $_drawObject
   (get_local $3)
  )
  (set_global $STACKTOP
   (get_local $3)
  )
 )
 (func $runPostSets (; 21 ;)
  (nop)
 )
 (func $__post_instantiate (; 22 ;)
  (set_global $STACKTOP
   (i32.add
    (get_global $memoryBase)
    (i32.const 128)
   )
  )
  (set_global $STACK_MAX
   (i32.add
    (get_global $STACKTOP)
    (i32.const 5242880)
   )
  )
  (call $runPostSets)
 )
 (func $legalstub$_moveBall (; 23 ;) (param $0 i32) (param $1 f64)
  (call $_moveBall
   (get_local $0)
   (f32.demote/f64
    (get_local $1)
   )
  )
 )
 (func $legalstub$_movePlayer (; 24 ;) (param $0 i32) (param $1 i32) (param $2 f64)
  (call $_movePlayer
   (get_local $0)
   (get_local $1)
   (f32.demote/f64
    (get_local $2)
   )
  )
 )
 (func $legalstub$_tick (; 25 ;) (param $0 f64) (param $1 i32) (param $2 i32)
  (call $_tick
   (f32.demote/f64
    (get_local $0)
   )
   (get_local $1)
   (get_local $2)
  )
 )
)
