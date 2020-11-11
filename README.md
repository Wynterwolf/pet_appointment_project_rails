# Vet Appointment App

Pet appointments, especially when dealing with multiple pets, can be hard to keep track of. This app allows you to keep track of your pets veterinarian, his or her specialty, and appointment times for individual pets while maintaining a secure login for you, our User. 

## Installation

To fork and clone this repo from your terminal window:

```git clone https://github.com/Wynterwolf/pet_appointment_project_rails```

Open the project in your favorite code editor. Open a term window and use the following commands to install all the gems related to this project.

```bundle install```

Once this command is finished (which may take a while, depending on the system), you can return to your terminal. 

Next we will run our migrations, using the following command:

```rails db:migrate```

At this point you have a couple of options. You can populate the database from the seed file by using the following command:

```rails db:seed```

If while seeding the database, you get a message about needing yarn, please see the following website for installation instructions.

```https://classic.yarnpkg.com/en/docs/install/#windows-stable```

Or you can skip seeding the DB from my file and create your own data from the user interface. From here, you will need to start the server. It can be done with this command:

```rails server```

Open up your favorite browser and use the following URL to see the user interface.

```localhost:3000```

If you seeded the DB as instructed above, you can log into the account with the email of ```test@test.com``` and the password of ```password```