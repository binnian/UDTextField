//
//  ContentView.swift
//  UDTextField
//
//  Created by apple on 2020/11/2.
//

import SwiftUI

struct ContentView: View {
    @State var text : String
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.red)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Group {
                    Text("自定义键盘，完美支持中文")
                    Text("支持实时获取修改内容")
                    Text("感谢Start")
                }.padding()
                
                UDTextField("请输入内容", text: $text).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.leading,10)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(10).padding(.horizontal, 10.0)
            }.padding(.top,50)
            Spacer()
        }
    }
}
