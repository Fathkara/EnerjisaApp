//
//  InvociesVC.swift
//  EnerjisaCase
//
//  Created by Fatih on 2.08.2023.
//

import UIKit
import SnapKit

class InvociesListVC: UIViewController {
    
    //MARK: - Views
    
    private var totalPriceLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        scrollView.contentSize = CGSize(width: 0, height: view.frame.size.height)
        return scrollView
    }()
    
    private var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .lastBaseline
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private var customStackView = CustomStackView()
    private var customSecondStackView = CustomStackView()
    private var customInfoView = CustomInfoView()
    
    //MARK: - Properties
    
    private var firstList: List?
    private var invoicesList: Invoice?
    var arrInvoice = [Invoice]()
    
    
    var viewModel: InvociesListViewModelProtocol?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDelegate()
        configureNavigationBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Fatura Listesi"
    }
    
    //MARK: - Private Func
    
    private func initDelegate() {
        viewModel?.delegate = self
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .systemOrange
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.systemOrange
        navigationItem.title = "Fatura Listesi"
        
        //view.addSubview(parentView)
        view.addSubview(scrollView)
        scrollView.addSubview(parentStackView)
        parentStackView.addArrangedSubview(customInfoView)
        parentStackView.addArrangedSubview(customStackView)
        parentStackView.addArrangedSubview(customSecondStackView)
        
        viewModel?.loadInvocies()
        segueForDetail()
        
        makeConstraints()
    }
    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        let startColor = UIColor(red: 0.99, green: 0.93, blue: 0.31, alpha: 1.0)
        let endColor = UIColor(red: 0.93, green: 0.65, blue: 0.25, alpha: 1.0)
        
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: -0.1, y: 0)
        gradient.endPoint = CGPoint(x: 1.13, y: 1.02)
        gradient.frame = CGRect(x: 0, y: 0, width: 375, height: 88)
        
        let image = imageFromLayer(gradient)
        appearance.backgroundImage = image
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func imageFromLayer(_ layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, UIScreen.main.scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage ?? UIImage()
    }
    
    
    
    
    private func handleFisrtList() {
        guard let firstList = self.fetchFirstList(isFirst: true) else { return }
        guard let secondList = self.fetchFirstList(isFirst: false) else { return }
        guard let invoicesData = viewModel?.getInvocies() else {return}
        
        customStackView.setupCosntraints(title: firstList.company ?? "", state: firstList.address ?? "", instNo: firstList.installationNumber ?? "", contNo: firstList.contractAccountNumber ?? "", price: firstList.amount ?? "")
        
        customInfoView.createView(info: invoicesData.totalPriceCount!, price: invoicesData.totalPrice!)
        
        customSecondStackView.setupCosntraints(title: secondList.company ?? "", state: secondList.address ?? "", instNo: secondList.installationNumber ?? "", contNo: secondList.contractAccountNumber ?? "", price: secondList.amount ?? "")
    }
    
    func fetchFirstList(isFirst:Bool) -> List? {
        
        if let userInvoices = viewModel?.getInvocies(),  let lists = userInvoices.list, !lists.isEmpty {
            if isFirst {
                firstList = lists[0]
            }else {
                firstList = lists[1]
            }
            
        }
        
        return firstList
    }
    
    
    func segueForDetail() {
        
        customStackView.nexPage = { [self] in
            if let userInvoices = self.viewModel?.getInvocies(),
               let lists = userInvoices.list,
               let invoices = userInvoices.invoices,
               !lists.isEmpty {
                self.firstList = lists[0]
                self.invoicesList = invoices[0]
                self.arrInvoice = userInvoices.invoices!
                navigationItem.title = ""
            }
            
            guard let firstList = self.firstList else { return }
            let vc = InvociesDetailBuilder.make(listData: firstList, invoiceData: invoicesList!, arrInvoice: self.arrInvoice)
            vc.arrData = self.arrInvoice
            vc.fromHome = true
            self.show(vc, sender: nil)
        }
        
        customSecondStackView.nexPage = { [self] in
            if let userInvoices = self.viewModel?.getInvocies(),
               let lists = userInvoices.list,
               let invoices = userInvoices.invoices,
               !lists.isEmpty {
                self.firstList = lists[1]
                self.invoicesList = invoices[4]
                self.arrInvoice = userInvoices.invoices!  
                navigationItem.title = ""
            }
            
            guard let firstList = self.firstList else { return }
            let vc = InvociesDetailBuilder.make(listData: firstList, invoiceData: invoicesList!, arrInvoice: self.arrInvoice)
            vc.arrData = self.arrInvoice
            vc.fromHome = false
            self.show(vc, sender: nil)
        }
    }

    
}



//MARK: InvociesViewModelDelegate

extension InvociesListVC: InvociesViewModelDelegate {
    func handleOutPut(outPut: InvociesListViewModelOutPut) {
        switch outPut {
        case .invociesData(var userInvoicess):
            print(userInvoicess)
            userInvoicess.invoices = self.arrInvoice
            handleFisrtList()
        case .error(let error):
            print(error)
        }
    }
}

//MARK: - Constraints

extension InvociesListVC {
    func makeConstraints() {
        
        
        scrollView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.frame.size.width)
        }
                
        parentStackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
            
        }
        
        customInfoView.snp.makeConstraints { make in
            make.top.equalTo(parentStackView).offset(24)
            make.left.equalTo(parentStackView).offset(30)
            make.right.equalTo(parentStackView).offset(-30)
            make.height.equalTo(104)
        }
        
        customStackView.snp.makeConstraints { make in
            make.top.equalTo(customInfoView.snp.bottom).offset(32)
            make.left.equalTo(parentStackView).offset(32)
            make.right.equalTo(parentStackView).offset(-32)
            make.height.equalTo(400)
        }
        
        customSecondStackView.snp.makeConstraints { make in
            make.top.equalTo(customStackView.snp.bottom).offset(32)
            make.left.equalTo(parentStackView).offset(32)
            make.right.equalTo(parentStackView).offset(-32)
            make.height.equalTo(400)
        }
    }
}
