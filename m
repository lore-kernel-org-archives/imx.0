Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DC12222C5
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 05:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602912; cv=none; b=Whe3eF0XTBr45YF7AcZDNsxiIbyCZSIJi4a1LTsAxJ1ss3X2NlOWw/msU26rLct4d2/S/asVZpFEgXhSbZnsVFlGmiBe92AlfAakGa8Ux1FQKhF4QKTmacWLWENhymhJiJH4ZlPGbMVDZoIZEVft+dqcKkrfuDWFhpGHRmmlOTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602912; c=relaxed/simple;
	bh=EuXdb769TzxSabic49+YuzfWZXwBJqDChmUmYS4MOL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kujo4gV9thKOcmJKBa6AGxDQNBMxzu+gc1oEYxYA/Dl6sJv35c5niy+a8J9mCTfhRLVWDSve+qOtHw3un4amWtAL1vFUUZ8+HZJqp6nYEa0FqgsPk7kObfW8pxdQ4tLUorsPYJMijK0yMmchCFkQpACHuuSWuY5k8IXF4iGMBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hnr/iguj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AwRr9teQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hnr/iguj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AwRr9teQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SNYt631704
	for <imx@lists.linux.dev>; Wed, 4 Mar 2026 05:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qt/HtlB2bl3WqSWGBiy3e0LJSkBn9/Il23j6YIhRm+4=; b=Hnr/iguj6k1fVonc
	PMAh9YyYKduzxadaY/AQVRXix8kVklW20hbfs4s9mODekG0CB1q+tK+nwdzpG4tv
	CALIf/u+fFnncbs27+mzPwYkkLo10pZOh13kktkNVjony2scj/G2CTSNxLxYSs9V
	SciVKIbgmDOOXBeSO11pQXJyK4fjPh00JmzqmZ/sC82DDg/6WA8jp+CysQv7GG0e
	h11vKx2xJWXE9EuRanpgJqdxzmtLu5GErLbIYi7/bsTXCJT3ytr5+SxDUwULFcAi
	0EjgyKuJL9NlwZhkARQXP+HZMQES8LDxBBeR3SGt9l/R1WFlXdebYVCSqVbM4TPL
	be8xTQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtubq3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 04 Mar 2026 05:41:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be2f742c46so5660408eec.0
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 21:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772602909; x=1773207709; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qt/HtlB2bl3WqSWGBiy3e0LJSkBn9/Il23j6YIhRm+4=;
        b=AwRr9teQ1ieGr5BFbdG4Q/kLtg9rICPhruBl3Y8R1QUEiHWKNoZXaUu3zwu3R2UAnj
         5k1tph/Pu6UPozgMLUuv/tmZiNJQqNuzV1/c9AbqDG4ntLY3zUO11uUdDFPBYdAZreo6
         kuFetFRiHcw3ux2J75/Nnn1iapuKow+RLMRDxBuB/fqrqp+RsAEWkN/LfHPUtB7WQhtY
         pyC2+2w8sJQC0xLppS7g694wY9hXxBZf3nreFpxQffmbyx03Y+MbBSQ2eH5EnmMWIdob
         ipTPCVPoXSxeMU5zuOmooLQZBFFB8h4v532zf6gzMPmE8OoGj19t+eHH19VdZxlldqKN
         nfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602909; x=1773207709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qt/HtlB2bl3WqSWGBiy3e0LJSkBn9/Il23j6YIhRm+4=;
        b=C1Z2WY7j9DV5mbaPqKGUL5mToVX1GR4ftWFJri2zfphp23xnzFu9oPuXmm+4RJTLZf
         zgF5KZQDpT60SEEU0zbI4ENZ/PN6B9+AlCBL23VSq64dxybdlarrzrR/T6ry3goqUI67
         0WsUUcwtXGgveOkahyAeIXj33AgklgkCr2QNnRDTiT3u4urvVRXG1y7EU8BAS2k2vg3s
         t4aDsQ3JHw1Fn9YR3XvhCD1yRMh04+NhPVcH4RBrBXIY+KnMcTt7rwKljsTF06v2DW/S
         kD1DGFLqFHTvAv9ChiAN1SEckkdMugXxDJxWxN2AJEbMEluUOtG7YvhWO5RJdlV47+cm
         tssw==
X-Forwarded-Encrypted: i=1; AJvYcCWKDu/ExdYj4yPYVjI+tbW7GRN51I46dDJy5rh+zg1+gkxdAKCQ2noVMEsjcIv5Eu9oNWM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8MnqVuZph9Kr6vW1HPDSdeA5gk4CqvvpdkfNyJGQtpZw7RDa7
	03U6b+ufXv+5/9k4qzPrst4KlVcuMYIPYtXAOhi1TJqFCdpqQq2J+hqxhZjToV7R4gbfwBQZFiu
	yd32w6RqbaBy8mw2IFWR5LCNWxAcfUcLpTsjbxOl5Ar5GgPXS7BslYIk=
X-Gm-Gg: ATEYQzygZ4LEioO8l9+kjkKuvxpKisTHIXx/beIJHVqn3/ycknVwmSA27kudVbeOJHs
	oFk0tShHeONKRjp2B0cBmFlExOtjSTBUZ5teZt6iLYNVnwSVTqfhOkPGrJtHGPlK+hbTq/fS6Ov
	oPYJwSrLa4jXMpYRDxZ73+yJgiJoQc5KyIE8s2OzwqAAsU0Muxn2iHsK87rzaAtuqnX8pTu1vSO
	3+ps+ZQaQ0PUJV9OjVjpzivSHmneOAQSZ6/550kqj6PVvWBZNyi2TMyhG04URiY71cCFeTi4RZt
	IEavPHMXL6X2Pq1ywAro1NeOE9qsGDoWFWUB6T/MO5BJ9zjv3LJcIuF6YnQGt6JiOaffTSEu5FU
	GD9dVXDOAwCF0A45fyxJo+LTMQv4HAMr6oNxubXrurlQPqg3xvTSVt1I=
X-Received: by 2002:a05:7301:1292:b0:2b8:30b8:58cf with SMTP id 5a478bee46e88-2be30fccf2fmr316291eec.8.1772602908955;
        Tue, 03 Mar 2026 21:41:48 -0800 (PST)
X-Received: by 2002:a05:7301:1292:b0:2b8:30b8:58cf with SMTP id 5a478bee46e88-2be30fccf2fmr316277eec.8.1772602908364;
        Tue, 03 Mar 2026 21:41:48 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1731b6b6sm6231081eec.5.2026.03.03.21.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 21:41:47 -0800 (PST)
Message-ID: <dc5191d0-831e-4da1-b498-da41a57b30b3@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 21:41:46 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clocksource/drivers/timer-mediatek: Convert
 timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>, daniel.lezcano@linaro.org,
        tglx@kernel.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
        walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
        aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
References: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
 <20260304025720.2583655-4-zhipeng.wang_1@nxp.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260304025720.2583655-4-zhipeng.wang_1@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pI5NsXH69ngma_EF71-QAeZCHEgdJXgs
X-Proofpoint-ORIG-GUID: pI5NsXH69ngma_EF71-QAeZCHEgdJXgs
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7c61e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=mpaa-ttXAAAA:8 a=QX4gbG5DAAAA:8 a=IpJZQVW2AAAA:8 a=8AirrxEcAAAA:8
 a=JS8otC1fTDAvhBOTJEIA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=IawgGOuG5U0WyFbmm1f5:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0NSBTYWx0ZWRfXzWCbp4spUn87
 9V6YSRtz7VGkFrWcrPEU4jRE58gM0NgCjpmp1vHtpzhz5H9gigS9+QhQffO6PiitirLRwlLVpb4
 gzeR2V3iTYJaRt+nvIiLfqUBEwWlGX07mqFT/mFuun8WhZH9sjcUbatZv06Oqm9AiPlsPjpl4VV
 NRhDMQkUGs1Csjj7E8O32cymxY0rmkZ23e7zt2bxkAVx5bktT1LXaF08BR2BnsUfouEjFSwmsJi
 1wpDHBwTDGuRTlmALg2bgtiwQQ2GR+WXTpfC/6ajmv5nsrYI4x2WFoiWuzyOP6KVC094ABVZJ9p
 1E8VWtJBvsr8Rvd3/rp/z95tNnYjgciJw0vZVanarJKc9H7LvmDUBtyHBQljy5I7bq7SA+6UcEL
 PxtI9jDXIcDevnuLjqQIP/VOPpgget6kGmAXCeSox9TkKFvU0L80aS41MGlMe11ytFqQHCeHb/Q
 vcS6Xc9PYCChAyYlkmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1011 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040045

On 3/3/2026 6:57 PM, Zhipeng Wang wrote:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> Convert the timer-mediatek driver into a loadable module so that
> it can register an always-on timer as the tick_broadcast_device on
> MediaTek SoCs. This helps support GKI modular configurations.

You have expanded GKI in the cover letter but not in the commit text. 

Please add that in the commit text since this patch will be committed
and not the cover letter. 

> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Tested-by: Walter Chang <walter.chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
>  drivers/clocksource/Kconfig          |  2 +-
>  drivers/clocksource/timer-mediatek.c | 33 ++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index fd9112706545..2112efb85029 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -488,7 +488,7 @@ config SYS_SUPPORTS_SH_CMT
>  	bool
>  
>  config MTK_TIMER
> -	bool "Mediatek timer driver" if COMPILE_TEST
> +	tristate "MediaTek timer driver"
>  	depends on HAS_IOMEM
>  	select TIMER_OF
>  	select CLKSRC_MMIO
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
> index 7bcb4a3f26fb..4ad4bac6f34b 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -13,6 +13,9 @@
>  #include <linux/clocksource.h>
>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
>  #include <linux/sched_clock.h>
>  #include <linux/slab.h>
>  #include "timer-of.h"
> @@ -337,5 +340,35 @@ static int __init mtk_gpt_init(struct device_node *node)
>  
>  	return 0;
>  }
> +
> +#ifndef MODULE
>  TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
>  TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
> +#else
> +static int mtk_timer_probe(struct platform_device *pdev)
> +{
> +	int (*timer_init)(struct device_node *node);
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	timer_init = of_device_get_match_data(&pdev->dev);
> +	return timer_init(np);
> +}
> +
> +static const struct of_device_id mtk_timer_match_table[] = {
> +	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
> +	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver mtk_timer_driver = {
> +	.probe = mtk_timer_probe,
> +	.driver = {
> +		.name = "mediatek-timer",
> +		.of_match_table = mtk_timer_match_table,
> +	},
> +};
> +module_platform_driver(mtk_timer_driver);
> +
> +MODULE_DESCRIPTION("MediaTek Timer driver");
> +MODULE_LICENSE("GPL");
> +#endif

