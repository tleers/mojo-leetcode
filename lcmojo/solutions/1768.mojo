#PROBLEM: https://leetcode.com/problems/merge-strings-alternately/solutions/1075531/simple-python-solution/?envType=study-plan-v2&envId=leetcode-75
def main():
    let word1: String = "135"
    let word2: String = "24"
    print(mergeAlternately(word1, word2))

#TODO: Add benchmark
#TODO: Figure out why mergeAlternatelyBroken fails

# Implementation

fn max(a: Int, b: Int) -> Int:
    return a if a - b >= 0 else b
fn min(a: Int, b: Int) -> Int:
    return a if a - b <= 0 else b

fn mergeAlternately(
    borrowed word1: String, 
    borrowed word2: String
) -> String:
    var result: String = ""
    var a: Int = 0
    let r: Int = min(len(word1),len(word2))

    while True:
        result = result.__add__(word1[a] + word2[a])
        a = a + 1
        if a >= r: 
            break
    result = result.__add__(word1[a:] + word2[a:])
    return result


fn mergeAlternatelyBroken(
    borrowed word1: String, 
    borrowed word2: String
) -> String:
    var result: String = ""
    var a: Int = 0
    let r: Int = min(len(word1),len(word2))

    while True:
        result = result.__add__(word1[a] + word2[a])
        a = a + 1
        if a >= r: 
            break
    
    result = result.__add__(word1[a:] + word2[a+1:])
    return result