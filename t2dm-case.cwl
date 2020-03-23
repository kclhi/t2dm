#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0
inputs:
  abnormalLab:
    doc: potential cases marked with abnormal lab
    id: abnormalLab
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
outputs:
  case-assignment:
    id: case-assignment
    outputBinding:
      glob: '*.csv'
    outputSource: 5/output
    type: File
steps:
  '1':
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: abnormalLab
    out:
    - output
    run: rx_t2dm_med-abnormal-lab.cwl
    # Python:
    # run: rx_t2dm_med-abnormal-lab-python.cwl
  '2':
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: 1/output
    out:
    - output
    run: dx_t2dm-abnormal-lab.cwl
  '3':
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: 2/output
    out:
    - output
    run: dx_t2dm-rx_t2dm_med.cwl
  '4':
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: 3/output
    out:
    - output
    run: dx_t2dm-rx_tdm_med-prec.cwl
  '5':
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: 4/output
    out:
    - output
    run: dx_t2dm-rx_t1dm_med-dx2.cwl
