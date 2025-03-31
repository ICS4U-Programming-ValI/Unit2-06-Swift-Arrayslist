//  ArrayLists.swift
//  This program reads integers from a file, calculates the mean and median,
//  and displays the results. The file to read is selected by the user.
//
//  Version 1.0
//  Copyright (c) 2025 Val I. All rights reserved.

import Foundation

// Function to calculate the mean of an array of integers
func calcMean(_ arrayOfInts: [Int]) -> Double {
    let sum = arrayOfInts.reduce(0, +)
    return Double(sum) / Double(arrayOfInts.count)
}

// Function to calculate the median of an array of integers
func calcMedian(_ arrayOfInts: [Int]) -> Double {
    let sortedArray = arrayOfInts.sorted()
    let count = sortedArray.count
    if count % 2 == 0 {
        return Double(sortedArray[count / 2] + sortedArray[(count / 2) - 1]) / 2.0
    } else {
        return Double(sortedArray[count / 2])
    }
}

// Ask the user for the file to read
print("Which file would you like to read from?")
print("Enter the corresponding letter: ")
print("A: File1.txt")
print("B: File2.txt")
print("C: File3.txt")

// Get user input
let fileChoice = readLine()?.lowercased() ?? ""
let fileName: String

switch fileChoice {
case "a":
    fileName = "./File1.txt"
case "b":
    fileName = "./File2.txt"
case "c":
    fileName = "./File3.txt"
default:
    print("Invalid input")
    exit(1)
}

// Read integers from the file
let fileURL = URL(fileURLWithPath: fileName)
var arrayOfInts: [Int] = []

do {
    let fileContents = try String(contentsOf: fileURL)
    let lines = fileContents.split(separator: "\n")
    arrayOfInts = lines.compactMap { Int($0) }
} catch {
    print("Error reading file: \(error)")
    exit(1)
}

// Print the array
print("Array: \(arrayOfInts)")

// Calculate and print the mean and median
print("Mean: \(calcMean(arrayOfInts))")
print("Median: \(calcMedian(arrayOfInts))")