//
//  ContentView.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 29.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State var isToggle = false
    @State var inBalanceUp = false
    @State var showSendAlert = false
    @State var balance = 50000
    @State var balanceSecond = 0

    var body: some View {
        VStack {
            ZStack {
                backView
                Rectangle().fill(Color.init(red: 225/255, green: 233/255, blue: 222/255))
                    .offset(x: isToggle ? 176 : 0)
                mainView
            }

            Toggle(isOn: $isToggle, label: {
                Text("Показать мой кошелек")
            }).padding(13)
        }.animation(.spring(response: 0.3,
                            dampingFraction: 0.5,
                            blendDuration: 0.3))
    }

    var backView: some View {
        HStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("\(balance),00 ₽")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.black)
                    Text("MIR  **0001")
                    Divider()
                }
                VStack(alignment: .leading) {
                    Text("\(balanceSecond),00 ₽")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.black)
                    Text("MIR  **0002")
                    Divider()
                }
                Spacer()
            }
            Spacer()
        }
    }

    var mainView: some View {
        VStack {
            HStack {
                Text("Карта1")
                    .font(.title)
                    .bold()
                    .offset(x: isToggle ? 176 : 0)
                    .padding(EdgeInsets(top: 40, leading: 16, bottom: 0, trailing: 0))
                Spacer()
            }
            cardView
            buttonsView
            Spacer()
        }
    }

    var buttonsView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.white)
                .offset(x: isToggle ? 176 : 0)
                .frame(height: 88)
                .padding(14)
            HStack {

                upBalanceView
                Spacer().frame(width: 35)
                upBalanceCardView
                Spacer().frame(width: 50)
                openCardView
            }
            .offset(x: isToggle ? 176 : 0)

        }
        .frame(height: 88)

    }

    var upBalanceView: some View {
        VStack {
            Image("Up")
            Button(action: {
                self.balance = balance + 1000
                self.inBalanceUp = true
            }, label: {
                Text("Пополнить")
                    .frame(height: 40)
                    .foregroundColor(.black)
            }).actionSheet(isPresented: $inBalanceUp, content: {
                ActionSheet(title: Text("Пополнение"), buttons: [.default(Text("Баланс успешно пополнен"), action: {
                    print("Hello")
                })])

            })
        }
        .frame(height: 88)
    }

    let openCardView: some View = VStack {
        Image("OpenCard")
        Text("Открыть \n карту")
    }
        .frame(height: 88)

    var upBalanceCardView: some View {
        VStack {
            Image("Send")
            Button(action: {
                self.balance = balance - 1000
                self.showSendAlert = true
            }, label: {
                Text("Перевести")
                    .frame(height: 40)
                    .foregroundColor(.black)
            }).alert(isPresented: $showSendAlert) {
                Alert(title: Text("Перевод"),
                      message: Text("Перевести 1000 руб на карту 2?"),
                      primaryButton: .cancel(Text("ОК"), action: {
                    self.balanceSecond = balanceSecond + 1000
                    print(balanceSecond)
                }),
                      secondaryButton: .default(Text("Отмена"),
                                                action: {
                    print("Отмена")
                }))
            }

        }
        .frame(height: 88)
    }

    var cardView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.init(red: 70/255, green: 183/255, blue: 27/255, opacity: 0.7))
                .offset(x: isToggle ? 176 : 0)
                .frame(height: 200)
                .padding(14)
            VStack {
                Spacer()
                    .frame(height: 16)
                HStack {
                    Spacer()
                        .frame(width: 32)
                    Text("\(balance),00 ₽")
                        .font(.title2)
                        .foregroundColor(.white)
                        .offset(x: isToggle ? 176 : 0)
                    Spacer()
                }
                HStack {
                    Spacer()
                        .frame(width: 32)
                    Text("доступно")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .offset(x: isToggle ? 176 : 0)
                    Spacer()
                }
                Spacer()
            }
            .frame(height: 200)
        }
    }
}

#Preview {
    ContentView()
}
