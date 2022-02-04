//
//  RemoveRefeicaoViewController.swift
//  Aula 1
//
//  Created by Bruna Silva Borges on 01/02/22.
//

import UIKit

//MARK: CONTROLADOR DE ALERTA

class RemoveRefeicaoViewController{
    
    let controller: UIViewController

    init(controller: UIViewController){
        self.controller = controller
    }
    
    func show(_ food2: Food, handler: @escaping (UIAlertAction) -> Void){ //@escaping - serve pra executar algo apenas quando o usuario fazer uma acao 
        
        let alert = UIAlertController(title: food2.name, message: food2.detals(), preferredStyle: .alert)

        //Criando um botao de alerta
        let buttonCancel = UIAlertAction(title: "Cancel", style: .cancel )
        alert.addAction(buttonCancel)
        
        let buttonRemove = UIAlertAction(title: "Remove", style: .destructive, handler: handler)
        
        alert.addAction(buttonRemove)
         
        controller.present(alert, animated: true, completion: nil)
    }
}
