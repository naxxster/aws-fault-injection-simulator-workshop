#!/bin/bash

echo "Setting variables from EKS section"

# Query URL for convenience
EKS_URL=$( aws cloudformation describe-stacks --stack-name FisStackEks --query "Stacks[*].Outputs[?OutputKey=='FisEksUrl'].OutputValue" --output text )

# Retrieve the role ARN
KUBECTL_ROLE=$( aws cloudformation describe-stacks --stack-name FisStackEks --query "Stacks[*].Outputs[?OutputKey=='FisEksKubectlRole'].OutputValue" --output text )

echo $EKS_URL
echo $KUBECTL_ROLE
