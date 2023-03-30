import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let imgColor: Color
}

struct MenuView: View {
    @EnvironmentObject var signInViewModel: AppViewModel
    
    @State private var searchText = ""
    @State private var showSearchBar = false
    
    struct Category: Identifiable {
        let id: String
        let title: String
        let image: String
    }
    
    let categories = [
        Item(title: "family", image: "figure.2.and.child.holdinghands",
             imgColor: .red),
        Item(title: "dancing", image:"figure.socialdance",
             imgColor: .yellow),
        Item(title: "friends", image: "figure.2.arms.open",
             imgColor: .orange),
        Item(title: "solo", image: "figure.arms.open",
             imgColor: .green),
        Item(title: "home", image: "house",
             imgColor: .blue),
        Item(title: "random", image: "house",
             imgColor: .purple),
    ]
    
    var filteredCategories: [Item] {
        if searchText.isEmpty {
            return categories
        } else {
            return categories.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    @StateObject var viewModel = ViewModel()
    @Binding var categoryType: String
    
    let spacing: CGFloat = 10
    @State private var numberOfCols = 1
    
    var body: some View {
        let cols = Array(
            repeating: GridItem(.flexible(), spacing: spacing), count: numberOfCols)
        
        NavigationView {
            ScrollView {
                headerView
                
                LazyVGrid(columns: cols, spacing: spacing) {
                    ForEach(filteredCategories) { item in
                        NavigationLink(destination: CardSwipingView(categoryType: item.title)) {
                            ItemView(item: item)
                                .environmentObject(viewModel)
                        }
                        .buttonStyle(ItemButtonStyle(cornerRadius: 20))
                    }
                }
                .padding(.horizontal)
                .offset(y: -50)
            }
            .background(Color.white)
            .ignoresSafeArea()
        }
    }
    
    var headerView: some View {

        VStack {
            
            
            // Search bar
            //HStack {
                Button {
                    signInViewModel.signOut()
                } label: {
                    Text("Sign Out")
                        .frame(width: 75, height: 30 )
                        .background(Color.white)
                        .foregroundColor(Color.red)
                        .cornerRadius(10)
                        .padding()
                    
                }
                HStack {
                    Spacer()
                    if showSearchBar {
                        SearchBar(text: $searchText)
                            .frame(height: 40)
                            .background(Color.white)
                            .cornerRadius(10)
                            .transition(.move(edge: .trailing))
                            .animation(.default)
                    } else {
                        Button(action: {
                            withAnimation {
                                showSearchBar.toggle()
                            }
                        }) {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                    }
                    if showSearchBar {
                        Button(action: {
                            withAnimation {
                                showSearchBar.toggle()
                            }
                            searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        .padding(.leading, 10)
                    }
                    Spacer().frame(width: 10)
                }
                
            //}
            .offset(y: -50)
            
            Image("")
                .resizable()
                .frame(width: 110, height: 110)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .onTapGesture {
                    numberOfCols = numberOfCols % 3 + 1
                }
        }
        .frame(height: 350)
        .frame(maxWidth: .infinity)
        .background(Color.purple)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(categoryType: .constant("friends"))
    }
}
