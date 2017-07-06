from collections import OrderedDict
def firstNotRepeatingCharacter(s):
    # O(1) because there's only 26 letters
    letters = OrderedDict()
    for letter in s:
        if letter in letters: letters[letter] +=1
        else: letters[letter] = 1
    for letter in letters:
        if letters[letter] == 1: return letter
    return '_'
