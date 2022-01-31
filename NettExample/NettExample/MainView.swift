import UIKit
import Relative
import Nett

extension String {
    enum Account: String {
        case email = "bell.fill"
        case password = "key.fill"
    }
    init(_ account: Account) {
        self.init(account.rawValue)
    }
}

class MainView: UIView {
    
    var innerView = UIView()
    var scroll: UIScrollView { get {.init(in: self, &innerView) } }
    
    let stackContainer = UIStackView {
        $0.distribution = .fill
        $0.spacing = 25
        $0.axis = .vertical
    }
    
    let txtEmail = UITextField("Email ID")
    var stackEmail: UIStackView {
        .init(image: .init(systemName: .init(.email))!, mainView: txtEmail)
    }
    
    let txtPassword = UITextField("Password", isSecureText: true)
    var stackPassword: UIStackView {
        .init(image: .init(systemName: .init(.password))!,
              mainView: txtPassword,
              accessoryViewType: .password({ [weak self] in
            self?.txtPassword.isSecureTextEntry = $0
        }))
    }
    
    let stackNumber: UIStackView = {
        .init(image: .init(systemName: "swift")!,
              mainView: UITextField("Number"),
              accessoryViewType: .custom(.init {
            $0.backgroundColor = .systemPink
        }))
    }()
    
    let topView: UIView = {
        .init { view in
            view.backgroundColor = .systemGray.withAlphaComponent(0.4)
            view.height(300).isActive = true
            _ = UIImageView { image in
                image.image = .init(systemName: "airtag.fill")
                image.tintColor = .lightGray.withAlphaComponent(0.6)
                //  image.contentMode = .scaleAspectFit
                view.addSubview(image)
                image.layout(using: [
                    image.x(in: view),
                    image.y(in: view),
                    image.width(in: view, ratio: 1),
                    image.height(in: view, ratio: 1)
                ])
            }
        }
    }()
    
    let buttons = ["ferry.fill": UIColor.systemPink, "bolt.car.fill": UIColor.systemTeal, "cablecar.fill": UIColor.systemMint].map { image, color in
        UIButton {
            $0.setImage(.init(systemName: image), for: .normal)
            $0.tintColor = color
            $0.border(color: .lightGray.withAlphaComponent(0.5))
        }
    }
    
    init() {
        super.init(frame: CGRect())
        
        [txtEmail, txtPassword].enumerated().forEach {
            $1.tag = $0 + 1
        }
        scroll.keyboardDismissMode = .interactive
        
        backgroundColor = .white
        
        innerView.addSubview(stackContainer)
        stackContainer.layout(using: [
            stackContainer.x(in: innerView),
            stackContainer.width(in: innerView, ratio: 0.8),
            stackContainer.safeArea(.top, in: innerView, 32),
            stackContainer.bottom(in: innerView)
        ])
        
        stackContainer.addArrangedSubviews([
            topView,
            UILabel {
                $0.text = "Login"
                $0.font = .preferredFont(forTextStyle: .title1)
            },
            .separator(in: stackEmail),
            .spacer(),
            .separator(in: stackPassword),
            .border(on: stackNumber),
            UIStackView {
                $0.axis = .vertical
                $0.distribution = .fillProportionally
                $0.spacing = 0
                $0.addArrangedSubviews([
                    UIButton {
                        $0.setTitle("Forgot Password?", for: .normal)
                        $0.titleLabel?.font = .preferredFont(forTextStyle: .callout)
                        $0.contentHorizontalAlignment = .left
                        //  $0.layout(using: [$0.height(50)])
                        var config = UIButton.Configuration.plain()
                        config.buttonSize = .mini
                        $0.configuration = config
                        $0.addAction {
                            
                        }
                    },
                    UIButton {
                        $0.setTitle("Login", for: .normal)
                        $0.titleLabel?.font = .preferredFont(forTextStyle: .body)
                        $0.backgroundColor = .systemBlue
                        $0.layout(using: [$0.height(50)])
                        $0.layer.cornerRadius = 10
                        $0.addAction {
                            self.stackEmail.isHidden = true
                        }
                    }
                ])
            },
            UILabel {
                $0.text = "Or, Login with..."
                $0.font = .preferredFont(forTextStyle: .caption1)
                $0.textAlignment = .center
                $0.textColor = .lightGray
            },
            UIStackView {
                axis(.horizontal)
                Subview {
                    button 
                }
                $0.axis = .horizontal
                $0.distribution = .fillEqually
                $0.spacing = 6
                $0.addArrangedSubviews(buttons)
                $0.layout(using: [$0.height(50)])
            },
            UIButton {
                let attr = AttributedText(text: "New Here? Register", textHighlight: "Register")
                $0.setTitleColor(.gray, for: .normal)
                $0.setAttributedTitle(attr.change(color: UIColor.systemBlue).build(), for: .normal)
                $0.titleLabel?.font = .preferredFont(forTextStyle: .callout)
                $0.addAction {
                    
                }
            }
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
