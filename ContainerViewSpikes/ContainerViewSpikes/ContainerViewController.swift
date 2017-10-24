//
//  ContainerViewController.swift
//  ContainerViewSpikes
//
//  Created by Rhydian Thomas on 24/10/17.
//  Copyright © 2017 Rhydian Thomas. All rights reserved.
//

import UIKit

protocol ContainerViewControllerDelegate: class {
  func didTransitionToSummary()
  func didTransitionToMap()
}


class ContainerViewController: UIViewController, ContainerViewControllerDelegate {

  // MARK: - Private properties

  @IBOutlet private weak var cardView: UIView!

  private lazy var summaryViewController: SummaryViewController = {
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
    viewController.delegate = self
    return viewController
  }()

  private lazy var mapViewController: MapViewController = {
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
    viewController.delegate = self
    return viewController
  }()


  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    print("ContainerViewController viewDidLoad")

    add(childViewController: summaryViewController)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    print("ContainerViewController viewWillAppear")
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    print("ContainerViewController viewWillDisappear")
  }


  func didTransitionToMap() {
    summaryViewController.willMove(toParentViewController: nil)
    add(childViewController: mapViewController)

    mapViewController.view.alpha = 0

    transition(from: summaryViewController, to: mapViewController, duration: 0.3, options: .curveEaseInOut, animations: {
      self.mapViewController.view.alpha = 1
      self.summaryViewController.view.alpha = 0
    }) { finished in
      self.summaryViewController.removeFromParentViewController()
      self.mapViewController.didMove(toParentViewController: self)
    }

    // make sure our cards view is always on top
    self.view.bringSubview(toFront: self.cardView)
  }

  func didTransitionToSummary() {
    mapViewController.willMove(toParentViewController: nil)
    add(childViewController: summaryViewController)

    summaryViewController.view.alpha = 0

    transition(from: mapViewController, to: summaryViewController, duration: 0.3, options: .curveEaseInOut, animations: {
      self.summaryViewController.view.alpha = 1
      self.mapViewController.view.alpha = 0
    }) { finished in
      self.mapViewController.removeFromParentViewController()
      self.summaryViewController.didMove(toParentViewController: self)
    }

    // make sure our cards view is always on top
    self.view.bringSubview(toFront: self.cardView)
  }


  // MARK: - Private methods

  private func add(childViewController child: UIViewController) {
    addChildViewController(child)
    view.addSubview(child.view)

    // constraints
    child.view.translatesAutoresizingMaskIntoConstraints = false
    child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    child.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    child.didMove(toParentViewController: self)

    // make sure our cards view is always on top
    self.view.bringSubview(toFront: self.cardView)
  }

}
