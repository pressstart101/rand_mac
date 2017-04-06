#!/usr/bin/env xcrun swift
print(" ###### #    #  ####  #      #    # ###### \n #      #    # #    # #      #    # #      \n #####  #    # #    # #      #    # #####  \n #      #    # #    # #      #    # #      \n #       #  #  #    # #       #  #  #      \n ######   ##    ####  ######   ##   ###### \n")

import Foundation
var pplz = ["Adonnis", "Alex", "Ben","Calin", "Dam", "Ehab", "Iuri", "Jamal", "Mark", "MikeC", "MikeG", "Ryan", "Tajivon"]
func shuffleArray<T>(array: Array<T>) -> Array<T>{
    var array1 = array
    for index in ((0 + 1)...array.count - 1).reversed()
    {
        
        let j = Int(arc4random_uniform(UInt32(index-1)))
        
        
        swap(&array1[index], &array1[j])
    }
    return array1
}


func groups(_ groupSize: Int) -> [[String]] {
    var arr = shuffleArray(array: pplz)
    return stride(from: 0, to: arr.count, by: groupSize).map({ (startIndex) -> [String] in
        let endIndex = (startIndex.advanced(by: groupSize) > arr.count) ? arr.count-startIndex : groupSize
        return Array(arr[startIndex..<startIndex.advanced(by: endIndex)])
        
    })
}

func format(pplz_per_group: Int) -> String {
    var arr = groups(pplz_per_group)
    var str = ""
    var num = 0
    if arr[arr.count-1].count == 1{
        arr[arr.count-2].append(arr[arr.count-1][0])
    }
    
    for i in arr{
        num += 1
        if i.count > 1{
            str += "Group" + "\(num). " + "\(i.joined(separator:" "))\n\n\n"
        }
        
    }
    print(str)
    return str
}


print("How many people per group?")
    if let str_to_int = readLine() {
        let str_to_int_unwrapped = Int(str_to_int)
        
        let b = format(pplz_per_group: str_to_int_unwrapped!)
    }






