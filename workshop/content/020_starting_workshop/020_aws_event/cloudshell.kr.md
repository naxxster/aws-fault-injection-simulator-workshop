---
title: "AWS CloudShell 구성"
chapter: false
weight: 20
services: true
---

데스크톱에서 이 워크샵을 진행할 수도 있지만, 이 워크샵의 지침에서는 AWS CloudShell (AWS 이벤트에서 진행 시) 또는 AWS Cloud9 (자신의 계정에서 진행 시)을 사용하고 있다고 가정합니다. 

CloudShell을 열려면 [AWS 콘솔](https://console.aws.amazon.com/console/home)로 이동하여 "CloudShell"을 검색하거나 메뉴 모음에서 CloudShell 아이콘을 클릭합니다.

{{< img "start-cloudshell.png" "CloudShell 시작하기" >}}

CloudShell 터미널이 열리면 GitHub 저장소를 내려받아야 합니다. 다음 내용을 CloudShell에 붙여넣습니다.

```bash
mkdir -p ~/environment
cd ~/environment
git clone https://github.com/aws-samples/aws-fault-injection-simulator-workshop.git
```

CloudShell을 처음 사용하는 경우 여러 줄 붙여넣기를 확인하는 대화 상자가 나타날 수 있습니다.

{{< img "cloudshell-safe-paste.png" "CloudShell 여러 줄 붙여넣기 확인하기" >}}

원하는 바에 따라 "Ask before pasting multiline code" 체크상자를 헤제합니다. 그런 다음 "Paste"를 선택합니다.

다음과 같은 git 복제 작업에 보일 것입니다.

{{< img "clone-git-repo.png" "GitHub 복제" >}}

### 도구 및 종속성 업데이트

{{% notice info %}}
이 워크샵의 지침에서는 Linux와 유사한 환경에서 bash 셸을 사용한다고 가정합니다. 또한 여러 도구를 사용합니다.다음 지침에 따라 CloudShell에 필요한 도구를 설치합니다.
{{% /notice %}}

CloudShell 터미널에서 다음 코드를 복사/붙여 넣습니다 (전체 블록을 한 번에 붙여 넣을 수 있습니다).

```bash
# Update to the latest stable release of npm and nodejs.
sudo npm install -g stable 

# Install typescript
sudo npm install -g typescript

# Install CDK
sudo npm install -g aws-cdk

# Install the jq tool
sudo yum install jq -y

```
