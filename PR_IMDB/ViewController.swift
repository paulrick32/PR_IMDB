//
//  ViewController.swift
//  PR_IMDB
//
//  Created by Paulinho on 06/08/19.
//  Copyright © 2019 Paulo Pereira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {


    @IBOutlet weak var tableview: UITableView!
    
    
    var movieData: [MovieModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieData()
        
        
        
        // Do any additional setup after loading the view.
    }
    func fetchMovieData(){
        DispatchQueue.main.async {
            Alamofire.request("https://api.themoviedb.org/3/movie/upcoming?api_key=c5850ed73901b8d268d0898a8a9d8bff").responseJSON(completionHandler: { (response) in
                switch response.result{
                case.success(let value):
                    let json = JSON(value)
                    json["results"].array?.forEach({ (movie) in
                        let movie = MovieModel(title: movie["title"].stringValue, release_date: movie["release_date"].stringValue, genres_ids: movie["genres_ids"].stringValue, poster_path: movie["poster_path"].stringValue, overview: movie["overview"].stringValue, poster: movie["poster_path"].stringValue)
                        self.movieData.append(movie)
                        
                        print(movie)
                    })
                   self.tableview.reloadData()
                case.failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }


    
 
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.lblGenre.text = self.movieData[indexPath.row].genres_ids
        cell.lblMovie.text = self.movieData[indexPath.row].title
        cell.lblDate.text = self.movieData[indexPath.row].release_date
     //   let resource = ImageResource(downloadURL: URL(string: movieData[indexPath.row])!, cacheKey: movieData[indexPath.row])
     //   cell.photo.kf.setImage(with: resource)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail:DetailView3 = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailView3
        
        detail.stroverview = movieData[indexPath.row].overview
        detail.strdate = movieData[indexPath.row].release_date
        detail.strname = movieData[indexPath.row].title
        detail.strgenre = movieData[indexPath.row].genres_ids
        
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
