//
//  DetailView3.swift
//  PR_IMDB
//
//  Created by Paulinho on 07/08/19.
//  Copyright © 2019 Paulo Pereira. All rights reserved.
//

import UIKit

class DetailView3: UIViewController {

    @IBOutlet weak var lblDtlName: UIStackView!
    @IBOutlet weak var lblDtlGenre: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblDtlDate: UILabel!
    @IBOutlet weak var posterDtl: UIImageView!
    
    @IBOutlet weak var lblDtlOverview: UILabel!
    
    
    var strname = ""
    var strgenre = ""
    var strdate = ""
    var strposter = ""
    var stroverview = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblDtlOverview.text = stroverview
        lblDtlGenre.text = strgenre
        lblDtlDate.text = strdate
        lblName.text = strname
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
