Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FA63242AC
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769089502; cv=none; b=FWCV5rATk5KMseuy3g8bCVz6+nGrPg0PW2qHAUVf+RAiewTO3zuXydO0H2gLvaFaWsZgKneYFPMRlkeQCGUI2brbREKF9mGIR6CjffhByyV+gTnQlZtImN1GW9u8J7eotyoKUjOF+wwKuqi/Rtwq2tnOGwj5rV/6i9QjHoUyB10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769089502; c=relaxed/simple;
	bh=zvCB63LFnEjdtIx6luOoekU8E/I0ECmc0pzAnnziwXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EhHVtAsC6si9YjU/AjN1/Mbq+Czt2+aODWdX/sSJuHd9V+31i4KpqrfpF2COm4kdGthLVVwlARTtvWsm4JZG8PjWMOxdq6dqmIbLFKNypykQ/+3k40kr4p8fm1GQaLE3vVlkPYTaUwbESL4WBNMWM1MiO5cTLITX+wNzfh/M9X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dw47YnyJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBr1SdMi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dw47YnyJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBr1SdMi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MCkdoJ3902397
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 13:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=; b=dw47YnyJtrDeJCM5
	wJYJ54TRymRwHwwKJneOJjUCyGQF9JLqOGdsQpImL93qHBZyvkqlUPDhPelYJ38s
	tbxGXr5uRXFVurgQRv2doRWiIMpZIqGI/xpILS9N7kBMyoFnHcANuS/ZuN/GMJBA
	1b1kyc/CycwTZ8q2rKyat7HXK2ebm7xYkIutV7/7UtTZs2OPGz61XZj48PbITt1W
	wEc2uFvBSVorZW9d/RROIUZ/3cVyB4VncWVCqsxm0MiqfThK4nVzdn3c8LDhmXez
	s7AXqXTcGET4VdKqSe9Z2l91enRGMQ7EDr3HpTzEponiD9dyNg7xfYx1NW7XDVWm
	V71cUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khk0ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 13:44:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e518fb75so11044685a.3
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 05:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769089498; x=1769694298; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=;
        b=PBr1SdMimdl3T3MvVGgu15O1+HhxiPCEXEl6akRc7ItM+rcUFQ6JK1xb0xgtiAV7UH
         Yed562oA8jrL//fWZRVt+PKmUjlOVspTnK4XCPwbJ1auyKdDsfv3VARJnmTUBVdRefGt
         RokrN6a9rGmrshc1Diz20ZnqJBFkmyaXPT4kv/NZcqR7HOdjKYn3nxrD6L+ORhEWAjgV
         NFIbwGKOP0uzHOTw+mbpdYntTyvpyJRrssL9HCIZtNtij3mkxsNv2Ji6G3/ZWBTNZL76
         VCpR3dmqONnKALiBht91Yi6Kn85MPO+xL/defiS7iRop+D8rHx3BZdBicyEVf+dD6oR9
         2yOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769089498; x=1769694298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehwO5LCRInJQM6vPkfsO0mRLXSEQICDcdEnsiHaqUHA=;
        b=maVutElXLRQ52gcKqmeodppCsc8w0dksawDIf0yFhoxSzlmwiLihTn+5sEpa6OkHtk
         XubU8JBxyfqoKNJ6YSta2flaTz529UcBeE3Lvkiuy7zOwXqYrGRoBSz3hdW4tNx3Fmt3
         WcEw1YkAh4YjLB7ExXclXXAX6oMnKBR3mnyiH5IvXXeYQtUz0FBel7Lqc81BgtpSse5W
         PfQRudWejHlIaC0SKExGumfsDCt7NARcAeCQ77ZJVR88nDpbruOHCLTLTNjxe9cx8oQC
         w1uj9Yw5JIVRCa9cu8hkMd4u4a0a7ikPpMteAEMWNnV18iKVamaVWfMJ0r4MNtVucXnP
         ct2g==
X-Forwarded-Encrypted: i=1; AJvYcCWMx3pOhd4beZN7pQW/PswUhBbHP+Jgll7DxDQxYTdSDTbUoftk57oiqFxGm7YjQR8ZVMI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgAmPb7KEj/pMEkifSPK8lU63p9//fjw6OvhKl5tMrqwVsI5nH
	YrHMIPHkFCxcPg94fgKNatuQVy6LUGalNwDK8/Gr09VDpctb+9lrUCDLEoMVH33/6H7tNYaHwSh
	Og3u72OPgSqWsk07/+niNp8M0SD6DmEzniHW1rXWyrYmBULVd0vXmlC0=
X-Gm-Gg: AZuq6aLlgYFYrCy4MguniAfJxkgUY9ASPKczOhUo7tyEiGLg97o82f3pgaw3sS67faQ
	mTRUsqj0hKtlZ1PqCd8CiQJId3cUzs55nnceOxOKJnEQ7f1EnEygQ1InYk2enatCim5/2Ga4TVL
	T2C6+y0VEopctmPShxF/++oLHcXPedMY1e0y7KR7S5wz953IgV3xQDrJrw/SNB72Vu4huTzkxDM
	uFfQY6EZLK7H2oXlR1WwOZGHBYcjKWzOFk82AjFbFtevamYze2GeF4wY8w3z6XZM1cWLvSy3ojX
	hgyoR9WP0TeUZd150UjDQ0EA5BOQXc1jg7h7GXgpVKMmFh5QAvhIajLyNsRvnIxDkhkmrIw+ovl
	jcm7rDdFafrIfoQulGCRQiJ8u4WMvRKVMnNIFAG9XDn7IV9tU3Q/rjfPskWtCGdxaV0M=
X-Received: by 2002:a05:620a:4710:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c6a672694bmr2200107485a.5.1769089497704;
        Thu, 22 Jan 2026 05:44:57 -0800 (PST)
X-Received: by 2002:a05:620a:4710:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c6a672694bmr2200106085a.5.1769089497144;
        Thu, 22 Jan 2026 05:44:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65831de21e0sm1129568a12.28.2026.01.22.05.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 05:44:56 -0800 (PST)
Message-ID: <825c3e7c-469a-4d69-b298-18f2edf72ea4@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 14:44:52 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwMyBTYWx0ZWRfX3lzQCk/f2iZI
 2vUgooUwzVm/34VVunnnWgfTBeWSAlYimU1nVY51qZiuIHvs0ng+djcrKdNbMbthNrWL+j4VQhm
 qFVmOPcRWLeuH4++42zw7nW5+Msxftq659qZtFIrr0xCFRBazO8Dd52eNrjPOlOks2/GKAkSykR
 4Htw01cM86ZAHhFAnn8TCHZ4rg36yQoZv6A87eFRVmyJy+KjlsLk0HL6sYDTklYctZV+J84jA7Y
 hMP2kziZtN+v6UEAkH81xjqJ1R5XEb0AQhzET8pMshSRt3NjiWPNjmutE0HhSR+tOeYbCp//QV7
 +a6OuNi7OPf7R0i8uSqKAmLD5wlDZjfCSUBHlWI8bniYMhwaRVULGAxjYb00b9r90n1JzJnLhH9
 KIBCW0BNR25sXrmFGIZTeptUX7Efkp6ePoS5Lkc0BUDaz0fYYc8/77VqL8Wi4JNa9TTL7Ln2dB3
 5eh+waXa1YDWVLs1zgA==
X-Proofpoint-ORIG-GUID: coJ_jcTk4LSmM5srNvkO-gpi9_-lcUYN
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=697229da cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=fwfv46HyQb7ozjPenEcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: coJ_jcTk4LSmM5srNvkO-gpi9_-lcUYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220103

On 1/22/26 11:48 AM, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

[...]

> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;

Let's define the pin settings for the reset pin too, otherwise lgtm

Konrad

> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_s4a>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 
