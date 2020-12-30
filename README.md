--------------------------------------------------------------------------------------------------------------------------------
                                                        Legends
--------------------------------------------------------------------------------------------------------------------------------
    Legends is an multiplayer application that takes a team of 5 champions from one user to duel another users team. 

    The winner is based off the sum of champion statistics. Which ever team has the highest sum on their team will have destroyed the 

opponents nexsus.

    Sign up and create an User Account!
    Log in if you already have account!
    Create a Team of Champions!
    Duel other Users!



----------------------------------------------------------------------------------------------------------------------------------
                                                    Installing the APP
----------------------------------------------------------------------------------------------------------------------------------
Fork and clone the repository. 

Copy the SSH key and paste it into your console with the command "git clone" before it.



----------------------------------------------------------------------------------------------------------------------------------
                                                    Bundle install
----------------------------------------------------------------------------------------------------------------------------------
Once you're in the directory you will want to install the gems.

In your console run the command

"bundle install"



----------------------------------------------------------------------------------------------------------------------------------
                                                        Seeding The DB
----------------------------------------------------------------------------------------------------------------------------------
The Database[DB] is seeded by an API. If you decide to drop the database and its champions you will need to re-seed the database.

                    (This will completely drop users, champions, and teams from the database)

step 1. If you are dropping the database and wanting to reseed it you can run the rake command 'rake reset_db' in your console.
        Once your shotgun server is running you can move on to the next step.

step 2. Uncomment the API in '/legends/app/models/api.rb' (shortcut 'ctrl+a', 'ctrl+?')

step 3. Uncomment the #Api.load_data in 'legends/app/models/champion.rb'

step 4. Next go to your 'localhost:9393/' (Take a look at your shotgun server in the terminal you should see the DB being seeded with
        the champions when loading your localhost)

step 5. Comment out your Api and #Api.load_data that is located in steps 2 and 3.

You have successfully seeded the database!

----------------------------------------------------------------------------------------------------------------------------------


