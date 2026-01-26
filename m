Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB1330B2A
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423574; cv=none; b=OODZb+iSmjzl8GYKwfmPGjmfAQ+oo43MaI+wfOYfLenwUSnIrQ4CSWVwCPJuCWQ8lrJfOLlPxgTlRiqm+SxSY2Es5r5JzAKm//XEo3dpq81qdOxar/8EisYpteauzYWWzekPXTNDJCAzUR+VUN3wiyS8Vcxq9Zt32Yux86SDp1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423574; c=relaxed/simple;
	bh=eWAdrV6TAtui1MJq3ZE1m/+gDAFZQQwdZF81DH6TaDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lq0fzFuSXNzkoXS3VZ3TbcHlxE2dNBgGze+cFn1a+QSSIF0TS10pzXr54VzbbiC1SQkoCrYsV7ikwqrhnWdMuqZlWW4rL24a7UCffhsU9fZE4ZRyADZQO/+Gb5p+s827GpeuU2WqGLK1sDNLKsGEBiq11lxIlLry5JoBnp9rGLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULxdXg8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YSxOCrXY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULxdXg8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSxOCrXY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8dO0l2135451
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JnGQa+VppXSpGH8Db51uvFUmO5TW2cub0y3XamdlXbo=; b=ULxdXg8GOuwlgBJL
	TgivDwLrLmZGDQj6b7363AGK+1t5pNEoyeTBAP87E7bO8F2CRgksn+JM4V6iF9cB
	TedXI5UGCAgtChJkpTvInxkibW3S4B9oS0ie3qbqr/9ZPIBNoFfHFVPBH0gEVNJv
	psl+3qIqHyDB1Cq2MC2Jml1UuRptrNf+O8xs0i8PvvpOaIG8OMNVZRvzoLG+7WNE
	by8je9iU5ZEYXN7AOcZwUAzF5w0ZE5onMXRLIA3zWu1cENk2NCxJqQKBeunQF5eH
	WWqv+SowYjxeCAV/9/TqfcRCP/sVgmS7djm+h6GeMps28Y84192T5UWZr4/Hw4Z5
	oeFgOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dm8v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 10:32:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so116148485a.0
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 02:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769423571; x=1770028371; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnGQa+VppXSpGH8Db51uvFUmO5TW2cub0y3XamdlXbo=;
        b=YSxOCrXYCqX3raq/ucQIa7hz1ZBCMT881gAAsP0aueesTi8h7Z3RxyaCSz6Q+jWDnk
         RbPNPP5cp9UQHogxMpHBUFx/TG4J7owbDDcf2yOAxf9yd3uw0itRGpwk4dgJwaJUUSXD
         WRndVwn6lz8rBYEDj5rEFNJev+y6SChlb4HFKUAaI5IEWxQ5G3J/vyruA1DvLDprwEY9
         pEq7rrJtdVMz/oeZzeOixHIN/8vyXx0xxRirMuIYzzD99U8sWZPS+zbqNXlVRCPjt+tO
         ZSKKEBGfXoEGbMm6z6bqVO9cxrTffgj9alb+mxoifL9lpLyNcFxFovyojTlhcFDOR0t1
         Cc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423571; x=1770028371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnGQa+VppXSpGH8Db51uvFUmO5TW2cub0y3XamdlXbo=;
        b=gT66Jcnm/4Q5DB31fq/lW+oMhnfR1oPAp1US8VYRyW1W3WgShP/KzMUa4YHGJ6IDv0
         jF9j8fpw8CwD+BG+TeAQvOGQKy/ZPPO222Y2ThUMaAP5FzMxJ9LnXdMAYK9D1jSZCRow
         8JU/TqeRrdBeDTEHMo+Ohl0GLCD9nT7KLyBbiOMRVOVQDwkVGE4LemOsBPX8YG5IJimG
         flEkMPDJZiOUwNMMW2Sf/A/prYGGxAmvAWVrDwz8pQ3Oe/F0xxkOP2uGSVXanOQSkPIJ
         UW++i0JrNO9PXJpKKl8eIIVWGO6ccshtcRoi45gFX02mbqmF0lgV8ICR7Rgz28KvXoGS
         DKlw==
X-Forwarded-Encrypted: i=1; AJvYcCXCRPxj133MIxc5umd+vyn93g1Fo/faJ75b71AVG6H8EvKtxzbU8Rbift2G1HZzfB+bXmg=@lists.linux.dev
X-Gm-Message-State: AOJu0YysDddOkoYXukXxLdvkcnfd5AevDA6m94mg+PykcQPDS93LQ6Wl
	PzmFHspw9fCP7hkrKunKzXnbWNBelAvVoNuahppfV87VDw9s25R2hypvqmr2CJ85x5xSMZBmgSY
	TZt4c8s3cU/B55BB7gMDOl3q8Bray2FoRXH1pNG8HuOUSk/P9cMJHWQ8=
X-Gm-Gg: AZuq6aJQk66rFQY+x8tdYCcHCBLwSLs2KS0bTAN9HGLTupEk2hQKypSY2zDcuiZY14w
	fI9HRMuaB/Dra+t+ByPrE36/f/9HX8toMYPNjWjcq01RtMwJN+2608r5ziOCBcrnZRzBSBpHa3p
	NWhJNzQUC0klYJrNK8gQci0VAobcL5tLcuvYfa/hIO/Gp0j0RJtT9octrlkaY8kU7aazM+8lQWq
	drk3ryFRZyJERdJrD+wn6D6UfqntQObAviifQ66EyWvTyVnvOq4JMW1LXXi+MYYy8MhmlfkHf+D
	ig+kfhK1wgwkexk7Kal2ZcHlW1q8BqhUHPxsGz/T6obX64knbV8A3jHowKB4BUNqCHvoUvtAHzt
	z8NxF4nGiZJPjW5u4D7LGvnBFAACWu0X/nfjgXFgT1DlfpzwHFRYEQ61vl8ZobRuaumU=
X-Received: by 2002:a05:620a:2588:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c6f95790c0mr358638785a.1.1769423571036;
        Mon, 26 Jan 2026 02:32:51 -0800 (PST)
X-Received: by 2002:a05:620a:2588:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8c6f95790c0mr358637685a.1.1769423570661;
        Mon, 26 Jan 2026 02:32:50 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b7d7d89sm606513966b.68.2026.01.26.02.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 02:32:49 -0800 (PST)
Message-ID: <291206cc-85e7-4251-9507-5848f721a708@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 11:32:46 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
 <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
 <e0e6f248-3d82-4b0c-9ee2-4a655b7bbbfd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e0e6f248-3d82-4b0c-9ee2-4a655b7bbbfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA5MCBTYWx0ZWRfX6zG0lcBdpTFG
 LEdL0kKM0Aja1u8pi7wI0Hv54qJtzLEAYemfVySx655dezufsz/y0UfMQH2Ix0h6+37OAqOCLU2
 B1q5mn66rkJYC3Z/YuwUD8FsH6w92Cf9mpzYvW1fkTfB4KnCEwy7yaOTwvf1ADQVecpbobxFohO
 w+SP77SIK3YWPvou8rHhbUs6dD7tYh0HM3STX4GBHMstlYRiiKalIP3F2vRj1ygFzt3+5UkCRBm
 7BUmAwsFqosN58vOHIx+n4R+h1TndUCzCQn97KB8R9t4lQlG7U4LhW8ec1/uegkHwNmuX33V7/z
 pe3FObZHalPR/r63ZoRmX7VFlQQJ6J9NX+VpxTOqu9TXVINJAKx1ICIK+ufrzZbbeDwbV/0u+y2
 mBn52b7gsuIjIEtn6ODATLEpb2kdOcdu4zxGAgrBCoT76XwxamjmVOhiz8EY6CqDU/OgplrfMDM
 zeiVhIbEsyzKU5/0MjA==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=697742d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qa14B8Bdw_gfn3ERDOEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Q7QTpKqg8c_5pOBLpyq3V74GynbBJtUf
X-Proofpoint-GUID: Q7QTpKqg8c_5pOBLpyq3V74GynbBJtUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260090

On 1/23/26 3:30 AM, Wenmeng Liu wrote:
> Hi Konrad,
> 
> On 1/22/2026 9:44 PM, Konrad Dybcio wrote:
>> On 1/22/26 11:48 AM, Wenmeng Liu wrote:
>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>
>>> The Talos EVK board does not include a camera sensor
>>> by default, this DTSO has enabled the Arducam 12.3MP
>>> IMX577 Mini Camera Module on the CSI-1 interface.
>>>
>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +&cci_i2c1 {
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +
>>> +    camera@1a {
>>> +        compatible = "sony,imx577";
>>> +        reg = <0x1a>;
>>> +
>>> +        reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
>>
>> Let's define the pin settings for the reset pin too, otherwise lgtm
> 
> The reset pin on the Talos EVK board is different from the default. Do you recommend that I define the reset pin's pinctrl in the Talos EVK board's DTS?

Certianly not in the SoC DTSI

The other question is whether to put it in the board or mezz DTS(O)

I think the latter makes more sense, as presumably a different mezz
could use it for different purposes

Konrad
