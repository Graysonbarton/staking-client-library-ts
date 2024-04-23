#!/bin/bash

buf generate --template protos/buf.gen.orchestration.yaml buf.cbhq.net/cloud/staking --path coinbase/staking/orchestration/v1 --include-imports --include-wkt
buf generate --template protos/buf.gen.rewards.yaml buf.cbhq.net/cloud/rewards-reporting-protos-rewards --path coinbase/staking/rewards/v1 --include-imports --include-wkt
# TODO: Remove this once the generation issue is fixed.
find ./src/gen -type f -exec sed -I '' -e 's/parentprotocols/parent/g' -e 's/parentprotocolsnetworks/parents/g' -e 's/parentnetworks/parent/g' -e 's/nameprojectsworkflows/name/g' -e 's/parentprojects/parent/g' {} \;
