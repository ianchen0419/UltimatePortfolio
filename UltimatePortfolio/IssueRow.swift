//
//  IssueRow.swift
//  UltimatePortfolio
//
//  Created by 陳怡安 on 2023/7/23.
//

import SwiftUI

struct IssueRow: View {
    @EnvironmentObject var dataController: DataController
    @ObservedObject var issue: Issue
    
    var body: some View {
        NavigationLink(value: issue) {
            HStack {
                Image(systemName: "exclamationmark.circle")
                    .imageScale(.large)
                    .opacity(issue.priority == 2 ? 1 : 0 )
                
                VStack(alignment: .leading) {
                    Text("issue.issueTitle")
                        .font(.headline)
                        .lineLimit(1)
                    
                    Text("No tags")
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(issue.issueCreationDate.formatted(date: .numeric, time: .omitted))
                        .font(.subheadline)
                    
                    if issue.completed {
                        Text("CLOSED")
                            .font(.body.smallCaps())
                    }
                }
                .foregroundStyle(.secondary)
            }
        }
    }
}

struct IssueRow_Previews: PreviewProvider {
    static var previews: some View {
        IssueRow(issue: .example)
    }
}
