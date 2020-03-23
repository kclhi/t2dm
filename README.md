# T2DM

Type 2 Diabetes Mellitus phenotype as a structured phenotype definition, as produced by the Phenoflow architecture.

## Requirements

[Docker](https://docs.docker.com/install/) and [CWLTool](https://github.com/common-workflow-language/cwltool#install)

## Configuration

Specify input dataset path in 't2dm-inputs.yml', Line 6.

Defaults to a KNIME implementation unit implementation. For an example, alternate Python unit, update:

't2dm-inputs.yml', Lines 12 - 14.
't2dm-case.cwl', Lines 48 - 50.

## Usage

Run: `cwltool t2dm.cwl t2dm-inputs.yml`
