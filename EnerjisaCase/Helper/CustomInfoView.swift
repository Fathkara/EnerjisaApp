//
//  CustomInfoView.swift
//  EnerjisaCase
//
//  Created by Fatih on 4.08.2023.
//

import UIKit
import SnapKit

class CustomInfoView: UIView {
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = Font.custom(size: 16,fontWeight: .SemiBold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let infoImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let totalLbl: UILabel = {
        let label = UILabel()
        label.font = Font.custom(size: 15,fontWeight: .SemiBold)
        return label
    }()
    
    let totalPriceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
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
    
    func configure() {
        addSubview(infoImage)
        addSubview(infoLabel)
        addSubview(totalLbl)
        addSubview(totalPriceLabel)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor(red: 0.68, green: 0.68, blue: 0.75, alpha: 0.4).cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10.0
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.masksToBounds = false
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func createView(info:Int ,price:String) {
        infoLabel.text = "Tüm sözleşme hesaplarınıza ait \(info) adet ödenmemiş fatura bulunmaktadır."
        totalLbl.text = "Toplam Borç:"
        totalPriceLabel.text = "₺ \(price)"
        infoImage.image = UIImage(named: "info")
        infoImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(12)
            make.width.height.equalTo(24)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.left.equalTo(infoImage.snp.right).offset(12)
            make.right.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(12)
        }
        
        totalLbl.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(16)
            make.left.equalTo(infoImage.snp.right).offset(12)
        }
        totalPriceLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-12)
            make.centerY.equalTo(totalLbl)
        }
    }
    
    func createDetailView(info:Int ,price:String) {
        infoLabel.text = "Seçili sözleşme hesabınıza ait \(info)\nadet ödenmemiş fatura\nbulunmaktadır."
        totalLbl.text = "Toplam Borç:"
        totalPriceLabel.text = "₺ \(price)"
        infoImage.image = UIImage(named: "info")
        infoImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(12)
            make.width.height.equalTo(24)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.left.equalTo(infoImage.snp.right).offset(12)
            make.right.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(12)
            make.height.equalTo(70)
        }
        
        totalLbl.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(16)
            make.left.equalTo(infoImage.snp.right).offset(12)
        }
        totalPriceLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-12)
            make.centerY.equalTo(totalLbl)
        }
    }

    
    
}
