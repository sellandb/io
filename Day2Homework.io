//Fib problem

Fibonacci := method(index,
	if(index == 2 or index == 1, return 1)
	return Fibonacci(index - 1) + Fibonacci(index - 2)
)

Fibonacci2 := method(index,
	if(index == 2 or index == 1, return 1)
	sequence := 1
	fibs := list(1,1)
	while(sequence < (index - 1),
		fibs append ((fibs at(sequence)) + (fibs at(sequence - 1)))
		sequence = sequence + 1
	)
	return fibs at(sequence)
)

//Overriding the "/" operator, except I am adding a new one in this case
OperatorTable addOperator("div", 2)

Number div := method(divisor,
	if(divisor == 0,
		return divisor,
		return self/divisor)
)

//Adding up a 2D array
2dArray := list(list(1,2,3,4), list(5,6,7,8), list(9,10,11,12), list(13,14,15,16))

2dsum := method(array,
	out := 0
	while(array size > 0,
		current := array pop
		out = out + current sum
	)
	return out
)
//2dsum(2dArray) println
	
//Create myAverage
IncorrectTypeException := Exception clone
IncorrectTypeException name := "Incorrect Type Exception"

List myAverage := method(
	if(self size == 0,
		return 0
	)
	i := self size
	while(i > 0,
		if( self at(i-1) type != "Number",
			IncorrectTypeException raise("There was a non number type in the list")
		)
		i = i - 1
	)
	return (self sum / self size)
)
Null := Object clone
dList := Object clone
dList dim := method(x,y,
	self X := x
	self Y := y
	self DList := list()
	i := 0
	j := 0
	while(i < x,
		self DList push(list())
		while(j < y,
			self DList at(i) push(Null clone)
			j = j + 1
		)
		j = 0
		i = i + 1
	)
	return self
)

dList set := method(x,y,value,
	self DList at(x) atPut(y, value)
	return self
)

dList get := method(x,y,
	self DList at(x) at(y)
)
		
		
//Implement transpose
dList transpose := method (
	outputList := dList clone
	outputList dim(self Y, self X)
	i := 0
	j := 0
	while(i < (self X),
		write("outside", i)
		while(j < (self Y),
			write("inside", j)
			outputList set(j,i, self get(i,j))
			j = j + 1
		)
		j = 0
		i = i + 1
	)
	return outputList
)

dList writeToFile := method(name,
	if(name type != "Sequence",
		Exception raise
	)
	f := File with(name)
	f remove
	f openForUpdating
	i := 0
	j := 0
	while(i < self X,
		while(j < self Y,
			if( j == ((self Y) - 1),
				f write("#{self get(i,j)}" interpolate),
				f write("#{self get(i,j)}\t" interpolate)
			)
			j = j + 1
		)
		j = 0
		f write("\r\n")
		i = i + 1
	)
	f close
)
dList readFromFile := method(name,
	if(name type != "Sequence",
		Exception raise
	)
	f := File with(name)
	f openForReading
	
	s := f contents
	outMatrix := dList clone
	lines := s split("\r\n")
	i := 0
	j := 0
	while(i < lines size,
		numbers := lines at(i) split("\t")
		if(i == 0,
			outMatrix dim(lines size, numbers size)
		)
		while(j < numbers size,
			outMatrix set(i,j, numbers at(j) asNumber)	
			j = j + 1
		)
		j = 0
		i = i + 1
	)
	f close
	return outMatrix
)

//Last homework problem
"Lets play a game" println
StandardIO := File standardInput()
"Test" println
testIn := StandardIO readLine()
testIn println
	
	
	