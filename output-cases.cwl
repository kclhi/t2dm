#!/usr/bin/env cwl-runner

$namespaces:
  s: https://phekb.org/
arguments:
- -data
- /home/kclhi/.eclipse
- -reset
- -nosplash
- -nosave
- -application
- org.knime.product.KNIME_BATCH_APPLICATION
baseCommand: /home/kclhi/knime_4.1.1/knime
class: CommandLineTool
cwlVersion: v1.0
doc: Output cases
id: output-cases
inputs:
- doc: inputModule
  id: inputModule
  inputBinding:
    prefix: -workflowFile=
    separate: false
  type: File
- doc: potentialCases
  id: potentialCases
  inputBinding:
    prefix: -workflow.variable=dm_potential_cases,file://
    separate: false
    valueFrom: ' $(inputs.potentialCases.path),String'
  type: File
label: output-cases
outputs:
- doc: Output identified cases of this type of diabetes.
  id: output
  outputBinding:
    glob: '*.csv'
  type: File
requirements:
  DockerRequirement:
    dockerOutputDirectory: /home/kclhi/.eclipse
    dockerPull: kclhi/knime:amia
s:type: write
