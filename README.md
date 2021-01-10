SwiftUI_RefreshList
===============

<image src="Docs/screen.gif" width="40%">

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
    ListRefresh(action: AddData()){
        List {
            Foreach(Data){ number in
                Text("\(number)")
            }
        }
    }
    func AddData(){
        Data += [Data.count+1]
    }
}
```
