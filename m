Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1618B43634C
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 14:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918567; cv=none; b=O9BbkukU2+6uoGP8NBvjJMJjILrwwlRsbURwGCQMVkG4/i2rSKHhTVkmmjo6tF+jS2gdDDcSiOGhXsBKNjoSKc6rlOCCZjcBptg7xd+Wgy3XIbROvH6XaeTdu2LjzsbWFLb19v3ymEtcdv+dAAgNW2NuyqVRziBWPkjIbSmaw5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918567; c=relaxed/simple;
	bh=oq4ASq6khY2rYBGz2aotRBZA10LhKXDoOCFxTvWas/0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pncsEdILSiJctE0eITt1ZgZYqbTpWdXTd3gq6X8Eiqpme4xT5LYWOC8dJI8AnPUI750lDY0rhZVMmVU7gRBL7WleLF0iUY/tVvMh5FcMJHzFQiqB9fnnbEIoOkd+tYKhJp1PIhxHp/26JDshdn32CqjMHmblg7mMlzhmR+ebXdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jWxVCnbC; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jWxVCnbC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A69444E421AB;
	Tue, 20 Jan 2026 14:16:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75FC1606AB;
	Tue, 20 Jan 2026 14:16:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5B5010B698AE;
	Tue, 20 Jan 2026 15:15:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768918562; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+sjV4jKZbmaCgDV+GkMaLzLnPZD2hmO2N+9AYVVEwgo=;
	b=jWxVCnbCkzG1ahCUoIe6zWU7LBpBHB9DhliiM0lM8yu2Jq6FBVXrGVmvXCS3nMRLdeGeyC
	dhWRn6K1Rh+vjBnUoWUnJXUf4WRGtEXrsg7JshFYDmafpl8SIJdpySEakihoFFiDEqMngi
	iAmQzHGDrXCnxIn0Kyr75uMDpgbg2kBSbohOpxxCRM7qunkgrmR88S1QiUrDxqGpQDNc0/
	8Kr47qQmMW4s++eN70Y8Bug/+6qGCFfEInYJEtufQPtVVPjSs8Eio488J11LDjS0NqdlI+
	oyxbmSmIfSAnD2FxMebS1yS4b5RWHr5imr2k3tGt+6EBj/9wi2F6EtA93teD7Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
Subject: Re: [PATCH v2 00/12] drm/bridge: convert users of
 of_drm_find_bridge(), part 2
Message-Id: <176891855295.598401.9824700731247929118.b4-ty@bootlin.com>
Date: Tue, 20 Jan 2026 15:15:52 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3


On Fri, 09 Jan 2026 08:31:31 +0100, Luca Ceresoli wrote:
> This series converts all DRM bridge drivers (*) from the now deprecated
> of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
> allows correct bridge refcounting. It also converts per-driver
> "next_bridge" pointers to the unified drm_bridge::next_bridge which puts
> the reference automatically on bridge deallocation.
> 
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].
> 
> [...]

Applied, thanks!

[01/12] drm: of: drm_of_panel_bridge_remove(): fix device_node leak
        commit: a4b4385d0523e39a7c058cb5a6c8269e513126ca
[02/12] drm: of: drm_of_panel_bridge_remove(): convert to of_drm_find_and_get_bridge()
        commit: f675a276b84488e78287dd22c2e9461e4c008c66
[03/12] drm/bridge: sii902x: convert to of_drm_find_and_get_bridge()
        commit: d07490fb23958006bcecd6f2ba411571c099d104
[04/12] drm/bridge: thc63lvd1024: convert to of_drm_find_and_get_bridge()
        commit: 9d34e1a8cf7b643bca058a65f3441d90099b297f
[05/12] drm/bridge: tfp410: convert to of_drm_find_and_get_bridge()
        commit: 35dd5e1c089b6fd9f503bb15ebc1138d5a3f887e
[06/12] drm/bridge: tpd12s015: convert to of_drm_find_and_get_bridge()
        commit: 0bbca46cd50a527bded903ffe7f32e3761e825bd
[07/12] drm/bridge: lt8912b: convert to of_drm_find_and_get_bridge()
        commit: 31cb3cd7e7149983e279f3d6da3ae5757a965ea5
[08/12] drm/bridge: imx8mp-hdmi-pvi: convert to of_drm_find_and_get_bridge()
        commit: 7654c807f20701ebd1dc7e967270d017dcc36730
[09/12] drm/bridge: imx8qxp-ldb: convert to of_drm_find_and_get_bridge()
        commit: 32529d384cea3a9b939ff1b56aa30a13f8370129
[10/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach: use a temporary variable for the next bridge
        commit: e5e1a0000746ded4d9fa16fceda0748aec2b6e6a
[11/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach: don't use the bridge pointer as an error indicator
        commit: 33f86ac63031d0593e48eb0a738f2d1b1ee29879
[12/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
        commit: 685d0dfc37d081e56374852165afc8ab3b3e8d5b

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

