Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D2620E033
	for <imx@lists.linux.dev>; Wed, 28 May 2025 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422012; cv=none; b=ExglQy111qJTH+P1n6to7FMIpvrx4lCuIo/fZ16eTlq/qweCSgvMzwHzCYtQkxEHqtAS8nHe00anherl6P5h0s51A1vYcIXHlRZVfZJNsjGqR9luHGnpgGa4ZgIUpafdAen0ANn6KmzRi0ts+yJce8p+D4aagvtkHAW4XpvpXaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422012; c=relaxed/simple;
	bh=Fi+QiGSJC8uF2K0X5kt8vPGp5bckmVAYGE46xxU1R40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZllrtDp/kLV6P7wcW+70kuJJENKyam1cBHwS8JQK7X9iINIp4AkRIbW2sQhbrlk1WaqQEqT4ILk7WTcCozHByEm1eTx3GKBbaC/+Wgz8rgLUsk1pKGelTm68J1FxtvESUrmtclib5MoO5RtFQAh8g6Da+Z1dRyPe9ilXfPxzqdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYX8fy24; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYX8fy24"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S8kTR1015467
	for <imx@lists.linux.dev>; Wed, 28 May 2025 08:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DRzWkDK3ft+iwkKji/GjVMzB
	ocQDwCbSuP5DIc/EUys=; b=NYX8fy24OEESH86jLxZM9FLzbN+nsk41j6+K93rW
	ueBNg7KgmhdpslFMbhhc4lTXjuX2liHHDZxYeQ/+t5uz9RssxOwPIu4W9c2tZM+J
	CGtb5ziTFEhYj5WTXFiQn5KrflxgZV78v52nlevTu5N0Jjc4c+qYaCk8LOv+Tn+X
	X9OkFAJ3pBEtSkNYly3WQ2nZCCsEO0I5MNBO/kIJSpabr4MU67xuXpVyT/mgYo2N
	NHHOxlvQLJOx7rtO0uWJ3xj2jV7gU37aeb1yVu/1aXV7A4de+16hUocYKszCct8r
	MsQgCFogJEUBfWNdmeQitrcpH8XZeyPrbMesdFQBdkqzXA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcx38v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 28 May 2025 08:46:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faad1f2b69so41041056d6.3
        for <imx@lists.linux.dev>; Wed, 28 May 2025 01:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422009; x=1749026809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRzWkDK3ft+iwkKji/GjVMzBocQDwCbSuP5DIc/EUys=;
        b=u03NxlOJ+4y+2kibc2zyXMw3U4Kzh/K00udn/fNhQSghPIxlV4Zie2Klf6pbWmTwWM
         QbwGNMSjua0H131RgkgvfIofLXseEayxuMtsHIezyJBJfnB7c7cndZ7PLF022t8CH/K3
         FfWgESAguZBSZrJv7pyADviicSQ4HkvsnmEeqbHh0L1hqrLHWbZIyJQ+MjmlTZ3UGW6i
         UQ4ktLV4OPabTrVFW1LpD/+eBBohOT7zEW61j1hXKCw4wjRgyrdaCEexDxX1QU0jC37O
         n/VrSdGs2cs+RgEVY4rnQyB5rjVKQZf72qR5KZOtuYj2ZGyZ6yqybjjExC0AebrLHGMG
         z4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWh33M2o47cuxcLh3Hb1nLAQC0eei3m4cAiSxERnpn4IVC3BpZVgM24iVRhWfWKMBcVw8o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMX+OZS5hGYhQRaAzpcBrVxUNgUHCPCfARkus4BhDNKyg7H4bT
	ZY45yk4sY+0myRTUm6slWsvBM5YTLBsV8HwIBMYBfHgQ3sjA/3zDr3G2Q1F+pHRF4uKhGmzPngr
	08eR9blyIlRR+pFe4xzV8jfFqRxRAYYfM9g9UiCu5m3VvAd5BLvO/qMg=
X-Gm-Gg: ASbGncu62xqXEz3EIpv8Y+JSuEJACAm2McpnEokRWECW5h3hMBO2iHlBnLH3rOue/FL
	3E97/O9iebdgxwUoJWplggmwPNoS+wWymM9vyPi20ejdtF9H4O2/IfLFtofGKqp2sBe2lFKwwX5
	c3cxwTR51CfHWuruea3Nbnm9AItGrYajGL0UUXG9XKdi8LWM4RDAQJvHSE2Te2BSCotuQzo0aiO
	ibjC1Yl2vr07ZciMm0Ja/6d8hpkkZ3HyuOaYxwN2wXi+p+frTGdTKY19EG4HSXJmygcooH1YVkE
	xUIhkgv6wmjVy2lz51aAu+LHqbH5rxe6mYb8PVZqr5LK+ZoGnqAd/KYP4aJf6Bl280KTuL20wRc
	=
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008816d6.23.1748422008971;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo9qqoQrF01ykPGF/17EjYHoPs6gmbavsSE2zy6sawKd53Clq0hMx0BlOXLpAzfgtNG6M5ag==
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008336d6.23.1748422008535;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b3e3asm182752e87.234.2025.05.28.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:46:47 -0700 (PDT)
Date: Wed, 28 May 2025 11:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        broonie@kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <vjtgxpbpaowlz7ftryudf44f35jyaislvkckuzrzlpj25z25cf@vytjvui65gec>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
 <20250527082446.2265500-7-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527082446.2265500-7-aichao@kylinos.cn>
X-Proofpoint-ORIG-GUID: QtglfORblDj9qgeTZWX8sCzbLqqZGvp4
X-Proofpoint-GUID: QtglfORblDj9qgeTZWX8sCzbLqqZGvp4
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6836cd79 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=uJ6pKfArofpzZCl0i4YA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3NSBTYWx0ZWRfXwPCEGCLLE5iG
 /wHlLl8wYNFAvgH0pvG2qR5LkbstHdkIBoPGKlmj81KssSfRee/odJ7mcIYbwLhXu7pvi2PZS/U
 q8wwa9g4ywunYLv5J/Vz/ebbDSRvOsahyjtd/7l6A/MMXNVwPaFQ5PEvnznY41m4zZ113ogT6Yk
 kr5y9IngIorK4nDRs9+hbsOP658XKKKGHJAzpOmf0CbEtM6UJXiIJdP4PU1sKZzsEFtqDK6nXp9
 r+mLyyFoN5I2A7I5oNEFhiCPPcvXz4vlGg5ugSuuyXTstZs0rbSPJfW57oxFFyyStnKianwXm7W
 uFGpwJ+J4jXPv0+lw5pRvxKE0kn4jFf7dY9N0RlhhWj/vm+fwVh9GD1a+l+cWV3g3xhngkVmpDd
 0eNv3kPEMt0h2fj4LEQ0D4D+KwRAjxbv6G8VIS5FxwTVL7mNNR/iuAf3X0129MHiMvPXcgDB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=522 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280075

On Tue, May 27, 2025 at 04:24:46PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.

There are no calls to put the node. In the patched files the nodes are
already automatically put by the looping macro, there is nothing to
cleanup. Please stop sending this patch.

> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/soc/qcom/lpass-cpu.c       | 3 +--
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
