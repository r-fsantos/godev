typealias Math = (Int, Int) -> Int

func addingTwoInts(_ a: Int, _ b: Int) -> Int { a + b }

func printingMathResult(_ a: Int, _ b: Int, _ mathFunction: Math) -> Void {
    print("Res: \(mathFunction(a, b))")
}

printingMathResult(40, 2, addingTwoInts)
