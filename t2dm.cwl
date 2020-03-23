#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0
inputs:
  inputModule1:
    doc: KNIME implementation unit.
    id: inputModule1
    type: File
  inputModule2:
    doc: KNIME implementation unit.
    id: inputModule2
    type: File
  inputModule3:
    doc: KNIME implementation unit.
    id: inputModule3
    type: File
  inputModule4:
    doc: KNIME implementation unit.
    id: inputModule4
    type: File
  inputModule5:
    doc: KNIME implementation unit.
    id: inputModule5
    type: File
  inputModule6:
    doc: KNIME implementation unit.
    id: inputModule6
    type: File
  inputModule7:
    doc: KNIME implementation unit.
    id: inputModule7
    type: File
  inputModule8:
    doc: KNIME implementation unit.
    id: inputModule8
    type: File
  potentialCases:
    doc: potential cases file
    id: potentialCases
    type: File
outputs:
  dm_cases:
    id: dm_cases
    outputBinding:
      glob: '*.csv'
    outputSource: 4/output
    type: File
requirements:
  SubworkflowFeatureRequirement: {}
steps:
  '1':
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
    out:
    - output
    run: read-potential-cases.cwl
  '2':
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: 1/output
    out:
    - output
    run: abnormal-lab.cwl
  '3':
    in:
      abnormalLab:
        id: abnormalLab
        source: 2/output
      inputModule3:
        id: inputModule3
        source: inputModule3
      inputModule4:
        id: inputModule4
        source: inputModule4
      inputModule5:
        id: inputModule5
        source: inputModule5
      inputModule6:
        id: inputModule6
        source: inputModule6
      inputModule7:
        id: inputModule7
        source: inputModule7
    out:
    - case-assignment
    run: t2dm-case.cwl
  '4':
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: 3/case-assignment
    out:
    - output
    run: output-cases.cwl
