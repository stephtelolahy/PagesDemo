import SwiftUI
import SafariServices

struct ContentView: View {
    @State private var isReturningFromWeb = false

    var body: some View {
        VStack {
            if isReturningFromWeb {
                Text("Subscription Completed!")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
            } else {
                Button("Subscribe Now") {
                    openSafari()
                }
            }
        }
        .onOpenURL { url in
            if url.absoluteString == "myapp://subscriptionComplete" {
                isReturningFromWeb = true
                dismissSafari()
            }
        }
    }

    func openSafari() {
        guard let url = URL(string: "https://stephtelolahy.github.io/PagesDemo/") else { return }
        let safariVC = SFSafariViewController(url: url)
        UIApplication.shared.windows.first?.rootViewController?.present(safariVC, animated: true)
    }

    func dismissSafari() {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
    }
}

#Preview {
    ContentView()
}
