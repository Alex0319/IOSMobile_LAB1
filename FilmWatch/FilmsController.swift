//
//  DataManager.swift
//  FilmWatch
//
//  Created by Admin on 05.03.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import SwiftyJSON

class FilmsController{
    
    private var films = [Film]()
    
    init?() {
        if(!loadFilmsInfo()){
            return nil
        }
    }
    
    private func loadFilmsInfo() -> Bool{
        guard let asset=NSDataAsset(name: "FilmInfo",bundle: Bundle.main) else {
            return false
        }
        let json = JSON(data: asset.data)
        if let array = json["films"].array{
            for element in array{
                films.append(Film(title: element["filmTitle"].string!, photoPath: element["filmPoster"].string!, description: element["filmDescription"].string!))
            }
        }
        return true
    }
    
    public func getFilmsCount()->Int{
        return films.count
    }
    
    public func getFilmInfo(index: Int)->Film{
        return films[index]
    }
}
