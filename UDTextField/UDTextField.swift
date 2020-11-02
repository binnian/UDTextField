//
//  UDTextField.swift
//  UDTextField
//
//  Created by apple on 2020/11/2.
//

import SwiftUI
import UIKit

struct UDTextField: UIViewRepresentable {
    
    @Binding var text: String
    private let textField = UITextField(frame: .infinite)
    
    init(_ localizedStringKey: String, text: Binding<String>) {
        _text = text
        textField.placeholder = localizedStringKey
        textField.borderStyle = .roundedRect
    }
    
    func makeUIView(context: UIViewRepresentableContext<UDTextField>) -> UITextField {
        textField.delegate = context.coordinator
        
        textField.font = UIFont(name: "HelveticaNeue", size: 15)
        textField.isUserInteractionEnabled = true
        textField.backgroundColor = UIColor.init(named: "white")
        textField.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
        //定义边框
        textField.borderStyle = .none
        
        //        textField 增加关闭键盘按钮
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
        let doneButton = UIBarButtonItem(title: "关闭", style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
        toolBar.items = [doneButton]
        toolBar.setItems([doneButton], animated: true)
        textField.inputAccessoryView = toolBar
        
        return textField
    }
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<UDTextField>) {
        uiView.text = text
    }
    func makeCoordinator() -> Coordinator { Coordinator(self) }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var udTextField: UDTextField
        
        init(_ udTextField: UDTextField) {
            self.udTextField = udTextField
            super.init()
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(Self.textDidchange(_:)),
                                                   name: UITextField.textDidChangeNotification,
                                                   object: udTextField.textField)
        }
        
        deinit {
            NotificationCenter.default.removeObserver(self)
        }
        
        @objc private func textDidchange(_ notification: Notification) {
            let textField = udTextField.textField
            if textField.markedTextRange == nil {
                udTextField.text = textField.text ?? String()
            }
        }
    }
}
//关闭按钮回调
extension  UITextField{
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
       

        self.resignFirstResponder()
    }
}
