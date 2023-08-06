//
//  InvoicesDetailVC.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import UIKit
import PhoneNumberKit
import SnapKit

class InvoicesDetailVC: UIViewController {
    
    //MARK: Views
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: 0, height: view.frame.size.height)
        
        return scrollView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .SemiBold)
        label.text = "KİŞİSEL BİLGİLER"
        return label
    }()
    
    private var nameSurnameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .SemiBold)
        label.text = "Adınız ve Soyadınız"
        return label
    }()
    
    private var nameTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Ad ve soyad giriniz.."
        textfield.backgroundColor = UIColor("#F3F3F3")
        textfield.layer.cornerRadius = 10
        textfield.layer.masksToBounds = true
        textfield.textColor = UIColor("#444444")
        textfield.font = UIFont.systemFont(ofSize: 16)
        textfield.textAlignment = .left
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        return textfield
    }()
    
    private var identifyNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .SemiBold)
        label.text = "T.C. Kimlik Numaranız "
        return label
    }()
    
    private var identifyTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "XXXXXXXXXXX"
        textfield.backgroundColor = UIColor("#F3F3F3")
        textfield.layer.cornerRadius = 10
        textfield.layer.masksToBounds = true
        textfield.textColor = UIColor("#444444")
        textfield.font = UIFont.systemFont(ofSize: 16)
        textfield.textAlignment = .left
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        return textfield
    }()
    
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .SemiBold)
        label.text = "E-Posta Adresiniz"
        return label
    }()
    
    private var emailTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "ornek@enerjisa.com.tr"
        textfield.backgroundColor = UIColor("#F3F3F3")
        textfield.layer.cornerRadius = 10
        textfield.layer.masksToBounds = true
        textfield.textColor = UIColor("#444444")
        textfield.font = UIFont.systemFont(ofSize: 16)
        textfield.textAlignment = .left
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        return textfield
    }()
    
    private var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .SemiBold)
        label.text = "Cep Telefonu Numaranız"
        return label
    }()
    
    private var phoneNumberTextfield: PhoneNumberTextField = {
        let textfield = PhoneNumberTextField()
        textfield.placeholder = "Alan kodu olmadan numaranızı giriniz..."
        textfield.backgroundColor = UIColor("#F3F3F3")
        textfield.layer.cornerRadius = 10
        textfield.layer.masksToBounds = true
        textfield.textColor = UIColor("#444444")
        textfield.font = UIFont.systemFont(ofSize: 16)
        textfield.textAlignment = .left
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
        return textfield
    }()
    
    private var installationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .SemiBold)
        label.text = "TESİSAT DETAYI"
        return label
    }()
    
    private var leftLineView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor =  UIColor("#F3F3F3").cgColor
        return view
    }()
    
    private var dueDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .SemiBold)
        label.text = "Vade\nTarihi"
        label.numberOfLines = 0
        return label
    }()
    
    private var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor("#444444")
        label.font = Font.custom(size: 15,fontWeight: .SemiBold)
        label.text = "Ödenecek\nTutar"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var rightLineView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor =  UIColor("#F3F3F3").cgColor
        return view
    }()
    
    private var backgroundControl: UIControl = {
        let control = UIControl()
        control.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        control.isUserInteractionEnabled = false
        return control
    }()
    
    //MARK: Properties
    
    var viewModel: InvoicesDetailViewModelProtocol?
    private var customDetailView = CustomDetailView()
    private var customExcelView = ExcelStackView()
    private var popupView = CustomPopup()
    var arrData = [Invoice]()
    var fromHome = false
    var blurEffectView: UIVisualEffectView?
    
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    }
    
    //MARK: Private Func
    
    private func configure() {
        navigationController?.navigationBar.tintColor = .white
        let titleText = "FATURA DETAYI"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: Font.custom(size: 17,fontWeight: .SemiBold)
        ]
        let attributedTitle = NSAttributedString(string: titleText, attributes: attributes)
        let navBarLabel = UILabel()
        navBarLabel.attributedText = attributedTitle
        navBarLabel.sizeToFit()
        navigationItem.titleView = navBarLabel
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(nameSurnameLabel)
        scrollView.addSubview(nameTextfield)
        scrollView.addSubview(identifyNumberLabel)
        scrollView.addSubview(identifyTextfield)
        scrollView.addSubview(emailLabel)
        scrollView.addSubview(emailTextfield)
        scrollView.addSubview(phoneNumberLabel)
        scrollView.addSubview(phoneNumberTextfield)
        scrollView.addSubview(installationLabel)
        scrollView.addSubview(customDetailView)
        scrollView.addSubview(leftLineView)
        scrollView.addSubview(dueDateLabel)
        scrollView.addSubview(amountLabel)
        scrollView.addSubview(rightLineView)
        nameTextfield.delegate = self
        identifyTextfield.delegate = self
        emailTextfield.delegate = self
        phoneNumberTextfield.delegate = self
        viewModel?.loadInvoices()
        makeConstraints()
        showInvoicesDetail()
        
    }
    
    
    
    private func showInvoicesDetail() {
        guard !arrData.isEmpty else { return }
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(dueDateLabel.snp.bottom).offset(17)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-12)
            make.bottom.equalTo(scrollView).offset(-20)
        }
        
        for (index, invoice) in arrData.enumerated() {
            guard let invoiceType = determineInvoiceType(for: invoice) else { continue }
            guard (invoiceType == "Ev" && fromHome) || (invoiceType == "İş Yeri" && !fromHome) else { continue }
            
            let excelStackView = ExcelStackView()
            let gesture = UITapGestureRecognizer(target: self, action:#selector(paymentClicked))
            let gestureInvoices = UITapGestureRecognizer(target: self, action: #selector(invoicesClicked))
            excelStackView.excelImage.addGestureRecognizer(gestureInvoices)
            excelStackView.excelImage.isUserInteractionEnabled = true
            excelStackView.excelImage.tag = index
            excelStackView.paymentLabel.tag = index
            excelStackView.paymentLabel.isUserInteractionEnabled = true
            excelStackView.paymentLabel.addGestureRecognizer(gesture)
            excelStackView.handleData(dueDate: invoice.dueDate ?? "", price: invoice.amount ?? "")
            stackView.addArrangedSubview(excelStackView)
            
            excelStackView.snp.makeConstraints { make in
                make.height.equalTo(50)
            }
        }
        
    }
    
    private func determineInvoiceType(for invoice: Invoice) -> String? {
        if let installationNumber = invoice.installationNumber {
            if installationNumber == "4012312871" {
                return "Ev"
            } else if installationNumber == "4012310284" {
                return "İş Yeri"
            }
        }
        
        return nil
    }
    
    private func setupIinvoices() {
        guard let invoicesListData = viewModel?.getList() else { return }
        customDetailView.setupCosntraints(title: invoicesListData.company ?? "", state: invoicesListData.address ?? "", instNo: invoicesListData.installationNumber ?? "", contNo: invoicesListData.contractAccountNumber ?? "",  isList: false)
        if fromHome {
            let info = 4
            customDetailView.customInfoView.createDetailView(info: info, price: invoicesListData.amount ?? "")
            
        }else {
            let info = 5
            customDetailView.customInfoView.createDetailView(info: info, price: invoicesListData.amount ?? "")
            
        }
    }
}
//MARK: - PopupView

extension InvoicesDetailVC {
    
    private func createBlur() {
        let blurEffect = UIBlurEffect(style: .dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.backgroundColor = .black
        blurEffectView?.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        blurEffectView?.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height * 0.719)
        blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView?.alpha = 0.64
        view.addSubview(self.blurEffectView!)
        blurEffectView?.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.sendSubviewToBack(blurEffectView!)
        
        view.addSubview(backgroundControl)
        backgroundControl.frame = view.bounds
        view.bringSubviewToFront(backgroundControl)
        view.bringSubviewToFront(popupView)
    }
    
    private func createPopup() {
        popupView.layer.cornerRadius = 20
        self.popupView.backgroundColor = UIColor("#FFFFFF")
        view.addSubview(popupView)
        
        
        popupView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(339)
        }
        
        createBlur()
        popupView.isHidden = false
        backgroundControl.isHidden = false
    }
    
    @objc func paymentClicked(sender: UITapGestureRecognizer) {
        guard let selectedLabel = sender.view as? UILabel else {
            return
        }
        
        let selectedIndex = selectedLabel.tag
        guard selectedIndex < arrData.count else {
            return
        }
        
        let selectedInvoice = arrData[selectedIndex]
        let selectedDueDate = selectedInvoice.dueDate ?? ""
        popupView.createPopup(dueDate: selectedDueDate)
        createPopup()
        hiddenPopup()
        
    }
    @objc func invoicesClicked(sender: UITapGestureRecognizer) {
        guard let selectedLabel = sender.view as? UIImageView else {
            return
        }
        
        let selectedIndex = selectedLabel.tag
        guard selectedIndex < arrData.count else {
            return
        }
        
        let selectedInvoice = arrData[selectedIndex]
        let selectedDueDate = selectedInvoice.documentNumber ?? ""
        popupView.createDocumentPopup(documentNo: selectedDueDate)
        createPopup()
        hiddenPopup()

    }
    
    func hiddenPopup() {
        self.popupView.nexPage = {
            self.removeBlur()
        }
    }
    
    private func removeBlur() {
        for subview in view.subviews {
            if let blurEffectView = subview as? UIVisualEffectView {
                blurEffectView.removeFromSuperview()
                backgroundControl.isHidden = true
                popupView.isHidden = true
            }
        }
    }
    
    
}

//MARK: - Validation functions

extension InvoicesDetailVC {
    private func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if emailPred.evaluate(with: email) {
            if email.hasSuffix("@enerjisa.com.tr") {
                print("true")
                return true
            }
            
        }
        return false
    }
    
    private func isValidIdentifyID(_ identifyID: String) -> Bool {
        let identifyRegex = "^[1-9]{1}[0-9]{9}[0-9]{1}$"
        let identifyIDTest = NSPredicate(format: "SELF MATCHES %@", identifyRegex)
        let isValidID = identifyIDTest.evaluate(with: identifyID)
        return isValidID
    }
}

//MARK: - InvoicesDetailViewModelDelegate

extension InvoicesDetailVC: InvoicesDetailViewModelDelegate {
    func handleOutPut(outPut: InvoicesDetailOutPut) {
        switch outPut {
        case .invoicesListData(let listData):
            setupIinvoices()
            print(listData)
        case .invoicesData(let listInvoice):
            print(listInvoice)
            
            
        }
    }
}




//MARK: - Constraints

extension InvoicesDetailVC {
    
    func makeConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(scrollView).offset(28)
            make.left.equalTo(view).offset(30)
        }
        
        nameSurnameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
        }
        
        nameTextfield.snp.makeConstraints { make in
            make.top.equalTo(nameSurnameLabel.snp.bottom).offset(10)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(44)
        }
        
        identifyNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextfield.snp.bottom).offset(30)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
        }
        
        identifyTextfield.snp.makeConstraints { make in
            make.top.equalTo(identifyNumberLabel.snp.bottom).offset(10)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(44)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(identifyTextfield.snp.bottom).offset(30)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
        }
        
        emailTextfield.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(44)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextfield.snp.bottom).offset(30)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
        }
        
        phoneNumberTextfield.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(10)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(44)
        }
        
        installationLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextfield.snp.bottom).offset(23)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
        }
        
        customDetailView.snp.makeConstraints { make in
            make.top.equalTo(installationLabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(32)
            make.right.equalTo(view).offset(-32)
            make.height.equalTo(400)
            
        }
        
        leftLineView.snp.makeConstraints { make in
            make.top.equalTo(customDetailView.snp.bottom).offset(17)
            make.left.equalTo(view).offset(30)
            make.height.equalTo(117)
            make.width.equalTo(1)
        }
        
        dueDateLabel.snp.makeConstraints { make in
            make.top.equalTo(customDetailView.snp.bottom).offset(20)
            make.left.equalTo(leftLineView.snp.right).offset(23)
            
        }
        
        amountLabel.snp.makeConstraints { make in
            make.top.equalTo(customDetailView.snp.bottom).offset(20)
            make.left.equalTo(dueDateLabel.snp.right).offset(40)
            
        }
        
        rightLineView.snp.makeConstraints { make in
            make.top.equalTo(customDetailView.snp.bottom).offset(17)
            make.right.equalTo(view).offset(-30)
            make.height.equalTo(117)
            make.width.equalTo(1)
            
        }
        
    }
}

//MARK: - TextfieldDelegate

extension InvoicesDetailVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case nameTextfield:
            
            let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIİJKLMNOPQRSTUVWXYZ ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        case identifyTextfield:
            
            let allowedCharacters = CharacterSet(charactersIn: "0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            let newLength = (textField.text?.count ?? 0) + string.count - range.length
            return allowedCharacters.isSuperset(of: characterSet) && newLength <= 11
            
        case phoneNumberTextfield:
            let characterLimit = 15
            let newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
            let numberOfChars = newText.count
            return numberOfChars < characterLimit
            
        default:
            break
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == emailTextfield {
            guard let email = textField.text else { return true }
            
            if !isValidEmail(email: email) {
                let emailAlert = UIAlertController(title: "Yanlış e-mail girdiniz.", message: nil, preferredStyle: .alert)
                emailAlert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { _ in
                    textField.layer.borderColor = UIColor.clear.cgColor
                    textField.layer.borderWidth = 0
                }))
                present(emailAlert, animated: true)
                textField.layer.borderColor = UIColor.red.cgColor
                textField.layer.borderWidth = 2
                return false
            }
        } else if textField == identifyTextfield {
            guard let nationalID = textField.text else { return true }
            
            if !isValidIdentifyID(nationalID) {
                let identifyAlert = UIAlertController(title: "“Girdiğiniz T.C. Kimlik numarası doğru değildir“", message: nil, preferredStyle: .alert)
                identifyAlert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { _ in
                    textField.layer.borderColor = UIColor.clear.cgColor
                    textField.layer.borderWidth = 0
                }))
                present(identifyAlert, animated: true)
                textField.layer.borderColor = UIColor.red.cgColor
                textField.layer.borderWidth = 2
                return false
            }
            
        } else if textField == phoneNumberTextfield {
            guard let phoneNumber = textField.text else { return true }
            
            if phoneNumber.count < 14 {
                let phoneAlert = UIAlertController(title: "Hata", message: "Geçersiz numara tuşladınız.", preferredStyle: .alert)
                phoneAlert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { _ in
                    textField.layer.borderColor = UIColor.clear.cgColor
                    textField.layer.borderWidth = 0
                }))
                present(phoneAlert, animated: true)
                textField.layer.borderColor = UIColor.red.cgColor
                textField.layer.borderWidth = 2
                return false
            }
        }
        
        return true
    }
    
}
