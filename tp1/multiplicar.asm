        .file   1 "multiplicar.c"
        .section .mdebug.abi32
        .previous
        .abicalls
        .text
        .align  2
        .globl  multiplicarMatrices
        .ent    multiplicarMatrices
multiplicarMatrices:
        .frame  $fp,32,$ra              # vars= 16, regs= 2/0, args= 0, extra= 8
        .mask   0x50000000,-4
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,32
        .cprestore 0
        sw      $fp,28($sp)
        sw      $gp,24($sp)
        move    $fp,$sp
        sw      $a0,32($fp)
        sw      $a1,36($fp)
        sw      $a2,40($fp)
        sw      $a3,44($fp)
        sw      $zero,8($fp)
$L2:
        lw      $v0,8($fp)
        lw      $v1,32($fp)
        slt     $v0,$v0,$v1
        bne     $v0,$zero,$L5
        b       $L1
$L5:
        sw      $zero,12($fp)
$L6:
        lw      $v0,12($fp)
        lw      $v1,48($fp)
        slt     $v0,$v0,$v1
        bne     $v0,$zero,$L9
        b       $L4
$L9:
        lw      $v1,8($fp)
        lw      $v0,48($fp)
        mult    $v1,$v0
        mflo    $v1
        lw      $v0,12($fp)
        addu    $v0,$v1,$v0
        sll     $v1,$v0,3
        lw      $v0,40($fp)
        addu    $v0,$v1,$v0
        sw      $zero,0($v0)
        sw      $zero,4($v0)
        sw      $zero,16($fp)
$L10:
        lw      $v0,16($fp)
        lw      $v1,52($fp)
        slt     $v0,$v0,$v1
        bne     $v0,$zero,$L13
        b       $L8
$L13:
        lw      $v1,8($fp)
        lw      $v0,48($fp)
        mult    $v1,$v0
        mflo    $v1
        lw      $v0,12($fp)
        addu    $v0,$v1,$v0
        sll     $v1,$v0,3
        lw      $v0,40($fp)
        addu    $a1,$v1,$v0
        lw      $v1,8($fp)
        lw      $v0,48($fp)
        mult    $v1,$v0
        mflo    $v1
        lw      $v0,12($fp)
        addu    $v0,$v1,$v0
        sll     $v1,$v0,3
        lw      $v0,40($fp)
        addu    $a2,$v1,$v0
        lw      $v1,8($fp)
        lw      $v0,52($fp)
        mult    $v1,$v0
        mflo    $v1
        lw      $v0,16($fp)
        addu    $v0,$v1,$v0
        sll     $v1,$v0,3
        lw      $v0,44($fp)
        addu    $a0,$v1,$v0
        lw      $v1,16($fp)
        lw      $v0,48($fp)
        mult    $v1,$v0
        mflo    $v1
        lw      $v0,12($fp)
        addu    $v0,$v1,$v0
        sll     $v1,$v0,3
        lw      $v0,36($fp)
        addu    $v0,$v1,$v0
        l.d     $f2,0($a0)
        l.d     $f0,0($v0)
        mul.d   $f2,$f2,$f0
        l.d     $f0,0($a2)
        add.d   $f0,$f0,$f2
        s.d     $f0,0($a1)
        lw      $v0,16($fp)
        addu    $v0,$v0,1
        sw      $v0,16($fp)
        b       $L10
$L8:
        lw      $v0,12($fp)
        addu    $v0,$v0,1
        sw      $v0,12($fp)
        b       $L6
$L4:
        lw      $v0,8($fp)
        addu    $v0,$v0,1
        sw      $v0,8($fp)
        b       $L2
$L1:
        move    $sp,$fp
        lw      $fp,28($sp)
        addu    $sp,$sp,32
        j       $ra
        .end    multiplicarMatrices
        .size   multiplicarMatrices, .-multiplicarMatrices
        .ident  "GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
