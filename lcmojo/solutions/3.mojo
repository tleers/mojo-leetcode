#https://leetcode.com/problems/longest-substring-without-repeating-characters/

# Assignment
####
# Given a string s, 
# find the length of the longest 
# substring
# without repeating characters.

####

# Python solution simple
####
# We want to iterate in O(N)
# Probably a hashmap approach will do?
# Own solution
# So if the length is 1, we return 1

# def lengthOfLongestSubstring(
#     s: str
# ) -> int:
#     hm={} # keep track of which char we've seen and where
#     l=0 # temporary length counter
#     max_l=0 # max length to return
#     i=0 # iterator
#     while i < len(s):
#         if s[i] not in hm:
#             l += 1 # length increases if new char
#             hm[s[i]] = i # we save the char index
#             max_l = max(max_l, l) # if max_l < l, then l, else max_l
#             i += 1 # next char
#         else:
#             i = hm[s[i]] + 1 # since we encountered same char, we need to go where we encountered it previously to make sure we don't skip any chars
#             hm = {} # we reset our encounters 
#             l = 0 # temporary length counter no longer needed
#     return max_l    
####
# MOJO native version
from python import Python
from python.object import PythonObject
# from utils import max

fn max(a: Int, b: Int) -> Int:
    return a if a - b >= 0 else b

def lengthOfLongestSubstring(borrowed s: String) -> Float64:
    var hm = Python.dict()
    var l: Float64 = 0
    var max_l: Float64 = 0
    # var i: Int = 0
    # while i < len(s):
    hm[0] = 0
    l = hm[0].to_float64()

    # for i in range(len(s)):
    #     if not hm.contains(s[i]):
    #         l += 1
    #         hm[s[i]] = i
    #         max_l = max(max_l, l)
    #         i += 1
    #     else:
    #         hm[s[i]]
    #         i = hm[s[i]] + 1
    #         hm = dict()
    #         l = 0
    return max_l

def main():
    let s1 = "abcabcbb"
    let s2 = "bbbbb"
    let s3 = "pwwkew"
    lengthOfLongestSubstring(s1)