#!/usr/bin/env cwl-runner

$namespaces:
  s: https://phekb.org/
baseCommand: python
class: CommandLineTool
cwlVersion: v1.0
doc: A case is identified in the presence of an abnormal lab value (defined as one of three different exacerbations in blood sugar level) AND if medication for this type of diabetes has been prescribed.
id: rx_t2dm_med-abnormal-lab-python
inputs:
- doc: Python implementation unit
  id: inputModule
  inputBinding:
    position: 1
  type: File
- doc: potentialCases
  id: potentialCases
  inputBinding:
    position: 2
  type: File
label: rx_t2dm_med-abnormal-lab-python
outputs:
- doc: Output containing patients flagged as having this case of diabetes
  id: output
  outputBinding:
    glob: '*.csv'
  type: File
requirements:
  DockerRequirement:
    dockerPull: python:latest
s:type: boolean-expression
