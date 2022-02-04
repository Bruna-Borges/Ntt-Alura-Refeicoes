//
//  ViewController.swift
//  AluraViagens
//
//  Created by Bruna Silva Borges on 02/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viagensTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
        
        
        viagensTableView.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    
    }
}
//MARK: - NUMERO DE LINHAS E OPCIONAIS
//Aqui eu disse que o meu view controller vai implementar um protocolo chamado UITableViewDataSource
extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = "viagem\(indexPath.row)"
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
        headerView?.configuraView()
        return  headerView
    }
    

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
}

