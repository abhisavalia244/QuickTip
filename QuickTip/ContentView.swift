import SwiftUI

struct ContentView: View {
    @State private var billAmount: String = ""
    @State private var tipPercentage: String = ""
    
    var calculatedTip: Double {
        let bill = Double(billAmount) ?? 0
        let tip = Double(tipPercentage) ?? 0
        return bill * tip / 100
    }

    var totalAmount: Double {
        let bill = Double(billAmount) ?? 0
        return bill + calculatedTip
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("💸 QuickTip")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.accentColor)

            VStack(alignment: .leading, spacing: 12) {
                Text("Bill Amount")
                    .font(.headline)
                TextField("e.g. 75.50", text: $billAmount)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)

                Text("Tip Percentage")
                    .font(.headline)
                TextField("e.g. 15", text: $tipPercentage)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(.roundedBorder)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("Tip: $\(calculatedTip, specifier: "%.2f")")
                    .font(.title3)
                Text("Total: $\(totalAmount, specifier: "%.2f")")
                    .font(.title2)
                    .bold()
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
