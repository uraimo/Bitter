#!/bin/sh

wget https://github.com/krzysztofzablocki/Sourcery/releases/download/0.9.0/Sourcery-0.9.0.zip
unzip Sourcery-0.9.0.zip -d Sourcery

# Change directories to avoid a bug with relative paths containing .. in Sourcery 0.9.0
# https://github.com/krzysztofzablocki/Sourcery/issues/380
cd ..
Templates/Sourcery/bin/sourcery
cd Templates

rm Sourcery-0.9.0.zip
rm -rf Sourcery
# Remove an unnecessary file that Sourcery 0.9.0 creates on run
# https://github.com/krzysztofzablocki/Sourcery/issues/421
rm ../default.profraw
