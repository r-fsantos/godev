// Implementação de pilha em swift

class Stack {
    let maxSize: Int
    var stack: [Int] = []
    
    init(maxSize: Int) {
        self.maxSize = maxSize
    }
    
    func isFull() -> Bool { self.stack.count >= self.maxSize }

    func isEmpty() -> Bool { self.stack.isEmpty }
    
    func push(element: Int) -> Void {
        if self.isFull() {
            print("Pilha cheia")
        }
        else {
            self.stack.append(element)
        }
    }

    func pop() -> Void {
        if self.isEmpty() {
            print("Pilha vazia")
        }
        else {
            self.stack.removeLast()
        }
    }
    
    func clearStack() -> Void { self.stack.removeAll() }
    
    func getStack() -> [Int] { return self.stack }
    
    func getTopOfStack() -> Int { return self.stack.count - 1 }
}

let testMaxsize: Int = 5
var firstStack: Stack = Stack(maxSize: testMaxsize)

for _ in 1...5 { firstStack.push(element: 42) }
print(firstStack.getStack())
print(firstStack.getTopOfStack())

for _ in 1...2 { firstStack.pop() }
print(firstStack.getStack())
print(firstStack.getTopOfStack())

firstStack.clearStack()
print(firstStack.getStack())
