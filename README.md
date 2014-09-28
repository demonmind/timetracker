timetracker
===========

The project assumes a user clocks in/out once during the day for simplicity.

On home page if user enters employee id and clicks sign in, the user will be automatically clocked in. If user has been clocked in previously the user will just see the dashboard with the info related to him.

When user is in the dashboard he can clock out. After clocking out the user will get the Clock In/Clock Out time and the amount of hours worked during the day. The user will also see the time worked for the last 7 days on the Clock Out Screen.

A user that is admin when he logs is he see the info related to him, plus he can see the list of workers and the time they have worked during the last 7 days.

An admin will also be able to add/remove employees through 2 different sections of the application.

Most Rspect Test for model and controller provided, with additional integration tests

Because the user can see his report on his dashboard not export button is provided. Although can be easily done through the rails CSV gem.
