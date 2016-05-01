First of all, thanks for considering contributing to this project, all PRs are welcome!

Please notice that the sources for this library are not written directly in Swift but are generated using the GYB tool from the Swift project. The main Bitter template is located at `Templates/Bitter.swift.gyb` and if you need directions on how to modify GYB templates, check out my [tutorial](https://www.uraimo.com/2016/02/09/a-short-swift-gyb-tutorial/).

To compile the template and save the result as `Sources/Bitter/Bitter.swift` run `./compile.sh` from the `Templates/` directory, GYB will be downloaded and used to compile the template.

Modifying .gyb templates requires minimal knowledge of python and GYB itself provide just a few flow control directive but, lickily, examples of all the directives you could need are already in the template.

When your template has an error, GYB will show the specific line where the error occurred, remove `--line-directive ''` from the compile script to enable this debug mode.
