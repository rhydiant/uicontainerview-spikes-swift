//
//  MapViewController.swift
//  ContainerViewSpikes
//
//  Created by Rhydian Thomas on 24/10/17.
//  Copyright © 2017 Rhydian Thomas. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

  weak var delegate: ContainerViewControllerDelegate?


  override func viewDidLoad() {
    super.viewDidLoad()

    print("MapViewController viewDidLoad")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    print("MapViewController viewWillAppear")
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    print("MapViewController viewWillDisappear")
  }

  @IBAction func didTapTransition(_ sender: Any) {
    delegate?.didTransitionToSummary()
  }
}
