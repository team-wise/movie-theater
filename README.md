# Entities
-  Movie
-  Director
-  Actor
-  Audience
-  Employee
-  Theater Manager
-  Theater Room
-  Theater Building
-  Show Time
-  Seasonal Discount


# Relationships

~~~
Show Time IS-IN-A  Theater
Show Time IS-IN-A Theater Room
~~~

~~~
Show Time HAS-A Movie
Show Time HAS-A Audience
Theater Building HAS-A Manager
Theater Building HAS-A Theater Room
Season Discount HAS-A Show Time (at a reduced price)
Movie HAS-A Director
Movie HAS-A Actor
~~~

~~~
Audience WATCHES a Movie
~~~

# Attributes

#### Movie

-  ID (serial)
-  Title (text)
-  Description (text)
-  Duration (int)
-  Rating (int)
-  Language (text)
-  Subtitle Language (text)
-  3D (bool)


#### Director (inherits: Person)



#### Actor (inherits: Person)



#### Employee (inherits: Person)

-  Position (string)
-  Type of Wage (string)
-  Wage (real)
-  Address (string)

#### Person (superclass)

-  ID (serial)
-  First Name (text)
-  Last Name (text)

#### Audience (inherits: Person)

-  DOB (date)

#### Theatre Room

-  ID (serial)
-  Capacity (int)

#### Theater Building

-  ID (serial)
-  Address (text)
-  Name (text)
-  Phone Number (text)

#### Show Time

-  ID (serial)
-  Price (real)
-  Start Time (datetime)
-  End Time (datetime)

#### Seasonal Discount

-  ID (serial)
-  Description (text)
-  Reduced Price (real)
-  Date start (text)
-  Date end (text)
