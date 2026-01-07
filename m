Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB550327210
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 13:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791659; cv=none; b=CzUIIrGZaMRH0ff7aPcfbe++a67OJG2mCSsQooMrDERt1kTRiPcQlxUidA5ZiHrIXjD81QrZwYy7ZilEmODTK02gXZW3wxjsUhPpkSDz8QjKBIUgEihb91mEI+vkwhCEU3ag++HHv+b3EsVxWJP59e0HRw7ys/19dlj90x9N+cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791659; c=relaxed/simple;
	bh=Dn+K3m4aGl1Z1mJsQB8GZ76aTRlWtd8eO60Wnf7NcR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hqQBGZrcJrfuthcoFuW/snx6wC5HZlqQTm54UOPfvqtRHYTkLmMYUWBq7TtNBw/mBATk00KK8iNzgeCXJOZxuHbM9XME5pu8zIX0tJAQLOPd2+HUsCnM9dqQHn8q3/dd94SdoItBblYbQ0671zfpt7ggVXO6vnCKYelT8UiEpDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EI3r0BgI; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EI3r0BgI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 59DA34E41FDE;
	Wed,  7 Jan 2026 13:14:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D496606F8;
	Wed,  7 Jan 2026 13:14:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D809103C8741;
	Wed,  7 Jan 2026 14:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GNPfEiszRR99Hg9zGJV2mQMmw44h7wIXiX9qevh7Kmk=;
	b=EI3r0BgIwCa6z1A0ET3VIboXK6H3MsW3SdoIC13k1JuWGuCbC+bRcKzA7lCZAyqw5rqEhk
	eGTYD85kpVdY4gS2ovGjdcgMy283c8IP/jmAasg+ziYNu4sPn0SowIr0+7GWJENDYGBMQ+
	mh6ryDV4pRQ4Mn+WR/3vYZ2dFHF9btus1rp3y7a7pIsDIdU74/iKzMNerB3EctqZcqsW7O
	1NyzsL1DbbZGnlEmtWkRTvxes6lw9UUrd2lGfPUPh4rmJDMg2nOtccNVvsHbKpAjBPIUSU
	FOMj+bBQ+P7L0FSW2a2HtVomaSOM0WtcXuFT5XEBGXDL5Vcceu3R6ea6L7cUXQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:13:02 +0100
Subject: [PATCH 11/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach:
 don't use the bridge pointer as an error indicator
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-11-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
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
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

In preparation to handle refcounting of the out_bridge, we need to ensure
the out_bridge pointer contains either a valid bridge pointer or NULL, not
an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
redeference an ERR_PTR.

Stop using IS_ERR(next_bridge) as an indication of an error, and instead
use the 'ret' integer.

No functional change.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index b3003aa49dc3..d6ef64e68623 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1891,7 +1891,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
 	struct drm_panel *panel;
-	int ret;
+	int ret = 0;
 
 	/*
 	 * Devices can also be child nodes when we also control that device
@@ -1926,16 +1926,17 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
 		next_bridge = devm_drm_panel_bridge_add(dev, panel);
+		if (IS_ERR(next_bridge))
+			ret = PTR_ERR(next_bridge);
 	} else {
 		next_bridge = of_drm_find_bridge(remote);
 		if (!next_bridge)
-			next_bridge = ERR_PTR(-EINVAL);
+			ret = -EINVAL;
 	}
 
 	of_node_put(remote);
 
-	if (IS_ERR(next_bridge)) {
-		ret = PTR_ERR(next_bridge);
+	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
 		return ret;
 	}

-- 
2.52.0

