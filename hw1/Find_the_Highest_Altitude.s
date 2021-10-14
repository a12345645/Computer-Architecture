.data
gain:     .word -5,1,5,0,-7, -5, 10, 9, -4, 8, -4, 2, -4, 4, 3, -2
len:      .word 16
argument: .word   7

.text
main:
        la s0, gain         
        mv s1, zero # altitude = 0
        mv s2, zero # highest = 0
        lw s3, len
        mv t0, zero # i = 0
loop:
        lw t1, 0(s0)
        addi s0, s0, 4
        add s1, s1, t1 # altitude += gain[i];
        
        mv a2, s2 # max(highest, altitude);
        mv a3, s1
        jal max
        add s2, a0, zero
        
        addi t0, t0, 1 #i++
        blt t0, s3, loop
        
        mv a2, s2
        jal print
        
        li  a7, 10        # end program
        ecall
        
max:
        mv a0, a3
        blt a2, a3, maxReturn
        mv a0, a2
maxReturn:
        jr ra 
        
print:
        mv a0, a2
        li a7, 1
        ecall
        jr ra 