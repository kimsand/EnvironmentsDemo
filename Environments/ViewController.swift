//
//  ViewController.swift
//  Environments
//
//  Created by Kim André Sand on 06/09/2017.
//
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet var environmentLabel: UILabel!
	@IBOutlet var baseURLLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()

		environmentLabel.text = kServiceEnvironment
		baseURLLabel.text = kBaseURL
	}
}
