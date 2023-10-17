import SwiftUI

struct ContentView: View {
    
    enum Field {
        case number1
        case number2
    }
    
    
    @State var number1 = 0
    @State var number2 = 0
    @FocusState private var focusedField: Field?
    var body: some View {
        VStack {
            HStack{
                TextField("Number 1", value: $number1, format: .number)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .font(.system(size: 50))
                    .focused($focusedField, equals: .number1)
                    .textContentType(.givenName)
                    .submitLabel(.next)
                    .keyboardType(.numberPad)
                Text("X")
                    .font(.system(size: 50))
                TextField("Number 2", value: $number2, format: .number)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 50))
                    .focused($focusedField, equals: .number2)
                    .textContentType(.givenName)
                    .submitLabel(.return)
                    .keyboardType(.numberPad)
            }
            .onSubmit {
                switch focusedField {
                case .number1:
                    focusedField = .number2
                default:
                    print("mutiplied")
                }
            }
            Text("\(number1 * number2)")
                .font(.system(size: 50))
            Spacer()
//                Button{
//                number1 = 0
//                number2 = 0
//            } label: {
//                Text("Clear")
//                    .foregroundColor(.red)
//                    .font(.system(size: 35))
//                    .background(clipShape(Capsule(), style: FillStyle()))
//                    .frame(width: 100, height: 100, alignment: .center)
//           }
        }
    }
}

