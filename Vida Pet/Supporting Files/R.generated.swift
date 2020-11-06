//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.segue` struct is generated, and contains static references to 2 view controllers.
  struct segue {
    /// This struct is generated for `MeusPetsDetalheViewController`, and contains static references to 1 segues.
    struct meusPetsDetalheViewController {
      /// Segue identifier `MeusPetsDetalhesToMeusPetsCadastro`.
      static let meusPetsDetalhesToMeusPetsCadastro: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, MeusPetsDetalheViewController, Vida_Pet.MeusPetsCadastroViewController> = Rswift.StoryboardSegueIdentifier(identifier: "MeusPetsDetalhesToMeusPetsCadastro")

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `MeusPetsDetalhesToMeusPetsCadastro`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func meusPetsDetalhesToMeusPetsCadastro(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, MeusPetsDetalheViewController, Vida_Pet.MeusPetsCadastroViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.meusPetsDetalheViewController.meusPetsDetalhesToMeusPetsCadastro, segue: segue)
      }
      #endif

      fileprivate init() {}
    }

    /// This struct is generated for `MeusPetsListaViewController`, and contains static references to 2 segues.
    struct meusPetsListaViewController {
      /// Segue identifier `MeusPetsListaToMeusPetsCadastro`.
      static let meusPetsListaToMeusPetsCadastro: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, MeusPetsListaViewController, Vida_Pet.MeusPetsCadastroViewController> = Rswift.StoryboardSegueIdentifier(identifier: "MeusPetsListaToMeusPetsCadastro")
      /// Segue identifier `MeusPetsListaToMeusPetsDetalhes`.
      static let meusPetsListaToMeusPetsDetalhes: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, MeusPetsListaViewController, MeusPetsDetalheViewController> = Rswift.StoryboardSegueIdentifier(identifier: "MeusPetsListaToMeusPetsDetalhes")

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `MeusPetsListaToMeusPetsCadastro`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func meusPetsListaToMeusPetsCadastro(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, MeusPetsListaViewController, Vida_Pet.MeusPetsCadastroViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.meusPetsListaViewController.meusPetsListaToMeusPetsCadastro, segue: segue)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `MeusPetsListaToMeusPetsDetalhes`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func meusPetsListaToMeusPetsDetalhes(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, MeusPetsListaViewController, MeusPetsDetalheViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.meusPetsListaViewController.meusPetsListaToMeusPetsDetalhes, segue: segue)
      }
      #endif

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 7 storyboards.
  struct storyboard {
    /// Storyboard `Adote`.
    static let adote = _R.storyboard.adote()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Login`.
    static let login = _R.storyboard.login()
    /// Storyboard `MeusPets`.
    static let meusPets = _R.storyboard.meusPets()
    /// Storyboard `Navigation`.
    static let navigation = _R.storyboard.navigation()
    /// Storyboard `Perfil`.
    static let perfil = _R.storyboard.perfil()
    /// Storyboard `RecemChegados`.
    static let recemChegados = _R.storyboard.recemChegados()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Adote", bundle: ...)`
    static func adote(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.adote)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Login", bundle: ...)`
    static func login(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.login)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "MeusPets", bundle: ...)`
    static func meusPets(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.meusPets)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Navigation", bundle: ...)`
    static func navigation(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.navigation)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Perfil", bundle: ...)`
    static func perfil(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.perfil)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "RecemChegados", bundle: ...)`
    static func recemChegados(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.recemChegados)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 6 colors.
  struct color {
    /// Color `Vida Pet: Blue`.
    static let vidaPetBlue = Rswift.ColorResource(bundle: R.hostingBundle, name: "Vida Pet: Blue")
    /// Color `Vida Pet: Dark Blue`.
    static let vidaPetDarkBlue = Rswift.ColorResource(bundle: R.hostingBundle, name: "Vida Pet: Dark Blue")
    /// Color `Vida Pet: Gray`.
    static let vidaPetGray = Rswift.ColorResource(bundle: R.hostingBundle, name: "Vida Pet: Gray")
    /// Color `Vida Pet: Red`.
    static let vidaPetRed = Rswift.ColorResource(bundle: R.hostingBundle, name: "Vida Pet: Red")
    /// Color `Vida Pet: White`.
    static let vidaPetWhite = Rswift.ColorResource(bundle: R.hostingBundle, name: "Vida Pet: White")
    /// Color `Vida Pet: Yellow`.
    static let vidaPetYellow = Rswift.ColorResource(bundle: R.hostingBundle, name: "Vida Pet: Yellow")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Vida Pet: Blue", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func vidaPetBlue(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.vidaPetBlue, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Vida Pet: Dark Blue", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func vidaPetDarkBlue(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.vidaPetDarkBlue, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Vida Pet: Gray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func vidaPetGray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.vidaPetGray, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Vida Pet: Red", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func vidaPetRed(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.vidaPetRed, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Vida Pet: White", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func vidaPetWhite(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.vidaPetWhite, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "Vida Pet: Yellow", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func vidaPetYellow(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.vidaPetYellow, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 4 images.
  struct image {
    /// Image `claw_icon`.
    static let claw_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "claw_icon")
    /// Image `pet1`.
    static let pet1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "pet1")
    /// Image `pet2`.
    static let pet2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "pet2")
    /// Image `pet3`.
    static let pet3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "pet3")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "claw_icon", bundle: ..., traitCollection: ...)`
    static func claw_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.claw_icon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pet1", bundle: ..., traitCollection: ...)`
    static func pet1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pet1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pet2", bundle: ..., traitCollection: ...)`
    static func pet2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pet2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pet3", bundle: ..., traitCollection: ...)`
    static func pet3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pet3, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Login"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 3 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `cell_cirurgias`.
    static let cell_cirurgias: Rswift.ReuseIdentifier<UIKit.UITableViewCell> = Rswift.ReuseIdentifier(identifier: "cell_cirurgias")
    /// Reuse identifier `cell_vacinas`.
    static let cell_vacinas: Rswift.ReuseIdentifier<UIKit.UITableViewCell> = Rswift.ReuseIdentifier(identifier: "cell_vacinas")
    /// Reuse identifier `cell`.
    static let cell: Rswift.ReuseIdentifier<MeusPetsListaCellTableViewCell> = Rswift.ReuseIdentifier(identifier: "cell")

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.meusPetsCadastro` struct is generated, and contains static references to 15 localization keys.
    struct meusPetsCadastro {
      /// Value: Adicionar
      static let nova_adicionar = Rswift.StringResource(key: "nova_adicionar", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Adicionar Imagem
      static let image_selector_nova_imagem = Rswift.StringResource(key: "image_selector_nova_imagem", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Cancelar
      static let image_selector_cancelar = Rswift.StringResource(key: "image_selector_cancelar", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Cancelar
      static let nova_cancelar = Rswift.StringResource(key: "nova_cancelar", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Cirurgia
      static let nova_cirurgia_placeholder = Rswift.StringResource(key: "nova_cirurgia_placeholder", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Data
      static let nova_data = Rswift.StringResource(key: "nova_data", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Digite uma data válida
      static let error_wrong_date = Rswift.StringResource(key: "error_wrong_date", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Escolher da Galeria
      static let image_selector_galeria = Rswift.StringResource(key: "image_selector_galeria", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Nova Cirurgia
      static let nova_cirurgia_titulo = Rswift.StringResource(key: "nova_cirurgia_titulo", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Nova Vacina
      static let nova_vacina_titulo = Rswift.StringResource(key: "nova_vacina_titulo", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Preencha as informações abaixo
      static let nova_cirurgia_mensagem = Rswift.StringResource(key: "nova_cirurgia_mensagem", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Preencha as informações abaixo
      static let nova_vacina_mensagem = Rswift.StringResource(key: "nova_vacina_mensagem", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Tirar Foto
      static let image_selector_camera = Rswift.StringResource(key: "image_selector_camera", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Vacina
      static let nova_vacina_placeholder = Rswift.StringResource(key: "nova_vacina_placeholder", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: dd/MM/yyyy
      static let default_date_formater = Rswift.StringResource(key: "default_date_formater", tableName: "MeusPetsCadastro", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Adicionar
      static func nova_adicionar(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("nova_adicionar", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "nova_adicionar"
        }

        return NSLocalizedString("nova_adicionar", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Adicionar Imagem
      static func image_selector_nova_imagem(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("image_selector_nova_imagem", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "image_selector_nova_imagem"
        }

        return NSLocalizedString("image_selector_nova_imagem", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Cancelar
      static func image_selector_cancelar(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("image_selector_cancelar", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "image_selector_cancelar"
        }

        return NSLocalizedString("image_selector_cancelar", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Cancelar
      static func nova_cancelar(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("nova_cancelar", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "nova_cancelar"
        }

        return NSLocalizedString("nova_cancelar", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Cirurgia
      static func nova_cirurgia_placeholder(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("nova_cirurgia_placeholder", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "nova_cirurgia_placeholder"
        }

        return NSLocalizedString("nova_cirurgia_placeholder", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Data
      static func nova_data(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("nova_data", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "nova_data"
        }

        return NSLocalizedString("nova_data", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Digite uma data válida
      static func error_wrong_date(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error_wrong_date", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "error_wrong_date"
        }

        return NSLocalizedString("error_wrong_date", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Escolher da Galeria
      static func image_selector_galeria(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("image_selector_galeria", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "image_selector_galeria"
        }

        return NSLocalizedString("image_selector_galeria", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Nova Cirurgia
      static func nova_cirurgia_titulo(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("nova_cirurgia_titulo", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "nova_cirurgia_titulo"
        }

        return NSLocalizedString("nova_cirurgia_titulo", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Nova Vacina
      static func nova_vacina_titulo(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("nova_vacina_titulo", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "nova_vacina_titulo"
        }

        return NSLocalizedString("nova_vacina_titulo", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Preencha as informações abaixo
      static func nova_cirurgia_mensagem(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("nova_cirurgia_mensagem", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "nova_cirurgia_mensagem"
        }

        return NSLocalizedString("nova_cirurgia_mensagem", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Preencha as informações abaixo
      static func nova_vacina_mensagem(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("nova_vacina_mensagem", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "nova_vacina_mensagem"
        }

        return NSLocalizedString("nova_vacina_mensagem", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Tirar Foto
      static func image_selector_camera(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("image_selector_camera", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "image_selector_camera"
        }

        return NSLocalizedString("image_selector_camera", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: Vacina
      static func nova_vacina_placeholder(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("nova_vacina_placeholder", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "nova_vacina_placeholder"
        }

        return NSLocalizedString("nova_vacina_placeholder", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      /// Value: dd/MM/yyyy
      static func default_date_formater(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("default_date_formater", tableName: "MeusPetsCadastro", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "MeusPetsCadastro", preferredLanguages: preferredLanguages) else {
          return "default_date_formater"
        }

        return NSLocalizedString("default_date_formater", tableName: "MeusPetsCadastro", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try adote.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try login.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try meusPets.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try navigation.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try perfil.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try recemChegados.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct adote: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = AdoteListaViewController

      let bundle = R.hostingBundle
      let name = "Adote"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct login: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = LoginViewController

      let bundle = R.hostingBundle
      let name = "Login"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "Vida Pet: Blue", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Vida Pet: Blue' is used in storyboard 'Login', but couldn't be loaded.") }
          if UIKit.UIColor(named: "Vida Pet: White", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Vida Pet: White' is used in storyboard 'Login', but couldn't be loaded.") }
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct meusPets: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = MeusPetsListaViewController

      let bundle = R.hostingBundle
      let name = "MeusPets"

      static func validate() throws {
        if UIKit.UIImage(named: "claw_icon", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'claw_icon' is used in storyboard 'MeusPets', but couldn't be loaded.") }
        if UIKit.UIImage(named: "pet3", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'pet3' is used in storyboard 'MeusPets', but couldn't be loaded.") }
        if UIKit.UIImage(named: "plus", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'plus' is used in storyboard 'MeusPets', but couldn't be loaded.") }
        if UIKit.UIImage(named: "plus.viewfinder", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'plus.viewfinder' is used in storyboard 'MeusPets', but couldn't be loaded.") }
        if UIKit.UIImage(named: "square.and.pencil", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'square.and.pencil' is used in storyboard 'MeusPets', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "Vida Pet: Blue", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Vida Pet: Blue' is used in storyboard 'MeusPets', but couldn't be loaded.") }
          if UIKit.UIColor(named: "Vida Pet: Dark Blue", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Vida Pet: Dark Blue' is used in storyboard 'MeusPets', but couldn't be loaded.") }
          if UIKit.UIColor(named: "Vida Pet: White", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Vida Pet: White' is used in storyboard 'MeusPets', but couldn't be loaded.") }
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct navigation: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UITabBarController

      let bundle = R.hostingBundle
      let name = "Navigation"

      static func validate() throws {
        if UIKit.UIImage(named: "chart.pie", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'chart.pie' is used in storyboard 'Navigation', but couldn't be loaded.") }
        if UIKit.UIImage(named: "doc", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'doc' is used in storyboard 'Navigation', but couldn't be loaded.") }
        if UIKit.UIImage(named: "person", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'person' is used in storyboard 'Navigation', but couldn't be loaded.") }
        if UIKit.UIImage(named: "plus", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'plus' is used in storyboard 'Navigation', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "Vida Pet: Dark Blue", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Vida Pet: Dark Blue' is used in storyboard 'Navigation', but couldn't be loaded.") }
          if UIKit.UIColor(named: "Vida Pet: White", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'Vida Pet: White' is used in storyboard 'Navigation', but couldn't be loaded.") }
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct perfil: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = PerfilViewController

      let bundle = R.hostingBundle
      let name = "Perfil"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct recemChegados: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = RecemChegadosListaViewController

      let bundle = R.hostingBundle
      let name = "RecemChegados"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
