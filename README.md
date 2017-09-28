## Bitmap Editor

Ruby 2.3 program that simulates a basic interactive bitmap editor.
Bitmaps are represented as an `M x N matrix` of pixels with each element representing a colour.

### Program input
The input consists of a file containing a sequence of commands, where a command is represented by a single capital letter at the beginning of the line.

Parameters of the command are separated by white spaces and they follow the command character.

Pixel co-ordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250.

Bitmaps starts at coordinates 1,1. Colours are specified by capital letters.

### Commands
There are 6 supported commands:

`I M N` - Create a new M x N image with all pixels coloured white (O).

`C` - Clears the table, setting all pixels to white (O).

`L X Y C` - Colours the pixel (X,Y) with colour C.

`V X Y1 Y2 C` - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).

`H X1 X2 Y C` - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).

`S` - Show the contents of the current image


To run the application you must supply a command file like so `bin/bitmap_editor examples/show.txt`

##### Input File:

```
I 5 6
L 1 3 A
V 2 3 6 W
H 3 5 2 Z
S
```

##### Expected Output:
```
OOOOO
OOZZZ
AWOOO
OWOOO
OWOOO
OWOOO
```

### Classes

`Screen` - Basic class which holds the bitmap. All commands are executed on object of this class

`CommandParser` - Parses the command supplied to figure out the command to be executed and it's arguments

`Bitmap` - Bitmap of size MxN. All public methods to manipulate the image goes in here.

`BitmapEditor` - Interface for reading the file.

`Command/*` - Each class specific to the Commmand to be executed on the bitmap.

### Logic

`BitmapEditor` reads the file and passes each line to `CommandParser`

`CommandParser` figures out the command to be run and it's arguments. It also raises error if the command supplied does not exist.

This command is now executed on the `Screen` object. Since each command is executed by a specific class, `Screen` object is passed as argument to this function.

`Command::Base` is responsible for checking if the image exists and that the arguments are correct before executing the command. It raises concerned error otherwise.

Finally, the command is executed on the screen using the specific class which in-turn calls the public methods on `Bitmap`'s object to manipulate the image.

### Specs

Specs are written in `rspec`

Run `rspec` from within the program directory to run the specs.
