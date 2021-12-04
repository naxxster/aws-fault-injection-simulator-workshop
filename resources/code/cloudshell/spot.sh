#!/bin/bash

echo "Setting variables from EC2 spot section"

# Query variables
STATE_MACHINE_ARN=$( aws stepfunctions list-state-machines --query "stateMachines[?contains(name,'SpotChaosStateMachine')].stateMachineArn" --output text )
EXPERIMENT_TEMPLATE_ID=$( aws fis list-experiment-templates --query "experimentTemplates[?tags.Name=='FisWorkshopSpotTerminate'].id" --output text )


echo $STATE_MACHINE_ARN
echo $EXPERIMENT_TEMPLATE_ID
