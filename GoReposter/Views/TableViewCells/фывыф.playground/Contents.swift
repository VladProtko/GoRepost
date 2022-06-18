import UIKit

struct Starship {
    var name: String
}

let tardis = Starship(name: "TARDIS")
var enterprise = tardis
enterprise.name = "Enterprise"

print(tardis.name)
