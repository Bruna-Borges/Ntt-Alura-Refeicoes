//
//  Food.swift
//  Aula 1
//
//  Created by Bruna Silva Borges on 24/01/22.
//

import UIKit

// A CLASSE FOOD É RESPONSAVEL POR SABER QUAIS OS DETALHES DE UMA FOOD

class Food: NSObject, NSCoding{
    
    // MARK: - ATRIBUTOS
    
    let name: String // nome do atributo que eu quero guardar
    let happines: Int
    var itens: Array<Itens> = [] //ARRAY PARA ARMAZENAR OBJETOS DENTRO DE UMA DETERMINADA CLASSE
    
    //MARK: - CONSTRUTOR = INITI OU INICIALIZADOR
    
    //init = inicializador
    init(name: String, happines: Int, iten: [Itens] = []) { //dentro do init sempre deixe o tipo explicito ex: name: STRING,
     //nome do parametro que estou recebendo

        self.name = name //self.name é igual a variavel --- self.name = name é igual ao parametro do metodo
        self.happines = happines
        self.itens = iten
    }
    
    //MARK: - NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(happines, forKey: "happines")
        aCoder.encode(itens, forKey: "itens")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        happines = aDecoder.decodeInteger(forKey: "happines")
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Itens>
    }
   
    
  //MARK: - METODO
    
    // METODO PRA SABER O TOTAL DE CALORIAS
    
    func totalCalories() -> Double {
        var total = 0.0
        
        for iten in itens{
            total += iten.calories
        }
        
        return total
    }
    
    func detals () -> String{
        
        var mensagem = "Happines: \(happines)"
        
        for item in itens {
            mensagem += ", \(item.name ) - calories \(item.calories)"
        }
        
        return mensagem
    }
}
