//
//  ContentView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 19.06.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var login: String = ""
    @State var password: String = ""
    @State var shouldShowLogo = true
    
    private let keyboardPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { notification in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { notification in false }
    ).eraseToAnyPublisher()
    
    var body: some View {
        ZStack {
            
            GeometryReader { geometry in
                Image("backgroundPicture")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
            }
            
    ScrollView {
        
        VStack {
            
            if self.shouldShowLogo {
                Image("vkLogo-1")
                    .padding([.bottom, .top], 20)
            }
            
            VStack(alignment: .leading) {
                Text("Телефон или e-mail")
                    .frame(width: 300, alignment: .leading)
                    .padding(.top, 20)
                Spacer()
                TextField("", text: $login)
                .frame(maxWidth: 300)
            }
            
            VStack(alignment: .leading) {
                Text("Пароль:")
                    .frame(maxWidth: 300, alignment: .leading)
                Spacer()
                SecureField("", text: $password)
                    .frame(maxWidth: 300)
            }
            
            HStack {
            Button {
                print("Log In pressed")
            } label: {
                Text("Войти")
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: 60)
            }
            .buttonStyle(.bordered)
            .background(.blue)
            .disabled(self.login.isEmpty || self.password.isEmpty)
                
                Button {
                    print("Log In pressed")
                } label: {
                    Text("Отмена")
                        .foregroundColor(.gray)
                    }
            }
            .frame(maxWidth: 300,
                   maxHeight: 50,
                   alignment: .leading)
            
            
            Text("Ещё не зарегестрированы?")
                .font(.headline)
                .frame(maxWidth: 300, maxHeight: 30, alignment: .leading)
                .foregroundColor(.gray)
            
            Button {
                print("Tap regestration button")
            } label: {
                Text("Зарегистрироваться")
                    .frame( maxWidth: 300)
            }
            .buttonStyle(.bordered)
            .padding(.top, 5)
            Spacer()
            
        }
        .padding([.leading, .trailing], 20)
        .frame(maxWidth: 350)
        .textFieldStyle(RoundedBorderTextFieldStyle())

            }.onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
        .onReceive(self.keyboardPublisher) { isKeyboardShow in
            withAnimation(.easeIn(duration: 0.5)) {
                self.shouldShowLogo = !isKeyboardShow
            }
        }
    }
}

extension UIApplication {
    func endEditing () {
        self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
