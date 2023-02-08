//
//  FSProductsViewController.swift
//  MVVMFakeStoreAPI
//
//  Created by Rahul Acharya on 2023-01-17.
//

import UIKit

class FSProductsViewController: UIViewController {
    
    @IBOutlet weak var productListTable: UITableView?
    private var viewModel = FSProductViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeEvent()
        
        
        
        
    }
    
    func observeEvent(){
        productListTable?.register(UINib(nibName: FSProductCell.cellID, bundle: nil), forCellReuseIdentifier: FSProductCell.cellID)
        viewModel.fetchProducts()
        viewModel.eventClosure = { [weak self] event in
            switch event {
            case .validate:
                DispatchQueue.main.async {
                    self?.productListTable?.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }
    
    
}


extension FSProductsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FSProductCell.cellID, for: indexPath) as? FSProductCell
        cell?.objc = self.viewModel.productsArray[indexPath.row]
        return cell ?? UITableViewCell()
    }
    
    
}
