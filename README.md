# Bitmap editor

## Input 

The input consists of a file containing a sequence of commands, where a command is represented by a single capital letter at the beginning of the line. Parameters of the command are separated by white spaces and they follow the command character.

Pixel coordinates are a pair of integers: a column number between 1 and 250, and a row number between 1 and 250. Bitmaps starts at coordinates 1,1. Colours are specified by capital letters.

## Supported Commands

There are 6 existing commands:

* I N M - Create a new M x N image with all pixels coloured white (O).
* C - Clears the table, setting all pixels to white (O).
* L X Y C - Colours the pixel (X,Y) with colour C.
* V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
* H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
* S - Show the contents of the current image.

## Adding Commands

Commands are modular, so you can provide additional commands to support more complex parsing. To add a command:

1. Define a grammar for your command. The first character should be a unique uppercase letter, and any subsequent characters should be arguments to your command.
2. Add a class that inherits from `Commands::Base`.
3. Your class may implement `validate` to provide your own custom validations. Default validations are accessible by calling `super` from within your validator.
4. Your class may implement `perform_action`, which should contain any business logic that manipulates the canvas.
5. Import your command in `lib/example_editor.rb`, and add it to the `COMMANDS` hash to register the command.
6. That's it! Your new command can now be used.

## Examples

Examples are provided in the examples/ folder, and can be tested on your machine by invoking the shell script provided:

`>bin/bitmap_editor examples/simple_fill.txt`

## Testing

Unit tests are included for the editor, canvas, and each supported command. Integration tests are provided for each example in the examples/ folder. Run `rspec` from the root of the project to run all of the tests.
