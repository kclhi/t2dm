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
doc: An abnormal lab value is defined as one of three different exacerbations in blood sugar level.
id: abnormal-lab
inputs:
- doc: KNIME implementation unit
  id: inputModule
  inputBinding:
    prefix: -workflowFile=
    separate: false
  type: File
- doc: Potential cases of this type of diabetes.
  id: potentialCases
  inputBinding:
    prefix: -workflow.variable=dm_potential_cases,file://
    separate: false
    valueFrom: ' $(inputs.potentialCases.path),String'
  type: File
label: abnormal-lab
outputs:
- doc: Output of patients flagged as having an abnormal lab result.
  id: output
  outputBinding:
    glob: '*.csv'
  type: File
requirements:
  DockerRequirement:
    dockerOutputDirectory: /home/kclhi/.eclipse
    dockerPull: kclhi/knime:amia
s:type: logic
