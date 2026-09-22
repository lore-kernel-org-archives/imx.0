Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77AC53A385
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092412; cv=none; b=uAjNSmlWo2F+YzmOe2IXZ471Ew0xVHwZIHAOy74f59YOYgbnWPnMMJnNuLHbiocyG3+M0SzuHJ30YATkgm4YBna3MCglvlpCkRRbz86CyGGp/qWRcuq1F4RfxpmHy7eXxrnrLuKs7QZKf409lvv8WrbsrFgV0akn15czeVYy62U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092412; c=relaxed/simple;
	bh=1ox+s3r/Lp49qOJnR5SlvSJcD70klbBFmDZHc2fBQ8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ky3mmXSGRZ5JXmqRHh+YxeKlJVHkRszXMlTcFwAd2cQ/eEKOxjWZ7HZJcXqrnU2uxGnAvBw0swnFTh0yMGcueXCwWrrI7GXeL7SfE2IuzWHUzcGFj3eSL8BcohvWQGWnFg+K+IHdvzusYBS/4h+gqRXZ7KCA+TGY8XrZ5WbexmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBnaACdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2gpw16T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBnaACdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2gpw16T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjmCk3952765
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=; b=EBnaACdN35LR0TSm
	uT7siCIIr5YiLkdMaOTc9tROU7tlR1y1s+UzHutqFfBbi8+Ch3QYxsUyHahLSxvC
	ejOgaI3Do89ZrKpZB87X3Y7Vvk+nsf7Mu0rGc5bgpdfLblnByGMve4+u6tTf8P2x
	x2BHtRANSr0XizjIT+lSyqYeD6brKrPMxeih3imdpakpN4v3BE5cu/vHNEvLa4z6
	oCLQ4vZmTHpwv4QgHFjVD8MdQku3ZmQyyREBT4JyPXbSHk4i9oUYH0p9KM+SxUjw
	JaLMj4gMa70WzUgdXcZkwAIKBh79nbkbR/r7yzNQcreW6va/2xOQ/ga3dXCr4NjR
	f70nsw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqbd9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 15:53:26 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so240403e0c.2
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 08:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092406; x=1790697206; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=;
        b=j2gpw16TOIE+RjQtijgV2corNRIFA3KPql58w9+PqQc1OT8ds+cFclLrriSNV2qhg9
         aN27PX4d2l/SXihlTOEVU1Hqc/hygZCp7IdCQjCJzcsqT+5OrQLww5qWOKhudbOfPlJa
         kgLqiFcqet0duDc8PHTxHbIKuBBY8Gbcf8wxBkBpgpDlVJvvuw8nTpvb3RADJY8uRbpj
         1c0K3R1a91foP2z8c6s0hrJmWadHov/Tr4SQ2xx4yR/igzHzEtNLYsxKneBOVV92jVUw
         9inTpUFBTmXrSfKC+AzLjk9/Ic03cpCGpnWOho4q89bHm6yzJFQx+dB33lLJO2Af/ukh
         T2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092406; x=1790697206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vyx3xVvWQDVKiKfZUlkZQl+55/TqlPifg4DigWt7F3M=;
        b=VQmh/kzMKGDCC5vqcECzStg4P3exGgC4UTG9P5vHsAeuwqV5vV2oVcZ3bOH9+GwXGI
         e/xIxjJaR6MGYiPJqd/lfCi9oLjJbP8EUViQaulKgtz64nAsYJT5rKz2PtRyIsE4mYzE
         lyqbcclDpIcf1cRi4ziHhgHSLY8hN7rYIHAhCVSPNfc6yWj6ThSboCMoJaUPUwEvcm/8
         aJoBHRGwpvZ0mV8LbGMpc3SoeZmittGvEBOopFsPVf556y8unqGL4Q25fOjDr+oN6a15
         vsQbxAWiznpTF5mWTPvqU3n0RHktf20lX+9tpt2CFqLHt5tc5x2KaOZ2OHaKaT8xXa26
         MKJQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5BMVQ/2mkucidMSc/B9qLRyYLckEp7VBIaz0OnNT8EZovZ1HZNYEHJd9eHfmCYRW8oQk=@lists.linux.dev
X-Gm-Message-State: AFuF++nq8Rnu5ZIxpT8dYYJhTIs+NWrlFAV9FxUn+FF1V+ALmnKTmvYn
	pFGRZ9oJytYmDm1xela3L4LAKZ/zDieWBa4rPwOGBxCACn749cV4K63/UgFbbngHv+fVIjnPLz7
	m8uIt/AqefKxHAg7oukLtcO1ivPzMPXHFSJikrvO273vk+e9SeHpeJLw=
X-Gm-Gg: AYBFou3jZlzCSP50sjfiE1GECPPcv60HlpfCQkbOgTSH+CCLus/pcqHnMU9QbuQqbOf
	KKoX44M+BJD0BH6z2PpmLgy/m2mqfeLf6SxVs9QMN/SOxVidu+l7lWO8gMkzzZ94CzHPrI9wVOe
	O/lrzj3+EUSHs9x1cCwl0jegICtSz94Mk7TFEOjBrs8rzI4xbC102bPPRD7UlfTo7IwYtc7T4ND
	9RBuB22R71+OjatbQTeSfgwC72GFkqinjiz+mMc5gFUJt7U/98Wag4pSdl2AA5oA1+Pp70G/jfJ
	FpfgxPB89MppXvO3aQYiekddRUsHXTCE5jyfaef0Jzb81CpiXPg4HXWuuevMTnyUJ1SCX9//674
	dElHdwnDKOrl8pPd06eAqJg==
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr6422288137.0.1790092405794;
        Tue, 22 Sep 2026 08:53:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5791:b0:7a7:12b0:fd03 with SMTP id ada2fe7eead31-7a712b10825mr6422236137.0.1790092405243;
        Tue, 22 Sep 2026 08:53:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c583022sm109114066b.29.2026.09.22.08.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:53:24 -0700 (PDT)
Message-ID: <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:53:20 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Y8ZxW0gCyTvBakVhagHl3Q2PQn9NmH7F
X-Proofpoint-GUID: Y8ZxW0gCyTvBakVhagHl3Q2PQn9NmH7F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX9jaDj55b9SvN
 CWUCJdGVNmzJa0Hkq5+Xqe4DHZF+pk96ipjLcjSJO1QN06ZfHx2rNrlRvhFq93a6i6NXqKkbOe+
 MXC/Atk6/J+/NdY+dvj7B6c/ryrnlRU=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab2a476 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EY8lGxjS-5OGnG_HtjIA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX/urpILRC8PQf
 j9JaXBy/VdP3ydMaTuGipJgWb9eTva9+dULZgQQKsF+D6dnDNdw1DvpSGeuTomxQsy5m/GrYpdJ
 da7cMyIkEsJhN7HMXZjlTk7XC4rf0a0Z9YTCzL261JqUEd/vYVEE40dHlzhjrZDqc1+bQvM0fB7
 8NpNWjXGUT9ACStc6AphXpJTk/VrwJOZ0/gI1kRmPmVDfrUh3qNKBerM4p7nsuXmYpdOe2iB+OW
 uiBPVDOki18hNixe1HNNF/a91jEHdhhkPY1us8p84GbKdygcCPWxBmqjeDtSSYkTRR+UsjEiRrc
 KJi9SdEkM94HYwlgFM9eapy2gJgnLp4pJEwpZhsP27lIGYpJKI9AERa2kB7Z4U85RUn6pOvHSoU
 ZVo4m8EMbQscrseX0XrhFZoixeIDgrPpez3XhX+oDf490y9A1uhPFxSTc7ys0VwUF0Ge1itXvnO
 wOfNSC7YS8iKbaXiDcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

[...]

> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};

Please realign this vs the hamoa series - define a port in the SoC
DTSI and reference it here

https://lore.kernel.org/linux-arm-msm/20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org/

Konrad
