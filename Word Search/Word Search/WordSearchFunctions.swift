//
//  WordMethods.swift
//  Word Search
//
//  Created by Brian Vo on 10/26/16.
//  Copyright © 2016 Brian Vo. All rights reserved.
//

import Foundation
import UIKit

let filepath = Bundle.main.path(forResource: "WordList", ofType: "txt")
let lines = ReadWordList()

enum Errors: Error {
    case invalid(String)
    case parseError(Int)
}

func ReadWordList() -> [String] {
    var lines = [String]()
    do {
        let allWords = try String(contentsOfFile: filepath!)
        lines = allWords.components(separatedBy: "\n")
        return lines
    } catch {
    //
    }
    return lines
}


func ScrabbleWord(scrabble: String) -> [String] {
    var finalList = [String]()
    var scrabbleLength = 0;
    for line in lines {
        var tempWord = Array(line.characters)
        for scrab in (scrabble.characters) {
            if ((tempWord.contains(scrab))) {
                scrabbleLength += 1
                tempWord.remove(at: tempWord.index(of: scrab)!)
            }
        }
        if (tempWord.count == 0 && scrabbleLength >= 3) {
            finalList.append(line)
        }
        scrabbleLength = 0
    }
    return finalList
}

func MorphWord(morph: String) -> [String] {
    var MorphSet = [String]()
    for line in lines {             //(int i = 0; i < Lines.Length; i++)
        if (morph.characters.count == line.characters.count) {
            var counter = 0
            var check = 0
            for i in 0 ..< morph.characters.count {
                let morphChar = morph.characters[morph.characters.index(morph.startIndex, offsetBy: i)]
                if (morphChar == line.characters[line.characters.index(line.startIndex, offsetBy: i)]) {
                    counter += 1
                }
                else {
                    check += 1
                }
            }
            if ((morph.characters.count - 1) == counter && check == 1) {
                MorphSet.append(line)
            }
        }
    }
    return MorphSet;
}

func MorphChain(start: String, end: String, max: Int) throws -> [String] {
    
    if (!lines.contains(start) || !lines.contains(end) || start.characters.count != end.characters.count) {
        throw Errors.invalid("Invalid input")
    }
    var totalChains : [[String]] = []   //List of string arrays
    let setOne : [String] = [String](MorphWord(morph: start))      //starting word {e.g told: {bold, cold, fold, gold...}
    var wordsFound : [String] = []
    var foundMorph : [String] = [];
    for sets in setOne {
        
        //temp list to stores the start word and the current indexed morph word
        var temp : [String] = []
        temp.append(start);                            //add start word
        temp.append(sets);                        //add that specific index word
        totalChains.append(temp);		//totalChains gets e.g 0: {told, bold}, 1: {told, cold}, 2: {told, sold}...
        wordsFound.append(sets);
    }
    var x = 0;
    
    //while x is less than the number of elements inside totalchains...
    while (x < totalChains.count)
    {
        let chain = totalChains[totalChains.index(totalChains.startIndex, offsetBy: x)] //assign chain to that specfic x index
        if (chain.count <= max) { // while the number of elements in chain is less than the max length provided
            if (chain.contains(end)) {
                foundMorph = chain;
                break
            }
            if (foundMorph.contains(end)) { //if the end word/word we're looking for is inside chain

                //found the morph list; gets that chain; breaks out of loop
                break
            }
            let nextChain : [String] = [String](MorphWord(morph: chain.last!)) //nextChain gets the morphed word of the last word in chain
            
            //iterate through the morph word
            for next in nextChain //(int i = 0; i < nextChain.Count; i++)
            {
                if (!wordsFound.contains(next)) {
                    //temp gets every element inside chain; copies all of its contents
                    var temp : [String] = []
                    for element in chain {
                        temp.append(element);
                    }
                    temp.append(next); //temps adds the last index of next chain
                    if (next == end)
                    {
                        foundMorph = temp;
                        break
                    }
                    totalChains.append(temp); //total chains adds new list temp
                    wordsFound.append(next);
                }
            }
        }
        else if (chain.count >= max) {
            break
        }
        
        x += 1 //x will increment until it hits the max count in total chains
    }
    return foundMorph;
}







