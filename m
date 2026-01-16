Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED3C325730
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555979; cv=none; b=q9wwXGNoXT7ZSy1SwZJV8eiHlU/ZC4XXfknGhfz0yUPkhfv6xYJMg4m+7vxXw2glKXffWvQ4Sp/21DJbJcPnMoiRaljLn7kZIckUgi5Q1vjlzYQ1Rec+fR7+rpX/LwVlw/8CDC+gorA0NZMhpf3/0VigiCGU4Xgxa4I8YAe5Ljc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555979; c=relaxed/simple;
	bh=4DK30zwrdkHkSbuIWBaRqIzhR+GfaeYi+4giTk1kn0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wjx1xV3z/E1XO5bupTY3mSGzz/vX5XYJO/hhMrDQbXZAAOpt5x8jW2RwE9XzrgfoE4gWZYo4O/Gqwnh3na3eqxxkWOSx2zbtcEjhHZmw3t+u8HH1cm07QdVETJ506Tpz79HvcvfF5hYTAvrRRMBLRj34o5ZliOLklJZF0K24JhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhMJDEgo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bd+dTZUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhMJDEgo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bd+dTZUC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8IZCP3892789
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=; b=fhMJDEgoNHMyq9oY
	W1rEXEsbFons1+UH1kZ8oyHfbxIXEFV8DzBubq16FLbeytjOV0b4HEbJx/8FHnTz
	6qP7a5TjXaZ4xm2uM0r/vet2FDVznVQ9AuoiBGcg9fz209FYZdZJ4oa3/1MbB8WG
	RjmnoLRCVd31ih0Ya9CABi2vjndlzCQQElmOaCoMoFXjFbDFNh8QvYTm18b6/VnL
	oXstbRDXUrcFKswPQ+p06yVWFkgm8/3yUQEJJsuefT0PKUGjZiFXEB00xxs3N1Z5
	EjXz7i8Mjk5Oe2eKE0j+6IXH9G4muJW1Cp9L14VNmf7dzaU+x+VKJfX25B6+9NOq
	haA5Wg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b09m1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:32:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a0ec2496so318828785a.1
        for <imx@lists.linux.dev>; Fri, 16 Jan 2026 01:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768555976; x=1769160776; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=;
        b=bd+dTZUCQ4RJi4s9Vwwp08LxiCD7DeQi6R5zAOwA2ZzP/o2NzDz5V/VgmnQCpTFoEe
         efDOYR/vD/3g93Za2f/UDqBHAidqUkoNRMIgZQXKahPqA/yBTN8vdP150fB4Db4+L+qj
         YJI7pXowMad1N5qZd1E21RYz2X+nrH8axlNmtplLshBHMhOLmQ+1av6t/B5yj1x3ldK3
         HQJBViTHgXyLH8lM5D603Rw8O661Hzv1n0PBEqfCZSN5D+zyAiVjpJutVWGVD0pwoD4B
         rqsStldXkj/ORoGUCKgO9GSb8Bq5ftKl4/Jk2nblCnOdiTi8PZha9SBC09iSq601dRQM
         626Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555976; x=1769160776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzV/ocZOiQZRoHc+CgIt6IXIRkQY6672hlSeIuwn+AM=;
        b=WEcenYGfDvb6PhrHaa5qYx1Bk292IECKj3x4I2jXEsPMtqR7e19yiimcMdyeUD7Fhm
         XQQcEQmfthLZljPo6Vera0uRFBzVKv7JMpltMTb/LVfnCpU3bSi40G32g2wqxMPzT1jv
         h4QRR00WOui5n7BuxbbQWFsTu87W7uJsuHoR5Eswv47WM2ZNZiI1ol/1mmReQOeyh2UE
         c/VcnbHgw0Ad74MYdh0JrDM0FM4mDFFovpUe19dcyQnJ/UqIsgdwP5ld6Vi703h0M4so
         eQmk2eZrHoHqOOxKNmIWCpAz/7+zKOsHTRaC4SsjMVh4r03uoXOC424tZhQdkQ3Ud/AX
         Q/Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ9WJDVOsXAyK1G9cEPosZ9XeLQrigWgAM0uTkKOCfogTxtHnDwAwJ8QVIkL1g7E5RrAE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yze/MM3gevT5NnP6tTch9l1TQ2G5aGZYwZTYp08H5AazeToFAqS
	trV4aMgx85SfY70wJvoaVvuW3sCJXWTdOdurppL1fljsydCag8jMA+I7JsELjzRVoqbNmqmL2ep
	F8i/LmEyZt97GAWBh5BqpkmXuLftSx89YZu0BrCZF0xwoWIf4tMvU0Pw=
X-Gm-Gg: AY/fxX6dD2dFBWzY1W2bMh5V6f6eDCOhcTCW2HfCx1z/OaIekyEUI59rYW06LdkAFJs
	YWfbWhzs8C/AYNq/CU0oGMGXJockZtavpBavCDuq9VUWp0vYfNdIhrFLNCVoDxQA2/48R/5UAvM
	OfPjDG5urnSkSJ9cv65YcYzi1fSfDMKQ61VqXdwUsJvsgkrSihrf0U/E8q3cKyGVmnep0y/Ctyo
	kkgaYwF2T0OesWUn0e7jy0Xvn8QpJeB/nZlgvnLJqVozhgLZwlf4Ll7ZrnRsizyZtZ1CNLk9W1y
	71szVXavBAIufpAVWY6E5a70sguf2UjlK/jFH2L8RxXV2MEaDp/YObTzl+Iv1Veqax9guqgsQ9f
	DDt24Nn0F1RTS7VMC76SJ172QRGqboHixogeJm+bCgEM9f+p577dQOTtK8IUh/EfmksMpxSYxcQ
	==
X-Received: by 2002:a05:620a:3942:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8c6a67899b0mr306190885a.67.1768555975731;
        Fri, 16 Jan 2026 01:32:55 -0800 (PST)
X-Received: by 2002:a05:620a:3942:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8c6a67899b0mr306188385a.67.1768555975194;
        Fri, 16 Jan 2026 01:32:55 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72602f3sm186480285a.40.2026.01.16.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:32:54 -0800 (PST)
Message-ID: <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 17:32:45 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
 <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JIKri3xavP3UBJb1vNFWdwVnKRIWEBBw
X-Proofpoint-ORIG-GUID: JIKri3xavP3UBJb1vNFWdwVnKRIWEBBw
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=696a05c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tQJASglR_GpgkQO9bp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3MCBTYWx0ZWRfXzZFNuTLSHla3
 e3v6uUY3ZGnmZuoDKrp8dU1P04RLbsKPdPu83JPUs0waAt/yKMaWfPhK5SmDiWVgoaRElP9/AzZ
 uA8SQMFK9tXxvdxguMG9NRazf+VXSKlvsy4dievZokHRbGJXEyCahMRcpwkAu7xaswK62sWj9Lc
 HclE2VEIIAGJIXdEKYA1GWMdjLVqUAPLjegrMFfnbV39tuks59awbB/lhdwLR1NC6pYY9SCzlms
 3T0TtSwWBUW1t04OzCXYfXqUcNqiGKCDpEgWYRvV+7Xv34C71yQhuR5jZtUig3UkeDtoLFtmkhR
 EP2uHAYXEcBXTNIV1SA0RWs0+IfTe9NxQrQa2dkQQBjLA6Ap8A6g3XyNhpy3a+cTKrHyyOH8AAw
 a+O7so7PZFzNaIw7UzG4b3o6Y8Qdq8QPcNOBwvvkjuIgQugpJw15Oog/GkcFLOPOEAi7rfxs6kd
 MqAOgfSggRf5tVGBHaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160070



On 1/16/2026 5:12 PM, Vladimir Zapolskiy wrote:
> On 1/15/26 12:12, Wenmeng Liu wrote:
>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>
>> The Talos EVK board does not include a camera sensor
>> by default, this DTSO has enabled the Arducam 12.3MP
>> IMX577 Mini Camera Module on the CSI-1 interface.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++ 
>> ++++++++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/ 
>> qcom/Makefile
>> index 
>> 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>> +dtbo-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtbo
> 
> Please remind me, what does dtbo-y Makefile target serve for?
Rob mentioned:
https://lore.kernel.org/all/20260106192609.GA2581379-robh@kernel.org/

I checked, dtbo- is not an upstream usage, it will be updated form 
dtbo-$(CONFIG_ARCH_QCOM) to dtb-$(CONFIG_ARCH_QCOM) in the next version.

Thanks,
Wenmeng>
>> +talos-evk-camera-imx577-dtbs    := talos-evk.dtb talos-evk-camera- 
>> imx577.dtbo
>>   talos-evk-lvds-auo,g133han01-dtbs    := \
>>       talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-lvds-auo,g133han01.dtb
>>   x1e001de-devkit-el2-dtbs    := x1e001de-devkit.dtb x1-el2.dtbo
>>   dtb-$(CONFIG_ARCH_QCOM)    += x1e001de-devkit.dtb x1e001de-devkit- 
>> el2.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/ 
>> arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&camss {
>> +    vdd-csiphy-1p2-supply = <&vreg_l11a>;
>> +    vdd-csiphy-1p8-supply = <&vreg_l12a>;
>> +
>> +    status = "okay";
>> +
>> +    ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@1 {
>> +            reg = <1>;
>> +
>> +            csiphy1_ep: endpoint {
>> +                data-lanes = <0 1 2 3>;
>> +                remote-endpoint = <&imx577_ep1>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&cci {
>> +    status = "okay";
>> +};
>> +
>> +&cci_i2c1 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    camera@1a {
>> +        compatible = "sony,imx577";
>> +        reg = <0x1a>;
>> +
>> +        reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
>> +        pinctrl-0 = <&cam2_default>;
>> +        pinctrl-names = "default";
>> +
>> +        clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +        assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
>> +        assigned-clock-rates = <24000000>;
>> +
>> +        avdd-supply = <&vreg_s4a>;
>> +
>> +        port {
>> +            imx577_ep1: endpoint {
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                data-lanes = <1 2 3 4>;
>> +                remote-endpoint = <&csiphy1_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>>
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 



