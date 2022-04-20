---
title: "선택 사항: Amazon DevOps Guru를 위한 설정"
chapter: false
weight: 60
services: true
---

{{% notice warning %}}
워크샵 마지막에 Amazon DevOps Guru (DevOps Guru) 섹션을 살펴보려는 경우에만 이 섹션을 완료하십시오. DevOps Guru를 탐색하려는 경우 DevOps Guru가 초기 자원을 검색하고 기준선을 잡을 수 있도록 충분한 시간을 제공하십시오. 선택한 계정/리전의 자원 수에 따라 2~24시간이 소요될 수 있습니다.
{{% /notice %}}

[**DevOps Guru 콘솔**](https://console.aws.amazon.com/devops-guru/home?#/home)을 선택하고 **"Get Started"** 버튼을 선택합니다.

{{< img "getting-started.kr.png" "DevOps Guru 콘솔" >}}

"Amazon DevOps Guru analysis coverage"에 대해서 이 워크샵의 일부로만 탐구하려는 경우는 **"Choose later"**를 선택하십시오. 그렇지 않으면 "Analyze all AWS resources in the current AWS account in this Region"을 선택할 수 있지만 시작하는 데 시간이 더 걸리고 비용이 더 많이 발생할 수 있습니다.

{{< img "coverage.kr.png" "적용 범위 선택">}}

이 워크샵에서는 Amazon Simple Notification Service (SNS) 알림을 살펴보지 않으므로 SNS 주제를 지정할 필요가 없습니다. 

**"Enable"** 을 선택합니다.

적용 범위를 "Choose later"로 설정하면 자원을 아직 선택하지 않았음을 알리는 정보 배너가 표시됩니다.

{{< img "no-resources-warning.kr.png" "자원 없음에 대한 경고 배너" >}}

배너에서 **"Manage analysis coverage"** 옵션을 선택하거나 [**DevOps Guru 콘솔**](https://console.aws.amazon.com/devops-guru/home?#/home)에서 **"Settings"** 을 선택하고 "DevOps Guru analysis coverage"에서 **"Manage"** 옵션을 선택합니다.

{{< img "manage-coverage.kr.png" "콘솔에서 적용 범위 관리하기" >}}

이름이 `Fis`로 시작하는 모든 스택을 선택합니다.

{{< img "select-stacks.en.png" "FIS 스택 선택하기" >}}

**"Save"** 를 선택합니다.
