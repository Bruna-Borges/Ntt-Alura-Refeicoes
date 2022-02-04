//
//  Viagem.swift
//  Aula 2 Viagens
//
//  Created by Bruna Silva Borges on 02/02/22.
//

import UIKit

class Viagem: NSObject {
    
    let titulo: String
    let quantidadeDeDias: Int
    let preco: String
    let caminhoDaImagem: String
    
    
    init(titulo:String, quantidadeDeDias:Int, preco:String, caminhoDaImagem:String){
        
        self.titulo = titulo
        self.quantidadeDeDias = quantidadeDeDias
        self.preco = preco
        self.caminhoDaImagem = caminhoDaImagem
    }
    
    

}
