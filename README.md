# PERFECT GRADE

## BACKEND

Capstone project for Flatiron School DC.

This project was inspired by the real experiences I had in college. Lots of friends (and myself) had bad habits of thinking we had "no work" and proceeding to goof off... until the avalanche of assignments we were conveniently avoiding came crashing down. 

Ultimately, I solved the problem by evenly spreading my workload out across the whole semester in advance. This led to a new problem, however, of the tedium and time consumed in the process. 

My aim with this project is to automate that problem. My hope is that students will be able to use this tool to find a consistent daily workload for their semesters. When you can block off a predictable set of time for working every day, it builds good habits and takes a load of stress off your shoulders so you can actually focus on the work itself. 

### Demo

The welcome page gives you the option of logging in or creating an account. Attempting to navigate to any other endpoint without being logged in will redirect you to the welcome page.

![Login](https://imgur.com/me08obh.gif)

After logging in, a user can add all their courses for the semester. Within each course, they then can add all assignments from the syllabus. 

![Adding assignments](https://media.giphy.com/media/LPwWru3y9CSSJ6uC9i/giphy.gif)

Courses and assignments can be edited and deleted.

![Editing and deleting](https://media.giphy.com/media/US7N2k3aCcZiyi6fUC/giphy.gif)

Once all assignments for the full semester have been entered, clicking "make the grade" from the main page will calculate a flattened workload. All empty days will be filled, and days with more assignments will be spread out to days with fewer assignments. 

This spreading only goes backward, so no assignment will be listed later than its due date. The flattening algorithm also automatically adjusts dates so the final schedule lists what date to actually complete an assignment, not its due date in class (i.e. an assignment due to be turned in on Wednesday will be listed no later than Tuesday on the flattened schedule). This means students can enter assignments straight from the syllabus as written and get back an actionable, consistent plan for the whole semester with no additional effort.

![Final flattened schedule](https://media.giphy.com/media/mA6SfkOkuqum99Hz0Z/giphy.gif)

![Final flattened schedule](https://media.giphy.com/media/mA6SfkOkuqum99Hz0Z/giphy.gif)

### Status

The basic version of the app is up and running with support for user accounts and secure login.

Known issues include the CSV export, which needs to be modified and tested for compatibility with major to-do apps.

Future features may include a "stress score" for individual assignments (allowing the algorithm to sort out a truly equitable per-day workload), and handling for regularly-repeating assignments.

[Link to the frontend portion of this project.](https://github.com/PeteHanner/perfect-grade-frontend)

Special thanks on this project to Tyler Curran, Rachael Tomlinson, Meghan Wingert, Tatiyahna Blakely, Cassie Turner, and Molly Magoffin. Extra special thanks to DaYoung Lee, JC Chang, and Shannon Nabors.
