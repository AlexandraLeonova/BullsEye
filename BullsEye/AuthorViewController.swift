//
//  AuthorViewController.swift
//  BullsEye
//
//  Created by Александра Леонова on 18.04.2024.
//

import UIKit

class AuthorViewController: UIViewController {

    @IBOutlet var buttonBack: UIButton!
    @IBAction func unwindToGame(_ sender: UIStoryboardSegue) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBack.tintColor = .systemGreen
    }
    

}
