//
//  LaunchViewController.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 15/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet weak var animation: LauncView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animation.addUntitledAnimation()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
