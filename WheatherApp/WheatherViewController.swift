//
//  WheatherViewController.swift
//  WheatherApp
//
//  Created by Fernando García Fernández on 27/3/17.
//  Copyright © 2017 Fernando García Fernández. All rights reserved.
//

import Foundation
import UIKit

class WheatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var table: UITableView!
    
    var isSearching = false
    var viewModel: WheatherViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeViewForeground()
        viewModel = WheatherViewModel()
        configureDelegates()
    }
    
    func configureDelegates(){
        table.delegate = self
        table.dataSource = self
        searchBar.delegate = self
    }
    
    
    func changeViewForeground(){
        if isSearching{
            searchBar.alpha = 1
            table.isHidden = false
        }
        else{
            searchBar.alpha = 0.5
            table.isHidden = true
        }
    }
    

    //MARK: Search Bar delegates
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
        changeViewForeground()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.endEditing(true)
        changeViewForeground()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.endEditing(true)
        changeViewForeground()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.endEditing(true)
        changeViewForeground()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterCities(searchText: searchText)
        table.reloadData()
    }
    
    
    //MARK: TableView delegates
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getDataCount()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell;
        cell.textLabel?.text = viewModel.getCityByIndex(index: indexPath.row)
        return cell;
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isSearching = false
        changeViewForeground()
    }
    
}
