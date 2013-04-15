# Numbers 0.9

A minimal application that counts hierarchical collections.

Preserves historical data of collection size changes.

## Version Information

+ 0.9 - Initial Release - Base functionality

## Usage and Tips
+ Collections are for keeping track of the number of 'something'.
+ Uncategorized # is the number of non-specific amount of 'something'.
+ Nested collections are for keeping track of the number of a more specific type of 'something'

Example:

- 100 Toys
  - (20 uncategorized)
  - (80 nested)
     - 79 Lego Bricks
         - (70 uncategorized)
         - (9 nested)
             - 9 Black Bricks
                  - (9 uncategorized)
                 - (0 nested)
     - 1 Remote Control Car
         - (1 uncategorized)
         - (0 nested)

## Current Behavioral Oddities
+ They're in there...

## Upcoming Features/Changes
+ Improve the code
+ Add more rigorous tests hitting edge cases
+ Improve the visualization (convert from nested lists to a D3.js visualization)
+ Improve the UX/UI
+ Add graphs to show historical changes in data
+ Add nested collection support to the graphs
+ Add coloring support in the graphs to show contribution to total from each nested collection over time. graph + charts (various)
+ Add User and authorization support
+ Add support for public/private collections
+ Add JSON api support (bi-directional)

*A cog in the Unseen-Data-Project*
