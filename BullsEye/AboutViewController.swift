//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Александра Леонова on 18.04.2024.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

//    @IBOutlet var bullPic: UIImage!
//    @IBAction func bullPicChange(_ sender: UIImageView){
//        var smashed = false
//        bullPic.high
//        
//    }
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
//        func url(
//            forResource name: String?,
//            withExtension ext: String?
//        ) -> URL?
        
        
    }
}
