Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F264014A0
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461176; cv=none; b=GJ/gA2vnVrEo0Um4aWRGf808MGtajxJNaHW8PFN/w5FgBevYOLVU5HolTbcH3fauegg1aIHY8oXZKKlWsk235sRHDnGlauyBUTyrb0rCvJibDdKNrejRjMTeszaXXlBghsSfegGeCq94J2tpJpibsgAWK8FMoI6ChWc6qQbI1SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461176; c=relaxed/simple;
	bh=pATfqLu+e2vqZ4O40YVHYShR1JR8UGne+lTZ9RVoEQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8e5JlSSqnzp4SLKQoFFRLb/vYFNq/XUm6egZqo6BzGhDD3/EuRRe0Xoudhn7byuAS3MZdM9gokfA2msfvOVk0143C8/NJ7Z4JMpFmcQbKH3FLU5WwHTZazVA/dmwaWcK3I+TKGlJIZqrWJGh5+zJ5EOtGdFPbBfttz9AcRJZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGeUqWTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxA48me0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGeUqWTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxA48me0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B4MC93561526
	for <imx@lists.linux.dev>; Mon, 2 Mar 2026 14:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=; b=RGeUqWTVOt4Re0fA
	Rw6mJufAeAi28bVyMVkohFE5iZY6p6n0as0LiN73UTDEsoZKYEp5ZCqFWswmT106
	Td5LGDPwwjcuZG8GJQEI6i/P0ijVSG+Fu8iy4sFUPBrsSeMU4ZwZ8xLBGtmeq1BM
	dzgZ9FVkL2ahEuOrhHaM1PuNEkNXdcQ85GJpXQDyxHLUtQi95wK/XblaRoTugFgD
	v6AgbcIR0MEuVA3mtTJwybgNBA9BcRHOKpqWs23pS3GBRFDKWtPd92C6wHav9wqQ
	sYhfFK8xTHknlr9iWUSjsA1fEohCcZ11Pstvv1O+3VGjlCUpJq69xhSPyleZH3vi
	LUvOcQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bv8jvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 02 Mar 2026 14:19:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4025302aso383889785a.3
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 06:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772461173; x=1773065973; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=;
        b=RxA48me0Qs3GfgoC5eKaSdhBZ8Ck/P1ujpSIu4y/LDowIyk7uwbH37fA+cHPyEXq6E
         Nq0VEO86Anl/wgH9iAPbfIDgZ5L82uuOjLm+Fcdg2pzDccjfSKfLu9aZP7/3Emp2+QUU
         QTpyya31z5OWZHy1+tLE1rsrTuQofKrhnFGNgUK4Fhns5axiAN9C7IY2zV2Zfxjo3IK6
         cmYzN1ooRM2vvk9A0GnHl6zEXagpJdQKUR9hsIPXyy43y6PdkbcK/RWc3gzGiRHDRFGm
         bP7xv0Bb2Rcz9x+zxdH6fD71W8Bhckc8aD/eWboECOPU9Mi3Jc/LKVNxhfw5VOjhFcnP
         4VTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461173; x=1773065973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjo/kdQSRpPefoMLwX6+iCPNspce4EmQ1eua8UqXSEA=;
        b=jEFwIohitG9eVKkaIofNkktnXOOxBlOp66wTSdcERKutOpkdeICYFP8Gv7iFt8NTcV
         MvldQmVkVYReEv4fduom88lo7lPSH160bGtJktlo9kTyItEkwpcK9DZq41+iL6jvBztD
         lA/Os3FCJZubkSD9F+iLkBtPKCprC1nPLehgr39yeOsjQvDNeQrH1PhsDHfJMDqKYA4J
         W4bLc0NZ7Q4fIpdsXt3V3RDK3U2x0IZ8iDM2ei1c43MzESoqpIGxo5RkVvlYbeu2xuLB
         gCjL9O0BfG4eC65UjwzL66qMCMAbp2DAboywGi4GQSY6TqjxbGegIddxfrp5/CxsoihC
         6m9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXt0x7yh31Zu/07HQdpCtjObxF+8cZAva/EH4LqjK/Zk1UgtBNhnBfVpUp6drnxyfypZg4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvRD8u6SDxArOKF7Wf48dTQYHXFkfQoxeA1VhTln8rTdNnDjj7
	yxu66X/Ilh6yDGUBo5xqAfASLbHaCYvRvXDjiUDHM4Vw2G7UnSB//D+int2v6ICPiKcyumaNxqW
	AcH3Qr5Ns9FSg1szdD0H1XZDu4xrSQX+TgMCv3V2D2+ZDQti2klcKVPk=
X-Gm-Gg: ATEYQzynCpr6FRka6ePIU1ys664RZrRtv8uiPTYR6JSbefACHMgNpcqj5qiqXwLmubz
	iXvo0f0ycFKH55bmr8KglpcX2wGZ2cXtKBCgN5/aHIvGRMdIcVfdMtCMvSBQULHOHwnlVz7eJ0R
	/jQNiOB/yLKqbTsuzsQcXG5oU08RtsC34apIiDpnWNj1gcz9MC8Uv+jlEe2j6oBKNxXTXTlbSh3
	ZPaoluJ48N74DMQejLvSWXlo8EwyRj3tNGScEOizJ7wTFFNHRJjTreBji8kB/LSGYkiJB/Z/979
	DfTdLNM0+fRr4uEfvQBv6C/gBlZDxx25JO8N3vw46l0pHnAYjg7bmhHsGZBVDHM8lkolf7XkP5K
	OpjQpRaue4qtu3woQkLPBwzsnxoGniuvjNTfLB7Crjo/CJOZxRNHFsJyxX0k/rn/2afBTftM3Rg
	LXKF0=
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1228837985a.10.1772461173135;
        Mon, 02 Mar 2026 06:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8ca:2e37:ad06 with SMTP id af79cd13be357-8cbc8f467c1mr1228833585a.10.1772461172660;
        Mon, 02 Mar 2026 06:19:32 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac07c09fsm3499457a12.32.2026.03.02.06.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 06:19:30 -0800 (PST)
Message-ID: <9cb20af1-c2f5-4511-a066-24bc689d2fa5@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:19:27 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M
 regulator
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
References: <20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com>
 <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-hamoa_evk-v1-1-36f895a24d8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S-2vrBb9g9NIzUZ0tc34Z1QP80lOoNdb
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a59c75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=__G2b6sp-w7MuTAc3JcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: S-2vrBb9g9NIzUZ0tc34Z1QP80lOoNdb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMCBTYWx0ZWRfX8KFxVGgj+7AG
 z5NXT8OtBHZmtmx9/yHIZHfyYC5v0y8mzjLDCl19w+EMqP51Wl8t8InYUZP/DEXvlphGR+gpxJe
 wrqfzLanFSl/Tmlyx0zUpYRP/ONnMPjRT0a9Kl3TC/rfzrJK7cZGZoqpCnHMek406o/6UIJX9B3
 6nS2obSSC4rvesmTb2Hn+rUe/130pfFM8fXmh/PdDBGRp+KCgAAKMiOm5SS3hkd2F0NAKZ/gjTU
 7j0bTub8kpHCBTk+5OFbiHMoaVWH+dP9TcrgGFwTD7C4AVkCYdtGrAnfUjQmRQpuvtZ70Ejvxv8
 SFJkw8C5liWNDM8vf+3woD7+L8HB83tDgV8pnGciH4H2W1P7KdVu3vRK0NyJOzPDTlcKrDortLH
 NwKcmRgnsu9A3lHa+/gXxoaMW/9VlARdQDuVOA8C/m6MMfOBCxCv3OSKQcBG7MzFl64xc6DX+39
 w87NEy/UwykAmWZ8+Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020120

On 2/27/26 6:29 AM, Wenmeng Liu wrote:
> From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> 
> Add pm8010 L4M regulator which is used by Camera I2C pull-up.

I think this mandates regulator-always-on, as we don't have a 
better solution for that now

Konrad

> 
> Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> index b8e3e04a6fbd489f66bb44a02aba7b9746f30fe2..5d9af325c931ebbc9f3f8261d427a31e6da090be 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> @@ -376,6 +376,21 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	/* PM8010_M */
> +	regulators-8 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "m";
> +
> +		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name = "vrer_l4m_1p8";

typo: 'vreg'

> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
>  };
>  
>  &iris {
> 
