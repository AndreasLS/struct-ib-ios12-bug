//
//  MyCustomView.swift
//  TesteFramework2
//
//  Created by André Salla on 06/08/21
//  Copyright © 2021 André Salla. All rights reserved.
//

import UIKit
import TesteFramework

public protocol MyCustomViewDelegate: AnyObject {
    func showEditView(edition: ValueModel)
}

final public class MyCustomView: UIView, NibLoadable {

    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var totalAmount: UILabel!
    @IBOutlet private(set) weak var editButton: UIButton!
    private var valueModel: ValueModel? {
        didSet {
            self.setupView(value: valueModel)
        }
    }
    weak var delegate: MyCustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupFromNib()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupView(value: ValueModel?) {
        self.editButton.isHidden = !(value?.valueIsEditable ?? false)
        self.totalAmount.text = value?.value ?? "R$ 0,00"
    }
    
    func change(data: ValueModel) {
        self.valueModel = data
    }
    
    @IBAction func editTapped(_ sender: UIButton) {
        if let value = valueModel {
            self.delegate?.showEditView(edition: value)
        }
    }
    
    
}
