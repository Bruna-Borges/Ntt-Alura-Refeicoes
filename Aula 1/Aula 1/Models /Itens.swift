//
//  Itens.swift
//  Aula 1
//
//  Created by Bruna Silva Borges on 24/01/22.
//

import UIKit

class Itens: NSObject, NSCoding {
    
    //MARK: - ATRIBUTOS DA CLASSE
    var name: String
    var calories: Double
    
    //MARK: - INIT = INICIALIZADOR 
    init(name: String, calories: Double) {
        self.name = name
        self.calories = calories
    }
    //MARK: - NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(calories, forKey: "calories")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        calories = aDecoder.decodeDouble(forKey: "calories")
    }
}
