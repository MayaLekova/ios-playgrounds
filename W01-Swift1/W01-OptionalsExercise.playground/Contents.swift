var number1: Int?
var number2: Int!
var number3: Int

// 4 number1 is an optional so it can contain nil
print(number1)

// 5 conditional binding
if let num = number1 {
    print(num)
}

// 6
// print(number2)
// Why does it crash? -> Because it's trying to automatically unwrap the optional and it's nil
// When should you use and implicit optional? -> When you're sure it will contain a value and don't want to unwrap it every time
// When should you not use one? -> When there's a possibility that it will later become nil
// What does it default to on initialisation? -> nil

// 7
// print(number3)
// Why does it crash? -> Because number3 is used without being initialized
// When should you use a non-optional? -> When you're absolutely sure it will contain a value
// Can a non-optional be nil? -> No

// 8
// Why do you not need to unwrap an implicit and non-optional variable? -> Because it's not optional?
// Why is it good that they cause your program to crash? -> Because they are needed for its proper functioning, and there's no point in running the program further without them.
// Think of an example where something must always have a value, and you would rather have your program crash if it doesn’t.
// -> For example in a game you always want to have your avatar, because without it you can't do anything in the game - store a position in the game world, store the items or weapons, do gameplay actions
