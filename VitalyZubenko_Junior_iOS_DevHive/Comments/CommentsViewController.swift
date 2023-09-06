//
//  CommentsViewController.swift
//  VitalyZubenko_Junior_iOS_DevHive
//
//  Created by Vitaly Zubenko on 05.09.2023.
//

import UIKit

class CommentsViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: "commentCell")
        tableView.rowHeight = 100
        tableView.layer.backgroundColor = UIColor.green.cgColor
        tableView.tableFooterView = UIView(frame: .zero)
        return tableView
    }()
    
    var pressedPost: Int!
    
    var viewModel: CommentsViewModelProtocol! {
        didSet {
            viewModel.fetchComments(forPostId: pressedPost) {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = CommentsViewModel()
        setupNavigationBar()
        setConstraintsTableView()
        navigationItem.title = "Comments (\(viewModel.numberOfRows()))"
    }
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    private func setConstraintsTableView() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension CommentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel != nil {
            navigationItem.title = "Comments (\(viewModel.numberOfRows()))"
            return viewModel.numberOfRows()
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CommentsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
