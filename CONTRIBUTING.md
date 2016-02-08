Thanks for considering to contribute to this project!

Please notice that the sources for this library are generated 
using the GYB tool from the Swift project.
The main Bitter templates is located at Templates/Bitter.swift.gyb

To compile the template saving the result as Sources/Bitter/Bitter.swift 
run ./compile.sh from the Templates/ directory, GYB will be downloaded and
used to compile the template.

Modifying .gyb templates requires minimal knowledge of python and GYB itself 
provide just a few flow control directive but, likely, examples of all the 
directives you could need are already in the template.

When your template has an error GYB will give you the exact line where the error
occurred, to enable an indication of which line generated in the template a line 
in the result, remove --line-directive '' from the compile script.

