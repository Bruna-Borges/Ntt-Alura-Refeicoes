//
//  RefeicoesTableViewController.swift
//  Aula 1
//
//  Created by Bruna Silva Borges on 27/01/22.
//


import UIKit

    //MARK: - CLASSE
class RefeicoesTableViewController: UITableViewController, AddFoodDelegate{

    //MARK: - ATRIBUTOS
    var food: [Food] = [ ]
    
    override func viewDidLoad() {
        food = RefeicaoDao().recupera()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil )
        let food = food[indexPath.row]
        celula.textLabel?.text = food.name
        
        // AQUI IMPLEMENTAMOS UM SISTEMA PARA ULTILIZAR GESTOS DO USUARIO - RECONHECEDOR DE GESTOS
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetals(_:)))
        celula.addGestureRecognizer(longPress) // se eu quiser adicionar alguma coisa a celula basta chamar esse metodo
        
        return celula
    }
    
    func add(_ foods: Food){
        food.append(foods)
        tableView.reloadData()
        RefeicaoDao().saveFood(food)
    }
    
    //MARK: - GESTOS JA INICIADO ALI EM CIMA COM LONGPRESS
    
    @objc func showDetals(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began { // isso se chama validacao é um if que verifica o estado que o usuario esta
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else {return}
            let food2 = food[indexPath.row]
            
            
            RemoveRefeicaoViewController(controller: self).show(food2, handler: {Alert in
                self.food.remove(at: indexPath.row)// estou removendo um determinado item da linha que eu selecionei
                self.tableView.reloadData()
            })

    }
}
    //MARK: - MUDANÇA DE TELA
    //RECOMENDAÇAO SEMPRE QUE COLOCARMOS UMA NOVA TELA NO STORY BOARD É BOM COLOCAR UM IDENTICADOR
    // PREPARE PFR SEGUE SERVE - ELE SE PREPARA ANTES DE SEGUIR PRO PROXIMO VIEWCONTROLLER
    // SEGUE É AQUELA SETINHA NO STORY BOARD QUE LIGA UMA TELA A OUTRA!!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //SEMPRE QUE TRABALHAMOS COM SEGUE É IMPORTANTE USARMOS UM IDENTIFICADOR DE OCORRER ALGUM CRASH
        if segue.identifier == "adicionar" {
            
            if let viewController = segue.destination as? ViewController{
                viewController.delegate = self
            }
        }
    }
}
