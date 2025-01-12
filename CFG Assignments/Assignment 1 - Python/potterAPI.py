import requests
import random
# importing libraries required to read, randomise and format the json data
# random has been imported to randomise the name of a character for the user
# defining the api link as variable 'endpoint'
endpoint = "https://hp-api.onrender.com/api/characters"

# using the requests.get() and writing an if statement to print a message to confirm we have the data
response = requests.get(endpoint)

if response.status_code == 200:
    print("\U0001F4AF")
else:
    print(f"Have another go pal {response.status_code}")
# converting api response to json
character_data = response.json()
# welcome message
print(f"Welcome to the Harry Potter bingo sheet creator! " + "\U0001FA84\n"
      "\nLet's get 12 names for your class bingo sheet " + "\U0001F9D9" + "\U0001F3FF\n")

# breaking up the flow by asking for user input
print(input("Press \033[1menter\033[0m to continue..."))

# creating a while loop:
# part 1:
# defining the user_choice in 'while True' for when correct character name is entered
# and then used 'if not' condition to ensure that pressing enter would continually
# re-prompt them for a valid character name
# using variable 'character_match' to say that if there is no user_choice (i.e. pressing enter)
# then treat it as a null value = 'None' and to start the loop again

while True:
    user_choice = input("Enter the name of the character you want to choose: ").strip().lower()

    if not user_choice:
        print("\n\033[1mValid name is required.\033[0m Try again")
        continue

    character_match = None
# part 2:
# creating the condition that if the correct character name is entered by the user
# it loops through to here and the 'character_match' variable and 'character[name]' are the same
# this then ends the loop because the user input a character name that has returned as 'True'
    for character in character_data:
        if user_choice in character["name"].strip().lower():
            character_match = character["name"]
            break
# character_match = True
# break
#  character_match = character["name"]
# I initially used this, but when I tested it, if I entered an invalid
# character name, it was re-printing the 'user_choice' variable first,
# and then it would print the if statement for 'character_match'
# super frustrating !!

# part 3:
# creating the condition that if the character matches the dictionary, it will print the user input
    if character_match:
        print(f"\nYour chosen Character is: {character_match}")
        break
# part 4:
# defining that if the user doesn't input a valid character name per the other conditions then it will keep triggering
# this printed message
    else:
        print("\n\033[1mTry again!\033[0m Enter valid character name:")

# creating random sample:
# defining a 'random_characters' variable and using the random import's 'random.sample()' function
# and specifying that I want it to print a sample of '10' random characters
random_characters = random.sample(character_data, 11)

# breaking up the flow by asking for user input:
print(input(f"\nPress \033[1menter\033[0m to choose 11 random characters " + "\U0001F52E"))

# using a for loop, so I can use the 'enumerate()' function and using the index name_in_list to call random character
# names counting from 1.
for name_in_list, character in enumerate(random_characters, 2):
    print("Random Character {}: {}".format(name_in_list, character["name"]))

# I'm not sure if this could ever potentially cause the user's input character and the random list to ever contain
# duplicates (think it's unlikely).

# writing results to a txt:
# creating a function 'potter_names' to put the inputs into a txt:


def potter_names(user_choice, random_characters):
    # opening the file in write mode
    with open("potter_names.txt", "w") as file:
        # writing to the file with the user's character choice and the random choices
        file.write(f"\nYour character choice was: \n1. {user_choice}\n")
        file.write("\nYour 11 random characters are:\n")

        # looping through the random characters and writing each one to the file using enumerate, so they're formatted
        # in a numbered list
        for i, character in enumerate(random_characters, 2):
            file.write(f"{i}. {character['name']}\n")

    # using print statement requesting user input to check that the characters were saved to the nominated file as
    # intended which should print out the names and the txt file should reflect this
    print(input(f"\nLet's check if your character names saved to the file!" 
                "\nPress \033[1menter\033[0m:"))

    # opening the file in read mode to display all 12 character names
    with open("potter_names.txt", "r") as file:
        print("\x1B[3m\033[1mYou have saved the following to potter_names.txt:\x1B[23m\033[0m ")
        print(file.read())

# calling the function
potter_names(character_match, random_characters)
# closing message to the user, prompting them to close or start the programme again
print(f"\nCome back again soon for another dozen names! \U0001F44B" + "\U0001F3FF\n")
