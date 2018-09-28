# TennisClub

A local tennis club has asked you to build a piece of software to help them to manage memberships, and register members for classes and book courts.

#### Inspired By

[TennisBiz](http://www.thinksmartsoftware.com/en-gb/products/tennisbiz/overview.html)

<!-- [Glofox](https://www.glofox.com/club-solution/), [Pike13](https://www.pike13.com/pike13-scheduling-software-demo) -->

#### Caution

You might try to create a Ruby class named `Class` - this is a reserved word in Ruby, so you will have to name your class `TennisClass`, or similar.

## User Stories / Acceptance Criteria - MVP


### MEMBERS

#### Become a member

_As an aspiring tennis member_ <br />
_I want to become a member_<br />
_So that I can get access to the tennis club activities_<br />

**Acceptance Criteria:** Members should be able to create membership<br />

#### Book tennis class

_As a tennis club member_<br />
_I want to book a tennis class_<br />
_So that I can go to that class_<br />

**Acceptance Criteria:** Club members should be able to book classes<br />

#### View all my class bookings

_As a tennis club member_<br />
_I want to view all the classes that I have booked_<br />
_So that I don't forget to go_<br />

**Acceptance Criteria:** Club members should be able to view the list of classes that they have booked.


### CLUB MANAGER

#### Manage memberships

_As a tennis club manager_<br />
_I want to check/update the list of members_<br />
_So that I am storing up-to-date information about members_<br />

**Acceptance Criteria:** Club managers should be able to edit and update members<br />
**Acceptance Criteria:** Club managers should be able to delete members<br />

#### Manage tennis classes

_As a tennis club manager_<br />
_I want to manage the list of classes_<br />
_So that I have up to date information about what classes are available_<br />

**Acceptance Criteria:** Club managers should be able to create classes<br />
**Acceptance Criteria:** Club managers should be able to edit and update classes<br />
**Acceptance Criteria:** Club managers should be able to delete classes<br />

#### View all bookings of a class

_As a tennis club manager_<br />
_I want to view all members assigned to a class_<br />
_So that I can see which classes are going to be busy_<br />

**Acceptance Criteria:** Club managers should be able to view a list of classes, and see the members that will be attending that class.



## User Stories - Possible Extensions

### MEMBERS

#### Book tennis court

_As a tennis club member_<br />
_I want to book a tennis court_<br />
_So that I'm sure the court is free for me to use_<br />

**Acceptance Criteria:** Club members should be able to book courts<br />

#### View all my court bookings

_As a tennis club member_<br />
_I want to view all the courts that I have booked_<br />
_So that I don't forget to go and play_<br />

**Acceptance Criteria:** Club members should be able to view a list of courts that they have booked.

#### Select full/student/junior membership

_As a tennis club member_<br />
_I want to be able to be classified as full/student/junior member_<br />
_So that I can optimise my membership_<br />

**Acceptance Criteria:** Club members will be able to assign full/student or junior status to their membership<br />


#### Opt in Wimbledon Ballot

_As a tennis club member_<br />
_I want to be able to opt in for the Wimbledon ballot_<br />
_So that I can be considered for the ballot_<br />

**Acceptance Criteria:** Club members will be able to assign Wimbledon opt-in option to their membership<br />

#### Record review/complaint

_As a tennis club member_<br />
_I want to be able to leave a club review or complaint_<br />
_So that I can be heard_<br />

**Acceptance Criteria:** Club members will be able to create a feedback text<br />


### CLUB MANAGER

#### Manage tennis courts

_As a tennis club manager_<br />
_I want to manage the booking of courts (by members and classes)_<br />
_So that I have up to date information about which courts are available_<br />

**Acceptance Criteria:** Club managers should be able to create courts<br />
**Acceptance Criteria:** Club managers should be able to edit/update courts<br />
**Acceptance Criteria:** Club managers should be able to delete courts<br />


#### View all bookings of a court

_As a tennis club manager_<br />
_I want to view all the bookings for a tennis court_<br />
_So that I can see which courts are going to be busy_<br />

**Acceptance Criteria:** Club managers should be able to see the members that will be using a court.


#### Book a court for a member

_As a tennis club manager_<br />
_I want to be able to book a court for a member_<br />
_So that I make sure that members can book by phone or in person_<br />

**Acceptance Criteria:** Club managers should be able to book a court for a member if the court is available.


#### View all bookings of a court

_As a tennis club manager_<br />
_I want to view all activities assigned to a court_<br />
_So that I can see which courts are going to be busy_<br />

**Acceptance Criteria:** Club managers should be able to view a list of classes and members using the court, and see the members that will be attending each class.



#### Manage Wimbledon Ballot

_As a tennis club manager_<br />
_I want to be able to mark members as "opted-in for Wimbledon ballot"_<br />
_So that I can manage members participating to the adult ballot (not available to students) and junior ballot_<br />

**Acceptance Criteria:** Club managers will be able to assign Wimbledon opt-in option to members<br />
**Acceptance Criteria:** Club managers will be able to assign full members that opted in to the adult Wimbledon ballot <br />
**Acceptance Criteria:** Club managers will be able to assign junior members that opted in to the junior Wimbledon ballot <br />


## User Stories - Further ideas


#### Classes should have a maximum capacity

_As a tennis club manager_<br />
_I want to be able to assign a maximum capacity to a class_<br />
_So that the class can't be over-booked_<br />

**Acceptance Criteria:** Club managers should be able to give each class a maximum capacity<br />
**Acceptance Criteria:** Club managers should not be able to assign members to a class that is already full. (At capacity)


#### Classes should taught by a coach

_As a tennis club manager_<br />
_I want to be able to assign a class to a coach_<br />
_So that I keep track of worked hours_<br />

**Acceptance Criteria:** Club managers should be able to assign each class to a coach<br />
**Acceptance Criteria:** Coaches should have a coaching qualification and a police check validity<br />
**Acceptance Criteria:** Coaches should have earning field and make money for each class depending on qualification<br />
