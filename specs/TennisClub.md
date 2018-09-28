### TennisClub

A local tennis club has asked you to build a piece of software to help them to manage memberships, and register members for classes and book courts.

#### Inspired By

[TennisBiz](http://www.thinksmartsoftware.com/en-gb/products/tennisbiz/overview.html)

<!-- [Glofox](https://www.glofox.com/club-solution/), [Pike13](https://www.pike13.com/pike13-scheduling-software-demo) -->

#### Caution

You might try to create a Ruby class named `Class` - this is a reserved word in Ruby, so you will have to name your class `TennisClass`, or similar.

### User Stories / Acceptance Criteria - MVP

#### Manage Membership

_As a tennis club manager_ <br />
_I want to manage the list of members_<br />
_So that I am storing up-to-date information about members_<br />

**Acceptance Criteria:** Club managers should be able to create members<br />
**Acceptance Criteria:** Club managers should be able to edit members<br />


#### Manage Classes

_As a tennis club manager_<br />
_I want to manage the list of classes_<br />
_So that I have up to date information about what classes are available_<br />

**Acceptance Criteria:** Club managers should be able to create classes<br />
**Acceptance Criteria:** Club managers should be able to delete classes<br />

#### Manage Courts

_As a tennis club manager_<br />
_I want to manage the booking of courts (by members and classes)_<br />
_So that I have up to date information about which courts are available_<br />

**Acceptance Criteria:** Club managers should be able to create courts<br />
**Acceptance Criteria:** Club managers should be able to delete courts<br />

#### Register Users for Classes

_As a tennis club manager_<br />
_I want to be able to add a user to a class_<br />
_So that I can book their place_<br />

**Acceptance Criteria:** Club managers should be able to assign members to classes.

#### Book Users for Courts

_As a tennis club manager_<br />
_I want to be able to book a court for a user_<br />
_So that I make sure there is no overlapping on the same court_<br />

**Acceptance Criteria:** Club managers should be able to assign members to courts if available.

#### View all customers assigned to a class

_As a tennis club manager_<br />
_I want to view all members assigned to a class_<br />
_So that I can see which classes are going to be busy_<br />

**Acceptance Criteria:** Club managers should be able to view a list of classes, and see the members that will be attending that class.

### User Stories - Possible Extensions


#### View the schedule of a tennis court

_As a tennis club manager_<br />
_I want to view all activities assigned to a court_<br />
_So that I can see which courts are going to be busy_<br />

**Acceptance Criteria:** Club managers should be able to view a list of classes and members using the court, and see the members that will be attending each class.

#### Classes should have a maximum capacity

_As a tennis club manager_<br />
_I want to be able to assign a maximum capacity to a class_<br />
_So that the class can't be over-booked_<br />

**Acceptance Criteria:** Club managers should be able to give each class a maximum capacity<br />
**Acceptance Criteria:** Club managers should not be able to assign members to a class that is already full. (At capacity)

#### Junior Membership

_As a tennis club manager_<br />
_I want to be able to mark members as having "Junior Membership"_<br />
_So that I can also manage the junior section_<br />

**Acceptance Criteria:** Club managers will be able to assign junior membership to members<br />
**ACceptance Criteria:** Club managers will be able to assign an age group to a class and birth date to members<br />
**Acceptance Criteria:** Club managers will only be able to assign junior members to classes of their age group.


#### Student Membership

_As a tennis club manager_<br />
_I want to be able to mark members as having "Student Membership"_<br />
_So that I can offer students a relevant discount but limited services_<br />

**Acceptance Criteria:** Club managers will be able to assign student membership to members<br />
**ACceptance Criteria:** Club managers will be able to assign a full membership tag to a class <br />
**Acceptance Criteria:** Club managers will only be able to assign student members to classes that are not restricted to full members.


#### Wimbledon Ballot

_As a tennis club manager_<br />
_I want to be able to mark members as "opted-in for Wimbledon ballot"_<br />
_So that I can manage members participating to the adult ballot (not available to students) and junior ballot_<br />

**Acceptance Criteria:** Club managers will be able to assign Wimbledon opt-in option to members<br />
**ACceptance Criteria:** Club managers will be able to assign full members that opted in to the adult Wimbledon ballot <br />
**Acceptance Criteria:** Club managers will be able to assign junior members that opted in to the junior Wimbledon ballot <br />
