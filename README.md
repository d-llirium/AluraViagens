
## [. alura viagens. parte da formação iOS da ALURA ](https://cursos.alura.com.br/formacao-ios)

### by d_llirium

#### view: Storyboard e XIB
  - StackView
  - Constraints
  - ScrollView
  - TableView
  - TableViewCell
  - TableViewHeader
 
 
#### view controller: 
  - UITableView, UITableViewDataSource
  - UITableViewCell
  - UINavigationController
  - protocols: Codable, decodable
  - delegate protocol
  
  
#### Actions:
  - ##### Bundle.main.url( // -> find FILE 
        forResource: filename,
        withExtension: nil
    ) 
  - ##### JSONSerialization // DATA -> JSON
            .jsonObject(
            with: data
            , options: []
    )
  -  ##### json[ "objetos" ] // JSON[ key ] -> DICTIONARY
                as? [ String: Any ]
  - ##### JSONSerialization.data( // JSON -> DATA
        withJSONObject: json, 
        options: []
    )
  - ##### JSONDecoder().decode( // DATA -> Object
        Objeto.self
        , from: jsonData
    )
  - ##### DispatchQueue.main.async // Schedules a block asynchronously
    {
      configuração secundária da view 
    }
  - ##### view.addGestureRecognizer( // view -> GestureRecognizer
      UIGestureRecognizer(
          target: self,
          action: #selector(
              didSelectView(_ : )
          )
      )
    )
   - ##### @objc func didSelectView(
        _ gesture: UIGestureRecognizer
    ) {
        if let selectedView = gesture.view // retorna a view que recebeu o gesto
        {
            let viagemSelecionada = viagens?[
                selectedView.tag // identifica a view pelo tag
            ]
            delegate?.didSelectView( // chamada pela ViewController quando seleciona a célula de oferta
                viagemSelecionada
            )
        }
     }
  - ##### tableView.register( // cellNibName -> CellView
      UINib(
        nibName: "ViagemTableViewCell",
        bundle: nil
      ),
      forCellReuseIdentifier: "ViagemTableViewCell"
    )
  - ##### tableView.dequeueReusableCell( // cellID -> CellObject
      withIdentifier: "ViagemTableViewCell"
    ) as? ViagemTableViewCell
  
  
#### DataTypes:
  -  UIImage( // objectName -> object
       named: object?.asset ?? ""
     )
  - Data( // conteúdo do arquivo -> DATA
      contentsOf: file
    ) 
  - Dictionaries
  - HomeTableViewHeader
