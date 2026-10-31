Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463586;
	b=ocbB7HlXxsFyT4/zugxpVY/UXJbOZWZutYNijd0nQ6wLb2xAGpvokwrZCJvaekoyJmDB
	 8ytZizMGcwfvQqSncsvhuusG+a1VszoRP7eEYcd+fg1TIBxUxsxFoDJMMvp50uUqiXNbP
	 JQDZdE+M2U+7FFa1RBVSVfARYGq2oGGQ+llYQj+ikFlLqtNV1Iogn6qBOfRQKKocuKFKL
	 Dv/ucb6i9zROfq0jM4nlThWIdVQP5mNQRBMnU+twjd/SePAHMbQoVmsC1lxzuelA7e+cM
	 qmEHcBta4zlmw0QVHyaW87Bv/Hpzb3epoxaa7y1REyKmjC5n/9K8uywE3sf3mDvmPLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
	b=5sBFm72MQjpod+sd85yxfyLgOkJ255wVUUhG9rvLXG0Fh5C51xX1yC6pKrfP9VgCJKD/
	 3Aj0s2c31PiUQBdo+k1Qp+SzR3oIG9FYlO++zlI85oVH2YOCXigBFKzmlHFdZQ+bjZgtq
	 U/gdxQ0obbGOg+PP5A23dokzOm7sSZWU7IFXGBn6pXTtbOBZOHpul5SRTH/0jVxMThyuS
	 RawrZNnWamLDfqLhvZoEHzlFGlaSmCams4Ii905NlA/aV3yt0/kUHR9tbmbcIuqmo8FvM
	 PkgsZEpdoBTz52qkkQyKR2bg8ZlBlaeGjgyQxnPj3/NS7it3+Ky6FmJXpVqBpe5E4wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mym7SJzv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cpzv8DiA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255BB606A320
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 16:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 255BB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mym7SJzv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cpzv8DiA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0WSd2789969
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 16:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zvoaKP+xUkSGJRscR5IFcdre
	CABepZREPTFbnRV1kJ0=; b=Mym7SJzvPJhBrW8cTjXDr3bK0JGoqkt9BOS67c9H
	AZsqbfCMihN1+Nnb64lqybfcq1t6P3fuqhRNPe4cbhfvNEsAwr+aXeQz7KIiVmOZ
	y6hpGPvDX/0Tm6yC8PcRy37IPLDwoGiLsX/G4SlKxq7/kkk6Ac6MSmXubqc3gwLE
	rVFQ3IeE1FRc3g6As8OjO0KUeklXIsmdvXMj8p12gJosHwJMgVb9r9YHH429jBqQ
	kQrIUFT+6LBDdr/FdpxCEWjLCfqiYFCBXo0lhlwQ6OnNsViWUejIKg1eac7xszF6
	8OcJsSUAO+yAIIg01Iw/gZopm0LimI9h4jcFJYlYQpYKpA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxhjb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 16:19:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f568dee56so300390885a.0
        for <imx@lists.linux.dev>; Sat, 31 Oct 2026 09:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463584; x=1794068384; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
        b=Cpzv8DiAk+Fxz+wFZaTfG/OZyvzT8780ut3+/M4TJeynM1bGVODtR15pfB0ftsiOUF
         0KKwYoLBWup8Ud8paXSwCJhG/uSgoOif5DEnKrMkjzs408arTBW79ApDzWJfgcn0bciu
         ukQNLiv3BuVvQoElDzBa1leAgcIFmHsrxqBlpGIUg6fN0cGjqkTgp/U3Mjh5HhllzZ3a
         uTYRCYuN0f1/MZpaa2Cf7o7DVH4xp7Fr3e+t+baAH1xOhxnLoecmGiOdBRLanPCE9C2E
         AqB3NsEjI/C4zPI+31BmXtZNIny6jbqKfyCdcIsn4z68EPhoFzMNw1NqzvpPup6qNZsY
         cHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463584; x=1794068384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
        b=T0vfcGzsFgVdkxv46OM5XKZCBPyEQpXyKRpQM3AOWFmPjQXpilUn0YwPd2frkzXeoE
         QtFFbXkJy9xzF19Pqy7nw+3B42LN6nwz4ug7m8q2HDoFlJgOH3zrslizTKko+3Pu7Txz
         3e2RLpswyYbJ2fa8G7urZriuxVWk1FGe+VfwiJ2K+6WBNoiOd4WhogjDp0EHomTjfGaj
         4YL/BrvNXpJLdVI0b2SdCjzVD4JeKyT8Bn8ntVaUN5BV49HtmZ2tEs2bgzFVEjateMgS
         C5oNvL1jEDdSn0f9/KFxXffOT0WeBsHcO6PM8EFW+1kTsJ5bU9+fFntnSkw5zl9x0ZvK
         rxqg==
X-Forwarded-Encrypted: i=1; AKwUvBwSme2MA1t2mCYeRqNR6V3JFynB0bPm8/U69FD60Z12ZWoqR9RFbBbD0YfBwPh1sViUSbY=@lists.linux.dev
X-Gm-Message-State: AFq9FYLhChTD8xkrBcPdCp+U8OQbWxV1krVPBgAZhZPnmznJNSg6R2Ne
	R0aurggASFhqqpn2Nhc/QZMN3xfx0yDdW3oaIDwI4/hxd7eaAMqvFmAoOx/QyVOEGIP/jrBerPc
	Z/1wipQP2BZxj9qEz67nWVf7rw7dISVedF36k9qejcBxAh3ae+2lf1Kg=
X-Gm-Gg: AYBFou3IE3qt5jTTPQYLehkOSU1kQvoKFG4RUDcdXweaBM5PKuCAg8ffPti3kg1VGN4
	zHNhxbCA2ReTW24LrSJkNIli1hageDs790hDulXHHcw8W2aVfeRqTb9fpKPJ5aaPRAj+g179Hs7
	NW/L+OiMp4Fe1nTMk1giPn2KfgSQu7VBMBfVmuLLj9JfNFcVg2XzYgtkeVONCtpQSwBQnP1ciLs
	ybwQWZ4Xxhi2RhN6XfAn7wlIAIq0zROGybjG9rWViGhsjz8hTA0sJmL/BQpNdIavWOPJprmLc4/
	lGq+h59HexbhjwwRJPbhF2LsV3EM3SXitIQyhsP15dIm1andfHZoWL7k6ZIC4TAqLOVtV91vgw2
	1A8wwE0yh0Lm01wN3qIEAiCHieXJfW2UjrlPcyHpxUYKPjmchyyN9t6Y7Xdhcrmqj6gfHWLKHU4
	DJZMy02SRkHwgNl4eWGSvOC2EBk+uCoItmD1nZyxmU+tBSGw9MW75AvZM4XlVPNw==
X-Received: by 2002:a05:620a:1793:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-944216f3483mr979229985a.60.1793463584149;
        Sat, 31 Oct 2026 09:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-944216f3483mr979220585a.60.1793463583497;
        Sat, 31 Oct 2026 09:19:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbee0094sm12126731fa.20.2026.10.31.09.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:19:42 -0700 (PDT)
Date: Sat, 31 Oct 2026 18:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 15/35] drm/bridge: anx6345: set the panel orientation on
 the connector
Message-ID: <45e2lt2ngv3ozvpapexui5gicabcvhsxfhrwwq3pdakmdiyxnf@mag7bgkjplav>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-15-5e3070a3478f@oss.qualcomm.com>
 <179344372467.9825.11469688608855257522.b4-review@b4>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179344372467.9825.11469688608855257522.b4-review@b4>
X-Proofpoint-GUID: -i6mGICSgC7x-PhDDPoNTy0yivHlUl0D
X-Proofpoint-ORIG-GUID: -i6mGICSgC7x-PhDDPoNTy0yivHlUl0D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX0qev2IJofqG2
 rwvoaBTEa5NSzHzxkRCjMGbJxhbB4bn1Pms0fsHiUMC9/n0hBXcY8oqkvzDKI0NUmxnBC7wuqh5
 05Q2M0TczYk6CCIvAqD6XRKlnWqOfH0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX8kmwIn61w3n8
 9OiEXqQMuHkF7FxVIyw2SoiiuNwfhOBd5LlMlUBwzcpBdmGpTLkMcOSJf8vN7hqaaexzCu1J8iK
 xHm/jDPR3icWO8nwdi3/FMRIgpyU3cxOh5+hkcAfZMzSy4BV8YxqtGsNnlpt1hbzoJs/TqDjSgl
 3Nv1dNjE37hriBgk58935eRGgM3jenokCpnqCErcEXXbDRiTLMaTAQ88sEcMVgsdSretTHl46rb
 ClJWyvYobiNR5tyEKzmxKY9R6wvidVeT2fteet5TaVaeY1U22dJMXrUmFMQEGBO8WP4j9K5Mxto
 tKyq4ZFcA/xEgJmsRG7cDcmERPm/hUfJP6j3ZfN1XP56WPSnTVyh4uYOGKeIZDOkV7yBNxkqWxg
 ukoAGQvoB9pipKznNVGmYyAIUqAw5o8c33NtFL5S/ZPjEl5pqnayo3xGlyMZ/jHiQxZGmh3BFl4
 ZYXlXlmKRiNBY16i2oQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae61520 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=1b4m9KtQkR1i_e9s8qgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

On Sat, Oct 31, 2026 at 11:48:44AM +0100, Luca Ceresoli wrote:
> > The panel is used directly, without the panel bridge, so nothing sets
> > its orientation on the connector apart from the workaround in the
> > get_modes() of some panel drivers, which runs too late.
> >
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > index 407834a03b63..91ce1a877bf8 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > @@ -525,6 +525,11 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
> >
> >  	anx6345->connector.polled = DRM_CONNECTOR_POLL_HPD;
> >
> > +	err = drm_connector_set_orientation_from_panel(&anx6345->connector,
> > +						       anx6345->panel);
> > +	if (err)
> > +		goto connector_cleanup;
> 
> Muy understanding is that this driver, and those in patches 15-21, should
> be eventually converted to use the bridge API instead of the panel API, but
> that's a significant work and so for now this small change is enough to get
> to patch 22 (workaround removal).
> 
> Correct?

Yes. Refactoring the drivers to use bridge API is different, bigger
project, which can be undertaken later (or in parallel).

-- 
With best wishes
Dmitry
