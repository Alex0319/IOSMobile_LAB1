//
//  FilmTableViewController.swift
//  FilmWatch
//
//  Created by Admin on 03.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class FilmsTableViewController: UITableViewController {
    
    var filmsController:FilmsController? = nil
    
    private func loadSampleFilms(){
        filmsController = FilmsController()
        if filmsController == nil {
            let alert=UIAlertController(title: "Error",message: "Error.Not found information about films",preferredStyle:UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.default,handler: nil))
            self.present(alert,animated: true,completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleFilms()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filmsController!.getFilmsCount()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FilmTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FilmsTableViewCell else {
            fatalError("The dequeued cell is not an instance of FilmTableViewCell")
        }
        let currentFilm = filmsController?.getFilmInfo(index: indexPath.row)
        cell.lblFilmTitle.text=currentFilm!.title
        cell.imgvwFilmPoster.image=currentFilm!.poster
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if(segue.identifier == "ShowFilmDetails"){
            guard let filmDetailViewController = segue.destination as? FilmViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedFilmCell = sender as? FilmsTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedFilmCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            filmDetailViewController.film=filmsController?.getFilmInfo(index: indexPath.row)
        }
    }
}
