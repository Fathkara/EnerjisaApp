//
//  CustomPopUp.swift
//  EnerjisaCase
//
//  Created by Fatih on 5.08.2023.
//

import UIKit
class CustomPopup: UIView {
    
    private var vectorImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector")
        return image
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor("#000000")
        label.font = Font.custom(size: 20,fontWeight: .Medium)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 3
        label.textAlignment = .center
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .Medium)
        return label
    }()
    
    private var clickButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tamam", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true

        return button
    }()
    
    var nexPage: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createPopup(dueDate:String) {
        titleLabel.text = "Son Ödeme Tarihi"
        descriptionLabel.text = "Bu fatura \(dueDate) tarihine kadar\nödenmesi gerekmektedir."
        
    }
    func createDocumentPopup(documentNo:String) {
        titleLabel.text = "Döküman Numarası"
        descriptionLabel.text = "Bu faturaya ait döküman numarası\n\(documentNo)’dir. Bu numaraya istinaden\nişlemlerinizi gerçekleştirebilirsiniz."
    }
    
    func configure() {
        addSubview(vectorImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(clickButton)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ImageClicked))
        vectorImage.addGestureRecognizer(gesture)
        vectorImage.isUserInteractionEnabled = true
        vectorImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(vectorImage.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(80)
        }
        
        let startColor = UIColor("#FCEE50")
        let endColor = UIColor("#EEA540")
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = clickButton.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        clickButton.layer.insertSublayer(gradientLayer, at: 0)
        clickButton.addTarget(self, action: #selector(clickButtonTapped), for: .touchUpInside)
        clickButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
    }
    @objc func clickButtonTapped() {
        nexPage?()
    }
    
    @objc func ImageClicked() {
        nexPage?()
    }
}
