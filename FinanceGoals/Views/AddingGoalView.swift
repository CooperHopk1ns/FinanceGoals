//
//  AddingGoalView.swift
//  FinanceGoals
//
//  Created by Cooper Hopkins on 6/12/22.
//

import SwiftUI

struct AddingGoalView: View {
    @Environment(\.dismiss) var dismiss
    @State var number = 0
    @State var image = ""
    @State var description = ""
    @State var amountSavedText = ""
    @State var amountSaved = 0
    @State var amountTotalText = ""
    @State var amountTotal = 0
    var body: some View {
        NavigationView {
                VStack {
                TextField("description", text: $description)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                TextField("Amount Saved", text: $amountSavedText)
                        .padding()
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                TextField("Amount Total", text: $amountTotalText)
                    .padding()
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
                Text("You Have To Refresh The View")
                        .padding()
                Button(action: {
                    amountSaved = Int(amountSavedText) ?? 0
                    amountTotal = Int(amountTotalText) ?? 0
                    number = goals.count
                    goals.append(Goal.init(number: number, image: image, description: description, amountSaved: amountSaved, amountTotal: amountTotal))
                    dismiss()
                    
                    print("\(goals)")
                }) {
                    Text("Enter")
                }
            }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200, alignment: .top)
            .navigationTitle("Add A Goal")
        }
    }
}

struct AddingGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddingGoalView()
    }
}
