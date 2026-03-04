Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4533CB2CF
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650962; cv=none; b=JbGgOTeEk42h7p6noBEFkbRettkn11poNSIC+VBzN+lg/Tmx0Av/TVo8tpkbw8aXG5B8dh/pKQEaUR0QYu1QCNYWQIHjpAg+GVhz0LIu6I8o++7mlTzJOfHOP5RnL11xSwagAbggu6iMJKlbMEI1gyJV5g4cKb6SkoAzAEmifdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650962; c=relaxed/simple;
	bh=vr921QcGtFzVFWMBa2ciMyksUfCqCnRpo0Vb09A4Vu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZKXmoy3dsSVhet9u3+3XdvcNbiPNmMB2mZSeE4Pvr/FGnAHe2lZuYzqTAbCVmmoaU3a01iiwojJ8SadZC4pRGFD1ijt0G+sMyZ0quuM7jw+ikG3OmwvSrecnNutM4BlYMulT6RIvHd638wDiv3FizCBMut/jkKS80wW4ktZV/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdbduWmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IO4pG3Lk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdbduWmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IO4pG3Lk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HH7Mu3837884
	for <imx@lists.linux.dev>; Wed, 4 Mar 2026 19:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m3ID+Rt3thScCZWKCweYCrtA
	tGByTHZygFo61zkltu0=; b=kdbduWmAuOxgRJDnWHrdmZx794TiSXGoPs0P835a
	UMhWh3w9ExHrKJeno627eEYKhycPJQuEWxv+WeQMflCAKS29mFtKPfc9B3UZFkHd
	OdIBMrpmBn/Lkm7FWLFyH56RcYiS7X7a/CB4XXwZCi7xpwgCL/QRqWs3bpm/J9wc
	aETs6Mcq/4ycqyxL0GOK915RX8Cq6fBRdtU4x526NEnNL6tW0KUm7z8kFHkVYAEi
	vwFbJtZn8H2TD6IzTJYKCCNYmyf5T7XJ+azBvJiJY6+Echrw1NCNt6D3K1W0r04x
	MGKGz+K+plTRLHayID98c8ZeQETBPmNQJ0xQmWoIPK/RRg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m0aw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 04 Mar 2026 19:02:40 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56a89808d23so43323355e0c.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 11:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772650959; x=1773255759; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m3ID+Rt3thScCZWKCweYCrtAtGByTHZygFo61zkltu0=;
        b=IO4pG3LkvEiKU6Sq/72kFFjIPdkqByTrTbiz5VOMm6pzemtcmNb1gAKERjYMaCbXlD
         5aHYT/7tVrePIW6wR8iiMf+DBRzYt9fWZnsMkkEn4DFB0pTGEohaJYJkfXXZ+Itdi3+L
         oyM5jBsNYKSoMWHJerAdijBiCtl6mf2ixuLZpveHxgBvyhjrVVL3QWzwJwiYRNcZrVPc
         sNkiFdz2ryl0WkYdLq2M0dSzrUQZYOH44RiIa/PdKml6L0G1FHVUrr67xXR/SWeIYCIU
         IAIyTRNGraND+4mkha0LtodZadquYkNBKYof/NdgUYVuZKKfTHpDGohaq8kPQn4Lm/4C
         YO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772650959; x=1773255759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3ID+Rt3thScCZWKCweYCrtAtGByTHZygFo61zkltu0=;
        b=nXqBEoSfiP4Q2AoMRhKVZIugHIZwndGEQAKdk+KKrkHwnzIp7HBLt27lMeTVWVWhXH
         WcFHgZ5sLSyytizrwaHIvj0qbaEF8sfI3mt+3AT8a2uHuqG1GOP6N/HmaEEGEQguB/+K
         kz7AGi+x6Rg0Kdyu/6l1ogoTSMAt5xR5PayLlzy+FjEiBK0cQTc+aYDIXiaKagQ6YdTp
         l1rJ+QQX7a8e4FGs+jYeIW8PdnfMiNkh36VXooXGzLUom27bwCqKcYlEAaLvXgV4bloZ
         qNnmIW5bHNb1cM0DwteJgiQHua9y06BJd3gCCszDUQ4ZyDhFShORpEugnMzPMn8Zn5Jf
         ht0g==
X-Forwarded-Encrypted: i=1; AJvYcCVp+W+Lr18yptxGzTHEihumjw/5JfmEbz9O88/rRcLEw2EtSEk7sZIMfb/OgiFBLh0zFw0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5PPjY+5NU2QFr3/W95SanxYWE/1YYPF1FKODJE+9S1MYJd1DF
	92hZq3gOmTgL3JM118kHgVMDSVmSLBrL1j3m4eaIBOPMDn37xGG2Ycq5118qQPdUcs4SZv5KzPt
	9MvOcOVIwvLj+0RqCZEtMRrzbU1GGcWFkKIF78I7dsXZCptJFbfpOVHg=
X-Gm-Gg: ATEYQzwWbj94tNGTQyL4p7NWV/y0Jv9w64hXKKST2c9H+au7h1mf0oDQXGcsIxslMuO
	qFpHV3fAVEK0Zr4Zm0DzP8/VW/aIwvYBD5spxvHmXLWzqAphH1z/m5soOIXG/F0HPBs/gSaiuLX
	444rgp1jWK/tki3TJftyYYIzpWQWog64xbBJf7yelLcUVM+Ax2GIcop1CeSuSKT5OiOKt+VMSUq
	5pBEpwyZI+KkIC3y1i+9xAJMnvAXsGZHSBWml0MhWzDy0XelRxJZpS8y525F4cMsqoMvRQ4/2fF
	tbbpszw6GfI27wZm+0C1qB9OEXK1ALOekBIUBiDgshs/DXK9o+r+4ArQGuXLeidah/x7GxwKSkw
	VFskkNuMn3Bxhz0AQIWBQyiRCODsr
X-Received: by 2002:a05:6122:3d03:b0:567:638a:ce16 with SMTP id 71dfb90a1353d-56ae77c396bmr1558891e0c.14.1772650959116;
        Wed, 04 Mar 2026 11:02:39 -0800 (PST)
X-Received: by 2002:a05:6122:3d03:b0:567:638a:ce16 with SMTP id 71dfb90a1353d-56ae77c396bmr1558806e0c.14.1772650958386;
        Wed, 04 Mar 2026 11:02:38 -0800 (PST)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:ee0b:246c:2dae:77b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8a9542sm39209755e9.1.2026.03.04.11.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:02:36 -0800 (PST)
Date: Wed, 4 Mar 2026 20:02:34 +0100
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com,
        walter.chang@mediatek.com, jstultz@google.com, amergnat@baylibre.com,
        aisheng.dong@nxp.com, jindong.yue@nxp.com, xuegang.liu@nxp.com
Subject: Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek: Convert
 timer-mediatek to a loadable module
Message-ID: <aaiByowtXrTxPsd7@mai.linaro.org>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a881d0 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=mpaa-ttXAAAA:8 a=QX4gbG5DAAAA:8 a=IpJZQVW2AAAA:8
 a=8AirrxEcAAAA:8 a=4XJdlQNtnODeGaihWlIA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: rZ4UCzhceBrDUCwg7FoFw7PoxWEOnnnV
X-Proofpoint-GUID: rZ4UCzhceBrDUCwg7FoFw7PoxWEOnnnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE1NSBTYWx0ZWRfX5wzNyQcCVL9D
 4y/gZzpymtUELhMfqHdov1JzBEiamdXsrNQMc/qfLSLSs8Xg1Zana1mYivsH8ULex8at425hn4f
 6OwtqXssUbNYP/gG8Ip5qU2Irrcms4oYVKa2m/Z0zcD1DN5VTrsL5YVAizjIN4JGVdYL+SPybF5
 o8JpeD3zHFR+yILSBebZsIEfzSQSjFDeUkvVB3FAnGyP/x1T/PgOY329eyhUcjCUApY5w/Qv3lm
 bupG1J8FQ9rs6nRV4jplaiXpKu9Tld5mwoiWdEdrwmbWVF2KF6RKodlSaF7J7n+WII0OMjTyPar
 VG9zIlcvaC92zdBs/eAcg1wq/SkF6J6cNVz0aV6PGUlk0WMFbSRxapjEmgw4UNsM3jVpx0uD/rH
 J1tSWQc57MuPD3jwWm8uMg+WkA+8aUcBPaeryfLLXvhibNPXDmyeAt2mkO9EhpEJuYyyi0zYA/v
 fZjL+PUtH++HIpxnTEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040155

On Wed, Mar 04, 2026 at 05:12:06PM +0900, Zhipeng Wang wrote:
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> 
> Convert the timer-mediatek driver into a loadable module so that it
> can register an always-on timer as the tick_broadcast_device on
> MediaTek SoCs. This helps support GKI(Generic Kernel Image) modular
> configurations.
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

What do you think about the approach found here:

https://lore.kernel.org/all/20250625085715.889837-1-daniel.lezcano@linaro.org/

> -- 
> 2.34.1
> 

-- 
