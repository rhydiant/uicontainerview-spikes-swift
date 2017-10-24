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


  func didTransitionToSummary() {
    remove(childViewController: mapViewController)
    add(childViewController: summaryViewController)
  }

  func didTransitionToMap() {
    remove(childViewController: summaryViewController)
    add(childViewController: mapViewController)
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
    view.bringSubview(toFront: cardView)
  }

  private func remove(childViewController child: UIViewController) {
    child.willMove(toParentViewController: nil)
    child.view.removeFromSuperview()
    child.removeFromParentViewController()
  }
}
