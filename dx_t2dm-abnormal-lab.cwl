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
doc: A case is identified in the presence of an abnormal lab value (defined as one of three different exacerbations in blood sugar level) AND if a diagnosis of T2DM is identified.
id: dx_t2dm-abnormal-lab
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
label: case-assignment-2
outputs:
- doc: Output containing patients flagged as having this case of diabetes.
  id: output
  outputBinding:
    glob: '*.csv'
  type: File
requirements:
  DockerRequirement:
    dockerOutputDirectory: /home/kclhi/.eclipse
    dockerPull: kclhi/knime:amia
s:type: boolean-expression
