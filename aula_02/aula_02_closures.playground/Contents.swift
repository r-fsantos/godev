/*
 Closure
 */

func makeBuy(onCompletion: (Int) -> Void) -> Void {
    onCompletion(42)
}

makeBuy { res in
    print("res: \(res)")
}

func makeBuy(value: Double,
             hasDiscount: Bool,
             onCompletion: (Double) -> Void
            ) -> Void {
    let discount: Double = 0.9
    let finalValue: Double

    finalValue = hasDiscount ? value * discount : value

    onCompletion(finalValue)
    
    return
}

makeBuy(value: 42, hasDiscount: true) { res in
    print("res: \(res)")
}

// use person as struct
typealias onCompletion = (Int) -> Void

func makeBuyProduct(onCompletion: onCompletion) {
    onCompletion(42)
}
 
makeBuyProduct { print($0) }



typealias onCompletionWithDiscount = (String) -> Void
typealias onCompletionWithoutDiscount = (String) -> Void

func makingBuy(value: Double,
               hasDiscount: Bool,
               onCompletionWithDiscount: onCompletionWithDiscount,
               onCompletionWithoutDiscount: onCompletionWithoutDiscount) -> Void {
    let discount: Double = 0.9
    let finalValue: Double
    
    finalValue = hasDiscount ? value * discount : value
    
    if hasDiscount {
        onCompletionWithDiscount("Compra com disconto, valor final: \(finalValue)")
    }
    else {
        onCompletionWithoutDiscount("Valor final: \(finalValue)")
    }
}

makingBuy(value: 42, hasDiscount: true) { valueWithDiscount in
    print(valueWithDiscount)
} onCompletionWithoutDiscount: { valueWithoutDiscount in
    print(valueWithoutDiscount)
}

makingBuy(value: 42, hasDiscount: false) { valueWithDiscount in
    print(valueWithDiscount)
} onCompletionWithoutDiscount: { valueWithoutDiscount in
    print(valueWithoutDiscount)
}

func funcOnCompletion(_ message: String) -> Void { print(message) }

func funcMakingBuy(value: Double, hasDiscount: Bool) -> Void {
    let discount: Double = 0.9
    let finalValue: Double
    
    finalValue = hasDiscount ? value * discount : value
    if hasDiscount {
        let message: String = "Compra com disconto, valor final: \(finalValue)"
        funcOnCompletion(message)
    }
    else {
        let message: String = "Compra com disconto, valor final: \(finalValue)"
        funcOnCompletion(message)
    }
}

funcMakingBuy(value: 42, hasDiscount: true)
funcMakingBuy(value: 42, hasDiscount: false)


