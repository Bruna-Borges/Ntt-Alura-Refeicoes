//
//  ViewController.swift
//  Aula 1
//
//  Created by Bruna Silva Borges on 20/01/22.
//

import UIKit // = Interface do Usuario - biblioteca que ajuda a ultilizar a interface do usario.

    //MARK: - PROTOCOL
// PROTOCOL É EQUIVALENTE A UMA INTERFACE
//QUANDO TRABALHAMOS COM PROTOCOL ESTAMOS DEFININDO APENAS A CASCA DO METODO A IMPLEMENTACAO QUEM IRA FAZER É A PROPRIA CLASSE QUE FOR ULTILIZAR VIEWCONTROLLERDELEGATE
protocol AddFoodDelegate {
    //AQUI VAMOS ADICIONAR TODAS AS COISAS EM COMUM QUE QUEREMOS QUE ELE ENXERGUE!!
    func add(_ foods: Food)
}

    //MARK: - CLASSE

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItensDelegate {
   //MARK: - OUTlets
    
    @IBOutlet weak var ItensTableView: UITableView?
    
    
    //MARK: - ATRIBUTOS
    
    // DELEGATE - VAMOS DELEGAR A RESPONSABILIDADE DE CHAMAR UM METODO DE OUTRA CLASSE PARA ALGUEM
    var delegate: AddFoodDelegate?
//    var iten: [String] = ["Tomato Souce", "Cheese", "Spicy Sauce"]
    var iten: [Itens] = []
    var selectItens: [Itens] = []
                                                                     
    //MARK: - IBOutlets
    // referente aos TextField name e happines
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var happinesTextField: UITextField?
    
    //MARK: - METODOS DE CICLO DE VIDA DA VIEW (EXISTEM VARIOS METODOS QUE PODEMOS CONTROLAR OS ESTADOS DA VIEW
    
    override func viewDidLoad() {
        let buttonAddIten = UIBarButtonItem (title: "Add", style: .plain, target: self, action: #selector(AddIten))
        // sempre que precisarmos usar acoes com selector use o #selector
        //adicionando o  botão a barrinha topbar
        navigationItem.rightBarButtonItem = buttonAddIten
        recuperaItens()
    }
    func recuperaItens (){
        iten = ItemDao().recupera()
    }
    
    //Colocando marcacao que diz que ele é um metodo que pode ser ultilizado em objective c
    @objc func AddIten(){
       let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    //MARK: - METODO PARA ADICIONAR ITENS
    func add(_ item: Itens) {
        iten.append(item)
        ItemDao().save(iten)
        if let tableView = ItensTableView{
        tableView.reloadData()
        }else{
            Alert(controller: self).show(mensagem: "could not load this table")
        }
    }
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iten.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let lineTable = indexPath.row
        let iten = iten[lineTable]
        celula.textLabel?.text = iten.name
        
        return celula
    }
    
    //MARK: - UITableViewDelegate - Esse metodo vai identificar o clique do usuario
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else{ return}
        
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            selectItens.append(iten[linhaDaTabela])
        }else{
            celula.accessoryType = .none
            
            let iten = iten[indexPath.row]
            if let position = selectItens.firstIndex(of: iten){
                selectItens.remove(at: position)
                
            }
        }
    }
    func recuperaRefeicaoDoFormulario() -> Food?{
        // USANDO GUARD LET
        guard let nameFood = nameTextField?.text else {
            Alert(controller: self).show(mensagem: "error reading the name field")
            return nil
        }
    
        guard let happinesFood = happinesTextField?.text, let happines = Int(happinesFood)else {
            Alert(controller: self).show(mensagem: "error reading the happines field")
            return nil
        }
        
        let food = Food(name: nameFood, happines: happines, iten: selectItens)
        
        return food
    }
    //MARK: - IBActions
    // referente ao botão "add"
    @IBAction func Add(_ sender: Any) {
        if let food = recuperaRefeicaoDoFormulario(){
            delegate?.add(food)
            // ESSE METODO FAZ COM QUE A MINHA TELA RETORNE A OUTRA SEM CRIAR VARIAS CAMADAS
            navigationController?.popViewController(animated: true)
        }else{
            Alert(controller: self).show(mensagem: "error reading form")
        }
       
    }
}

