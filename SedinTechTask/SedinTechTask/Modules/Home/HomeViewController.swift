//
//  HomeViewController.swift
//  SedinTechTask
//
//  Created by Navin Kumar R on 05/10/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorLbl: UILabel!
    
    private(set) lazy var viewModel: HomeViewModel = {
        HomeViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCell()
        loadData()
    }
    
    
    func registerTableViewCell() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "homeCell")
    }
    
    func loadData() {
        viewModel.loadData(path: "issues") { [self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async { [self] in
                    viewModel.data = data
                    errorLbl.isHidden = true
                    tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async { [self] in
                    errorLbl.isHidden = false
                    errorLbl.text = error.localizedDescription
                }
            }
        }
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        
        let data = viewModel.data[indexPath.row]
        cell.configure(data: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
