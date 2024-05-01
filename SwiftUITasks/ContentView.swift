import SwiftUI

struct ContentView: View {
    @State private var showAlert1 = false
    @State private var showAlert2 = false
    @State private var showActionSheet1 = false
    @State private var showActionSheet2 = false

    @State private var label2 = "Пример Alert с 2 кнопками и логикой"

    var body: some View {
        VStack(spacing: 24) {
            Text("Alert & Action Sheet").bold().padding()
            
            HStack(spacing: 58) {

                Text("Пример Alert").frame(width: 170, height: 48, alignment: .leading)
                Button(action: {
                    self.showAlert1 = true
                }) {
                    Text("Показать")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)

                }
                .alert(isPresented: $showAlert1) {
                    Alert(title: Text("Алерт"), message: Text("Пример 1"), dismissButton: .default(Text("OK")))
                }
                
            }


            HStack(spacing: 58) {
                Text(label2)
                    .frame(width: 170, height: 48, alignment: .leading)
                Button(action: {
                    self.showAlert2 = true
                }) {
                    Text("Показать")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert2) {
                    Alert(title: Text("Алерт 2"),
                          message: Text("Привет"),
                          dismissButton: .default(Text("Изменить текст"),
                                                 action: {
                        self.label2 = "Алерт сработал"
                    }))
                }
            }



            HStack(spacing: 58) {
                Text("Пример ActionSheet")
                    .frame(width: 170, height: 48, alignment: .leading)
                Button(action: {
                    self.showActionSheet1 = true
                }, label: {
                    Text("Показать")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }).actionSheet(isPresented: $showActionSheet1, content: {
                    ActionSheet(title: Text("Hello"))
                })
            }

            HStack(spacing: 58) {
                Text("Пример ActionSheet кнопками и логикой")
                    .frame(width: 170, height: 48, alignment: .leading)
                Button(action: {
                    self.showActionSheet2 = true
                }, label: {
                    Text("Показать")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }).actionSheet(isPresented: $showActionSheet2, content: {
                    ActionSheet(title: Text("Hello"), buttons: [.default(Text("Вывести привет"), action: {
                        print("Hello")
                    })])
                })
            }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
