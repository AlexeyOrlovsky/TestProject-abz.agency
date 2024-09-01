//
//  ForEachWithIndex.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 26.08.2024.
//

import SwiftUI

struct ForEachWithIndex<
    Data: RandomAccessCollection,
    Content: View
>: View where Data.Element: Hashable, Data.Index == Array.Index {
    // MARK: - Private Properties
    private let data: Data
    @ViewBuilder private let content: (Data.Index, Data.Element) -> Content

    // MARK: - Init
    init(
        data: Data,
        content: @escaping (Data.Index, Data.Element) -> Content
    ) {
        self.data = data
        self.content = content
    }

    init(
        _ data: Data,
        content: @escaping (Data.Index, Data.Element) -> Content
    ) {
        self.init(data: data, content: content)
    }

    // MARK: - Body
    var body: some View {
        ForEach(Array(data.enumerated()), id: \.1) { index, element in
            content(index, element)
        }
    }
}
