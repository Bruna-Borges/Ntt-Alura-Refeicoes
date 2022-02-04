//
//  RefeicaoDao.swift
//  Aula 1
//
//  Created by Bruna Silva Borges on 01/02/22.
//

import UIKit

class RefeicaoDao{
    
    func saveFood(_ food: [Food]){
        
        guard let caminho = recuperaCaminho() else { return }
       
        do{  // do  USADO PARA TENTAR FAZER ALGO -- SEMRPE QUE ULTILIZAR O TRY VOCE PRECISA USAR O DO
            let dados = try NSKeyedArchiver.archivedData(withRootObject: food, requiringSecureCoding: false)
            try dados.write(to: caminho)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    func recupera() -> [Food] {
        guard let caminho = recuperaCaminho() else{ return []}
        
        do {
            let dados = try Data(contentsOf: caminho)
            guard let foodSaves = try
                NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as?
                Array<Food> else { return []}
        
            return foodSaves
        }catch{
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperaCaminho()-> URL?{
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let caminho = diretorio.appendingPathComponent("Food")
        
        return caminho
    }
}
