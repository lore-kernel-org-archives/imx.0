Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC593603EF
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 07:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914067; cv=none; b=pBDUBST9dxkgD7PMXbBY6ahDGNeA47orUb0MvVx4XBhZkPTcTVzX2WenZrvqVFWUSNDjOKDssDIRwx/uBDW8KpwpmyamMLkX9H2OMzGRChR+YGADPEy6Mb7ckZ5XMAqPfkzRgTi/+uG6wOYAtp93sUDJZqul0UieA8+diSaOBbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914067; c=relaxed/simple;
	bh=mFjmBnXylcm1uTfvR/KeQdHJdDZZ6azkjeOFaaGXsx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SyuAl7uuO09S5lVmv5La2RkEJ2Jbpy/iwR5DX3h4U2WUiizhTwp+ETrFkRAmtdZZ+XujAMtUf6rT9+Or7lkhLjiGGKysb3ojzmRbbeSescxfqO5pIZ4BjdXPCEkyCaFgsKN8iulHng/36OCCOhLcTaS8QDTOT2CHSOMfehm3TkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tqCVjOBw; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tqCVjOBw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 213B44E410F1;
	Wed,  5 Aug 2026 07:14:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8BD6602AB;
	Wed,  5 Aug 2026 07:14:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A93411C34222;
	Wed,  5 Aug 2026 09:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785914056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9ZRJc3/K8jWfYuPRvuIdzf0hyVL9OC6N5kDNbWjfFX8=;
	b=tqCVjOBwzd66RZ+R5VqvCpQRKbHC9tDt22LgJvpIFoFGl/9VPLxu/QnvPPtK7MxWo7ioj3
	3kJl1+y5LvmpZZNlrs93oNd6VJ2aCjfS2fPXGRIEEjoyDB8na08K68qyfZNcdd35hRo82T
	6ZjT4FhZok5kLuqjtPm2UpX/52wVbAYIn9Fi/9d9irLbSady68k8GWAI9CiGgLGy+pEyg4
	W/nN5wlScoiag7BBvg/hIo7bMggsJegNnRv8FenPGn0VqZ/cKnK2BhnAnK3Oen6WVS0pz+
	0sREcJ41v/Vx15b7MZeRKm/2Lik67aVkD3B5PNlXXYgk8geGGs3grVfthUH1tQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, imx@lists.linux.dev, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Liu Ying <victor.liu@nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
References: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH 0/3] drm: remove unneeded 'fast_io' parameter
 in regmap_config
Message-Id: <178591404454.122884.10665232219542066367.b4-ty@b4>
Date: Wed, 05 Aug 2026 09:14:04 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3


On Sun, 05 Jul 2026 18:35:35 +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again. No dependencies, can be applied directly to the subsystem tree.
> Buildbot is happy, too.
> 
> 
> Wolfram Sang (3):
>   drm/bridge: remove unneeded 'fast_io' parameter in regmap_config
>   drm/imx: remove unneeded 'fast_io' parameter in regmap_config
>   drm/rockchip: remove unneeded 'fast_io' parameter in regmap_config
> 
> [...]

Applied, thanks!

[1/3] drm/bridge: remove unneeded 'fast_io' parameter in regmap_config
      commit: ae2854a7622fa088a2cebd0ac51ef72226301e99

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


