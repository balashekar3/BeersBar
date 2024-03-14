//
//  BeersListScreen.swift
//  BeersBar
//
//  Created by Balashekar Vemula on 17/02/24.
//

import UIKit

class BeersListScreen: UIViewController {
    
    @IBOutlet weak var beersListTableView: UITableView!
    
    private var viewModel = BeersViewModel()
    
    // MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupTableView()
    }
    // MARK: - SetupTableView

    private func setupTableView(){
        beersListTableView.delegate = self
        beersListTableView.dataSource = self
        beersListTableView.register(BeerTableViewCell.nib, forCellReuseIdentifier: BeerTableViewCell.identifier)
    }
        
}
    // MARK: - TableViewExtension

extension BeersListScreen : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.modelResponse?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerTableViewCell") as? BeerTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.labelTitle.text = viewModel.modelResponse?[indexPath.row].name
        return cell
    }
    
    
}

extension BeersListScreen{
    func setupViewModel(){
        viewModel.getListForBeers()
        viewmodelCallBackes()
    }
    func viewmodelCallBackes(){
        viewModel.eventHandler = { [weak self] recivedEvent in
            
            switch recivedEvent{
            case .loading:
                debugPrint("Screen Start loading....")
            case .stopLoading:
                debugPrint("Screen Stop loading....")
            case .dataLoded:
                debugPrint("Screen Data Loded....")
                DispatchQueue.main.async {
                    self?.beersListTableView.reloadData()
                }
            case .error(let error):
                debugPrint("Screen error \(error?.localizedDescription ?? "no")....")
            }
        }
    }
}
