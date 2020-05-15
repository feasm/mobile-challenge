//
//  CoinConvertViewController.swift
//  BtgChallenge
//
//  Created by Felipe Alexander Silva Melo on 10/05/20.
//  Copyright © 2020 Felipe Alexander Silva Melo. All rights reserved.
//

import UIKit

protocol CoinConvertCoordinatorDelegate: class {
    func showCoinList()
}

final class CoinConvertViewController: UIViewController {

    // MARK: - Properties
    var coinConvertView: CoinConvertView?
    var viewModel: CoinConvertViewModelInput?
    var coordinator: CoinConvertCoordinatorDelegate?
    
    init(viewModel: CoinConvertViewModelInput, coordinator: CoinConvertCoordinatorDelegate) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func loadView() {
        super.loadView()
        coinConvertView = CoinConvertView(viewController: self)
        view = coinConvertView
        title = "Convert"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

}

// MARK: - Output

extension CoinConvertViewController: CoinConvertViewModelOutput {
    func displayAlertMessage(message: String) {
        presentAlert(message: message)
    }
    
    func displayFromCoinNickname(coinNickname: String) {
        // TODO: Get from local database
    }
    
    func displayToCoinNickname(coinNickname: String) {
        // TODO: Get from local database
    }
    
    func displayConversionValue(conversionValue: String) {
        coinConvertView?.toCoinView.updateValue(value: conversionValue)
    }
}

// MARK: - Delegates

extension CoinConvertViewController: BtgButtonDelegate {
    func didTapButton(view: BtgButton) {
        viewModel?.getConversionQuote()
    }
}

extension CoinConvertViewController: CoinViewDelegate {
    func didUpdateCurrency(view: CoinView, value: String) {
        viewModel?.updateFromCoinValue(value: value)
    }
    
    func didTapCoinButton(view: CoinView) {
        coordinator?.showCoinList()
    }
}