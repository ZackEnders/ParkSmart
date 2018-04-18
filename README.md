# ParkSmart
This is a Parking app that allows the user to rent out their driveway. It then allows other users to reserve that driveway. It is a community based app and works kind of like AirBnB. 

# Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
### Prerequisites
1. You will need a modern web browser that can render HTML documents (e.g. Google Chrome).
2. Ruby and Rails should be installed on your computer.

### Installing
This is a stand-alone web application that does not need to be installed. It will run locally on your computer as long as you have rails installed.

Open the terminal and run ```git clone https://github.com/ZackEnders/ParkSmart.git```

Next you will need to cd into the directory. Type 
```cd ParkSmart``` in the terminal.

After that you will need to run ```bundle install``` and ``` rails db:migrate``` in your terminal.

From the terminal fire up the rails server
```rails s```

In your browser copy and paste this link
```localhost:3000```


If done correctly the ParkSmart site should load.

## Known Issues
* When posting a new driveway the address auto-complete doesn't always work. If this happens use ```⌘ + shift + R``` on mac, to hard reload your browser.

* Email confirmation isn't functional

## Testing
Did you break it?  Please [contact me](mailto:zack@zackenders.com) and let me know what functionality is not working properly so that I can fix the code.

## Built With
* [HTML](https://developers.google.com/web) - The web framework used
* [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS) - Cascading Style Sheets
* [Sass](https://sass-lang.com) - Syntactically Awesome Style Sheets
* [JavaScript](https://www.javascript.com) - Google Maps API, Address Auto-Complete
* [jQuery](https://jquery.com) - Datepicker for reservations
* [Ruby on Rails](http://rubyonrails.org/) - Backend framework and ActiveRecord DB
 
## Authors
* **[Zack Enders](https://www.linkedin.com/in/zackenders)** - *Conception and Creation*


