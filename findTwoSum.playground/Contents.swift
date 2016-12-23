//: Playground - noun: a place where people can play

import UIKit

let numArray = [2,7,11,15]


func findTwoSum(input:Int) -> (index1:Int,index2:Int){

    let count = numArray.count
    
    for i in 0 ..< count {
        for j in i ..< count{
            if input - numArray[i] - numArray[j] == 0 {
                return (i+1, j+1)
            }
        }
    }
    return (0,0)
}

findTwoSum(input: 13)