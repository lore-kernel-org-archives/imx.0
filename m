Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD88313529
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416428; cv=none; b=jhcAZ8AuqWJWGG2ZEmwkF4szCqAdcJrkQOY1ykhiOx6hANWMiiHMF58L2KK83j5cbEUtAdVunpPbIR8QEiyBSizNBpQgM+1mKBry4sPLxSFaYDCS4KX8vvTZeIF08wTo2eC3FndUe4h/ewEjXls0u2AIhPrkD/5amOuKSm+4h9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416428; c=relaxed/simple;
	bh=eBAJnpBvKXWMa0fIsEjvTakw3Ud/VQai74Ex6EWIqkU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FYg6Z2LExVGCJG1raDAgXl0og9MfhflMazLtDDAB0u6rBz4iIowLSMoBsjx8Lod93Lg06Vu4yESilBpYawh5D0Q3QqZAQittH0aslxV9D4k4PDIEAyjbpgizwqiMalVfstdOIswZGCIcMTcyo3RT1xcGiH7tAfEUSUZzj4Q9lzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Fsb1J3qv; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Fsb1J3qv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 634464E42295;
	Mon, 26 Jan 2026 08:33:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38E5160717;
	Mon, 26 Jan 2026 08:33:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03EA9119A8627;
	Mon, 26 Jan 2026 09:33:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769416423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RJK7fOiDsEdgNBqnNoS+yYdJDypAt+EMWhvumKttT4E=;
	b=Fsb1J3qvjFPYKpqKT4SHNAESEhf7nPztjLnFyLagSKCwsa1713E4v1ETHBP6De6EQjhfBz
	bTDB6V2ZzGu07c8qC4A/3bV2FhiefVDVHd5DXwNGsaRaoqE3tcbD6wyio42eoySeaEfgbC
	PYUrlI3WItjj4OmIpsZnN/kyTCWXRQMnixXi6x+eDcAH3ekZcme+Sb3u/4C1WYTEl5gLiZ
	HufcOTboaCfYDAMo5lXEQ5ORz/XzGPObLonHwdYe493pLtPX5skKDm1Dh18fTteGFD07A0
	bMGrGjxg5nBiP1da2oaXmGsgpMzUBO0vOXrqhIFNcgWUfO8efTCK37RZC1iHNA==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 09:33:38 +0100
Message-Id: <DFYDRSZBQBND.QSY119QND1GE@bootlin.com>
Subject: Re: [PATCH 3/3] drm/bridge: imx8qxp-pixel-combiner: Fix bailout for
 imx8qxp_pc_bridge_probe()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com>
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Jan 23, 2026 at 10:22 AM CET, Liu Ying wrote:
> In case the channel0 is unavailable and bailing out from free_child is
> needed when we fail to add a DRM bridge for the available channel1,
> pointer pc->ch[0] in the bailout path would be NULL and it would be
> dereferenced as pc->ch[0]->bridge.next_bridge.  Fix this by checking
> pc->ch[0] before dereferencing it.

Thanks for checking this code and providing fixes! These drivers have a
complex code path so I had a hard time in following the logic without neing
able to test on hardware. Apologies for the issues emerged.

> Fixes: ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the nex=
t bridge")
> Fixes: 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to devm=
_drm_bridge_alloc() API")

The bug was introduced by 99764593528f, while ae754f049ce1 is not changing
the bug, so for the sake of precision we can remove the first 'Fixes:'
line.

With that:
 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
