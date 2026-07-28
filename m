Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67E743030C
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 12:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240376; cv=none; b=Duu+0eDgXa8q//2soYCeLQ9pAThJYl3TQEtyQcyYg5bRa0IanWFdB933sbMMxNlFPi5fxggblJphh7MRnwaysksc7lbWOmALETHf/+m4aLjRGvNJJvDuGm1+vAf2nSYU5Kctfcow4BxXhQuM+kGtwvhCfX7HkjvUK/J4K3OVsm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240376; c=relaxed/simple;
	bh=DtghnU3zUVvgE4G94jCndqj827sk2LBqxMt8/WFWoWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9tgS/W+h+meFxut5QEoO8Ned36e1wv0vB3joeAhIerwPOsxu9+M83jp31PzkPdlwClu0zkbzpIJk24jb2IKeMpR/vHXYNN6UGW30yRRaZkObre8i+q4iipRjl+e/U3gnojofMdpmygj4Z38djO/7BuY2hiH7jRNDSmljyscPo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjUUPzTz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jiPbwTZy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjUUPzTz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jiPbwTZy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBH4Em2776878
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 12:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F6ytuslCG0pq1HL4h8Lyr149/N2ytTGcDm3j8uDWkuQ=; b=MjUUPzTzjv1KiOP6
	Y3by7YgCgd8kY2oL7V+QmWTVqSeey8SNO0gAlL0D+r2X+m03cUtFF8wH8qJxMp73
	BOgG/sEnJeQh8RmX+EkkNVws2rAHTkctc+5K23imjm/XHAuPd8f0N+A6cVYuYwOz
	VXv9j6k/ndmMtliDkCyfDjBC6DTk40SttqSiUH0RUamuKtOxb2bYH7hByMgdhk7Z
	tBt29KUvsN7kepcyh5AFutK7wuA3zP+v9XpB0uL4hiNeiScgN688bb9oFIIafL/e
	qMKZmXn84eTF1q6n35enCul3Vcyx3v9Qx5iV8ODk+nrC9hZw1BVSVl7DmYac8C2k
	omohWw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptatgf4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 12:06:13 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9775c49866dso48714241.2
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 05:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240373; x=1785845173; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6ytuslCG0pq1HL4h8Lyr149/N2ytTGcDm3j8uDWkuQ=;
        b=jiPbwTZymb8CMV65YVPoDyF4LoV3Zyhe6RC72g2JGW2ANdkI6kWRP5+NIATT9AhBVi
         ITE2fQxV0566VSzGxMtnRJJYtIBcwCIol84WE49sxADJVjbKl/POP/ctoTHADgmLS4QO
         l4RkpNTW2/9HArNpYYRIXYdYZTxHnk+w+Cxarb6vy1piD+lqJJMbBVzCZSwEQ+6n41vS
         hZRDVcpEbuTIUebIKufyNe5QV2QSFUyBJI7i2fKYd+TXq+p9GEj46T/6o8IiqFQSl6op
         PhUoGEqLTFcQRpsNIHlSNqhiIU6RCzVFFKNAghNv+qh8uua0l6gMpf9PnhVsEPyr6zAN
         p3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240373; x=1785845173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6ytuslCG0pq1HL4h8Lyr149/N2ytTGcDm3j8uDWkuQ=;
        b=MiW0bQVn/rMtE3tgG0P+5FI1earK/KTkgVGgxC0lemTTmsyENvUhEtCuSPW40fqrqs
         oAK0Fvhjr/Yww15UPasSevN5JiPESJPRwEPSG1fTOkXhVunZfvxcfCQZ5y3hakWKHUB0
         Az9zuNcluMO7w613BkV3Gp80y2H1zJr3XOfExP4537Ol1UL5KYgTrF270Lffqck8Fpnm
         /2ImZaA3beGheqj45AptGDGGwzBAtTw5THTOp42BF0hGKlM8oAS097/HxLedP88K8qWu
         AXD8eppKdqf0uGDadlrpijC76Ay+v5yKrJcfZbIYmUKj8bYNwrELjJN0+2e5q/VHlKiW
         5l4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoGJJrvXiCMX406uSG02wYEjU0/OpzyQo+1rXBWufuTmH+TrnwVFwqzjfrs2MziCgnY/0E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yynwy5vp9v9fP5YO9kSH63HeOH3Mp/gfwl5Bfy//PD8xfEVTs+5
	NSrD6YQ01Oawab52e7I6AzmVw01PfeXiPY6umv78GDB6A6zMZxzGciisTZrl+64+vM7u9TGCBVD
	HOwQ6A0Y99gRzd+bshXPbNanupGW9A8cm3S9wBBdX4TdXvt5+WcE85ms=
X-Gm-Gg: AR+sD11eXhYehDHJYul6Wkwo/0rp48a4YYN7/Sljge1D18lkDSLezfme6f0ZGOYAxOd
	T2Pq76Kk4ndexd2Zc65sAJN68wjK0d4dAxqkAC8ljj/TQUjvp4nojF5NyZkOii1AGhpGZeuDKD+
	B3wcwuBc/3fLR7XK6qjcAxtoHaXdSXK/irCNn9TVbRTo8/r0FXXypUbmNI4b9mCdMMD/3OQ6EkH
	Gmow6qjVLpsaN6zjIjHatKs8ftgnE4eycR+su7t2FOrGYzw/LPaDcFpHi6pSHP5k99WrCgbO3MJ
	R9Y+XGmi2v89oW7YBA07cGmtyL2q9qUduJL9k5vA4B0SsDd3E2rajYpXRBaSGbmaJfbGQX66oDA
	ogYfzruK0q+3Wov6LPSSoTIHH
X-Received: by 2002:a05:6102:a49:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7549f65b2a2mr308538137.1.1785240372991;
        Tue, 28 Jul 2026 05:06:12 -0700 (PDT)
X-Received: by 2002:a05:6102:a49:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-7549f65b2a2mr308523137.1.1785240372533;
        Tue, 28 Jul 2026 05:06:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb51c98c5sm3883878a12.11.2026.07.28.05.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:06:11 -0700 (PDT)
Message-ID: <ad142a95-ffcd-46fa-8d55-b3328bc00e20@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 14:06:07 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V
 output supply
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
 <20260723-rubikpi-next-20260615-v2-1-47c5add80114@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-rubikpi-next-20260615-v2-1-47c5add80114@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNiBTYWx0ZWRfXzX9rISFxFxX6
 etDRBTP9d0t6FjF+B1c8NZ0NJ5zdgyWELKIACuCsKzucJSP37+9ydlJXN0KFYVJCL46T2AMEaU3
 zlGKISQoW5KkwSAcnVXg1T2qP30Zjog=
X-Proofpoint-ORIG-GUID: rFLJBN72JhMzQzqP53COKoWdINxezcOT
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a689b35 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Wdb1h0LgAAAA:8 a=zsjO2eMJKmvGp5MnGoAA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-GUID: rFLJBN72JhMzQzqP53COKoWdINxezcOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNiBTYWx0ZWRfX+B9v3n0/9Xsz
 X00V/GEOJyOsS9Z6BS3L+JOBS67LMPeo8D1UhzxDHBZ+YY7wViEoyeiSDef1+sbWyoEObaCv4DF
 4VMk/aFbDKAaofxaUpxfctBghlQ7PInyMsURoIHxo/l5vUIpaMZYe/OTZFLmQ18YlptAfFOpqmA
 U81OuJaBU794dIW6so9P2TBXCC+nVjhdLqt09bvffZffeQ8BLhzSZNBfYojGPPmUExORkOhyFa4
 /7bdqM962EahSyfnPYSfAWUCUmV3H3nm9jycYnhRMnYRcXS1/u2vLqhh1Up1pZXc1v2/jU5F46O
 FAYfS/0pHT5zXF3+LTW9Wy9kkg3HpsJoktb7da1Ybse8HueEH3kTIPYWJOmfr89UQxBbbN8gaDi
 VWNsE2m8OO6oZsogR/vK0pPozsaTFm7LKn21kAShL48xNM2ZertKVn2daTPDfXc/LhqNux/zaqV
 t2M8tpNEz+qFsK5V7rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280106

On 7/22/26 6:12 PM, Hongyang Zhao wrote:
> Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
> supplies the two camera connectors and the 40-pin expansion header.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> index d8a9a7e47bdc..45514918562b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> @@ -214,6 +214,23 @@ vreg_usbhub_rest_1v8: regulator-usbhub-rest-1v8 {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_vcc3v3_output: regulator-vcc3v3-output {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vcc3v3_output";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&vcc3v3_output_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;
> +		regulator-boot-on;

Is it really on by default at boot?

Konrad
