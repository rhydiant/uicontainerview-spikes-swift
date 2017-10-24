//
//  SummaryViewController.swift
//  ContainerViewSpikes
//
//  Created by Rhydian Thomas on 24/10/17.
//  Copyright © 2017 Rhydian Thomas. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

  weak var delegate: ContainerViewControllerDelegate?
  

  override func viewDidLoad() {
    super.viewDidLoad()

    print("SummaryViewController viewDidLoad")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    print("SummaryViewController viewWillAppear")
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    print("SummaryViewController viewWillDisappear")
  }


  @IBAction func didTapTransition(_ sender: Any) {
    delegate?.didTransitionToMap()
  }

}

