//
//  ContentView.swift
//  PrimerApp
//
//  Created by Ingeniero Fernando on 22/08/20.
//  Copyright © 2020 Ingeniero Fernando. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Las variables siempre van acá
    @State private var showAlert: Bool = false
    @State private var showActionSheet: Bool = false
    
    var alert: Alert {
        Alert(
            title: Text("Hola Fernando!"),
            message: Text("Cuerpo de la alerta"),
            primaryButton: .default(
                Text("Aceptar"),
                action:{
                    print("Mi primera alerta")
                }
            ),
            secondaryButton: .cancel(
                Text("Cancelar"),
                action:{
                    print("Cerré mi primera alerta")
                }
            )
        )
    }
    
    var actionSheet: ActionSheet{
        ActionSheet(
            title: Text("Menú"),
            message: Text("Elige una opción"),
            buttons: [
                .default(
                    Text("Galería"),
                    action:{
                        print("Abrir galería")
                    }
                ),
                .default(
                    Text("Cámara"),
                    action:{
                        print("Abrir galería")
                    }
                ),
                .cancel(
                    Text("Cancelar"),
                    action:{
                        print("Cerré el modal")
                    }
                )
            ]
        )
    }
    var body: some View {
        VStack(
            alignment: .center, spacing: 15.0
        ){
            Text("Hola mundo")
                .font(.largeTitle)
                .foregroundColor(.accentColor)
                .fontWeight(.heavy)
            Text("Esta es mi primera app con SwiftUI")
                .font(.headline)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            Spacer()
            Image("synthwave")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(17.0)
                .shadow(radius: 20.0)
            Spacer()
            HStack(
                alignment: .center, spacing: 30.0
            ){
                Button(action:{
                    // Acción a ejecutar al presionar
                    self.showAlert.toggle()
                }){
                    // formato del botón
                    HStack{
                        Image(systemName: "bell.fill")
                            .foregroundColor(.white)
                        Text("Mostrar alerta")
                        .foregroundColor(.white)
                        .font(.headline)
                    }.padding(.all)
                }.background(Color.blue)
                .cornerRadius(14.0)
                    .alert(isPresented: self.$showAlert, content: {
                        () -> Alert in self.alert
                    })
                
                Button(action:{
                    // Acción a ejecutar al presionar
                    self.showActionSheet.toggle()
                }){
                    // formato del botón
                    HStack{
                        Image(systemName: "chevron.up")
                            .foregroundColor(.white)
                        Text("Mostrar Action Sheet")
                        .foregroundColor(.white)
                        .font(.headline)
                    }.padding(.all)
                }.background(Color.orange)
                .cornerRadius(14.0)
                .actionSheet(isPresented: self.$showActionSheet, content: {
                    () -> ActionSheet in self.actionSheet
                })
            }
        }.padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
