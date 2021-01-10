SwiftUI_RefreshList
===============

### SwiftPM

```
https://github.com/clementlvx/SwiftUI_RefreshList.git
```

Usage
-----

```
import SwiftUI
import RefreshList

struct ContentView: View {
    
    @State var isShowing = false
    @State var Data:[Int] = [1,2,3]

    var body: some View {
        ListRefresh(action: { AddData() } ){
            List {
                ForEach(Data, id: \.self){ number in
                    Text("\(number)")
                }
            }
        }
    }
    func AddData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation{ Data += [Data.count+1] }
        }
    }
}
```
