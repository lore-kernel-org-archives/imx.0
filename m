Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106863054C7
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552479; cv=none; b=tdymCIpvT9uW2rLlC4/SMHqPUfPV+v0lWSegJ8XLFDFAf9ALdNraR8ct32tNzcrUy1N0UDgf7EnHqyEHx3EsmdR3oMCvAgJ7WnKUjskB/+wP+MpLKgfRQxkuOi0d44GxFDUsHTkqYhUvuDORvEBtjQLaTMX4dXTfP81fnBeAZ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552479; c=relaxed/simple;
	bh=AgvUAbPqleTF+bvSeUFP5QtroUDWiTtUGgc/oDofEmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWKR3TePAGGzDEYjgjeOat8juT3Ka4II3SnCLNQXXr5OgXPX6IbKVXYmYa4IcVMmeAfDYpe25HGxMG7a/tmIqPbv0uNKLtCQLqCFsB9ibyPbLMik+u93502a8NDHNgos3r2TJBrdJ8RLR0smOx/tmcC251E3di4QK2wU0Nua/cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXabDyZ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZh5RApB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXabDyZ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZh5RApB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G872Qx3582873
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 08:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=; b=hXabDyZ2TBeZlXXl
	jtP4nYTQsqMYMs0HOxPMXQKxc5YWG3YEVmVG0XPQea7fMtB48UK1BccRr6uiK936
	WhJEBKipMvfECaxR9Tdd/macY8/LIVjUpElvrjSm5ujg2shuoK62Wa0X+YHnxXuR
	NcNxAU7DBYhlCysvPpB3/q5/o7EvSzgrSWzWknJcmr60KeSQ6kPKPBpUKTz1tv3Q
	DhaTBsnI40+XXZfd0FwPcWMCYOJJjAcyET/5nWzrikGtF+QmwOoCCa4Fbm9M9C26
	lifaKVDY5VbPHvQqxxGkgaXMkrXtoDt7Fs9wrkaVT8fjNCn7AzeY8TrUYOiO5C/t
	WzMOYw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9ayse7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 08:34:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-890587d4e87so51444326d6.0
        for <imx@lists.linux.dev>; Fri, 16 Jan 2026 00:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768552467; x=1769157267; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=;
        b=DZh5RApB6axP9fcSmUFbi3rvGafVa3OblFCT352bRHf+fP7MrJ/NM0mLvnTBm1DSqF
         qJmSxvWvh7X3Xkt9D6hkHuPj6U4WTrz+lEPO6CeXQp91P4/gGeBtQg+q43/WZzVS7i49
         SogRCd/Ua7MWUtqasFOLeSYIF0plNYz+/wlR2XlMwz3QG9j358igHnufYgDPa2RgURrg
         aYnpDRNY+yvJjLh2fFQnfMObQFNYvxKb+S8md3IGiSDePtgBSUp6r8Ddyrdt5lbBLLXD
         S83vrZjN/RNpgAjUpfxnGa4xiaXA591Ix5vHuGO1D3i2PzPygWaV7A60IF7WSTda72Ah
         Isng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768552467; x=1769157267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=;
        b=W+6f2PfIS65YrAL8HlTrKtTqYN+YiLvI4RESfsgrKERK3fRN/ztKaJVzgorpVZJmAm
         rrfLdgC3ZUi6kfZ0ZDbhUEHAkwxks+apdBmwgPFlN1ldLDH+MqgkglPAnNEaFSahicpp
         E/us9r8tlwKkQmACy0ZiefjhGIuJZIv31XWwMsLsHWjhh8zWnEi8UVORiCTUjRWLG+9B
         r3J8f60Y+nav55ph14mgwkusV5QquaPPuGIy/RD5ShKpQ8AZ2U1wtS2nfZx0xzNzBFAf
         QS45p1iAxzhOCxrnM5Uvx5LmPvX3Tel4OYDdggb/6ZvHk+1c5VAsn+vCuSjNgF7ymFD1
         qKyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKVoSOF5taxzSDI3tHRcoKb9tUfBUhj4NXcUUcXB2ivtknLQ7gqhS7lAr65pxIdPSLw3c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7MH2BvHF8R9WiRaB+3Owe8pwaqywxpkxL0J6W0COfQ3PnV9uM
	x8RaKFseq+klZt2a+mBATfcr5in1E+LYbTWWbGNIZgdd2eFWpvv8YQWekP294tNxLm5BsVvv9PM
	6n72t5lvK7u+anDQ6mqA2OqUqVAo3k6dSXtIGswKGiywN4HakhfTXR8g=
X-Gm-Gg: AY/fxX4pJr9n2Ik8p9stkmdtDbnGQ1iUyl5blbtWCy9PSzOdtZ8QsyMn3rwfgernNCr
	Tih0V2jfn2EQw5ok7V+p5Ous7hnfiR0Jq2Varo97hRrhbDNkepUCOD5OGmBXSCG4+eoe4A5rtkO
	wgu7/88+W9C9YAgrWmSNfYkgbLrnt9K5uMTIu7zky0K1lu8eljyVqDOede063EZfrM7a867IGki
	Cdwp7qHL0RUKGPRDCB4oE8TXp9F+DJWmQfHzwiK9jsVk59TLyWaqzUXkbbLJlpzQM/VsZs9qvBP
	I2QLEUWrdt6GLWsTLROmsxSl5kQm0xnCAvQySza+wSjTRy06DZOGjDVN9nxFODqARoQxKR/Dr9X
	7oeU8HZd3Ijc71QfQ1PnhkEgiI24BK2zkKZZ6sBo962QLXJMHcHnmWydoZcvSX9qlhDrJqoBfZw
	==
X-Received: by 2002:a05:6214:130e:b0:786:8f81:42f with SMTP id 6a1803df08f44-8942dd88ec0mr34294946d6.39.1768552467170;
        Fri, 16 Jan 2026 00:34:27 -0800 (PST)
X-Received: by 2002:a05:6214:130e:b0:786:8f81:42f with SMTP id 6a1803df08f44-8942dd88ec0mr34294616d6.39.1768552466704;
        Fri, 16 Jan 2026 00:34:26 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6040casm19565916d6.21.2026.01.16.00.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 00:34:25 -0800 (PST)
Message-ID: <025cefd3-888b-4744-bde3-2d5c007db66f@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 16:34:16 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>
 <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9YFjpAIgl9k2XsKgQ6P0T2WynGMCDttm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2MSBTYWx0ZWRfXyhuHUqCpZe9K
 srbazt6dRjebLaByCSsW/bqpP3axi8HwPSX70GCO/mD1kfshxoZMIXiPTeoXKzD8l2fVUXBqlIA
 hUauQmaOshuEaCyVWL4aisCa/CAEhpNLbohWm+MP2U6jHziYvOTIlC0huNSd37IbE1JTMTBiJCf
 UsYe1uIaF0qgQcP5DT+v8P/Olsj7SSqZbG5mV8KH0orPDcYJB/GLsUWuvaaL6kWbLj6Puwt90BA
 MPLsLEjFhhtltRa5X6RKmdmVEMnYKcUx0Bym6DRdWxTcbqXP9en11M1Vg7efEI4LI4Apvw/Z+Lh
 OrMJlOL1n66SCh227/Qmsmrm2JC7S4oVH1OOJghXTsyeYFUH22TKVNBMPRCUN1U8vfXA9Hy+FVq
 iV2HV+RIIm1iL9OqM8FyGkgQkXbnDyAgDjV7T2V75+YiyYq20FCVJVWnZom8QqU0FCxunfUKF29
 /7K/WOA+qz87wCYGclQ==
X-Proofpoint-GUID: 9YFjpAIgl9k2XsKgQ6P0T2WynGMCDttm
X-Authority-Analysis: v=2.4 cv=NfDrFmD4 c=1 sm=1 tr=0 ts=6969f813 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-6nChnoGJk84s89d4NQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160061



On 1/16/2026 4:28 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 15, 2026 at 06:12:38PM +0800, Wenmeng Liu wrote:
>> Add the sm6150 CCI device string compatible.
>>
>> SM6150 include three clock:
>> bus: Bus clock responsible for data transfer.
>> iface: Interface clock responsible for register read and write.
>> cci: Clock for CCI core operations.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3afc68ff437c0435b69a7 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -33,6 +33,7 @@ properties:
>>                 - qcom,sc8280xp-cci
>>                 - qcom,sdm670-cci
>>                 - qcom,sdm845-cci
>> +              - qcom,sm6150-cci
>>                 - qcom,sm6350-cci
>>                 - qcom,sm8250-cci
>>                 - qcom,sm8450-cci
>> @@ -263,6 +264,23 @@ allOf:
>>               - const: cpas_ahb
>>               - const: cci
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm6150-cci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +          maxItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: bus
>> +            - const: iface
>> +            - const: cci
> 
> So basically the same as camnoc_axi+cpas_ahb+cci, so just put it into
> existing enum with qcom,sm8550-cci.
> 
> I asked for this at v1.
> https://lore.kernel.org/all/43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org/
> 
> 
> Best regards,
> Krzysztof
> 
I raised this question in the previous version.
And got reply as:


---
me:

+                       clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+                                <&camcc CAM_CC_CPAS_AHB_CLK>,
+                                <&camcc CAM_CC_CCI_CLK>;
+                       clock-names = "camnoc_axi",
+                                     "cpas_ahb",
+                                     "cci";


         clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
         clock-names = "camnoc_axi";

If this is acceptable, I will update it this way in the next version.
---
Loic:

No, the idea is to name the clock from the device’s perspective.
For example, from the CCI perspective, you typically have:
- A core clock, clocking the logic, which could be named 'core' (but
'cci' here is ok)
- Clocks related to the bus interfaces (such as AHB or AXI), which
could be named 'iface...' or 'bus...'.

This approach clearly identifies the role of each clock and keeps
naming consistent, without depending on where the clock originates or
its source name.

 From that standpoint, some of the existing bus clock names defined in
qcom,i2c-cci.yaml are not ideal. You can find better naming in bindings
like qcom,i2c-qup.yaml or qcom,i2c-geni-qcom.yaml.
---


         clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
         clock-names = "camnoc_axi";

so is this acceptable?


Thanks,
Wenmeng



