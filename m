Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0694A3B9D8F
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279347; cv=none; b=fZwdJsv9DRYDE1SfXu8PFKZxJKjE48+v1lv1X482CshTRoR4NoX5P3XVRQQfgUS2l+zGPpzduGKzWT3Vtv98hiD3ydHi1qlQ/bxkzDYiGs21iDU9SGImO/5B05/IjP73bqgsxOUVkFsFU/Hek0AVRqhALCWUV+9qJQ2v6t8Brcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279347; c=relaxed/simple;
	bh=gqtcrGTFr5nvODLGuJoR5tYCC5t26GFYZF492b0TvA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5+NvG1OExS8lVsN8BOHNb67ZkV5er1crMVUizE6m/o/wNxOSteSp6w1FD0lY5GkKL+ozOanB5bYn7Vu6dzI99PVOL5Ca0qKp2N27bYMFtKAfjNQDBXvTMdT6W2Tanv3iHT3WQjlScw7qqoRXVjE8reKVPWXYlsSpemLKPposl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awUdgDUO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0dfq9hZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awUdgDUO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0dfq9hZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGbnf3476267
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 15:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Amel3Ki2zXNrX/7FZJwT6RM3+K8dNmrSBRyTw5oSvT0=; b=awUdgDUOtA9GKwW6
	epj58chBC5hgvDphFBS3cJCt0leEZW2ZTBg6+HzWewYubr3zRiiKmdCtSgb0CHlm
	zeNOT25pYTOiXzO35p8ZGm6OSdG63filyTDx8tugjgSY4AzlvvU5phViBfcIfqEl
	GmksDUY2d8vBLY3tZO30+KpVwTFG43DuHJ62+atAd7X7WZLDzi07Y5h12cg9Vbr4
	mnUALKU3zP5dZjodYaIPPY1Fg8W33MHVXYJs3O8+qrHFMrnAncRdD6uficI1VA//
	+Mh3++CmBmoaxegzL3VJVhFBv4jRYUqL7aOTvxkF77nktkY2/Pt6gmPqg5jUsZJX
	HQV6hQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w0qfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 15:22:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-950c135355fso455385241.1
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279344; x=1774884144; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Amel3Ki2zXNrX/7FZJwT6RM3+K8dNmrSBRyTw5oSvT0=;
        b=E0dfq9hZh/npFnYIJbw/FZPErEQYfOzTsRnq+dX+hGBPoV3V8hTJ/j6EaFC1gRBowU
         R6uWMTf+qOsXYHM8SzPQ7hydMMkX+lpRKqXP4gATqmrYu49+8kphSMdsZWhZf9ix7vuu
         9VOxQqHsY5DlZ000GjLAxZfa5XRyoRrG0/cuoddDgwN4wht1YG+33skFayHtsS7g3cQP
         gqhokC2MFv4b/DUFejs1OHZ4PdQC5GMCk1mb/y7qG7wGldHS1nm7npyFcgY8h2j8CoF3
         Us9F2XLRkdU4bnrUc40YxlHCBl1QdaVCs7PFOlW684y67LWtn/gpW0pB2PbZR2Pb7Jj9
         JQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279344; x=1774884144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Amel3Ki2zXNrX/7FZJwT6RM3+K8dNmrSBRyTw5oSvT0=;
        b=UjePU+puIS2NJiEk+6YWHoUKcH+qZWcRFfnz9NtAIM71gk/WeKW9+xWGWtXyLfLoIs
         jDgZC5AaJ9Glx8lzAo870+qILKg336glJr35yy5jZaUUQiHPLtOhkvbZp0jgymNaSqIW
         Y6dUa5MtRp4r4kU7v60B3twbWJHM3gj5K0g0QTZKcrwr0N5TNkpU9u4CS4x9h6/oLROf
         DGrCdTabO8WTzsb3LLxE0dJhIptkSxRyKYbpjA+pPYrdqt+WLHiM7Rp7g3urjWKvqEUr
         o17FRtP43UrY4IInX5e/xGIVwyY2QFYCof9qxs+Y/zJ4J9FAmmCWL0dRMdNOAJ1p1+0G
         nzNA==
X-Forwarded-Encrypted: i=1; AJvYcCVA1S3W/ao232yBFbCtkQf60ghpZSja46Z6zg/KZd3vcyRdIZf+fBY7MggOOo9xW25TEpY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyV4gmSOpDemMgfSLvBwICS9hFWMWqH0AjokX7n1KMqcfS4svIq
	2Z4lepNvpdjuzakT92jFUuAfsS0fdVO1OSBquoUOV97g8XUPQzq+dUtJ6aUWVzkL0wefH8vjHVq
	Otg5N16Yg4O48S6FlP1en34KP1gmKC8I7l/yqP6u1LmqbKQWtAuUQ2IQ=
X-Gm-Gg: ATEYQzzP5wsT4MQb5SG/OCYSve8M0soDyAH5wdfTx0uub1s3c31aCmgrbXCoZ9wl9mf
	o75ufZiAj/wwPUx5iHdxtIuiF9o/LkG0wzkgRGpHK5LXo3gx/2AKkSuEMBtq8QqlkgXfkRwhIeD
	dcydX2CtmqZltMipcduBBU/v+DlHfoRkV//T1AFPUDeeyXQ0NGU23EsND/JtPlh6GTXQMhQJlNX
	VyZkGC1ik/MjWp7wbmIx1M4eolfK8C/Gw1ktR/NV8bzL37PclX67V2RmS+xf3jef63Mibxn9x60
	T9t5WagUyB3r8PxWoKHccbMd0F1PehJNN6PzzvjeS60lcS3p2cPmlHpykiCZzdv14srnayexGcP
	0LNxhJpx/uZoopLSRHEnoExvhxD7P6H5E8VKuwjhgfVS8T0iQRjulCZa5mPUmVeV2xQiTD3XNqD
	LMN20=
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2333028137.2.1774279344372;
        Mon, 23 Mar 2026 08:22:24 -0700 (PDT)
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2332997137.2.1774279343875;
        Mon, 23 Mar 2026 08:22:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a281b6fb0sm86875a12.19.2026.03.23.08.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:22:22 -0700 (PDT)
Message-ID: <2e13c91a-6d87-4c2b-8a98-0b58f97023ed@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:22:19 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
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
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
 <20260305-sm6150_evk-v6-5-38ce4360d5e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-5-38ce4360d5e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c15ab1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hKTp4ChWe8y635cLtM8A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pAiXMaKfJ-MB21OywBcDUOp_OS_lTOmU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX8Z+RGV46V5RW
 VR+y3nzKYYcmJzdLOky8WHUE+mVdqHm1ASYSTG0Liv/hkSr2JRhvxxx+idgVyd4E3S4uOYYYxrb
 Lv55vWOiWyZ3DZBjcqoGfvzEgO57aMyTSa35v/S/gr0kqzaV6bFKzUiUJ2rs1+QXqtOmd6clWAy
 KezVHeYbMu0Uu4oYw2garXan0oj+T41I/S6oWLIqj7gfDZKOX9i3O4d7FNyYcwMEJcGt1pOjzJL
 W0KepLD3p3UD0xfgbdxgz318/vMdsnVXtkoZpF6M/MRkluwY7NHFHg1yT8uzKdzv5FKsXNUEWA1
 isKwwhgC1l41uoEODXsHDR92kV705Es0YT2LUYZzCta202rzJQ4Y11SaEQ9xIt2pzCC44twCIrz
 YD9905uNnhVN33N867hoe/uLIis8Lxcb776qeh79MYX6Vst2uJhAhxs5xFOGNwcD/36ks8rt8Hx
 yQo5bbA7E/z3prBONHw==
X-Proofpoint-GUID: pAiXMaKfJ-MB21OywBcDUOp_OS_lTOmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118

On 3/5/26 10:48 AM, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Talos EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default. This DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> CSI-1 interface using mclk2 as the MCLK source on this board.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
