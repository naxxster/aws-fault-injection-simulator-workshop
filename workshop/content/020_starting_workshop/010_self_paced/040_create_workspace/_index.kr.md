---
title: "워크스페이스 만들기"
chapter: false
weight: 40
services: true
---

{{% notice info %}}
AWS Cloud9 (Cloud9) 이 지원하는 브라우저 목록은 [여기](https://docs.aws.amazon.com/cloud9/latest/user-guide/browsers.html)에서 확인할 수 있습니다.
{{% /notice %}}

{{% notice tip %}}
Cloud9 도메인에 대해 광고 차단기, 자바스크립트 비활성화기 및 추적 차단기는 비활성화되어 있어야 합니다. 그렇지 않으면 워크스페이스 연결이 영향을 받을 수 있습니다. Cloud9에는 타사 쿠키가 필요합니다. [**이 지침**](https://docs.aws.amazon.com/cloud9/latest/user-guide/troubleshooting.html#troubleshooting-env-loading)에 따라 특정 도메인을 화이트리스트에 추가할 수 있습니다.
{{% /notice %}}

### 선택한 리전에서 Cloud9 시작

[**리전 선택**]({{< ref "030_region_selection" >}})에서 선택한 리전을 사용하여 [**Cloud9 콘솔**](https://console.aws.amazon.com/cloud9)로 이동합니다.

- **Create environment** 선택
- 이름을 `fisworkshop`으로 지정하고 **Next step**을 선택합니다.
- 웹 브라우저를 통해서만 Cloud9 환경에 접근하면 되므로 Environment type 아래에서 **Create a new no-ingress EC2 instance for environment (access via Systems Manager)** 를 선택하십시오.
- Instance type으로 `t3.small`을 선택하고 나머지는 마법사의 기본값들을 사용합니다. 마지막으로 **Create environment**을 선택합니다.

환경이 올라오면 다음과 같이 환경을 수정합니다.

- **Welcome** 탭 닫기
{{< img "images/020_starting_workshop/cloud9-1.png" "Welcome 탭 닫기" >}}
- 메인 작업 영역에서 새로운 **Terminal** 탭 열기
{{< img "images/020_starting_workshop/cloud9-2.png" "새 터미널 탭 열기" >}}
- 하단 작업 영역 닫기
{{< img "images/020_starting_workshop/cloud9-3.png" "하단 작업 영역 닫기" >}}

이제 워크스페이는 다음과 같아야 합니다.
{{< img "images/020_starting_workshop/cloud9-4.png" "Cloud9 워크스페이스" >}}

### Cloud9 인스턴스에서 디스크 크기 늘리기

{{% notice info %}}
이 워크샵의 일부 명령은 Cloud9 워크스페이스의 기본 디스크 할당량보다 더 많은 양을 요구합니다. 다음 명령은 Cloud9이 실행되는 Amazon EC2 (EC2) 인스턴스의 루트 볼륨에 디스크 공간을 더 추가합니다. 
{{% /notice %}}

Cloud9 터미널에 다음 코드를 복사/붙여 넣습니다 (전체 블록을 한 번에 붙여 넣을 수 있습니다). 
명령이 완료되면 인스턴스가 재부팅되고 IDE (통합 개발 환경) 가 다시 온라인 상태가 되기까지 1~2분 정도 걸릴 수 있습니다.

```bash
# Ensure we have newest boto3 installed
pip3 install --user --upgrade boto3

# Identify instance ID of the Cloud9 environment
export instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Use API to identify attached volume and increase size
python -c "import boto3
import os
from botocore.exceptions import ClientError 
ec2 = boto3.client('ec2')
volume_info = ec2.describe_volumes(
    Filters=[
        {
            'Name': 'attachment.instance-id',
            'Values': [
                os.getenv('instance_id')
            ]
        }
    ]
)
volume_id = volume_info['Volumes'][0]['VolumeId']
try:
    resize = ec2.modify_volume(    
            VolumeId=volume_id,    
            Size=30
    )
    print(resize)
except ClientError as e:
    if e.response['Error']['Code'] == 'InvalidParameterValue':
        print('ERROR MESSAGE: {}'.format(e))"

# Reboot - on restart the cloud-init will adjust FS size
if [ $? -eq 0 ]; then
    sudo reboot
fi
```

### 도구 및 종속성 업데이트

{{% notice info %}}
이 워크샵의 지침에서는 Linux와 유사한 환경에서 bash 셸을 사용한다고 가정합니다. 또한 여러 도구를 사용합니다.다음 지침에 따라 AWS Cloud9 워크스페이스에 필요한 도구를 설치합니다.
{{% /notice %}}

Cloud9 터미널에 다음 코드를 복사/붙여 넣습니다 (전체 블록을 한 번에 붙여 넣을 수 있습니다).

```bash
# Update to the latest stable release of npm and nodejs.
nvm install stable 

# Install typescript
npm install -g typescript

# Install CDK
npm install -g aws-cdk

# Install the jq tool
sudo yum install jq -y
```
