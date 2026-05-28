Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721262D978C
	for <imx@lists.linux.dev>; Thu, 28 May 2026 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977457; cv=none; b=CmIqcdgWIM9FhGETnllptOzmBBKY5Zg8s5Vymu2ScWXiDenB6EXjvs7IBCE26LSCXbLeC3r+3ZwpGwy5/mwA3sUmlEZmGc42TCHmg5TBFZb/hpMQsAFTKH78S9rLWGp+1flCbZAcSTnZjNxOC0bQKcPbE4HVpBFg/M0uvK1ACW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977457; c=relaxed/simple;
	bh=4rZJVp5bncr+uawsObC7M/OUhB7Yjqizbpz8zuZmW9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RvN8Q3VluVevoqzGnzTQJvTMZ0hvnVEKn0tnA6M5bNQuMklOSpB3P6ME5I0nq9c+GaWRyJQ9rJb5R8tkIf3op/fOulXFQ/bcYPoxI7qjOiQYlDPGKKJ2mwmsD1xlGmUMm8JKUqlnn6ubqNs4V2lGVDgL2LUGicyklRRENEQ6KTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D78VVkFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bXsmqhB3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D78VVkFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bXsmqhB3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8wNO1382549
	for <imx@lists.linux.dev>; Thu, 28 May 2026 14:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJ6t2LX8Nf3WHTmQ5lnb3pmaPw0YLr8cKpgF7Dcvu5o=; b=D78VVkFjlkuEcyzV
	lA5MQoHG+VL+o//HIRREbJTwdUOSH12gv48aMjCVORR6d88dLvsl3OvOwfBRPrNi
	Q5FA5uGDReErbHRo9RAmcTfVU+qTbRWt3lpZt8WMKkDvHeXKSwtFaV+tGjnthuzQ
	+1eCuA+3k49fs+lXWCknDat69t8FSVMB8OqK50nsgcK2OJWbCiRygTYVD4Pgsnxt
	ZoSlO/awycGLZ505VX2jGI0car+hbc3UlGFUo2X8s7Dd9slO7e7HquBovDRZVSh3
	UosDMuifqT/2UFc4Iu2mf3O08uNizPJUUeh9S6FdRISZY5cByS9PJVh9fIU9QQjF
	5Jtv1A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrk20x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 28 May 2026 14:10:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63302aca17aso5178529137.1
        for <imx@lists.linux.dev>; Thu, 28 May 2026 07:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779977454; x=1780582254; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJ6t2LX8Nf3WHTmQ5lnb3pmaPw0YLr8cKpgF7Dcvu5o=;
        b=bXsmqhB3H5ho98uQ5H+zAFCc4ZRRRPIYVCKXqH/LSRVGvOO/AGrHjBB28wGEC7h1yh
         SI0TitA+LCfXkxdgDcKdd6eMjVMQSfhr75JQQFpoRO/C31p3bZe8/KG3gHxrgqGGFgL1
         xir0drpcETKDbi3kOiVNjEWR8qoE2SL2wVTh4i0wlldkBkUUu+zwB8gTvxT6l4SLeu3t
         auuY2azlXYdMZR6+/Bqpi3yNy0Og8ko1ayMlWROTwAU7S9eskZGvCCRdO3bpnAVOqQmb
         UMd4DL3M6KXXUVxWqTW7GxmmHIbsszPrNECdh6r0/p7R985s75YWVEyldJZi2IT5q3BC
         SPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779977454; x=1780582254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ6t2LX8Nf3WHTmQ5lnb3pmaPw0YLr8cKpgF7Dcvu5o=;
        b=gNIFqSTt57WRtl1GtBOZFA0WQ/JmnTnAvabvhoss3GITEQwg+D142uqSiVWbY0+I0h
         dnrNA8j9B6za5NWws9/jWQD2aCBNZvhSXxDa5OWgJ19suGASqlwdowhuPNQoDtUuiNBW
         FpNKQpU3fffLChORAKmq2PLnvPOYzsJLIvZlv4UWvXznfu5NnHjosjwOvlPwBdPJj7sy
         jYuZ4V4SWenAfM5/5K+ViX2A2RhAqpVUVAZLaaACS2TdJLa/tuCy4XvyfZ88YMLeDLLc
         0I9YaZCKZRycIkITxfVryDvokY3Tn6zDA7fLovD2RJFlnu8PdVRYHGp+nimKcVzavpVh
         sBkA==
X-Forwarded-Encrypted: i=1; AFNElJ+GxuRyX1T4pZYylONi71BRggGBAuSUGpeUA+hTaDlLpuF3GpfyajJuYgy0GytoUw/LRyM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYQbuFWy254nf9TY3fsEsWg+MifAnirwjQ6RAK3HpstO6M+83I
	V+JplscNywe+fANHgBc4sQErMl5qx93U9z5rxRHgksUMzZQcC2Y21rqeKKANjoISvUpJKwAvjOj
	eUASdlwAa+lFgXmFcBv/JhbRWqR/J/JXv97tCMpSK/pBB93/4TQ01va0=
X-Gm-Gg: Acq92OFXuf79WdSYQo1zLsyERxFJfSesNlD9J6j2WFhgaaT62xqp6cw2Wd9a8CR5gig
	leP+sm9gutpwc07xp3rDhyPf04Y07CySuW/imTrxYru2hTDMkG4Bn8IrVTm2rSymxEWMTvgYbJJ
	yc1EYkglN/3s7re4j2R8z8krDMdNmhu9jQojhYpJGQmBb3YjHxNBer5ORA/mX6hRxRmdtc6lVg8
	4YfN+759rT14AHIIxIptFidCZ1BpHd54SDzOAaVFpu2vBqgBLiALYC2j1NpqW8ruzKcD7hHm9pN
	uI/meWMLIR5mbKHpzj6VQ+x14EmAqoZwjF2Hx3K/u7D6ZdcP1i8gCKkYQCo5E2atKsweckMUDQa
	UK2P7RdMUSZH7WZORiqisTdoktKADqVELeqFYwguy4G7FISYURAYNKCVDDESt45Pp2H9m47bWie
	9uA0Gf8HIg4oRBKlmDkgA=
X-Received: by 2002:a05:6102:2c13:b0:62f:4553:7a28 with SMTP id ada2fe7eead31-67c8dbf6c45mr12405603137.21.1779977453677;
        Thu, 28 May 2026 07:10:53 -0700 (PDT)
X-Received: by 2002:a05:6102:2c13:b0:62f:4553:7a28 with SMTP id ada2fe7eead31-67c8dbf6c45mr12405549137.21.1779977453082;
        Thu, 28 May 2026 07:10:53 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5b28absm14324149f8f.27.2026.05.28.07.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 07:10:52 -0700 (PDT)
Message-ID: <14c628b9-0bda-4658-8e60-7781284aaee2@oss.qualcomm.com>
Date: Thu, 28 May 2026 16:10:51 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: s32g3: Fix SWT8 watchdog address
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260528120323.46287-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260528120323.46287-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE0MyBTYWx0ZWRfX1CMm8do21iTw
 Hcl3tAodeG0ffL2xQtV4EaNl7dy9ulGUu7YVQBEeGxy13zH1LWcSdyNcjUeFmvhh1xqAFVqJQft
 XRjLlSOKc2rDDeHathyFKriNriDeviaBguuLBeDtnO57e+X+loJNbRW/oENJN1VWXoT73C45NQV
 kFxxGJilOgpPO1zTzEQshi4HfgRO4Y1wgTt4E+JC+XQOSWjk3gXBD3ccrApxCEdf4NKgwEwcAOF
 SQtRl32cfG1JB9/W1VipmafLqc3ik6vsgK4Tyx2rTi9SnQ1F0d4duCu++rzo2HmEO8KJ125GkAO
 IJw1XtLc23dQLNxPkiT6hpJjO0mF7yz3M0xz6ClzbTGXgHIWnSmOgNzJJuTsDvUleIPlzDGY3pc
 GqN4wqDdmv6k879PFeU4/W5ZTqb0VWPrYAwfdr8LC/h8FjBXqHWgXev1Tju+vbOJ/PhRlfuUwcM
 pbI27mXOrfas2Xa4SSg==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a184cee cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RFvq1impTiYap7nS4gAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: DjeEwrO5QD0Gllq0MkDv2sf9xu8WQVNd
X-Proofpoint-ORIG-GUID: DjeEwrO5QD0Gllq0MkDv2sf9xu8WQVNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280143

On 5/28/26 14:03, Krzysztof Kozlowski wrote:
> Add missing hex annotation to fix the SWT8 watchdog address in 'reg'
> property, as reported by dtc W=1:
> 
>    s32g3.dtsi:863.27-869.5: Warning (simple_bus_reg): /soc@0/watchdog@40500000: simple-bus unit address format error, expected "269fb20"
> 
> Lack of hex '0x' meant address would be interpreted as decimal thus
> completely different value used as this device MMIO.  If device was
> enabled this could lead to corruption of other device address space and
> broken boot.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 6db84f042745 ("arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Thanks for the fix

> ---
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index e314f3c7d61d..7e28dff53a86 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -862,7 +862,7 @@ gmac0mdio: mdio {
>   
>   		swt8: watchdog@40500000 {
>   			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
> -			reg = <40500000 0x1000>;
> +			reg = <0x40500000 0x1000>;
>   			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
>   			clock-names = "counter", "module", "register";
>   			status = "disabled";

