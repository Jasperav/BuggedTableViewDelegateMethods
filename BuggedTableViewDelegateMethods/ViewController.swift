import UIKit

open class GenericTableViewController<T: TableView>: UITableViewController {
    let genericTableView: T
    
    public init(genericTableView: T) {
        self.genericTableView = genericTableView
        
        super.init(style: .grouped)
        
        tableView = genericTableView
        genericTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        genericTableView.reloadData()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}

open class TableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    public init() {
        super.init(frame: .zero, style: .plain)
        
        delegate = self
        dataSource = self
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.backgroundColor = .green
        
        return cell
    }
}

class SubTableView: TableView {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Ignored...
        300
    }
}

class ViewController: GenericTableViewController<TableView> {
    init() {
        super.init(genericTableView: TableView())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
