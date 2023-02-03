import UIKit

import RxSwift
import RxCocoa
import RxRelay
import RxFlow

import Then
import SnapKit

import Moya
import Alamofire
import Kingfisher

class BaseVC: UIViewController {
    let bound = UIScreen.main.bounds
    var disposeBag = DisposeBag()
    
    override func viewDidLayoutSubviews() { self.layout() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.bind()
        self.configure()
        self.attribute()
        self.view.setNeedsUpdateConstraints()
    }
    
    func configure() { }
    func bind() { }
    func layout() { }
    func attribute() { }
}


