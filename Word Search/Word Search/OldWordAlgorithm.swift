//
//  OldScrabble Alg.swift
//  Word Search
//
//  Created by Brian Vo on 10/26/16.
//  Copyright © 2016 Brian Vo. All rights reserved.
//
//import Foundation
/*
func RemoveLeftovers(set: [Character], words: String) -> [Character] {
    var temp = [Character](set);
    
    for wordz in words.characters {
        for tempj in temp {
            if (wordz == tempj) {
                temp.remove(at: temp.index(of: tempj)!)
                break;
            }
        }
    }
    if (temp.count == 0)
    {
        temp.removeAll()
        return set; //Returns the original List <char> if there are no left over words in temp.
    }
    if (temp.count > 0)
    {
        temp.removeAll()
    }
    return temp;
}
func AddWord(set: [Character]) -> String {
    var temp = [String](); //Empty List to store strings
    if (set.count >= 3 && set.count <= 7) {
        let list = set
        let s = String(list); //Convert List type char set to a type string
        for line in lines {
            if (line == s) { //Checks if it line equals the set
                temp.append(line); //Adds to the List string outside the loop.
            }
        }
    }
    let result = temp.joined(separator: "") //Makes result as a readable string from refer.
    return result;
}

var List = [String]()
for i in 0 ..< lines.count {
    var words = [Character]()
    var line = lines[i]
    if ((textScrabble.text?.characters.count)! >= line.characters.count) {
        for linez in line.characters {
            for textk in (textScrabble.text?.characters)! {
                if (textk == linez) {
                    words.append(linez)
                    break
                }
            }
        }
    }
    let finalChar = RemoveLeftovers(set: words, words: textScrabble.text!)
    List.append(AddWord(set: finalChar))
}
let finalList = Array(Set(List))
for items in finalList {
    if (items != "") {
        listScrabble.text.append(items + "\n")
    }
}
func MorphWord(morph: String) -> [String] {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    var MorphSet = [String]()
    for line in lines {             //(int i = 0; i < Lines.Length; i++)
        if (morph.characters.count == line.characters.count) {
            for morphChar in morph.characters {    //(int j = 0; j < morph.Length; j++)
                for letter in alphabet.characters {    //(int k = 0; k < alphabet.Length; k++)
                    var list = morph
                    //Replaces your input string index with the index of the alphabet
                    if  let tempIndex = morph.characters.index(of: morphChar) {   //Remove(j, 1);
                        list.remove(at: tempIndex)
                        list.insert(letter, at: tempIndex)
                        
                        // Checks if the from the WordList.txt equals temp and not equal to the user input morph word; prints results
                        if (line == list && line != morph) {
                            //StringComparison.OrdinalIgnoreCase makes word case-insensitive
                            MorphSet.append(line); //Adds to the Hashset to remove any duplicate strings
                        }
                    }
                }
            }
        }
    }
    return MorphSet;
}
 */

