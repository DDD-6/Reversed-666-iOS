//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by devming on 2021/09/23.
//
import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "Repository"
let organizationName = "com.666"
let bundleID = "\(organizationName).\(projectName)"

let targets = Project.staticFrameworkTargets(
    name: projectName,
    bundleID: bundleID,
    dependencies: [
        .external(name: "Moya"),
        .external(name: "CombineMoya")
    ]
)

let project = Project.staticFramework(
    name: projectName,
    organizationName: organizationName,
    targets: targets
)
