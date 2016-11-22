## TOY ROBOT

A CLI simulator of a toy robot, moving around a table.

### Requirement
---
[Requirement is here.](https://gist.github.com/owenbyrne/5e3cacfba369725f82a7655b5293fa7b)

### Installation
---
Ensure you have Ruby 2 installed. Then run:

```
  cd toy-robot
  gem install bundler
  bundle install
```

### Run
---
Run the application with

```
  $ ruby bin/toy_robot.rb

  # or

  chmod +x bin/toy_robot.rb
  ./bin/toy_robot.rb
```

Follow the instructions to play, for example:

```
  PLACE 0,0,NORTH
  LEFT
  REPORT
```

Input `quit` to exit

### Test
---
Run all the tests:

```
  $ rake
```

Run single test like this:

```
  $ ruby test/lib/table_test.rb
```

### Changes
1. Add a new 'BACK' command to let the robot move backward.
2.
