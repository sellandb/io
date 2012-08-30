Car := Object clone
Car description := "Gets you around"
Car speed := "Medium"

Ferrari := Car clone
Ferrari description = "Gets you around fast"
Ferrari speed = "Fast"

mycar := Ferrari clone
mycar speed = "Faster"

mycar description println
mycar speed println

practice := method(1+1)
practice() println

prac := getSlot("practice")
prac() println