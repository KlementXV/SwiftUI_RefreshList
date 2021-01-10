import SwiftUI
import Introspect
import ActionClosurable


public struct AutoListRefresh<Content: View>: View {
    let content: () -> Content
    let action: () -> Void
    
    public init(action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self.content = content
    }
    
    public var body : some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                    .introspectTableView { tableView in
                        tableView.refreshControl = UIRefreshControl { refreshControl in
                            self.action()
                        }
                    }
            }
        }
    }
}

public struct ListRefresh<Content: View>: View {
    @Binding var show: Bool
    let content: () -> Content
    let action: () -> Void
    
    public init(show: Binding<Bool>, action: @escaping () -> Void, @ViewBuilder content: @escaping () -> Content) {
        _show = show
        self.action = action
        self.content = content
    }
    
    public var body : some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                    .introspectTableView { tableView in
                        tableView.refreshControl = UIRefreshControl { refreshControl in
                            show = true
                            refreshControl.beginRefreshing()

                            self.action()
                            if show == false {
                                refreshControl.endRefreshing()
                            }
                        }
                    }
            }
        }
    }
}
