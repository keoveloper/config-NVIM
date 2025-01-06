# This is a program to say if you are a child, teenager or adult.

print("Hello, I am a program to say if you are a child, teenager or adult.")
age = int(input("Please, enter your age: "))

if age < 13:
    print("You are a child.")
elif age > 13 and age < 20:
    print("You are a teenager.")
else:
    print("You are an adult")

print("Goodbye this is the end!")
