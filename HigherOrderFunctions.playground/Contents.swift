import UIKit

var greeting = "Hello, playground"

/*Difference between map and compact map
 map will return the values within an array
 as optional values whhile also returning nil values
 compact map will return the values in an array
 unwrapped and ignore nil values
 
 What is reduce function
 the reduce funtion will iterate through an array
 and return the desired result as a single variable
 
 Differnece between sort and sorted
 sort will sort an array and overwrite the array with
 the sorted values
 sorted will sort an array and return the sorted values
 in a seperate array
 
 What is the use of filter
 filter is used to return the desired result based on the
 the set conditions
 
 What is higher order function
 a higher order function is a function that takes
 functions as arguments or returns a function as a result
 */

struct Employee {
    let firstName:String
    let lastName:String
}

func employeeList() {
    let e1 = Employee(firstName: "Charles", lastName: "Newman")
    let e2 = Employee(firstName: "David", lastName: "Taylor")
    let e3 = Employee(firstName: "James", lastName: "Hall")
    let e4 = Employee(firstName: "Andrew", lastName: "O'Neill")
    
    employees = [e1, e2, e3, e4]
}

var employees:[Employee] = []

employeeList()

let namesOutput = employees.reduce("") {partialResult, name in
    return partialResult + name.firstName + " " + name.lastName + " "
}
print(namesOutput)

