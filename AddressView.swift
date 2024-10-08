//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by SANIYA KHATARKAR on 21/07/24.
//

import SwiftUI

struct AddressView : View{
    @ObservedObject var order : Order
    var body: some View{
        Form {
            Section{
                TextField("Name" , text: $order.name)
                TextField("Street address", text: $order.streetAddress)
                TextField("City" , text: $order.city)
                TextField("Zip", text: $order.zip)
                
            }
            
            Section{
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress ==  false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews : PreviewProvider{
    static var previews: some View {
        AddressView(order: Order())
    }
}
