//
//  ContentView.swift
//  DemoSignInWithApple20230220
//
//  Created by Xavier on 2/20/23.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .imageScale(.large)
                .foregroundColor(.primary)
            Text("Hello, Sign in with Apple!")
                .bold()
            //Sign in with apple button
            SignInWithAppleButton(.signIn) { request in
                request.requestedScopes = [.fullName, .email]
            } onCompletion: { result in
                switch result {
                case .success(let authResult):
                    print("Auth success. Result: \(authResult)")
                    //Post-authentication updates on persistence and/or states.
                case .failure(let error):
                    print("Auth failed. Result: \(error.localizedDescription)")
                    //Handle auth failures
                }
            }
            .frame(width: 280, height: 40, alignment: .center)            .signInWithAppleButtonStyle(.black)
            
            Spacer()
                .frame(height: 20)
            
            SignInWithAppleButton(.signUp) { request in
                request.requestedScopes = [.fullName, .email]
            } onCompletion: { result in
                switch result {
                case .success(let authResult):
                    print("Auth success. Result: \(authResult)")
                    //Post-authentication updates on persistence and/or states.
                case .failure(let error):
                    print("Auth failed. Result: \(error.localizedDescription)")
                    //Handle auth failures
                }
            }
            .frame(width: 280, height: 40, alignment: .center)
            .signInWithAppleButtonStyle(.whiteOutline)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
