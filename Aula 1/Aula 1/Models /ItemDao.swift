//
//  ItemDao.swift
//  Aula 1
//
//  Created by Bruna Silva Borges on 01/02/22.
//

import UIKit

class ItemDao{
    
    //MARK: - SALVANDO ITEM
    func save(_ iten: [Itens]){
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: iten, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else { return }
            try dados.write(to: caminho)
        }catch{
            print(error.localizedDescription)
        }
    }
    //MARK: - RECUPERANDO ITEM
    func recupera () -> [Itens]{
        
        do{
            
           guard let diretory  = recuperaDiretorio() else { return [] }
            let data = try Data(contentsOf: diretory)
            let saveItens = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Itens]
            return saveItens
            
        }catch{
          
            print(error.localizedDescription)
            
            return[]
        }
    }
    //MARK: - DIRETORIO
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
}
