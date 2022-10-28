//
//  ContentView.swift
//  VKAppSwiftUI
//
//  Created by Никита Мошенцев on 19.06.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    @State var login: String = ""
    @State var password: String = ""
    @State var shouldShowLogo = true
    @State private var showIncorrectCredentialsWarning = false
    @Binding var isUserLoggedIn: Bool
    
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
                }.onTapGesture {
                    UIApplication.shared.endEditing()
                }.alert(isPresented: $showIncorrectCredentialsWarning) {
                    Alert(title: Text("Error"), message: Text("Incorrect Login/Password was entered"))
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
                    Button(action: verifyLoginData) {
                    Text("Войти")
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: 60)
                }
                .buttonStyle(.bordered)
                .background(.blue)
                .disabled(self.login.isEmpty || self.password.isEmpty)
                    
                    Button {
                        
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
                .autocapitalization(.none)
            }
            .onReceive(self.keyboardPublisher) { isKeyboardShow in
                withAnimation(.easeIn(duration: 0.5)) {
                    self.shouldShowLogo = !isKeyboardShow
                }
        }
    }
    
    private func verifyLoginData() {
        if login == "1" && password == "1" {
            isUserLoggedIn = true
        } else {
            showIncorrectCredentialsWarning = true
        }
        password = ""
    }
}

extension UIApplication {
    func endEditing () {
        self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
