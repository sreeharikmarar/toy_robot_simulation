### Problem
Design a toy robot simulation where the robot can climb a glass building and install color filters on the glass panels. The glass building can be considered a rectangular grid with each glass panel representing a cell. A robot's location is represented by x and y coordinates. It's heading is represented by one of four cardinal compass points. An example position could be <0, 0, N>, which means that the robot is at the bottom-left corner and facing up.

Two robots are built, each capable of installing a specific color filter, namely red (R) and green (G). The color filters are additive i.e. combining R and G produces yellow (Y).

Each robot is capable of understanding the following commands:
* L -- turn left 90 degrees
* R -- turn right 90 degrees
* F -- move forward 1 cell
* I -- install color filter on the current cell

### INPUT

Simple command strings are written by the engineers to get the robots to color the building. 

The first line of input represents the size of the building with the base index being <0, 0>.

The rest of the input is data pertaining to the robots. Each robot has two lines of input. The first line gives the robot's position and color, and the second line is the sequence of commands that tell the robot where to navigate.

Each robot will finish its navigation sequentially, which means that the second robot wont start moving until the first one has finished moving.

### OUTPUT

The output should be a grid of characters denoting the state of the building after all robots have completed their tasks.

E = empty  
R = red  
G = green  
Y = yellow  

### SAMPLE INPUT

Input:  
5 5  
0 0 N R  
FFRFIFIRFIF  
4 0 N G  
FLFFRFIRFILFLFI  

### Expected OUTPUT

EEEEE  
EEGEE  
ERYGE  
EEREE  
EEEEE  


### HOW TO RUN

**Install Dependencies**

```
$: bundle install
```

**Run Tests**

```
$: rspec
```

**Run Program**

```
$: ./robot input.txt
```
