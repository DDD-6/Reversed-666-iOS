//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by devming on 2021/09/23.
//
import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "Domain"
let organizationName = "com.666"
let bundleID = "\(organizationName).\(projectName)"

let targets = Project.staticFrameworkTargets(
    name: projectName,
    bundleID: bundleID,
    dependencies: [
        .project(target: "Network", path: "../Network")
    ]
)

let project = Project.staticFramework(
    name: projectName,
    organizationName: organizationName,
    targets: targets
)
