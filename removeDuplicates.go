// Speaicl thanks: Michael
// https://github.com/imWildCat

package main

import (
	"fmt"
	"strings"
	"io/ioutil"
	"os"
)

func removeDuplicates(elements []string) []string {
	// Use map to record duplicates as we find them.
	encountered := map[string]bool{}
	result := []string{}

	for v := range elements {
		if encountered[elements[v]] == true {
			// Do not add duplicate.
		} else {
			// Record this element as an encountered element.
			encountered[elements[v]] = true
			// Append to result slice.
			result = append(result, elements[v])
		}
	}
	// Return the new slice.
	return result
}

func main() {
	input, _ := ioutil.ReadAll(os.Stdin)
	inputSting := string(input)
	trimmedString := strings.Trim(strings.Trim(inputSting, " "), "\n")
	a := strings.Split(trimmedString, " ")
	fmt.Println(removeDuplicates(a))
}