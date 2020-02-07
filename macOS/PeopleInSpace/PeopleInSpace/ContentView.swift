import SwiftUI
import MapKit
import common

struct ContentView: View {
    //private let names = ["Andrew Morgan", "Oleg Skripochka", "Jessica Meir"]
    //@State private var selection: Assignment
    @ObservedObject var peopleInSpaceViewModel = PeopleInSpaceViewModel(repository: PeopleInSpaceRepository())

    var body: some View {

        NavigationView {
            List(peopleInSpaceViewModel.people, id: \.name) { person in
                PersonView(person: person)
            }


//            List(selection: $selection) {
//                Section(header: Text("People In Space")) {
//                    ForEach(peopleInSpaceViewModel.people, id: \.name) { person in
//                        PersonView(person)
//                    }
//                }
//
//                Button("Update ISS position") {
//                    print("Button 1")
//                }
//
//            }
            .listStyle(SidebarListStyle())
            .onAppear(perform: {
                self.peopleInSpaceViewModel.fetch()
            })
            

            MapView(coordinate: CLLocationCoordinate2DMake(-24.7798, -139.8780))
        }
    }
}

//struct ContentView: View {
//    @ObservedObject var peopleInSpaceViewModel = PeopleInSpaceViewModel(repository: PeopleInSpaceRepository())
//
//    var body: some View {
//        NavigationView {
//            List(peopleInSpaceViewModel.people, id: \.name) { person in
//                PersonView(person: person)
//            }
//            .onAppear(perform: {
//                self.peopleInSpaceViewModel.fetch()
//            })
//        }
        
//        Text("Hello, World!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//}


struct DetailView: View {
    let text: String

    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PersonView : View {
    var person: Assignment
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(person.name).font(.headline)
                Text(person.craft).font(.subheadline)
            }
        }
    }
}

