// conditionals

let isHidden: Bool = true
let isEnabled: Bool = false

if isHidden {
    print("True case")
} else if isEnabled {
    print("True case for isEnabled")
} else {
    print("False case")
}

if !isEnabled { print("Single-line if, to save some lines...") }

var system: String
let company: String = "Apple"

if company == "Apple" {
    system = "iOS"
} else {
    system = "Android"
}
print(system)

system = (company == "Apou") ? "iOS" : "Android"
print(system)
