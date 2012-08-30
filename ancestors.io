Object ancestors := method(
	prototype := self proto
	if(prototype != Object,
		writeln("Slots of #{prototype type}\n---------------" interpolate)
		prototype slotNames foreach(slotName, writeln(slotName))
		writeln
		prototype ancestors))
		
Animal := Object clone
Animal speak := method("noises" println)

Duck := Animal clone
Duck speak := method("Quack" println)
Duck walk := method("waddle" println)

disco := Duck clone
disco ancestors