//
//  MeusPetsListaViewController.swift
//  Vida Pet
//
//  Created by João Pedro Giarrante on 15/10/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import UIKit


class MeusPetsListaViewController: VidaPetMainViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Variables
    
    let segueIdentifierDetalhes = "MeusPetsListaToMeusPetsDetalhes"
    let segueIdentifierCadastro = "MeusPetsListaToMeusPetsCadastro"
    let cellIdentifier = "cell"

    
    // MARK: LifeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupNavBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    fileprivate func setupNavBar() {
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = addItem
    }
    
    @objc fileprivate func addTapped() {
        performSegue(withIdentifier: segueIdentifierCadastro, sender: self)
    }

    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case segueIdentifierDetalhes:
            if let destinationVC = segue.destination as? MeusPetsDetalheViewController, let indexPath = sender as? IndexPath{
                destinationVC.pet = MeusPetsListaViewController.pets[indexPath.row]
                destinationVC.selectedPetIndex = indexPath.row
            }
        case segueIdentifierCadastro: break
        default: break
        }
    }

}


// MARK: - UITableViewDataSource

extension MeusPetsListaViewController: UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MeusPetsListaViewController.pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MeusPetsListaCellTableViewCell else {
            return UITableViewCell()
        }
        
        if var age = MeusPetsListaViewController.pets[indexPath.row].info.birth?.ageFromDate(withFormatter: defaultDateFormatter), let breed = MeusPetsListaViewController.pets[indexPath.row].info.breed {
            if age > 1 {
                let formattedAge = "\(Int(floor(age))) anos"
                cell.lblDescricao.text = "\(breed), \(formattedAge)"
            } else {
                age *= 12
                let formattedAge = "\(Int(floor(age))) meses"
                cell.lblDescricao.text = "\(breed), \(formattedAge)"
            }
        }
        cell.lblNome.text = MeusPetsListaViewController.pets[indexPath.row].name
        cell.imgPet.image = MeusPetsListaViewController.pets[indexPath.row].image?.decodeBase64ToImage()
        
        return cell
    }
}


// MARK: - UITableViewDelegate

extension MeusPetsListaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueIdentifierDetalhes, sender: indexPath)
    }
}


