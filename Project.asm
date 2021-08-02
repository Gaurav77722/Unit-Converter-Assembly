.data
msg1: .asciiz "\nPlease choose what you would like to convert\n"
mainmenu1: .asciiz "(1) Single Unit\n"
mainmenu2: .asciiz "(2) Sentence\n"
mainmenu3: .asciiz "(3) Currency Arbitrage\n"
mainmenu4: .asciiz "(4) Exit\n"
mainmenuuser: .asciiz "\nEnter your choice: "
sunitmenu1: .asciiz "(1) Distance\n"
sunitmenu2: .asciiz "(2) Weight\n"
sunitmenu3: .asciiz "(3) Speed\n"
sunitmenu4: .asciiz "(4) MainMenu\n"
distancemenu1: .asciiz "(1) m\n(2) cm\n(3) km\n(4) mile\n(5) feet\n(6) inch"
distancemenu2: .asciiz "(1) m\n(2) cm\n(3) km\n(4) mile\n(5) feet\n(6) inch\n(7) All"
weightmenu1: .asciiz "(1) g\n(2) kg\n(3) lbs\n(4) oz"
weightmenu2: .asciiz "(1) g\n(2) kg\n(3) lbs\n(4) oz\n(5) All"
speedmenu1: .asciiz "(1) kmph\n(2) mph"
speedmenu2: .asciiz "(1) kmph\n(2) mph\n(3) All"
numberSU: .asciiz "\nEnter a number: "
newline: .asciiz "\n"

# ======================= Currency Arbitrage Initializations ======================

warning: .asciiz "\n Remember: Arbitrage opportunity is entirely dependent on exchange rates! \n"
denom: "\n Enter the denomination of your base currency: "
basep: .asciiz "\n Enter first currency (this would be your base currency): "
btos: .asciiz "\n Enter conversion rate for base to second currency: "
stot: .asciiz "\n Enter conversion rate for second to third currency: "
ttob: .asciiz "\n Enter conversion rate for third back to base currency: "
secondp: .asciiz "\n Enter second currency: "
thirdp: .asciiz "\n Enter third currency: "
result: .asciiz "\n Arbitrage opportunity: "
profit: .asciiz "\nCongratulations! You made a profit of "
noarb: .asciiz "\n It is unwise to trade with these exchange rates. No arbitrage opportunity \n"
arrow: .asciiz "\\/ \n"
base: .space 20 
second: .space 20 
third: .space 20 

# =================== Sentence Conversion Initializations ==========================
userinputspace: .space 100 # space for sentence
kilom: .asciiz "kilometers"
tobereplaced: .space 200
number: .space 100
tobereplaced3: .space 100
inputprompt: .asciiz "Please enter a sentence: "
mil: .asciiz "miles"
kilog: .asciiz "kilograms"
pou: .asciiz "pounds"
mph: .asciiz "mph"
kmph: .asciiz "kmph"
space: .asciiz " "
.text

# ============= Start of main function ================
main:

	# Print msg1 - "Please choose what you would like to convert"
	li $v0,4
	la $a0,msg1
	syscall
	
	# Print (1) Single Unit                                                                                                                               
	#	(2) Sentence                                                                                                                                  
	#	(3) Currency Conversion                                                                                                                       
	#	(4) Exit  
	li $v0,4	#  (1) Single Unit
	la $a0,mainmenu1
	syscall
	
	li $v0,4	#  (2) Sentence
	la $a0,mainmenu2
	syscall
	
	li $v0,4	#  (3) Currency Conversion
	la $a0,mainmenu3
	syscall
	
	li $v0,4	#  (4) Exit
	la $a0,mainmenu4
	syscall
	
	
	# Print mainmenuuser - "Enter your choice: ". Ask user for their choice of input for mainmenu
	li $v0,4
	la $a0,mainmenuuser
	syscall
	
	
	li $v0,5
	syscall
	
	# Move the user input of mainmenu from $v0 to $t0
	move $t0,$v0
	
	# Move 1 -> $t1, 2 -> $t2, 3 -> $t3, 4 -> $t4, 5 -> $t5 for comparison with the user input
	addi $t1,$zero,1
	addi $t2,$zero,2
	addi $t3,$zero,3
	addi $t4,$zero,4
		
	# Check which number in the mainmenu the userinput corresponds to and jump on that function accordingly
	slti $t5,$t0,5
	beq $t5,$zero,exit
	beq $t0,$t1,singleunit
	beq $t0,$t2,sentence
	beq $t0,$t3,currencyconversion
	beq $t0,$t4,exit




	
	
	
	
	
# ==================== Single Unit ===================
singleunit:
	# Print (1) Distance                                                                                                                               
	#	(2) Weight                                                                                                                                  
	#	(3) Speed
	#	(4) Exit  
	li $v0,4	#  (1) Distance
	la $a0,sunitmenu1
	syscall
	
	li $v0,4	#  (2) Weight
	la $a0,sunitmenu2
	syscall
	
	li $v0,4	#  (3) Speed
	la $a0,sunitmenu3
	syscall

	li $v0,4	#  (4) MainMenu
	la $a0,sunitmenu4
	syscall
	
	
	# Print mainmenuuser (for Single Unit menu) - "Enter your choice: ". Ask user for their choice of input for Single Unit menu
	li $v0,4
	la $a0,mainmenuuser
	syscall
	
	
	li $v0,5
	syscall
	
	# Move the user input of mainmenu from $v0 to $t0
	move $t0,$v0
	
	# Move 1 -> $t1, 2 -> $t2, 3 -> $t3, 4 -> $t4, 5 -> $t5 for comparison with the user input
	addi $t1,$zero,1
	addi $t2,$zero,2
	addi $t3,$zero,3
	addi $t4,$zero,4
	
	# Check which number in the Single Unit Menu the userinput corresponds to and jump on that function accordingly
	slti $t5,$t0,5
	beq $t5,$zero,exit
	beq $t0,$t1,distance
	beq $t0,$t2,weight
	beq $t0,$t3,speed
	beq $t0,$t4,main
	
	
	# ============= Single Unit - Distance =================
	distance:
			# Print number - "Enter a number: ". Ask the user to enter a number of their choice
			li $v0,4
			la $a0,numberSU
			syscall
			
			li $v0,6 # This user input will get stored in $f0
			syscall
			
			#=============== From ===============
			# Print (1) m                                                                                                                               
			#	(2) cm                                                                                                                                  
			#	(3) km                                                                                                                       
			#	(4) mile
			#	(5) feet
			#	(6) inch 
			li $v0,4
			la $a0,distancemenu1
			syscall
			
			# Print mainmenuuser (for Single Unit - Distance menu1) - "Enter your choice: ". Ask user for their choice of input for Single Unit - Distance menu 1
			li $v0,4
			la $a0,mainmenuuser
			syscall
			
			li $v0,5
			syscall
			
			# Move userinput for single unit distancemenu 1 to $t0
			move $t0,$v0
			
			# ================== To ====================
			# Print (1) m                                                                                                                               
			#	(2) cm                                                                                                                                  
			#	(3) km                                                                                                                       
			#	(4) mile
			#	(5) feet
			#	(6) inch  
			#	(7) All
			li $v0,4
			la $a0,distancemenu2
			syscall
			
			# Print mainmenuuser (for Single Unit - Distance menu2) - "Enter your choice: ". Ask user for their choice of input for Single Unit - Distance menu 2
			li $v0,4
			la $a0,mainmenuuser
			syscall
			
			li $v0,5
			syscall
			
			# Move userinput for single unit distancemenu 2 to $t1
			move $t1,$v0
			
			# Move 1 -> $t2, 2 -> $t3, 3 -> $t4, 4 -> $t5, 5 -> $t6, 6 -> $t7, 7 -> $t8 for comparison with the user input
			addi $t2,$zero,1
			addi $t3,$zero,2
			addi $t4,$zero,3
			addi $t5,$zero,4
			addi $t6,$zero,5
			addi $t7,$zero,6
			addi $t8,$zero,7
			
			Fromdist:
				beq $t0,$t2,mTo # From - 1
				beq $t0,$t3,cmTo # From - 2
				beq $t0,$t4,kmTo # From - 3
				beq $t0,$t5,mileTo # From - 4
				beq $t0,$t6,feetTo # From - 5
				beq $t0,$t7,inchTo # From - 6
				j exit
			
			mTo:
				beq $t1,$t2,mtom # 1,1
				beq $t1,$t3,mtocm # 1,2
				beq $t1,$t4,mtokm # 1,3
				beq $t1,$t5,mtomile # 1,4
				beq $t1,$t6,mtofeet # 1,5
				beq $t1,$t7,mtoinch # 1,6
				beq $t1,$t8,mtom # 1,7
				j exit
				
			cmTo:
				beq $t1,$t2,cmtom # 2,1
				beq $t1,$t3,cmtocm # 2,2
				beq $t1,$t4,cmtokm # 2,3
				beq $t1,$t5,cmtomile # 2,4
				beq $t1,$t6,cmtofeet # 2,5
				beq $t1,$t7,cmtoinch # 2,6
				beq $t1,$t8,cmtom # 2,7
				j exit
				
			kmTo:
				beq $t1,$t2,kmtom # 3,1
				beq $t1,$t3,kmtocm # 3,2
				beq $t1,$t4,kmtokm # 3,3
				beq $t1,$t5,kmtomile # 3,4
				beq $t1,$t6,kmtofeet # 3,5
				beq $t1,$t7,kmtoinch # 3,6
				beq $t1,$t8,kmtom # 3,7
				j exit
				
			mileTo:
				beq $t1,$t2,miletom # 4,1
				beq $t1,$t3,miletocm # 4,2
				beq $t1,$t4,miletokm # 4,3
				beq $t1,$t5,miletomile # 4,4
				beq $t1,$t6,miletofeet # 4,5
				beq $t1,$t7,miletoinch # 4,6
				beq $t1,$t8,miletom # 4,7
				j exit
				
			feetTo:
				beq $t1,$t2,feettom # 5,1
				beq $t1,$t3,feettocm # 5,2
				beq $t1,$t4,feettokm # 5,3
				beq $t1,$t5,feettomile # 5,4
				beq $t1,$t6,feettofeet # 5,5
				beq $t1,$t7,feettoinch # 5,6
				beq $t1,$t8,feettom # 5,7
				j exit
				
			inchTo:
				beq $t1,$t2,inchtom # 6,1
				beq $t1,$t3,inchtocm # 6,2
				beq $t1,$t4,inchtokm # 6,3
				beq $t1,$t5,inchtomile # 6,4
				beq $t1,$t6,inchtofeet # 6,5
				beq $t1,$t7,inchtoinch # 6,6
				beq $t1,$t8,inchtom # 6,7
				j exit

				
		# ======================== Meter ===============================================				
			# ============= Distance - meter to meter =================
			mtom:
				addi $sp,$sp,-4
				swc1 $f0,0($sp)
				
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				lwc1 $f0,0($sp)
				addi $sp,$sp,4
				
				beq $t1,7,mtocm
				
				j main
			
			# ============= Distance - meter to centimeter =================
			mtocm:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f1,4($sp)
				sw $s0,8($sp)
				
				#  cm = m*100
				addi $s0,$zero,100 # $s0 = 100
				mtc1 $s0,$f1 
				cvt.s.w $f1,$f1
				mul.s $f0,$f0,$f1
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f1,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,mtokm
				
				j main
				
			# ============= Distance - meter to kilometer =================
			mtokm:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  km = m*0.001
				li $s0,0x3a83126f # $s0 = 0.001
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,mtomile
				
				j main
				
			# ============= Distance - meter to mile =================
			mtomile:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  mile = m*0.000621371
				li $s0,0x3a22e380 # $s0 = 0.000621371
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,mtofeet
				
				j main
				
			# ============= Distance - meter to feet =================
			mtofeet:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  feet = m*3.28084
				li $s0,0x4051f948 # $s0 = 3.28084
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,mtoinch
				
				j main
				
			# ============= Distance - meter to inch =================
			mtoinch:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  inch = m*39.3701
				li $s0,0x421d7afb # $s0 = 39.3701
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				j main
				
				
		# ======================== Centimeter ===============================================
				
			# ============= Distance - centimeter to meter =================			
			cmtom:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  m = cm*0.01
				li $s0,0x3c23d70a # $s0 = 0.01
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,cmtocm
				
				j main
			
			# ============= Distance - centimeter to centimeter =================
			cmtocm:
				addi $sp,$sp,-4
				swc1 $f0,0($sp)
				
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				lwc1 $f0,0($sp)
				addi $sp,$sp,4
				
				beq $t1,7,cmtokm
				
				j main
			
			# ============= Distance - centimeter to kilometer =================
			cmtokm:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  km = cm/100000
				li $s0,0x47c35000 # $s0 = 100000
				mtc1 $s0,$f2
				div.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,cmtomile
				
				j main
			
			# ============= Distance - centimeter to mile =================
			cmtomile:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  mile = cm/160934
				li $s0,0x481d2980 # $s0 = 160934
				mtc1 $s0,$f2
				div.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,cmtofeet
				
				j main
			
			# ============= Distance - centimeter to feet =================
			cmtofeet:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  feet = cm/30.48
				li $s0,0x41f3d70a # $s0 = 30.48
				mtc1 $s0,$f2
				div.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,cmtoinch
				
				j main
			
			# ============= Distance - centimeter to inch =================
			cmtoinch:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  inch = cm/2.54
				li $s0,0x40228f5c # $s0 = 2.54
				mtc1 $s0,$f2
				div.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				j main
			
		# ================================ Kilometer ============================================			
			
			# ============= Distance - kilometer to meter =================
			kmtom:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  m = km * 1000
				li $s0,0x447a0000 # $s0 = 1000
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,kmtocm
				
				j main
				
			# ============= Distance - kilometer to centimeter =================
			kmtocm:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  cm = km * 100000
				li $s0,0x47c35000 # $s0 = 100000
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,kmtokm
			
				j main
			
			# ============= Distance - kilometer to kilometer =================				
			kmtokm:
				addi $sp,$sp,-4
				swc1 $f0,0($sp)
				
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				lwc1 $f0,0($sp)
				addi $sp,$sp,4
				
				beq $t1,7,kmtomile
				
				j main
			
			# ============= Distance - kilometer to mile =================
			kmtomile:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  mile = km * 0.621371
				li $s0,0x3f1f122b # $s0 = 0.621371
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,kmtofeet
			
				j main
			
			# ============= Distance - kilometer to feet =================
			kmtofeet:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  foot = km * 3280.84
				li $s0,0x454d0d71 # $s0 = 3280.84
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,kmtoinch
				
				j main
			
			# ============= Distance - kilometer to inch =================
			kmtoinch:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  inch = km * 39370.14
				li $s0,0x4719ca1a # $s0 = 39370.14
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
			
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				j main
		
		# ============================== Mile =======================================
			# ============= Distance - mile to meter =================
			miletom:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  m = mile * 1609.344
				li $s0,0x44c92ae1 # $s0 = 1609.34
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,miletocm
				
				j main
				
			# ============= Distance - mile to centimeter =================	
			miletocm:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  cm = mile * 160934
				li $s0,0x481d2980 # $s0 = 160934
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,miletokm
			
				j main
				
			# ============= Distance - mile to kilmeter =================	
			miletokm:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  km = mile * 1.60934
				li $s0,0x3fcdfeda # $s0 = 1.60934
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,miletomile
			
				j main
			
			# ============= Distance - mile to mile =================	
			miletomile:
				addi $sp,$sp,-4
				swc1 $f0,0($sp)
				
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				lwc1 $f0,0($sp)
				addi $sp,$sp,4
				
				beq $t1,7,miletofeet
				
				j main
			
			# ============= Distance - mile to feet =================	
			miletofeet:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  feet = mile * 5280
				li $s0,0x45a50000 # $s0 = 5280
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,miletoinch
				
				j main
				
			# ============= Distance - mile to inch =================	
			miletoinch:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  inch = mile * 63360
				li $s0,0x47778000 # $s0 = 63360
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				j main
				
		# ============================= Feet ===========================================
			# ================ Distance - feet to meter =====================
			feettom:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  m = feet * 0.3048
				li $s0,0x3e9c0ebf # $s0 = 0.3048
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,feettocm
				
				j main
			
			# ================ Distance - feet to centimeter =====================
			feettocm:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  cm = feet * 30.48
				li $s0,0x41f3d70a # $s0 = 30.48
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,feettokm
				
				j main
			
			# ================ Distance - feet to kilometer =====================
			feettokm:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  km = feet / 3281
				li $s0,0x454d1000 # $s0 = 3281
				mtc1 $s0,$f2
				div.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,feettomile
				
				j main
			
			# ================ Distance - feet to mile =====================
			feettomile:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  mile = feet / 5280
				li $s0,0x45a50000 # $s0 = 5280
				mtc1 $s0,$f2
				div.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,feettofeet
				
				j main
			
			# ================ Distance - feet to feet =====================
			feettofeet:
				addi $sp,$sp,-4
				swc1 $f0,0($sp)
				
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				lwc1 $f0,0($sp)
				addi $sp,$sp,4
				
				beq $t1,7,feettoinch
				
				j main
			
			# ================ Distance - feet to inch =====================
			feettoinch:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  inch = feet * 12
				li $s0,0x41400000 # $s0 = 12
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				
				j main
		# =========================== Inch =============================================
			# ================ Distance - inch to meter =====================
			inchtom:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  m = inch * 0.0254
				li $s0,0x3cd013a9 # $s0 = 0.0254
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,inchtocm
				
				j main
			
			# ================ Distance - inch to centimeter =====================
			inchtocm:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  cm = inch * 2.54
				li $s0,0x40228f5c # $s0 = 2.54
				mtc1 $s0,$f2
				mul.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,inchtokm
				
				j main
				
			# ================ Distance - inch to kilometer =====================
			inchtokm:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  km = inch / 39370
				li $s0,0x4719ca00 # $s0 = 39370
				mtc1 $s0,$f2
				div.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,inchtomile
				
				j main
			
			# ================ Distance - inch to mile =====================
			inchtomile:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  mile = inch / 63360
				li $s0,0x47778000 # $s0 = 63360
				mtc1 $s0,$f2
				div.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,inchtofeet
				
				j main
			
			# ================ Distance - inch to feet =====================
			inchtofeet:
				addi $sp,$sp,-12 # Store every register to be used on stack
				swc1 $f0,0($sp)
				swc1 $f2,4($sp)
				sw $s0,8($sp)
				
				#  feet = inch / 12
				li $s0,0x41400000 # $s0 = 12
				mtc1 $s0,$f2
				div.s $f0,$f0,$f2
				
				# Print the output
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				li $v0,4
				la $a0,newline
				syscall
				
				# Load everything back from stack
				lwc1 $f0,0($sp)
				lwc1 $f2,4($sp)
				lw $s0,8($sp)
				addi $sp,$sp,12
				
				beq $t1,7,inchtoinch
				
				j main
			
			# ================ Distance - inch to inch =====================
			inchtoinch:
				addi $sp,$sp,-4
				swc1 $f0,0($sp)
				
				li $v0,2
				mov.s $f12,$f0
				syscall
				
				lwc1 $f0,0($sp)
				addi $sp,$sp,4
				
				j main
				
		j main
	
	# ============ Single Unit - Weight ===================
	weight:
		# Print number - "Enter a number: ". Ask the user to enter a number of their choice
		li $v0,4
		la $a0,numberSU
		syscall
			
		li $v0,6 # This user input will get stored in $f0
		syscall
		
		# ======================= From =======================
		# Print (1) g                                                                                                                              
		#	(2) kg
		#	(3) lbs
		#	(4) oz
		li $v0,4
		la $a0,weightmenu1
		syscall
		
		# Print mainmenuuser (for Single Unit - Weight) - "Enter your choice: ". Ask user for their choice of input for Single Unit - Weight
		li $v0,4
		la $a0,mainmenuuser
		syscall
			
		li $v0,5
		syscall
			
		# Move userinput for single unit weightmenu 1 to $t0
		move $t0,$v0
		
		# ========================= To ========================
		# Print (1) g                                                                                                                              
		#	(2) kg
		#	(3) lbs
		#	(4) oz
		#	(5) All
		li $v0,4
		la $a0,weightmenu2
		syscall
		
		# Print mainmenuuser (for Single Unit - Weight) - "Enter your choice: ". Ask user for their choice of input for Single Unit - Weight
		li $v0,4
		la $a0,mainmenuuser
		syscall
			
		li $v0,5
		syscall
			
		# Move userinput for single unit weightmenu 2 to $t1
		move $t1,$v0
			
		
			
		# Move 1 -> $t2, 2 -> $t3, 3 -> $t4, 4 -> $t5, 5 -> $t6, 6 -> $t7 for comparison with the user input
		addi $t2,$zero,1
		addi $t3,$zero,2
		addi $t4,$zero,3
		addi $t5,$zero,4
		
		Fromweight:
			beq $t0,$t2,gTo # From - 1
			beq $t0,$t3,kgTo # From - 2
			beq $t0,$t4,lbsTo # From - 3
			beq $t0,$t5,ozTo # From - 4
			j exit
			
		gTo:
			beq $t1,$t2,gtog # 1,1
			beq $t1,$t3,gtokg # 1,2
			beq $t1,$t4,gtolbs # 1,3
			beq $t1,$t5,gtooz # 1,4
			beq $t1,5,gtog # 1,5
			j exit
			
		kgTo:
			beq $t1,$t2,kgtog # 2,1
			beq $t1,$t3,kgtokg # 2,2
			beq $t1,$t4,kgtolbs # 2,3
			beq $t1,$t5,kgtooz # 2,4
			beq $t1,5,kgtog # 2,5
			j exit
			
		lbsTo:
			beq $t1,$t2,lbstog # 3,1
			beq $t1,$t3,lbstokg # 3,2
			beq $t1,$t4,lbstolbs # 3,3
			beq $t1,$t5,lbstooz # 3,4
			beq $t1,5,lbstog # 3,5
			j exit
			
		ozTo:
			beq $t1,$t2,oztog # 4,1
			beq $t1,$t3,oztokg # 4,2
			beq $t1,$t4,oztolbs # 4,3
			beq $t1,$t5,oztooz # 4,4
			beq $t1,5,oztog # 4,5
			j exit
			
	# ====================== Gram ================================
		# ============= Weight - gram to gram ============
		gtog:
			addi $sp,$sp,-4
			swc1 $f0,0($sp)
				
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			lwc1 $f0,0($sp)
			addi $sp,$sp,4
			
			beq $t1,5,gtokg
			
			j main
		
		# ============= Weight - gram to kilogram ============
		gtokg:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  kg = g * 0.001
			li $s0,0x3a83126f # $s0 = 12
			mtc1 $s0,$f2
			mul.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			beq $t1,5,gtolbs
			
			j main
			
		# ============= Weight - gram to lbs ============
		gtolbs:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  lbs = g / 454
			li $s0,0x43e30000 # $s0 = 454
			mtc1 $s0,$f2
			div.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			beq $t1,5,gtooz
			
			j main
			
		# ============= Weight - gram to oz ============
		gtooz:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  oz = g / 28.35
			li $s0,0x41e2cccd # $s0 = 28.35
			mtc1 $s0,$f2
			div.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			j main
			
	# ==================== KiloGram ===============================
		# ============ Weight - kilogram to gram ===========
		kgtog:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  g = kg * 1000
			li $s0,0x447a0000 # $s0 = 1000
			mtc1 $s0,$f2
			mul.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			beq $t1,5,kgtokg
			
			j main
		
		# ============ Weight - kilogram to kilogram ===========
		kgtokg:
			addi $sp,$sp,-4
			swc1 $f0,0($sp)
				
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			lwc1 $f0,0($sp)
			addi $sp,$sp,4
			
			beq $t1,5,kgtolbs
			
			j main
		
		# ============ Weight - kilogram to lbs ===========
		kgtolbs:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  lbs = kg * 2.20462
			li $s0,0x400d187e # $s0 = 2.20462
			mtc1 $s0,$f2
			mul.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			beq $t1,7,kgtooz
			
			j main
		
		# ============ Weight - kilogram to oz ===========
		kgtooz:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  lbs = kg * 35.274
			li $s0,0x420d1893 # $s0 = 35.274
			mtc1 $s0,$f2
			mul.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
		
			j main
			
	# ============================== Lbs =======================================
		# =========== Weight - lbs to gram ==============
		lbstog:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  g = lbs * 453.592
			li $s0,0x43e2cbc7 # $s0 = 453.592
			mtc1 $s0,$f2
			mul.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			beq $t1,5,lbstokg
			
			j main
			
		# =========== Weight - lbs to kilogram ==================
		lbstokg:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  kg = lbs * 0.453592
			li $s0,0x3ee83d36 # $s0 = 0.453592
			mtc1 $s0,$f2
			mul.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			beq $t1,5,lbstolbs
			
			j main
		
		# =========== Weight - lbs to lbs ==================
		lbstolbs:
			addi $sp,$sp,-4
			swc1 $f0,0($sp)
				
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			lwc1 $f0,0($sp)
			addi $sp,$sp,4
			
			beq $t1,5,lbstooz
			
			j main
		
		# =========== Weight - lbs to oz ==================
		lbstooz:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  oz = lbs * 16
			li $s0,0x41800000 # $s0 = 16
			mtc1 $s0,$f2
			mul.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			j main
			
	# ============================== OZ ======================================
		# ========== Weight - oz to gram ==================
		oztog:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  g = oz * 28.3495
			li $s0,0x41e2cbc7 # $s0 = 28.3495
			mtc1 $s0,$f2
			mul.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			beq $t1,5,oztokg
		
			j main
			
		# ========== Weight - oz to kilogram ==================
		oztokg:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  kg = oz / 35.274
			li $s0,0x420d1893 # $s0 = 35.274
			mtc1 $s0,$f2
			div.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			beq $t1,5,oztolbs
			
			j main
		
		# ========== Weight - oz to lbs ==================
		oztolbs:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  lbs = oz / 16
			li $s0,0x41800000 # $s0 = 16
			mtc1 $s0,$f2
			div.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			beq $t1,5,oztooz
		
			j main
		
		# ========== Weight - oz to oz ==================
		oztooz:
			addi $sp,$sp,-4
			swc1 $f0,0($sp)
				
			li $v0,2
			mov.s $f12,$f0
			syscall
				
			lwc1 $f0,0($sp)
			addi $sp,$sp,4
			
			j main
			
		j main
	
	# ============ Single Unit - Speed =====================
	speed:
		# Print number - "Enter a number: ". Ask the user to enter a number of their choice
		li $v0,4
		la $a0,numberSU
		syscall
			
		li $v0,6 # This user input will get stored in $f0
		syscall
		
		# ======================= From =======================
		# Print (1) kmph                                                                                                                              
		#	(2) mph
		li $v0,4
		la $a0,speedmenu1
		syscall
		
		# Print mainmenuuser (for Single Unit - Speed) - "Enter your choice: ". Ask user for their choice of input for Single Unit - Speed
		li $v0,4
		la $a0,mainmenuuser
		syscall
			
		li $v0,5
		syscall
			
		# Move userinput for single unit speedmenu 1 to $t0
		move $t0,$v0
		
		# ========================= To ========================
		# Print (1) kmph                                                                                                                              
		#	(2) mph
		#	(3) All
		li $v0,4
		la $a0,speedmenu2
		syscall
		
		# Print mainmenuuser (for Single Unit - Speed) - "Enter your choice: ". Ask user for their choice of input for Single Unit - Speed
		li $v0,4
		la $a0,mainmenuuser
		syscall
			
		li $v0,5
		syscall
			
		# Move userinput for single unit speedmenu 2 to $t1
		move $t1,$v0
			
		
			
		# Move 1 -> $t2, 2 -> $t3 for comparison with the user input
		addi $t2,$zero,1
		addi $t3,$zero,2
		
		Fromspeed:
			beq $t0,$t2,kmphTo # From - 1
			beq $t0,$t3,mphTo # From - 2
			j exit
			
		kmphTo:
			beq $t1,$t2,kmphtokmph # 1,1
			beq $t1,$t3,kmphtomph # 1,2
			beq $t1,3,kmphtokmph # 1,3
			j exit
			
		mphTo:
			beq $t1,$t2,mphtokmph # 2,1
			beq $t1,$t3,mphtomph # 2,2
			beq $t1,3,mphtokmph # 2,3
			j exit
			
	# ======================================= Kilometers Per Hour ==============================
		# ============= Speed - kilometers per hour to kilometers per hour ============
		kmphtokmph:
			addi $sp,$sp,-4
			swc1 $f0,0($sp)
				
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			lwc1 $f0,0($sp)
			addi $sp,$sp,4
			
			beq $t1,3,kmphtomph
			
			j main
		
		# ============= Speed - kilometers per hour to miles per hour ============
		kmphtomph:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  mph = kmph / 1.609
			li $s0,0x3fcdf3b6 # $s0 =  1.609
			mtc1 $s0,$f2
			div.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			j main
			
	# ======================================= Miles Per Hour ==============================
		# ============= Speed - miles per hour to kilometers per hour ============
		mphtokmph:
			addi $sp,$sp,-12 # Store every register to be used on stack
			swc1 $f0,0($sp)
			swc1 $f2,4($sp)
			sw $s0,8($sp)
				
			#  kmph = mph * 1.60934
			li $s0,0x3fcdfeda # $s0 =  1.60934
			mtc1 $s0,$f2
			mul.s $f0,$f0,$f2
				
			# Print the output
			li $v0,2
			mov.s $f12,$f0
			syscall
			
			li $v0,4
			la $a0,newline
			syscall
				
			# Load everything back from stack
			lwc1 $f0,0($sp)
			lwc1 $f2,4($sp)
			lw $s0,8($sp)
			addi $sp,$sp,12
			
			beq $t1,3,mphtomph
			
			j main
		 
		# ============= Speed - miles per hour to miles per hour ============
		mphtomph:
			addi $sp,$sp,-4
			swc1 $f0,0($sp)
				
			li $v0,2
			mov.s $f12,$f0
			syscall
				
			lwc1 $f0,0($sp)
			addi $sp,$sp,4
			
			j main
		
		j main
	

# ==================== Sentence ======================
sentence:
	# ===== $s0 -> User input =========
# ===== $s1 -> kilometers =========
# ===== $t8 -> word match count =====


# "Please enter a sentence"
li $v0,4
la $a0,inputprompt
syscall

# Take sentence input from user
li $v0,8
la $a0,userinputspace
li $a1,100
syscall

# Move user string to $s0
move $s0,$a0

# Move the word "kilometers" to $s1
la $s1,kilom

# initialize word match count as 0 in $t8
li $t8,0

# initialize ascii "space" in $t4
li $t4,0x20

move $t0,$s0 # Move sentence to $t0
move $t1,$s1 # Move word to $t1

la $t7,number # Space for the number to be stored
move $t5,$t7 # Move base address of the number in $t5
li $s7,0 # NUM

addi $sp,$sp,-16 # Initialize the stack
sw $s0,($sp) # Store the base address of the string on stack
sw $t7,4($sp) # Store the base address of the number on stack

# ============== Check for number ================
numberloop:
	li $t3,0x2b # Store ascii "+" in $t3	
	lbu $t2,0($t0) # Move first character of string in $t2
		
	# Check whether string has values between "0" to "9"
	beq $t2,0x30,zeroto0 
	beq $t2,0x31,oneto1 
	beq $t2,0x32,twoto2 	
	beq $t2,0x33,threeto3
	beq $t2,0x34,fourto4
	beq $t2,0x35,fiveto5
	beq $t2,0x36,sixto6
	beq $t2,0x37,sevento7
	beq $t2,0x38,eightto8
	beq $t2,0x39,nineto9 	
	addi $t0,$t0,1 # Advance pointer in the string to next character
	
	beqz $t2,storenewline # End of sentence? Jump
	j numberloop
zeroto0:
	sb $t3,($t0) # Ascii space to erase the number
	li $t2,0
	sb $t2,($t7)
	addi $t7,$t7,1
	addi $t0,$t0,1 # Advance pointer in the string to next character
	j numberloop
oneto1:
	sb $t3,($t0)
	li $t2,1
	sb $t2,($t7)
	addi $t7,$t7,1
	addi $t0,$t0,1 # Advance pointer in the string to next character
	j numberloop
twoto2:
	sb $t3,($t0)
	li $t2,2
	sb $t2,($t7)
	addi $t7,$t7,1
	addi $t0,$t0,1 # Advance pointer in the string to next character
	j numberloop
threeto3:
	sb $t3,($t0)
	li $t2,3
	sb $t2,($t7)
	addi $t7,$t7,1
	addi $t0,$t0,1 # Advance pointer in the string to next character
	j numberloop
fourto4:
	sb $t3,($t0)
	li $t2,4
	sb $t2,($t7)
	addi $t7,$t7,1
	addi $t0,$t0,1 # Advance pointer in the string to next character
	j numberloop

fiveto5:
	sb $t3,($t0)
	li $t2,5
	sb $t2,($t7)
	addi $t7,$t7,1
	addi $t0,$t0,1 # Advance pointer in the string to next character
	j numberloop
sixto6:
	sb $t3,($t0)
	li $t2,6
	sb $t2,($t7)
	addi $t7,$t7,1
	addi $t0,$t0,1 # Advance pointer in the string to next character
	j numberloop
sevento7:
	sb $t3,($t0)
	li $t2,7
	sb $t2,($t7)
	addi $t7,$t7,1
	addi $t0,$t0,1 # Advance pointer in the string to next character
	j numberloop
eightto8:
	sb $t3,($t0)
	li $t2,8
	sb $t2,($t7)
	addi $t7,$t7,1
	addi $t0,$t0,1 # Advance pointer in the string to next character
	j numberloop
nineto9:
	sb $t3,($t0)
	li $t2,9
	sb $t2,($t7)
	addi $t7,$t7,1
	addi $t0,$t0,1 # Advance pointer in the string to next character
	j numberloop
	
# =============== Check for unit =============

kmloop:	
	lbu $t2,0($t0) # Move first character of string in $t2
	
	
	lbu $t3,0($t1) # Move first character of word in $t3
	
	
	bne $t2,$t3,keepincrementkm # If first char of sentence and word don't match jump to keepincrement
	addi $t1,$t1,1 # Advance pointer in the word to next character
	addi $t0,$t0,1 # Advance pointer in the string to next character
	addi $t8,$t8,1 # Increment match count
	beq $t8,10,convertkmtom # Match count == 10 jump
	j kmloop
	
keepincrementkm:
	# If the first char of string and word don't match keep incrementing the sentence counter until it encounters space
	lbu $t2,0($t0) # Move first character of string in $t2	
	
	beq $t2,$t4,incrementkm # If the sentence encounters a space go back to loop
	beqz $t2,mrestore # End of sentence then exit
	
	addi $t0,$t0,1 # Advance pointer in the string to next character
	
	j keepincrementkm
	
incrementkm:
	addi $t0,$t0,1 # Increment once so that it doesn't load up "space" after jumping back to loop
	move $t1,$s1 # Reset the word pointer to the start of the word
	j kmloop
	
getAddresskm:
	# Get the base address of the sentence from $s0 -> $s3
	move $s3,$s0

	# Get address of kilometers - 10 in $s4
	addi $t5,$t0,-10
	move $s4,$t5 
	
	# Get address of words after kilometers in $s5
	move $s5,$t0
	
	# Store miles in $s6
	la $s6,mil
	
	# Space for the final sentence to be displayed
	la $s2,tobereplaced
	
	j kmtom1
	
	
	
	
kmtom1:
	lbu $t6,($s3) # Load first character from base address 
	beq $t6,0x2b,skip
	sb $t6,($s2) # Store first character from base address in the new space alloted for final sentence
	addi $s2,$s2,1 # Increment new space address
	skip:
	
	addi $s3,$s3,1 # Increment base address
	

		
	beq $s3,$s4,loadtobereplaced3km # Check if base address equals kilometers-11 address
	
	j kmtom1

	
kmtom2:
	#lbu $t6,($s6) # Load first character from "miles" address
	#sb $t6,($s2) #Store the first character of miles in the new space alloted
	

	#addi $s6,$s6,1 # Increment miles address
	#addi $s2,$s2,1 # Increment new space address
	
	#beq $t6,0x73,loadtobereplaced3km # If pointer == "s" in miles jump to next step (kmtom3)
	
	#j kmtom2
	li $v0,4
	la $a0,mil
	syscall
	
	li $v0,4
	la $a0,tobereplaced3
	syscall
	
	j exitse	
	

loadtobereplaced3km:
	la $s2,tobereplaced3
	j kmtom3
	
kmtom3:
	
	lbu $t6,($s5) # Load first character from address after kilometers
	sb $t6,($s2) # Store first characters from address after kilometers to newly alloted space
		
	
	addi $s5,$s5,1 # Increment address of address after kilometers
	addi $s2,$s2,1 # Increment new space address
	
	beqz $t6,final # End of sentence? Then jump to final printing
	
	j kmtom3
	
# ========== Miles to kilometers =================

mrestore:
	lw $t0,($sp) # Restore base address from stack for miles
	la $t1,mil # Store word "miles" for checking in $t1
	li $t8,0 # Restore count back to 0
	j mloop
	
mloop:
	lbu $t2,0($t0) # Move first character of string in $t2
	
	
	lbu $t3,0($t1) # Move first character of word in $t3
	
	
	bne $t2,$t3,keepincrementm # If first char of sentence and word don't match jump to keepincrement
	addi $t1,$t1,1 # Advance pointer in the word to next character
	addi $t0,$t0,1 # Advance pointer in the string to next character
	addi $t8,$t8,1 # Increment match count
	beq $t8,5,convertmtokm # Match count == 5 jump
	j mloop

keepincrementm:
	# If the first char of string and word don't match keep incrementing the sentence counter until it encounters space
	lbu $t2,0($t0) # Move first character of string in $t2	
	
	beq $t2,$t4,incrementm # If the sentence encounters a space go back to loop
	beqz $t2,kgrestore # End of sentence then exit
	
	addi $t0,$t0,1 # Advance pointer in the string to next character
	
	j keepincrementm
	
incrementm:
	addi $t0,$t0,1 # Increment once so that it doesn't load up "space" after jumping back to loop
	la $t1,mil # Reset the word pointer to the start of the word
	j mloop
	
getAddressm:
	# Get the base address of the sentence from $s0 -> $s3
	move $s3,$s0

	# Get address of miles - 5 in $s4
	addi $t5,$t0,-5
	move $s4,$t5 
	
	# Get address of words after miles in $s5
	move $s5,$t0
	
	# Store kilometers in $s6
	la $s6,kilom
	
	# Space for the final sentence to be displayed
	la $s2,tobereplaced
	
	j mtokm1
	
mtokm1:
	lbu $t6,($s3) # Load first character from base address
	beq $t6,0x2b,skip2 
	sb $t6,($s2) # Store first character from base address in the new space alloted for final sentence
	addi $s2,$s2,1 # Increment new space address
	skip2:
	
	addi $s3,$s3,1 # Increment base address


		
	beq $s3,$s4,loadtobereplaced3m # Check if base address equals miles-5 address
	
	j mtokm1

	
mtokm2:
#	lbu $t6,($s6) # Load first character from "kilometers" address
#	sb $t6,($s2) #Store the first character of kilometers in the new space alloted
	

#	addi $s6,$s6,1 # Increment kilometers address
#	addi $s2,$s2,1 # Increment new space address
	
#	beq $t6,0x73,loadtobereplaced3m # If pointer == "s" in kilometers jump to next step (mtokm3)
	
#	j mtokm2
	li $v0,4
	la $a0,kilom
	syscall
	
	
	li $v0,4
	la $a0,tobereplaced3
	syscall
	
	j exitse	

loadtobereplaced3m:
	la $s2,tobereplaced3
	j mtokm3
	
mtokm3:
	
	lbu $t6,($s5) # Load first character from address after miles
	sb $t6,($s2) # Store first characters from address after miles to newly alloted space
		
	
	addi $s5,$s5,1 # Increment address of address after miles
	addi $s2,$s2,1 # Increment new space address
	
	beqz $t6,final # End of sentence? Then jump to final printing
	
	j mtokm3

	
		
			
					
# ============== Kilograms to pounds =============
kgrestore:
	lw $t0,($sp) # Restore base address from stack for miles
	la $t1,kilog # Store word "kilograms" for checking in $t1
	li $t8,0 # Restore count back to 0
	j kgloop

kgloop:
	lbu $t2,0($t0) # Move first character of string in $t2
	
	
	lbu $t3,0($t1) # Move first character of word in $t3
	
	
	bne $t2,$t3,keepincrementkg # If first char of sentence and word don't match jump to keepincrement
	addi $t1,$t1,1 # Advance pointer in the word to next character
	addi $t0,$t0,1 # Advance pointer in the string to next character
	addi $t8,$t8,1 # Increment match count
	beq $t8,9,convertkgtopd # Match count == 9 jump
	j kgloop

keepincrementkg:
	# If the first char of string and word don't match keep incrementing the sentence counter until it encounters space
	lbu $t2,0($t0) # Move first character of string in $t2	
	
	beq $t2,$t4,incrementkg # If the sentence encounters a space go back to loop
	beqz $t2,pdrestore # End of sentence then exit
	
	addi $t0,$t0,1 # Advance pointer in the string to next character
	
	j keepincrementkg
	
incrementkg:
	addi $t0,$t0,1 # Increment once so that it doesn't load up "space" after jumping back to loop
	la $t1,kilog # Reset the word pointer to the start of the word
	j kgloop
	
getAddresskg:
	# Get the base address of the sentence from $s0 -> $s3
	move $s3,$s0

	# Get address of kilograms - 9 in $s4
	addi $t5,$t0,-9
	move $s4,$t5 
	
	# Get address of words after kilograms in $s5
	move $s5,$t0
	
	# Store pounds in $s6
	la $s6,pou
	
	# Space for the final sentence to be displayed
	la $s2,tobereplaced
	
	j kgtopd1
	
kgtopd1:
	lbu $t6,($s3) # Load first character from base address
	beq $t6,0x2b,skip3 
	sb $t6,($s2) # Store first character from base address in the new space alloted for final sentence
	addi $s2,$s2,1 # Increment new space address
	skip3:
	
	addi $s3,$s3,1 # Increment base address


		
	beq $s3,$s4,loadtobereplaced3kg # Check if base address equals miles-5 address
	
	j kgtopd1
	
kgtopd2:
	li $v0,4
	la $a0,pou
	syscall
	
	li $v0,4
	la $a0,tobereplaced3
	syscall
	
	j exitse	

loadtobereplaced3kg:
	la $s2,tobereplaced3
	j kgtopd3
	
kgtopd3:
	
	lbu $t6,($s5) # Load first character from address after miles
	sb $t6,($s2) # Store first characters from address after miles to newly alloted space
		
	
	addi $s5,$s5,1 # Increment address of address after miles
	addi $s2,$s2,1 # Increment new space address
	
	beqz $t6,final # End of sentence? Then jump to final printing
	
	j kgtopd3
	
# ================ Pounds to Kilograms ====================
pdrestore:
	lw $t0,($sp) # Restore base address from stack for miles
	la $t1,pou # Store word "pounds" for checking in $t1
	li $t8,0 # Restore count back to 0
	j pdloop
	
pdloop:
	lbu $t2,0($t0) # Move first character of string in $t2
	
	
	lbu $t3,0($t1) # Move first character of word in $t3
	
	
	bne $t2,$t3,keepincrementpd # If first char of sentence and word don't match jump to keepincrement
	addi $t1,$t1,1 # Advance pointer in the word to next character
	addi $t0,$t0,1 # Advance pointer in the string to next character
	addi $t8,$t8,1 # Increment match count
	beq $t8,6,convertpdtokg # Match count == 6 jump
	j pdloop
	
keepincrementpd:
	# If the first char of string and word don't match keep incrementing the sentence counter until it encounters space
	lbu $t2,0($t0) # Move first character of string in $t2	
	
	beq $t2,$t4,incrementpd # If the sentence encounters a space go back to loop
	beqz $t2,kmphrestore # End of sentence then exit
	
	addi $t0,$t0,1 # Advance pointer in the string to next character
	
	j keepincrementpd
	
incrementpd:
	addi $t0,$t0,1 # Increment once so that it doesn't load up "space" after jumping back to loop
	la $t1,pou # Reset the word pointer to the start of the word
	j pdloop
	
getAddresspd:
	# Get the base address of the sentence from $s0 -> $s3
	move $s3,$s0

	# Get address of pounds - 6 in $s4
	addi $t5,$t0,-6
	move $s4,$t5 
	
	# Get address of words after kilograms in $s5
	move $s5,$t0
	
	# Store kilog in $s6
	la $s6,kilog
	
	# Space for the final sentence to be displayed
	la $s2,tobereplaced
	
	j pdtokg1
	
pdtokg1:
	lbu $t6,($s3) # Load first character from base address
	beq $t6,0x2b,skip4
	sb $t6,($s2) # Store first character from base address in the new space alloted for final sentence
	addi $s2,$s2,1 # Increment new space address
	skip4:
	
	addi $s3,$s3,1 # Increment base address


		
	beq $s3,$s4,loadtobereplaced3pd # Check if base address equals pounds-6 address
	
	j pdtokg1
	
pdtokg2:
	li $v0,4
	la $a0,kilog
	syscall
	
	li $v0,4
	la $a0,tobereplaced3
	syscall
	
	j exitse	

loadtobereplaced3pd:
	la $s2,tobereplaced3
	j pdtokg3
	
pdtokg3:
	
	lbu $t6,($s5) # Load first character from address after miles
	sb $t6,($s2) # Store first characters from address after miles to newly alloted space
		
	
	addi $s5,$s5,1 # Increment address of address after miles
	addi $s2,$s2,1 # Increment new space address
	
	beqz $t6,final # End of sentence? Then jump to final printing
	
	j pdtokg3
	
	
	
	
# ========= kmph to mph =========
kmphrestore:
	lw $t0,($sp) # Restore base address from stack for miles
	la $t1,kmph # Store word "kmph" for checking in $t1
	li $t8,0 # Restore count back to 0
	j kmphloop
	
kmphloop:
	lbu $t2,0($t0) # Move first character of string in $t2
	
	
	lbu $t3,0($t1) # Move first character of word in $t3
	
	
	bne $t2,$t3,keepincrementkmph # If first char of sentence and word don't match jump to keepincrement
	addi $t1,$t1,1 # Advance pointer in the word to next character
	addi $t0,$t0,1 # Advance pointer in the string to next character
	addi $t8,$t8,1 # Increment match count
	beq $t8,4,convertkmphtomph # Match count == 4 jump
	j kmphloop
	
keepincrementkmph:
	# If the first char of string and word don't match keep incrementing the sentence counter until it encounters space
	lbu $t2,0($t0) # Move first character of string in $t2	
	
	beq $t2,$t4,incrementkmph # If the sentence encounters a space go back to loop
	beqz $t2,mphrestore # End of sentence then exit
	
	addi $t0,$t0,1 # Advance pointer in the string to next character
	
	j keepincrementkmph
	
incrementkmph:
	addi $t0,$t0,1 # Increment once so that it doesn't load up "space" after jumping back to loop
	la $t1,kmph # Reset the word pointer to the start of the word
	j kmphloop
	
getAddresskmph:
	# Get the base address of the sentence from $s0 -> $s3
	move $s3,$s0

	# Get address of kmph - 4 in $s4
	addi $t5,$t0,-4
	move $s4,$t5 
	
	# Get address of words after kilograms in $s5
	move $s5,$t0
	
	# Store kilog in $s6
	la $s6,mph
	
	# Space for the final sentence to be displayed
	la $s2,tobereplaced
	
	j kmphtomph1
	
kmphtomph1:
	lbu $t6,($s3) # Load first character from base address
	beq $t6,0x2b,skip5
	sb $t6,($s2) # Store first character from base address in the new space alloted for final sentence
	addi $s2,$s2,1 # Increment new space address
	skip5:
	
	addi $s3,$s3,1 # Increment base address


		
	beq $s3,$s4,loadtobereplaced3kmph # Check if base address equals kmph-4 address
	
	j kmphtomph1
	
kmphtomph2:
	li $v0,4
	la $a0,mph
	syscall
	
	li $v0,4
	la $a0,tobereplaced3
	syscall
	
	j exitse

loadtobereplaced3kmph:
	la $s2,tobereplaced3
	j kmphtomph3
	
kmphtomph3:
	
	lbu $t6,($s5) # Load first character from address after miles
	sb $t6,($s2) # Store first characters from address after miles to newly alloted space
		
	
	addi $s5,$s5,1 # Increment address of address after miles
	addi $s2,$s2,1 # Increment new space address
	
	beqz $t6,final # End of sentence? Then jump to final printing
	
	j kmphtomph3	
	
		
# =========== Mph to kmph ==========	
mphrestore:
	lw $t0,($sp) # Restore base address from stack for miles
	la $t1,mph # Store word "mph" for checking in $t1
	li $t8,0 # Restore count back to 0
	j mphloop

mphloop:
	lbu $t2,0($t0) # Move first character of string in $t2
	
	
	lbu $t3,0($t1) # Move first character of word in $t3
	
	
	bne $t2,$t3,keepincrementmph # If first char of sentence and word don't match jump to keepincrement
	addi $t1,$t1,1 # Advance pointer in the word to next character
	addi $t0,$t0,1 # Advance pointer in the string to next character
	addi $t8,$t8,1 # Increment match count
	beq $t8,3,convertmphtokmph # Match count == 3 jump
	j mphloop
	
keepincrementmph:
	# If the first char of string and word don't match keep incrementing the sentence counter until it encounters space
	lbu $t2,0($t0) # Move first character of string in $t2	
	
	beq $t2,$t4,incrementmph # If the sentence encounters a space go back to loop
	beqz $t2,exitse # End of sentence then exit
	
	addi $t0,$t0,1 # Advance pointer in the string to next character
	
	j keepincrementmph
	
incrementmph:
	addi $t0,$t0,1 # Increment once so that it doesn't load up "space" after jumping back to loop
	la $t1,mph # Reset the word pointer to the start of the word
	j mphloop
	
getAddressmph:
	# Get the base address of the sentence from $s0 -> $s3
	move $s3,$s0

	# Get address of mph - 3 in $s4
	addi $t5,$t0,-3
	move $s4,$t5 
	
	# Get address of words after mph in $s5
	move $s5,$t0
	
	# Store kmph in $s6
	la $s6,kmph
	
	# Space for the final sentence to be displayed
	la $s2,tobereplaced
	
	j mphtokmph1
	
mphtokmph1:
	lbu $t6,($s3) # Load first character from base address
	beq $t6,0x2b,skip6
	sb $t6,($s2) # Store first character from base address in the new space alloted for final sentence
	addi $s2,$s2,1 # Increment new space address
	skip6:
	
	addi $s3,$s3,1 # Increment base address


		
	beq $s3,$s4,loadtobereplaced3mph # Check if base address equals pounds-6 address
	
	j mphtokmph1
	
mphtokmph2:
	li $v0,4
	la $a0,kmph
	syscall
	
	li $v0,4
	la $a0,tobereplaced3
	syscall
	
	j exitse	

loadtobereplaced3mph:
	la $s2,tobereplaced3
	j mphtokmph3
	
mphtokmph3:
	
	lbu $t6,($s5) # Load first character from address after miles
	sb $t6,($s2) # Store first characters from address after miles to newly alloted space
		
	
	addi $s5,$s5,1 # Increment address of address after miles
	addi $s2,$s2,1 # Increment new space address
	
	beqz $t6,final # End of sentence? Then jump to final printing
	
	j mphtokmph3	

# ============ Number Related ==========
storenewline:
	li $t3,0x0a
	sb $t3,($t7)
	j printnumber

printnumber:
	lbu $t9,($t5) # Load first number from the number space
	beq $t9,0x0a,restorenumber # Check for newline in number space
	mul $s7,$s7,10 # num = num*10 + digit
	add $s7,$s7,$t9
	
	addi $t5,$t5,1 # Increment pointer in number space
	
	j printnumber
	
restorenumber:
 ## ======= $s7 -> number ===========
 	lw $t0,($sp) # Restore the base address from the stack
 	j kmloop # Jump to kmloop
 
 convertkmtom:
 	swc1 $f2,8($sp)
 	swc1 $f3,12($sp)
 	li $t5,0x3fcdf3b6 # 1.609
 	mtc1 $t5,$f2 # Move 1.609 to $f2
 	mtc1 $s7,$f3 # Move the number from the sentence to $s7
 	cvt.s.w $f3,$f3 # Convert int to float
 	div.s $f3,$f3,$f2 # Divide the number by 1.609 and store back in $f3
 	mov.s $f12,$f3 # Move the result to $f12 for printing
 	lwc1 $f2,8($sp) # Restore from stack
 	lwc1 $f3,12($sp)
 	j getAddresskm
 	
 convertmtokm:
 	swc1 $f2,8($sp)
 	swc1 $f3,12($sp)
 	li $t5,0x3fcdf3b6 # 1.609
 	mtc1 $t5,$f2 # Move 1.609 to $f2
 	mtc1 $s7,$f3 # Move the number from the sentence to $s7
 	cvt.s.w $f3,$f3 # Convert int to float
 	mul.s $f3,$f3,$f2 # Divide the number by 1.609 and store back in $f3
 	mov.s $f12,$f3 # Move the result to $f12 for printing
 	lwc1 $f2,8($sp) # Restore from stack
 	lwc1 $f3,12($sp)
	j getAddressm
	
convertkgtopd:
	swc1 $f2,8($sp)
 	swc1 $f3,12($sp)
 	li $t5,0x400d1eb8 # 2.205
 	mtc1 $t5,$f2 # Move 2.205 to $f2
 	mtc1 $s7,$f3 # Move the number from the sentence to $s7
 	cvt.s.w $f3,$f3 # Convert int to float
 	mul.s $f3,$f3,$f2 # Multiply the number by 2.205 and store back in $f3
 	mov.s $f12,$f3 # Move the result to $f12 for printing
 	lwc1 $f2,8($sp) # Restore from stack
 	lwc1 $f3,12($sp)
	j getAddresskg
	
convertpdtokg:
	swc1 $f2,8($sp)
 	swc1 $f3,12($sp)
 	li $t5,0x400d1eb8 # 2.205
 	mtc1 $t5,$f2 # Move 2.205 to $f2
 	mtc1 $s7,$f3 # Move the number from the sentence to $s7
 	cvt.s.w $f3,$f3 # Convert int to float
 	div.s $f3,$f3,$f2 # Divide the number by 2.205 and store back in $f3
 	mov.s $f12,$f3 # Move the result to $f12 for printing
 	lwc1 $f2,8($sp) # Restore from stack
 	lwc1 $f3,12($sp)
	j getAddresspd
	
convertkmphtomph:
	swc1 $f2,8($sp)
 	swc1 $f3,12($sp)
 	li $t5,0x3fcdf3b6 # 1.609
 	mtc1 $t5,$f2 # Move 1.609 to $f2
 	mtc1 $s7,$f3 # Move the number from the sentence to $s7
 	cvt.s.w $f3,$f3 # Convert int to float
 	div.s $f3,$f3,$f2 # Divide the number by 1.609 and store back in $f3
 	mov.s $f12,$f3 # Move the result to $f12 for printing
 	lwc1 $f2,8($sp) # Restore from stack
 	lwc1 $f3,12($sp)
	j getAddresskmph

convertmphtokmph:
	swc1 $f2,8($sp)
 	swc1 $f3,12($sp)
 	li $t5,0x3fcdf3b6 # 1.609
 	mtc1 $t5,$f2 # Move 1.609 to $f2
 	mtc1 $s7,$f3 # Move the number from the sentence to $s7
 	cvt.s.w $f3,$f3 # Convert int to float
 	mul.s $f3,$f3,$f2 # Multiply the number by 1.609 and store back in $f3
 	mov.s $f12,$f3 # Move the result to $f12 for printing
 	lwc1 $f2,8($sp) # Restore from stack
 	lwc1 $f3,12($sp)
	j getAddressmph
 
		
final:
	li $v0,4
	la $a0,tobereplaced
	syscall
	
	li $v0,2
	syscall
	
	li $v0,4
	la $a0,space
	syscall
	
	beq $t8,10,kmtom2
	beq $t8,5,mtokm2
	beq $t8,9,kgtopd2
	beq $t8,6,pdtokg2
	beq $t8,4,kmphtomph2
	beq $t8,3,mphtokmph2

	

exitse:
	li $t0,0
	li $t1,0
	li $t2,0
	li $t3,0
	li $t4,0
	li $t5,0
	li $t6,0
	li $t7,0
	li $t8,0
	li $t9,0
	li $s0,0
	li $s1,0
	li $s2,0
	li $s3,0
	li $s4,0
	li $s5,0
	li $s6,0
	li $s7,0
	addi $sp,$sp,16
	
	j main

# ==================== Currency Conversion =====================
currencyconversion:
	# f1 denom
	# f2 base to secod
	# f3 second to third
	# f4 third to base

	addi $sp,$sp,-36 # Store every register to be used on stack
	swc1 $f0,0($sp)
	swc1 $f1,4($sp)
	swc1 $f2,8($sp)
	swc1 $f3,12($sp)
	swc1 $f4,16($sp)
	swc1 $f5,20($sp)
	swc1 $f6,24($sp)
	swc1 $f7,28($sp)
	swc1 $f12,32($sp)

	# display warning
	li $v0,4
	la $a0,warning
	syscall

	# base currency
	li $v0,4
	la $a0,basep
	syscall

	# input base currency
	li $v0, 8
	la $a0, base
	li $a1, 20
	syscall

	# base denomination
	li $v0,4
	la $a0,denom
	syscall

	# input denom
	li $v0, 6 
	syscall
	mov.s $f1,$f0

	#second currency
	li $v0,4
	la $a0,secondp
	syscall

	#input second currency
	li $v0, 8
	la $a0, second
	li $a1, 20
	syscall

	# base to second rate
	li $v0,4
	la $a0,btos
	syscall

	#input base to second rate
	li $v0, 6 
	syscall
	mov.s $f2,$f0

	#third currency
	li $v0,4
	la $a0,thirdp
	syscall

	#input third currency
	li $v0, 8
	la $a0, third
	li $a1, 20
	syscall
	
	# second to third rate
	li $v0,4
	la $a0,stot
	syscall

	#input second to third rate
	li $v0, 6 
	syscall
	mov.s $f3,$f0
	
	#third to base rate
	li $v0,4
	la $a0,ttob
	syscall

	#input thord to base rate
	li $v0, 6 
	syscall
	mov.s $f4,$f0

	# calculate path 1
	mul.s $f5,$f1,$f2
	mul.s $f5,$f5,$f3
	mul.s $f5,$f5,$f4

	# subtract base from final result (path 1 final result)
	sub.s $f6,$f5,$f0

	# calculate path 2
	mul.s $f5,$f1,$f4
	mul.s $f5,$f5,$f3
	mul.s $f5,$f5,$f2

	# subtract base from final result (path 2 final result)
	sub.s $f7,$f5,$f0

	c.lt.s $f6,$f7
	bc1t path2

	path1:
		c.lt.s $f6,$f1
		bc1t loss
	
		# output optimal path
		li $v0,4
		la $a0,base
		syscall
	
		li $v0,4
		la $a0,arrow
		syscall
	
		li $v0,4
		la $a0,second
		syscall
	
		li $v0,4
		la $a0,arrow
		syscall
	
		li $v0,4
		la $a0,third
		syscall
	
		# output profit
		li $v0,4
		la $a0,profit
		syscall
	
		li $v0,4
		la $a0,base
		syscall
	
		sub.s $f12,$f6,$f1
		li $v0,2
		syscall
	
		# Pop values from stack
		lwc1 $f0,0($sp)
		lwc1 $f1,4($sp)
		lwc1 $f2,8($sp)
		lwc1 $f3,12($sp)
		lwc1 $f4,16($sp)
		lwc1 $f5,20($sp)
		lwc1 $f6,24($sp)
		lwc1 $f7,28($sp)
		lwc1 $f12,32($sp)
		addi $sp,$sp,36 
	
		j main
	

	path2: 
		c.lt.s $f7,$f1
		bc1t loss
	
		# output optimal path
		li $v0,4
		la $a0,third
		syscall
	
		li $v0,4
		la $a0,arrow
		syscall
	
		li $v0,4
		la $a0,second
		syscall
	
		li $v0,4
		la $a0,arrow
		syscall
	
		li $v0,4
		la $a0,base
		syscall	
	
		# output profit
		li $v0,4
		la $a0,profit
		syscall
	
		li $v0,4
		la $a0,base
		syscall
	
		sub.s $f12,$f7,$f1
		li $v0,2
		syscall
	
		# Pop values from stack
		lwc1 $f0,0($sp)
		lwc1 $f1,4($sp)
		lwc1 $f2,8($sp)
		lwc1 $f3,12($sp)
		lwc1 $f4,16($sp)
		lwc1 $f5,20($sp)
		lwc1 $f6,24($sp)
		lwc1 $f7,28($sp)
		lwc1 $f12,32($sp)
		addi $sp,$sp,36 
	
		j main
	
	loss: 
		li $v0,4
		la $a0,noarb
		syscall
	
		# Pop values from stack
		lwc1 $f0,0($sp)
		lwc1 $f1,4($sp)
		lwc1 $f2,8($sp)
		lwc1 $f3,12($sp)
		lwc1 $f4,16($sp)
		lwc1 $f5,20($sp)
		lwc1 $f6,24($sp)
		lwc1 $f7,28($sp)
		lwc1 $f12,32($sp)
		addi $sp,$sp,36 
	
		j main
# ================ End of Currency Arbitrage ===================		

	
# ================= Exit =========================
exit:
	# Exit code
	li $v0,10
	syscall
