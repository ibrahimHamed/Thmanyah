//
//  RetryErrorOverlayUIView.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
import UIKit

class RetryErrorOverlay: UIView {
    private let iconImageView = UIImageView()
    private let messageLabel = UILabel()
    private let retryButton = UIButton(type: .system)
    private let dismissButton = UIButton(type: .system)
    private let containerView = UIView()
    private let contentStack = UIStackView()
    private let buttonStack = UIStackView()
    
    private var retryAction: (() -> Void)?
    private var dismissAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = UIColor.black.withAlphaComponent(0.35)
        
        // Container with blur
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        containerView.addSubview(blurView)
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
        
        // Icon
        iconImageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
        iconImageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(scale: .large)
        iconImageView.tintColor = .systemYellow
        
        // Message
        messageLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        
        // Buttons
        retryButton.setTitle("Retry", for: .normal)
        retryButton.backgroundColor = .systemBlue
        retryButton.setTitleColor(.white, for: .normal)
        retryButton.layer.cornerRadius = 8
        retryButton.addTarget(self, action: #selector(retryTapped), for: .touchUpInside)
        
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.backgroundColor = .systemGray5
        dismissButton.setTitleColor(.secondaryLabel, for: .normal)
        dismissButton.layer.cornerRadius = 8
        dismissButton.layer.borderWidth = 1
        dismissButton.layer.borderColor = UIColor.systemGray4.cgColor
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        
        // Stack views
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 12
        buttonStack.addArrangedSubview(retryButton)
        buttonStack.addArrangedSubview(dismissButton)
        
        contentStack.axis = .vertical
        contentStack.spacing = 16
        contentStack.alignment = .center
        contentStack.addArrangedSubview(iconImageView)
        contentStack.addArrangedSubview(messageLabel)
        contentStack.addArrangedSubview(buttonStack)
        
        containerView.addSubview(contentStack)
        addSubview(containerView)
        
        // Layout
        [blurView, containerView, contentStack, buttonStack].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: containerView.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 36),
            containerView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -36),
            
            contentStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            contentStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            contentStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
            contentStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            
            retryButton.widthAnchor.constraint(equalToConstant: 120),
            retryButton.heightAnchor.constraint(equalToConstant: 44),
            dismissButton.widthAnchor.constraint(equalToConstant: 120),
            dismissButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configure(message: String, retry: @escaping () -> Void, dismiss: @escaping () -> Void) {
        messageLabel.text = message
        retryAction = retry
        dismissAction = dismiss
    }
    
    @objc private func retryTapped() {
        retryAction?()
    }
    
    @objc private func dismissTapped() {
        dismissAction?()
    }
}
