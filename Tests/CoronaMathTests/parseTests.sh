# Parses a Swift XCTest file and extracts all the test names,
# then outputs tuples for use in the allTests property, which
# is needed on Linux machines (which don't have Xcode integration).
cat $1 | grep func\ test | sed -E "s/.*func (test.*)\\(\\).*/(\"\1\", \1),/"
