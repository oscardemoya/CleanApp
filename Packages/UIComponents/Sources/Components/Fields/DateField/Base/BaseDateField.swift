//
//  BaseDateField.swift
//  UIComponents
//
//  Created by Oscar De Moya on 29/05/24.
//

import SwiftUI

public struct BaseDateField: View {
    @Environment(\.dateFieldStyle) var style
    @State var titleKey: LocalizedStringKey = ""
    @Binding var date: Date
    @Binding var optionalDate: Date?
    var displayedComponents: DatePicker<Label>.Components = [.hourAndMinute, .date]
    @Binding public var isExpanded: Bool
    @State private var internalDate: Date = .now
    @State private var isOptional: Bool

    public init(_ titleKey: LocalizedStringKey,
                selection date: Binding<Date>,
                displayedComponents: DatePicker.Components = [.hourAndMinute, .date],
                isExpanded: Binding<Bool>) {
        self.titleKey = titleKey
        self._date = date
        self._optionalDate = .constant(nil)
        self.displayedComponents = displayedComponents
        self._isExpanded = isExpanded
        self.isOptional = false
    }
    
    public init(_ titleKey: LocalizedStringKey,
                selection date: Binding<Date?>,
                displayedComponents: DatePicker.Components = [.hourAndMinute, .date],
                isExpanded: Binding<Bool>) {
        self.titleKey = titleKey
        self._date = .constant(.now)
        self._optionalDate = date
        self.displayedComponents = displayedComponents
        self._isExpanded = isExpanded
        self.isOptional = true
    }
    
    public var body: some View {
        style.makeBody(
            configuration: DateFieldStyleConfiguration(
                label: AnyView(label),
                datePicker: AnyView(datePicker),
                isExpanded: $isExpanded
            )
        )
    }
    
    @ViewBuilder
    var label: some View {
        HStack {
            labelText
            trailingView
        }
        .contentShape(.rect)
        .onTapGesture {
            if isOptional {
                internalDate = optionalDate ?? .now
            } else {
                internalDate = date
            }
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
    
    @ViewBuilder
    var labelText: some View {
        HStack {
            if let displayDate = (isOptional ? optionalDate : date) {
                if displayedComponents.contains(.date) {
                    Text(displayDate, style: .date)
                }
                if displayedComponents.contains(.hourAndMinute) {
                    Text(displayDate, style: .time)
                }
            } else {
                Text(titleKey)
                    .foregroundColor(.universalPlaceholderText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
        }
        .padding(.small)
    }
    
    @ViewBuilder
    var trailingView: some View {
        if isOptional {
            if optionalDate != nil {
                CircularCloseButton {
                    self.optionalDate = nil
                    withAnimation {
                        isExpanded = false
                    }
                }
            }
        } else {
            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                .foregroundStyle(.nonDecorativeElement)
                .padding(.small)
        }
    }
    
    @ViewBuilder
    var datePicker: some View {
        if isExpanded {
            VStack(spacing: 0) {
                Divider().overlay(.decorativeElement)
                DatePicker(titleKey, selection: $internalDate, displayedComponents: displayedComponents)
                    .datePickerStyle(.graphical)
                    .onChange(of: internalDate) { _, _ in
                        if isOptional {
                            optionalDate = internalDate
                        } else {
                            date = internalDate
                        }
                    }
            }
        }
    }
}

#Preview {
    @Previewable @State var date: Date = .now
    @Previewable @State var isExpanded1: Bool = false
    @Previewable @State var isExpanded2: Bool = false
    @Previewable @State var isExpanded3: Bool = false
    ScrollView {
        VStack {
            BaseDateField("Date", selection: $date, isExpanded: $isExpanded1)
                .dateFieldStyle(.primary)
            BaseDateField("Date", selection: $date, isExpanded: $isExpanded2)
                .dateFieldStyle(.secondary)
        }
    }
    .scrollBounceBehavior(.basedOnSize)
}
