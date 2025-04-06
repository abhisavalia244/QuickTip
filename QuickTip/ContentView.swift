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
        VStack(alignment: .leading, spacing: 20) {
            Text("QuickTip")
                .font(.largeTitle)
                .bold()

            TextField("Enter bill amount", text: $billAmount)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            TextField("Enter tip %", text: $tipPercentage)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            Text("Tip: $\(calculatedTip, specifier: "%.2f")")
            Text("Total: $\(totalAmount, specifier: "%.2f")")

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
