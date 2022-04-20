---
title: "AWS 자원 생성하기"
chapter: false
weight: 50
servcies: true
---

{{% notice warning %}}
워크샵을 자신의 계정에서 실행하는 경우에만 이 섹션을 완료하십시오. AWS에서 주관하는 이벤트(예: re:Invent, Kubecon, Immersion Day 등)에 있는 경우 이 단계는 이미 실행되어 있습니다.
{{% /notice %}}

오류 삽입 실험을 실행하기 전에 클라우드에서 자원을 생성해야 합니다. 워크샵의 나머지 부분에서는 이 자원들을 사용합니다.

저장소 복제

```
cd ~/environment
git clone https://github.com/aws-samples/aws-fault-injection-simulator-workshop.git
```

자원 배포

```
cd aws-fault-injection-simulator-workshop
cd resources/templates
./deploy-parallel.sh
```

완료하는 데 최대 30분이 소요될 수 있습니다.  
