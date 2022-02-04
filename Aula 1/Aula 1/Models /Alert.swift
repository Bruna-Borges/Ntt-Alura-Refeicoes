//
//  Alert.swift
//  Aula 1
//
//  Created by Bruna Silva Borges on 31/01/22.
//

import UIKit


class Alert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(title: String = "Sorry", mensagem: String){
        let alert = UIAlertController(title: title, message: mensagem, preferredStyle: .alert)
        
        let ok = UIAlertAction (title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
