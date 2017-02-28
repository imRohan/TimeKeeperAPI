Timekeeper API version 1.0
-----------

Timekeeper is a barebones implementation of what is used in BioConnect's Teamworks to track employees worked hours. The system uses two main components, a time card and time entries. A time card can hold an infinite number of time entries, and will calculate the hours worked based on the associated entries. Entries can be considered as pairs of "Clock-Ins" and "Clock-Outs".

This RESTful API was built to explore the fundamentals of this system through an open source repository for curious minds like yours.

You can check out the api live here:

https://timekeeper900.herokuapp.com/api/v1/timecards

Basic Usage
-----------

Timekeeper requires Rails 5 and its core dependencies.

To run Timekeeper, simply start the rails server

`rails s `

Tests written using MINItest can be run by executing

`rails test`
 
### Timekeeper API Spec

#### List all time cards

` http://localhost:3000/api/v1/timecards `

#### Show a single time card

` http://localhost:3000/api/v1/timecards/ID `

#### Create a time card

` http://localhost:3000/api/v1/timecards `

Params needed:
- timecard[username] string
- timecard[occurrence] date

Usernames will be downcased to minimize errors. Only one timecard can be created per day for one username.

#### Update a time card

` http://localhost:3000/api/v1/timecards/ID `

Params needed:
- timecard[username] string
- timecard[occurrence] date

#### Delete a time card

` http://localhost:3000/api/v1/timecards/ID `

#### List all time entries

` http://localhost:3000/api/v1/time_entries `

#### Show a single time entry

` http://localhost:3000/api/v1/time_entries/ID `

#### Create a time entry

` http://localhost:3000/api/v1/time_entries `

Upon creating, a time entry will be assessed for pair completion, if so, total hours will be calculated for the associated time card

Params needed:
- time_entry[time] date time
- time_entry[timecard_id] integer

#### Update a time entry

` http://localhost:3000/api/v1/time_entry/ID `

Upon updating a time entry, the time card will recalculate the total hours worked

Params needed:
- time_entry[time] date time
- time_entry[timecard_id] integer

#### Delete a time entry

` http://localhost:3000/api/v1/time_entries/ID `

TODO
----

- Ensure time entries occur on the same day as their associated time card
- Create a authentication system for API access
- Further bulletproof system
