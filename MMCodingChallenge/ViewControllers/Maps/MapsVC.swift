//
//  MapsViewController.swift
//  MMCodingChallenge
//
//  Created by Kem Bel on 11/17/21.
//

import UIKit
import WebKit

class MapsVC: UIViewController {
    
    var webView: WKWebView!
    var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var urlToLoad: URL?
    
    init(urlString: String) {
        if let url = URL(string: urlString) {
            urlToLoad = url
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebKit()
        setupButtons()
        setupViews()
    }
    
    override func loadView() {
        super.loadView()
        view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        view.addSubview(contentView)
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 42),
            backButton.widthAnchor.constraint(equalToConstant: 42),
            contentView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 8),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        contentView.addSubview(webView)
    }
    
    private func setupButtons() {
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
    }
    
    private func setupWebKit() {
        webView = WKWebView(frame: contentView.bounds, configuration: WKWebViewConfiguration())
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.load(URLRequest(url: urlToLoad!)) // we know urlToLoad is not nil because we have a checker in the init.
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc
    func buttonTapped(sender : UIButton) {
        dismiss(animated: true)
    }
}

// MARK: - WKNavigationDelegate
extension MapsVC: WKNavigationDelegate {}
