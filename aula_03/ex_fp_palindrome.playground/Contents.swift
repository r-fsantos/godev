

func getPalindromesFrom(_ candidates: [String]) -> [String] {
    candidates.filter( { $0 == String($0.reversed()) } )
}

let palindromCandidates: [String] = ["halalah", "notPalindrome", "bob", "test", "ovo"]
print(getPalindromesFrom(palindromCandidates))
