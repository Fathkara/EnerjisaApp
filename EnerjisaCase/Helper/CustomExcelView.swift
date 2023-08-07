//
//  CustomExcelView.swift
//  EnerjisaCase
//
//  Created by Fatih on 4.08.2023.
//

import UIKit
class ExcelStackView: UIView {
    
    //MARK: - UI
    
    private var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 17.5
        return stackView
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
    
    var dueDateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 16,fontWeight: .Medium)
        return label
    }()
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 16,fontWeight: .Medium)
        return label
    }()
    
    var excelImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "invoice")
        return image
    }()
    
    private var showImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "top")
        return image
    }()
    
    var paymentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor("#F3BC45")
        label.font = Font.custom(size: 16,fontWeight: .Medium)
        return label
    }()
    //MARK: - Properties
    var dueDate: String?
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()

    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Function
    
    private func configure() {
        addSubview(parentStackView)
        parentStackView.addArrangedSubview(dueDateLabel)
        parentStackView.addArrangedSubview(firstLine)
        parentStackView.addArrangedSubview(priceLabel)
        parentStackView.addArrangedSubview(secondLine)
        parentStackView.addArrangedSubview(excelImage)
        parentStackView.addArrangedSubview(thirdLine)
        parentStackView.addArrangedSubview(paymentLabel)
        parentStackView.addArrangedSubview(showImage)
        makeConstraints()
        

    }
    
    func handleData(dueDate:String,price:String) {
        self.dueDateLabel.text = dueDate
        self.priceLabel.text = price
        self.excelImage.image = UIImage(named: "invoice")
        self.paymentLabel.text = "Öde"
        self.showImage.image = UIImage(named: "top")
        
    }
    
    private func makeConstraints() {
        parentStackView.snp.makeConstraints { make in
            make.left.top.equalTo(self).offset(16)
            make.right.bottom.equalTo(self).offset(-16)
        }
        
        firstLine.layer.borderColor = UIColor("#F3F3F3").cgColor
        firstLine.layer.borderWidth = 1
        firstLine.snp.makeConstraints { make in
            make.height.equalTo(117)
            make.width.equalTo(1)
        }
        
        secondLine.layer.borderColor = UIColor("#F3F3F3").cgColor
        secondLine.layer.borderWidth = 1
        secondLine.snp.makeConstraints { make in
            make.height.equalTo(117)
            make.width.equalTo(1)
        }
        
        thirdLine.layer.borderColor = UIColor("#F3F3F3").cgColor
        thirdLine.layer.borderWidth = 1
        thirdLine.snp.makeConstraints { make in
            make.height.equalTo(117)
            make.width.equalTo(1)
        }

    }

    
    
    

}
