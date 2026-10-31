Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443812;
	b=xhd4tz1A5rSW8wpPcZP4ukMw+6e96ITlxpLCmb8BPKRDh0v35l56H+WDWSYt1yDYYMRB
	 zfUAwAnXe29oRcb75u/7JuqMyY2lSXq/GBfgxxA1GK3Lv6wI+o49o/QvSl6CeNwPNT7+V
	 ny1HesQl7qa3zC+gpXuNp8L2VsyhkYSRSIBlcKD2CfBGpVsyCyxlCC9mUkYi1KZ4+Jbc5
	 wa91wSUXVALfs6Bq77S7Z3TiL9sCwAzyVRk4C9LOx7O9oCqUaTmovoiOgwQabC4pqwz0w
	 wrIQmwC5cRSoeApDNLgm4Y6Jx1axM3fLLclPyu/D1THimcA25QwbtDUBSJKxhztzSsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443812;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=wfW2viipMB+TYAZ+Y4DJ13i/34AHklnHI0K1OUw0+KM=;
	b=IgUfJUENve7nEM3ZpBQXWHFnXuCphoDtPlAxXqu+Iprrswoyd5LMC4yVjkf6aVUlGyRf
	 FVeymdpz0Kx0Ch55N/dsxnYke2CflLs1orivkW9uHPr0/rfFurCMA2GkvgFzDUfFsz/w4
	 gOBXB5yKPdXRhJYoodbax/P/OSdhpmkdVDLnGJFHLDkb3NpPCV35vHzoZHgWN66mMSik8
	 x9pw5jhTqnzRkYccSpQZ2WefTOpWnX0tiW5Q8R8fVw3opA1dCq1ri1Dr8yGHKi7kL0U4V
	 7EyXPzt/BkT2IaEUhwn7U3C32bKdvfmIxQPZ80/y7EjNTPIvdRLYdoOtkWdOO5dz8vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jdJxIjJ3;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFAC606A31A
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 10:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFAC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jdJxIjJ3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C071E4E41319;
	Sat, 31 Oct 2026 10:50:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A10C6076B;
	Sat, 31 Oct 2026 10:50:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1C9410328D83;
	Sat, 31 Oct 2026 11:49:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793443803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wfW2viipMB+TYAZ+Y4DJ13i/34AHklnHI0K1OUw0+KM=;
	b=jdJxIjJ3ChsL6d8hPAAPLvEecTqPISyKSGZRNxVtOxAwke8yKEgptsX4zZFKhMRL9hdxOw
	BfK+XfFcbLUgMPqReS3H5MRyf2rvpoxSGy7ZozjCFRFAB/63KAsQK86vaIIXuO4Bwysabu
	tj/Kgdyqa6XTfdrkGoYypbDhxnJQ0JnOhRvFVGJoWpyincax4aThygQbABx52TtBKB26Kp
	1EtoW4BbWsFv0Kd58ffGuzr7DzUy/o5tVHMGGqcG2HxifVJgMrieCogibzySGKJnJD7kEW
	5nPDyJUmtSOatVCdoMD9KOU7CMA5bx3Q7q44WxILZpLDr/XTKaPUjBBiiotsSw==
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 16/35] drm/exynos: dpi: set the panel orientation on
 the connector
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Alison Wang <alison.wang@nxp.com>, 
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
 Igor Reznichenko <igor@reznichenko.net>, Michael Walle <mwalle@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
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
 Artur Weber <aweber.kernel@gmail.com>, David Heidelberg <david@ixit.cz>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20261026-drm-panel-funcs-v1-16-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-16-5e3070a3478f@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 11:48:44 +0100
Message-Id: <179344372468.9825.13949889516138830334.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> The panel is used directly, without the panel bridge, so nothing sets
> its orientation on the connector apart from the workaround in the
> get_modes() of some panel drivers, which runs too late.
>
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> index 74d3a2bebb74..05014c2e7d92 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> @@ -109,6 +109,7 @@ static int exynos_dpi_create_connector(struct drm_encoder *encoder)
>  	}
>
>  	drm_connector_helper_add(connector, &exynos_dpi_connector_helper_funcs);
> +	drm_connector_set_orientation_from_panel(connector, ctx->panel);

Patches 15-21 are quite inconsistent in terms of error checking:

 * some don't check for errors (like this one)
 * some do and return silently on error
 * some do and log an error before returning

I don't see a good reason, so I'd make them all log and return on error.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

