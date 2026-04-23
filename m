Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4FB3EDAA3
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948126; cv=none; b=qUkwD1zRenqjywjQhaHybucAuW7DkNyYw/FEuzzDtjn1pjLH+ZgCG9hOtfSX8Bf0drEnB12lSNq6T6XC/mSr9fVkoIBGUaUDreOiHgAw2balKxSiC3dKI2G/m9NkhAq/o2dlsuuIdrxDrShbGfvhMYS35FUXKaQACLmI6Dbg9gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948126; c=relaxed/simple;
	bh=KFmSssNsWA8OewITIm2Bsw9eL3yfUkRv5r3J8c4woog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdhByJTSd1UtAthnlsf2RmXDFnou235ewDHGuDsksUcJCb7ZWxEaRe+rdYyP56eDL3/Q/Qw0+7G+HLgBGBotD/yP+YS++kxpR0uoDRHIPSuBNHxb/X2mfJBIoN222fCwCG1nL+i+J8DRiyGn8ioxV/RdNgglwJGMwaxCOCD9D6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eC09PN2i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OVohg6JA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eC09PN2i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OVohg6JA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8tp6G179248
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 12:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nPbpkNj9ABhjGDGvKynwI0Mf
	HPrmaa9hsgMYHe0+7+Y=; b=eC09PN2i24nCZriljMh8JR/1ApJQAbNzTeI0q3AJ
	ecYJiOJZrZDmKs0KMclx5mM5sSs8rMozaTP5vcHDvT6EfMr8LxW+x5nNByuVX5p7
	0uUBmLUzk6EA4s/nXj7aqxxQ1tinWuC2x1wOaVAMZq1Sa2VVoYq1weIuCjZxa3tu
	rhcKGUnyeKVxQZozsBCCOeMugfw36mfVVMH3UPQW1yW5HYB/X+81gylFHiXPKmkd
	tsh9Aj5mT3OOS8YrlxbAJ+oZ/Hnm54MGwRs0gB/1MQOxg9xz6RvZyFyFinuqNOR9
	QAshNI31RpsjkNwnbsfUoVnHp16VxLx0svestX6bUeFzVg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62hfww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 12:42:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50edf0245b0so93914741cf.1
        for <imx@lists.linux.dev>; Thu, 23 Apr 2026 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948123; x=1777552923; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPbpkNj9ABhjGDGvKynwI0MfHPrmaa9hsgMYHe0+7+Y=;
        b=OVohg6JAJ+Mt7kvBiDVbUgy6qxn7+pkVmKSMnI+YwBaaje74exOaZmOsG9zo42iE0w
         x2vL1Fh52MbWIP40mQ0VfBBiZN6aIhEoA2uKXmzNwc+hC9MlU5qhmNVoqEb9dSNjmneD
         PGEDqF9ei9E6d6a5AUtjoevGAM+g2N3S2QSUkxRkbX5NL++D0B5+bzjf4tkkcnZwVVRr
         fVE5yidtj47WlrQZG4OgcV2wmYURcMXpqpRTZRdxs5ne0EyP5qRAW9g6svv3M8sdzOhn
         lef6uNL3VKmUv7Q3mmt8Vb7GEYKTtj795SIGZwNKWHzQHOnpY+NkCkuX9R5WfkPsg1iI
         O1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948123; x=1777552923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPbpkNj9ABhjGDGvKynwI0MfHPrmaa9hsgMYHe0+7+Y=;
        b=lreBd3PKJkUq92vEd6jjN9MmbJ6obncCgk5/44dKkPDb62afZByNRqibsZ4OVxFdlD
         k3yDPqR4E4nydcCelNVW8YhhZkZswJJIB19SEBn0xuq/BMKNv54rPV6o1WN1CTttwTWR
         7aQ35RLezVmuyKHr922H32z92mk7JW801CUTSvkzl2gTI8w1urue9rtgG5bVgw1q50IJ
         4vKFjYFWdGlxxwKIXNZoGax2isqI5BsC1khyU3uQSPl5L20IYdFUILs6DrzTPFHgx6rm
         y/IwlwcwkDLMUIVU24EFcIC6T0RRZe83cfHP3yYE6za3iQ33qwJQLhzezeaKVhwDc2jz
         YQhw==
X-Forwarded-Encrypted: i=1; AFNElJ8U8l7sg0gQrDETFH9OxUudvGgWXZwP9gFk3abYStuG8iBVIKMHCWPYWZBUgTdJeBL7IZ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwpaPuyGzRILNJw4Y789utjPVua3AfAGWW6DYsrxCNSCm9sm5o
	h91VC/Nnzvon/e79s7G81ckUEAlll1fKGQhDpcxN3DhB0YICiygFayqvsgvYSEijW8a7gw04yZX
	Re4j8eRCyoHgzFWtzKUy1FPAgBdaNvQaPt9taC0InE55HYpXKisci090=
X-Gm-Gg: AeBDievNdLXDydmYLy8xMaZ5Z0C1AhyBAePMus12t8P/VvPt2wTZLy43JNTKQC1H8gK
	uqd366qzXwe0n3pH5hZAM+waZO6qMWMrBrB+53r4sMnZRKWqagLI5Fv3j7Koh4hj8DZ0k2uUGWW
	EhMMsfg3HglsyZKpfok+WyvYZITMIqju6eiruwxVKXa3y/zypOV8NrfJk+ppd+f1jA3QbgWTckt
	XME6b25YPNkkWlF+c5Q8noSa0nlISuZlPKQP5SwAucOQ4dMdJBL2wa/X48Mc1NLP97JCaEasSOZ
	+gfIGqtXuRK36fej1fg+8HCKrAwbZbPhW0/pkqcx2wbfp+PafSrnmcSUTnur0ugJt6Jiu3y2UQR
	9ImBfHuuuf7Ht4MOL+qNoZSJy4aHgu+zi9RBHjt9HvyszZjBzXW2oaNEOSq9ykqRrXpLUfTQNIL
	rGNilfIrRErUeuA8eM13ek9dtPwhkV0Lq1gaNFrVtLgr1L/Q==
X-Received: by 2002:a05:622a:17c7:b0:50e:89e9:271c with SMTP id d75a77b69052e-50e89e92b67mr230996431cf.17.1776948122956;
        Thu, 23 Apr 2026 05:42:02 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50e:89e9:271c with SMTP id d75a77b69052e-50e89e92b67mr230995701cf.17.1776948122428;
        Thu, 23 Apr 2026 05:42:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm5134146e87.23.2026.04.23.05.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:42:01 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:41:59 +0300
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
Subject: Re: [PATCH v2 19/41] rm/rockchip: cdn-dp: remove now-redundant call
 to drm_connector_attach_encoder()
Message-ID: <lxwchrttkseoqo4e2njsyvpgingwymabvgoqh7xmwd5ysie2dv@v7t5q4qelqen>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423-drm-bridge-connector-attach_encoder-v2-19-2ae6ca69b390@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-19-2ae6ca69b390@bootlin.com>
X-Proofpoint-GUID: bd2nO1Y12Hecrr_4azugHt0dIo_WBpnz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfXzK4g+zhB7zrC
 deo3Tg+XTFwOJgDYMQx+M8N4K4br/dCU9mskyjmIJZESJ21nhpUqarWGRVrAx9hQpc/Q7IkNs0j
 0Kl87KfE4tf0lHvY3bXZ2HuH6iFECPfQKQ/Dbvce9uAa1aAiXpX+NKq0sUwqajnaNswjPwzRXNZ
 dDGaGax6f+dXgkGcVc1kQH+R+I9ECC/Z9Q6mjjceNHOLSC9uvZO4kEUpj0kuK/7zBN/ocC4i9NP
 1+tP+raoObPRnoLYwweTrUx2eLdhrviY4MQCg6C7j5Tioxyn23TOzohHHekeLdZ+IPuD0Nlz9u9
 QhRKWfJcXZba/RNaz85O4YVYoO4CAfa6bqVQjY2GMvXxXXON69mmE0cgThPK5qm2D+GAa3Ig5C+
 b6vmOsIdCB9F7x6UsW7mh6rTE+2HqyGdlPntX96+k3w8EjUsHrLvNnA3nuQqMhYyPqbcCogrrit
 8rZuQj522KMl96n8KKw==
X-Proofpoint-ORIG-GUID: bd2nO1Y12Hecrr_4azugHt0dIo_WBpnz
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69ea139c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=Gxjqsh2QC4DOxsvvGYoA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230126

On Thu, Apr 23, 2026 at 11:17:13AM +0200, Luca Ceresoli wrote:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().

Nit: there is a tiny typo in the subject, but it can be fixed when
applying.

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 --
>  1 file changed, 2 deletions(-)

-- 
With best wishes
Dmitry
