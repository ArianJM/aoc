package main

import (
    "bufio"
    "fmt"
    "log"
    "regexp"
    "os"
)

func main() {
    file, err := os.Open("input.txt")
    if err != nil {
        log.Fatal(err)
    }

    defer file.Close()

    scanner := bufio.NewScanner(file)

    numberRegex := regexp.MustCompile("[0-9]+")
    symbolRegex := regexp.MustCompile("[^0-9.]")

    text, err := os.ReadFile("input.txt")
    if err != nil {
        fmt.Print(err)
    }
    str := string(text)

    numberIndices := numberRegex.FindAllStringIndex(str, -1)
    symbolIndices := symbolRegex.FindAllStringIndex(str, -1)
    lineLength := 140

    for _, s := range numberIndices {
        if 


    if err:= scanner.Err(); err != nil {
        log.Fatal(err)
    }
}
