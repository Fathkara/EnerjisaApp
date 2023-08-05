//
//  CustomDetailView.swift
//  EnerjisaCase
//
//  Created by Fatih on 4.08.2023.
//

import UIKit
class CustomDetailView: UIView {
    
    //MARK: - UI
    
    private var copyImage: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private var copySecondImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
   
    private var firstLine: UIView = {
        let view = UIView()
        return view
    }()
    
    private var secondLine: UIView = {
        let view = UIView()
        return view
    }()
    
    private var thirdLine: UIView = {
        let view = UIView()
        return view
    }()
    
    private var viewInfo: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor("#FFFFFF")
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor(red: 0.68, green: 0.68, blue: 0.75, alpha: 0.4).cgColor
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 10.0
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        view.layer.masksToBounds = false
        return view
    }()

    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 16,fontWeight: .Medium)
        return label
    }()
    
    private var descripionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 16,fontWeight: .Medium)
        return label
    }()
    
    private var stateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .Regular)
        return label
    }()
    
    private var installationNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 16,fontWeight: .Medium)
        return label
    }()
    
    private var installationNumberNoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .Regular)
        return label
    }()
    
    private var contractAccountNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 16,fontWeight: .Medium)
        return label
    }()
    
    private var contractAccountNumberNoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .Regular)
        return label
    }()
    
    
    private var homeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()

    
    private var installationNumberStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private var contractNumberStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
//        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    private var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        return stackView
    }()
    
    private var streetStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        return stackView
    }()

    private var clickButton: UIButton = {
        let button = UIButton()
        button.setTitle("Goruntule", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true

        return button
    }()
    
    var customInfoView = CustomInfoView()
    
    //MARK: - Properties
    
    var nexPage: (() -> Void)?
    
    //MARK: - Init
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupContent()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContent()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - Private Func
    
    private func setupContent() {
        self.backgroundColor = .white

        addSubview(parentStackView)
//        parentStackView.addArrangedSubview(homeStackView)
//        homeStackView.addArrangedSubview(titleLabel)
        parentStackView.addArrangedSubview(titleLabel)
        parentStackView.addArrangedSubview(firstLine)
        parentStackView.addArrangedSubview(streetStackView)
        streetStackView.addArrangedSubview(descripionLabel)
        streetStackView.addArrangedSubview(stateLabel)
        
        parentStackView.addArrangedSubview(secondLine)
      
        parentStackView.addArrangedSubview(installationNumberStackView)
        installationNumberStackView.addArrangedSubview(installationNumberLabel)
        installationNumberStackView.addArrangedSubview(installationNumberNoLabel)
        installationNumberStackView.addArrangedSubview(copyImage)

        parentStackView.addArrangedSubview(contractNumberStackView)
        contractNumberStackView.addArrangedSubview(contractAccountNumberLabel)
        contractNumberStackView.addArrangedSubview(contractAccountNumberNoLabel)
        contractNumberStackView.addArrangedSubview(copySecondImage)
//        contractView.addSubview(copySecondImage)

        parentStackView.addArrangedSubview(thirdLine)
//        parentStackView.addArrangedSubview(amountStackView)
//        amountStackView.addArrangedSubview(amountLabel)
//        amountStackView.addArrangedSubview(amountPriceLabel)
//        parentStackView.addArrangedSubview(clickButton)
        parentStackView.addArrangedSubview(viewInfo)
        viewInfo.addSubview(customInfoView)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor(red: 0.68, green: 0.68, blue: 0.75, alpha: 0.4).cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10.0
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.masksToBounds = false
 
                
        let startColor = UIColor("#FCEE50")
        let endColor = UIColor("#EEA540")
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = clickButton.bounds
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        clickButton.layer.insertSublayer(gradientLayer, at: 0)
        clickButton.addTarget(self, action: #selector(clickButtonTapped), for: .touchUpInside)
      
    }
     
    @objc func clickButtonTapped() {
        nexPage?()
    }
    
    func setupCosntraints(title: String, state: String, instNo: String, contNo: String, isList: Bool = true) {
        titleLabel.text = title
        descripionLabel.text = "Adress:"
        stateLabel.text = state
        installationNumberLabel.text = "Tesisat Numarasi:"
        installationNumberNoLabel.text = instNo
        contractAccountNumberLabel.text = "Sozlesme\nHesap Numarasi:"
        contractAccountNumberNoLabel.text = contNo
        copyImage.image = UIImage(named: "copy")
        copySecondImage.image = UIImage(named: "copy_")
        
        parentStackView.snp.makeConstraints { make in
            make.left.top.equalTo(self).offset(16)
            make.right.bottom.equalTo(self).offset(-16)
            //make.bottom.equalTo(self).offset(16)
        }
        firstLine.layer.borderColor = UIColor("#DADADA").cgColor
        firstLine.layer.borderWidth = 1
        firstLine.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        secondLine.layer.borderColor = UIColor("#DADADA").cgColor
        secondLine.layer.borderWidth = 1
        secondLine.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        thirdLine.layer.borderColor = UIColor("#DADADA").cgColor
        thirdLine.layer.borderWidth = 1
        thirdLine.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        
        clickButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }

        contractAccountNumberLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(-16)
        }
        contractAccountNumberNoLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-25)
            make.centerY.equalToSuperview()
        }
        copySecondImage.snp.makeConstraints { make in
            make.left.equalTo(contractAccountNumberNoLabel.snp.right).offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(15)
        }

//
//        descripionLabel.snp.makeConstraints { make in
//            make.left.equalToSuperview()
//            make.top.equalToSuperview().offset(-30)
//
//        }
//        stateLabel.snp.makeConstraints { make in
//            make.top.equalTo(descripionLabel.snp.bottom).offset(4)
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//        }
        copySecondImage.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
//            make.width.height.equalTo(15)
        }
        
        viewInfo.snp.makeConstraints { make in
            make.height.equalTo(128)
        }
        customInfoView.snp.makeConstraints { make in
            make.top.equalTo(viewInfo)
            make.left.equalTo(viewInfo)
            make.right.equalTo(viewInfo)
            make.height.equalTo(128)
        }
        
        
    }
}
