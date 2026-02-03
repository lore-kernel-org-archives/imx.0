Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA07C3168EA
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137609; cv=none; b=ZhyF+5t7YE4+B/PmQglHXMlAKUahlpc1FARm0m8qH1sOm2DJ05Z7hlpS985KeZymN6MJsJTbiUnyxJc3opwSBykC/08lxJedjBVg4/H5Vh+44DvzJfw/X3zN/6rJfaEFQJsEkRR/hh1OVyQGFkE/taQrHFgWFTKo/SFQeYk2n1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137609; c=relaxed/simple;
	bh=jf1FMIBv5ITp4zwoevYSs11wKzKBjh5m7lCT367GV2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d37KSZ1V+fFkvhKSJdPM0SC8hALJ3a90NgEijUg1Xm4HM//0Fr87WdGoxCZnM/BE44ZsmkKeWhGoBQTsDnwd3cByqqvuicVjSNOHMgfcxAh5+jpn43OLNZlGEjy1d3QfnRJ5JPWQaEllZ/BQR5OF3zvLoqLr6f272kCJELc29dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ngK5+YA8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ngK5+YA8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D9331A2BC2;
	Tue,  3 Feb 2026 16:53:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E421360728;
	Tue,  3 Feb 2026 16:53:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C51D119A8888;
	Tue,  3 Feb 2026 17:53:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770137604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ibDtmuQVA6j42GniTwjElTySRXx2PReTUkYFO0TEtzU=;
	b=ngK5+YA89MEKf5Lyg9woI6zPXYK9jjhjeZMvfbGl3WkeDkJoKZn+MQsoOBUBLX3nGbPaPJ
	0ZuOnvRYmiH/E0y0mLOUrs1zcE8NQKeT4fEn7E8OYOMtf0amDNRuU/WNJoGWYxNRnzgXpp
	B8GD9ZGDIA4PleR9M3jPMfUnIfH6LrYDQPt4A1wQLvWAi7yhnyyOpnhJ9aUOHgrGqX+P9M
	zCT8cMcPOK8i3EBk2JeWQrGkdgobXxUsbTxsanIa9dI6EIClTz/6xlGkG7qHBdD4reiC0+
	ddP8UeAQ1v7TZ5K/stnV0oGgeG1ukjAlHqqd6lXftbS6farrYxI6Ofk5JqVavA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
Subject: Re: [PATCH 0/3] drm/bridge: imx: A few fixes
Message-Id: <177013759713.1993107.17429169659147772176.b4-ty@bootlin.com>
Date: Tue, 03 Feb 2026 17:53:17 +0100
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


On Fri, 23 Jan 2026 17:22:14 +0800, Liu Ying wrote:
> This patch series contains 3 bug fixes for i.MX8QXP DRM bridges.
> Each patch fixes a NULL pointer dereference issue and stands alone.
> 
> 

Applied, thanks!

[1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_ldb_bridge_destroy()
      (no commit info)
[2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy()
      (no commit info)
[3/3] drm/bridge: imx8qxp-pixel-combiner: Fix bailout for imx8qxp_pc_bridge_probe()
      commit: fe6d29b082d49df336ebb92226a3c004ae9e3222

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

