//
//  DateField.swift
//  UIComponents
//
//  Created by Oscar De Moya on 18/05/24.
//

import SwiftUI

public struct DateField: View {
    @State public var titleKey: LocalizedStringKey = ""
    @Binding public var date: Date
    var displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]
    @Binding public var isExpanded: Bool
    
    public init(_ titleKey: LocalizedStringKey,
                selection date: Binding<Date>,
                displayedComponents: DatePicker.Components = [.hourAndMinute, .date],
                isExpanded: Binding<Bool>) {
        self.titleKey = titleKey
        self._date = date
        self.displayedComponents = displayedComponents
        self._isExpanded = isExpanded
    }
    
    public var body: some View {
        BaseDateField(
            titleKey,
            selection: $date,
            displayedComponents: displayedComponents,
            isExpanded: $isExpanded
        )
    }
}

#Preview {
    @Previewable @State var date: Date = .now
    @Previewable @State var isExpanded: Bool = false
    DateField("Date", selection: $date, isExpanded: $isExpanded)
}
