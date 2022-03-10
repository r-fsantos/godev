var answerToLife: Int = 40
print(answerToLife)

func getAnswerToLife(_ answerToLife: inout Int) -> Void { answerToLife = 42 }

getAnswerToLife(&answerToLife)
print(answerToLife)

var a = 10
var b = 20

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
swapTwoInts(&a, &b)
print(a, b)
