# UserDefaultsPreference

Extension the UserDefaults from Foundation.framework. 

## Setup
Setup your preferences with @objc dynamic setter and getter.

```swift
import Foundation
import UserDefaultsPreference

final class MainWindowPreferences: NSObject, Preferences {
    
    let defaults: UserDefaults
    
    static var shared: MainWindowPreferences = MainWindowPreferences()
    
    init(defaults: UserDefaults = UserDefaults(suiteName: "MainWindow-shared")!) {
        self.defaults = defaults
    }
    
}

extension MainWindowPreferences {

    @objc dynamic var navigatorSidebarExpand: Bool {
        get { return defaults[#function] ?? true }
        set { defaults[#function] = newValue }
    }

    …
    
}

```

## Usage 

```swift
// set Combine.framework style observer dispose bag as class property
private var observers = Set<NSKeyValueObservation>()

let defaults = UserDefaults(suiteName: document.id)!

// listen value change 
MainWindowPreferences(defaults: defaults).observe(\.navigatorSidebarExpand, options: [.initial, .new]) { [weak self] (preferences, _) in
    let value = preferences.navigatorSidebarExpand
    …
}
.store(in: &observers)

// update value
MainWindowPreferences(defaults: defaults).navigatorSidebarExpand.toggle()
```