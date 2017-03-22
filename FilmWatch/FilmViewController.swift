//
//  FilmViewController.swift
//  FilmWatch
//
//  Created by Admin on 05.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var imgvwFilmPoster: UIImageView!
    @IBOutlet weak var lblFilmTitle: UILabel!
    @IBOutlet weak var lblFilmDescription: UILabel!
    
    var film:Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let film = film {
            lblFilmTitle.text=film.title;
            imgvwFilmPoster.image=film.poster
            lblFilmDescription.text=film.description
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
