#!/bin/bash

echo "Setting variables from ECS section"

# Query URL for convenience
ECS_URL=$( aws cloudformation describe-stacks --stack-name FisStackEcs --query "Stacks[*].Outputs[?OutputKey=='FisEcsUrl'].OutputValue" --output text )

echo $ECS_URL