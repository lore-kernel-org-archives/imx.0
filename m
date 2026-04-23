Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7692F3EE1C4
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948160; cv=none; b=Y+NY8oFUBgQbeojA3Qkzm78GR2HRog1eeVN0/0qXKkNDudi9jGhhsTwPl31Fj3GJSSVA9QUn1nLtFWubSCOgZv57fwo93rxyokjhWP8nmsj/I2m4op/91JjoVZah2coYeq6rNZpSdR0p79ZS2EZrL0Jfs2p4JLxB172Z6E0HHMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948160; c=relaxed/simple;
	bh=Ge4aYiy2aawexHZUk69tmUY0pOxBVZCqbad5pQluOrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyd/tn+EientiwctVmsj0ig5yP6P3opz3Fp2L0XJV8px8FNnDE36XU93Zu9TOJDU0MJvnzPTwUJ5juqyZgYNvgMAWwNvCwIxbnHnF9q2/NqIldPz5GRMZulVyI6wAvqUkEj+V3dxLkXynbfENJF2GGjgKAAztmpMs0HLNBnl7tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFCmdbSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dxmzgSTP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFCmdbSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dxmzgSTP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uLgk987831
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 12:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7qCN6fA46LhWWbVU/958hHw2
	V513lfnGpAmb4yh0Leg=; b=fFCmdbSfyR4XRLkYWI7N0Tk+PjH+OUN5AhQQ62C1
	NejbCSHDJFuHdR9JsGONxsS2qNPi8uecZxrL5IALiMQxx+wQiNuphOJcfp5E8q9S
	fF/a4MG4M0jRNGEiAR8yWqA+IK3BZ9XAnUM2O7nHmiHv67WIFxlWGCcNYdaR9JyG
	nzaSHAyLLVuyd7ErqfQPNLn5fcEU2pkJybXPxN1K1ekb8qm9/LfmyLhltoKVJKyb
	+4bnEIEu2cSE4RDXfCzHHo8BnEhXG7ue92bfANCDf7pki1CvO7/Q8Pqy8y7BYNfA
	8hk/fetWEbNmajZGVeNgXM/fIq48KlUrsYscWVnczkm09Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q3yu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 12:42:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50eb8bad331so45783751cf.0
        for <imx@lists.linux.dev>; Thu, 23 Apr 2026 05:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948157; x=1777552957; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qCN6fA46LhWWbVU/958hHw2V513lfnGpAmb4yh0Leg=;
        b=dxmzgSTPNQayA9OKqmMk2mM9hBtRVo+ILbwIyDma4fIgKBWzdhF4Fgph9LzU/d1Tbj
         D1bQABExPe/zNKnLndPPUlm0+55wRmrEmh118KwlJYx5X4F1nNDi7VP0u8zF/yEfhUZ6
         mxxhqVcMryCFwTyYIqNXDjpFYjEl9DefiZjN8SSHsBeP2j7n9QBQbxvVU13XXlBp8gh0
         eviFa+PgQFY5m/Svy7SnDpbWGsfK+nyn/aaGMvMt2lSj+0xryS7JgBaTaXD6uD0s/W1Z
         WhEt4rMgKrlS77qVXXX+4bVCc1xpYQNpkHnWuyyeYaa1DPeqh9o8bzoOi7bqTskMMgZf
         yqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948157; x=1777552957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qCN6fA46LhWWbVU/958hHw2V513lfnGpAmb4yh0Leg=;
        b=eFA5+kF5Ha9tasrjX9cmZyrhQdNBZgthNWcN0iDGVGQZ/eJYlZO3yVE7U9Scm8wpMg
         gtxT+oiKToE7nGC0FZRCKBCJmLLxZyAIkENSNxq43HFLkfaKYRRuFfjfJVEancDLAG4j
         2fxDzcl91UT61zixjEibNLAnyVvUTQ9qj8YtxrTum/j/46907EgpxQaWg1IlEqzhruV+
         jHb3zzQO8jQW1egfl/OKYbhmzwoyay/2FKwgs605iB5PnvzoFNBIubLerlSBi/YpPc0c
         TIOM7s2M/bEHeqEb82litqqDYCNUY06IDBhHGOHdgndkwsycTcdmcRwlsLzxi5or7/kU
         Ptxw==
X-Forwarded-Encrypted: i=1; AFNElJ8XffCB2vBFa79EvLlqB3MVZ5LEs2PEj8kHkU08EAFicSOq2CN+/u6iUeubLJkXOeeyUV0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws1jwqicnwWyclSdlaIE9IOB8V4Nupl1wF5SzR55+hpcgz5W0f
	sclnQuE2F/Cr36KJmm0AS08V0pvb7zZt72H7d31OMprtVZtunURBPmc04NkuvNmPd0wCb9dsQsr
	bIrRh8K9fPPT2RgKvfMcN6qSegrBCk2XyPLZN2+2hgBX3oxGC1jqrJYw=
X-Gm-Gg: AeBDieuqyDhhMCJBTFT+0J7/cE4OWbzROlhoWZ0N9oj1NqMFpnkJhe6BAucVuyK5Njz
	erA4V9ZPSt3enaI710VDLqzNfKJ2WOXTpafTIX6szUThhB69w+SnZ8XEKH8UdqMH0nwTQg0uHml
	5aARk2sFKCPsRdvO9QcIHaVwFwejOhGvDNyZUkBIgJikpPvuXnYFLA6v+k4mhO0487lWBMAoDH8
	o3W8+YgPI4XId8O8bHREtWh5kkIQkEftNs78h88Hg2Zz4nwZDNEcXgdozn2fDe7pToSQR/z/opA
	y/pjiMZJ4SWrjzKOiC3/7PTR3uI6JIdBtdK8UHfQuXJO95GNZXph+fKx1xCOJ3V0gxlijaVjda7
	fFT6bQr2RSoJAfr7josXz9Vzgf2aulBgQFxZcTUMy1GsyYOFbKnhfBBy+aQ/aSOedQ76yrNbKlu
	SLAvc36w54gCEg4brFcSYj5D/mJeQB0zpn5JweyoUg9xpmAw==
X-Received: by 2002:a05:622a:1496:b0:50f:c2f8:406e with SMTP id d75a77b69052e-50fc2f8479dmr91073181cf.48.1776948156420;
        Thu, 23 Apr 2026 05:42:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1496:b0:50f:c2f8:406e with SMTP id d75a77b69052e-50fc2f8479dmr91072081cf.48.1776948155831;
        Thu, 23 Apr 2026 05:42:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e147bsm5123482e87.52.2026.04.23.05.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:42:34 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:42:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
        Liu Ying <victor.liu@nxp.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 35/41] drm/rockchip: lvds: remove now-redundant call to
 drm_connector_attach_encoder()
Message-ID: <wapbiwxou64emxlt6oz5slst3nvcgvs35hvhpz7v3wmwp33bzc@mvdog4t7un6m>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115334.444750-1-luca.ceresoli@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423115334.444750-1-luca.ceresoli@bootlin.com>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69ea13bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=P-IC7800AAAA:8
 a=Gxjqsh2QC4DOxsvvGYoA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: bsMIxB8tZhs9pZWli0HUBwcfXDOxyjHk
X-Proofpoint-ORIG-GUID: bsMIxB8tZhs9pZWli0HUBwcfXDOxyjHk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfX1UfkbN+rK/Bp
 g97TNTJpf8j7q/cR9S7MRpANHUu//1ubWmf8oCl2rzG/cT4mMdwRe4HOWF/io2zQZyP0od5hIp5
 wr6ePHhFWQJ6Z6JvGGKGLejyZsLwuGgI2mwPeYFgtjX4ODzCndv2TPBf5j/PU5dRHtTjAY9cNOD
 V25OAVc0U8lQuYxiBSkjCAIwDwOnGFYI+gCSExkzM6CXI5SmNEJu9rivoLw9ziz/eNlSNrubHHM
 C6b8Dze2BSHgpN5R/WYRokmJ2jyGrybsfGRZ8yQkTZZRcnO+S3kHW+dpXrUI+2dmeiP4qpLZKDu
 KSuZyThsn9BUr6erjTyMGgAaXd0TLQIiQQs3TjKYJVd8/KY9Mpi414UiG8/HO0zOA+1bD8xPJur
 sZNSVp871ipEIBG5d/kSh7LDUe2JE+jLioIDH1BVIkP8WK5hzCE3HhSHw9QXiPp0let7dLK2NNt
 KUR6nN9qnHbC8Xzpe/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230126

On Thu, Apr 23, 2026 at 01:53:28PM +0200, Luca Ceresoli wrote:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.c | 6 ------
>  1 file changed, 6 deletions(-)
> 

stray duplicate

-- 
With best wishes
Dmitry
