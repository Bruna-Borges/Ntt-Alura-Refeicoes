//
//  AdicionarItensViewController.swift
//  Aula 1
//
//  Created by Bruna Silva Borges on 30/01/22.
//

import UIKit

protocol AddItensDelegate{
    func add(_ iten: Itens)
}

   //MARK: - CLASS

class AdicionarItensViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var calorieTextField: UITextField!
    
    //MARK: - ATRIBUTOS
    
    var delegate: AddItensDelegate?
    
    //MARK: - INIT METODO CONSTRUTOR
    
    init(delegate: AddItensDelegate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - VIEW LIFE CYCLE QUE CUIDA DO CICLO DE VIDA DA VIEW

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction AQUI EU VOU GUARDAR A AÇÃO DO MEU BOTÃO
    
    @IBAction func addIten(_ sender: Any) {
        
        guard let name = nameTextField.text, let calorie = calorieTextField.text else {
            return
        }
        if let numberCalorie = Double (calorie){
            let iten = Itens(name: name, calories: numberCalorie)
            
            //MARK: - FORMAS DE TRABALHAR COM OPCIONAIS
            /*1
            if let delegate  = delegate{
                delegate.add(iten)
            }
           //2
            guard let delgate = delegate else {return}
            delgate.add(iten)
            */
            
            //para navegar para proxima tela eu ultilizo meu navigationController.push()
            //para voltar para tela anterior eu ultilizo o navigationController.pop()
            delegate?.add(iten) //Essa tambem é uma forma de trabalhar com opcionais
            navigationController?.popViewController(animated: true)
                        
        }
    }
}
