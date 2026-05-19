Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9544DBD7F
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187175; cv=none; b=IMqlLmxvyo7qw6o8Nv0HfiGaX66Gp+IqEV2b5gAMb8MJWebpolHXXxDv20Mk6yk1q7rTVfNv9ws+6pn+ApzrRPhhxNhtCanv+xcVh/Hfj0aNDvHYgGlZFfKD3C+csy07aitT7li9d9S0ij9gjEPXA2ExVN0sqr4KfLpRAWG+MM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187175; c=relaxed/simple;
	bh=aUCOP+agAjxZpckDbDUVdOmdg9Hu1iDIc5tgr+R5ZRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7MlwMrWUp/PT2tZlKQKJf+9q1hOUFvcqF3fyoz/i9uO89pzV5zviuK78TVaIe8Ul3cT1WCJPh4wm9q1ZDP2Wl5TrW7TKvWtetrJtFfTGapdAg6+2zQRWOQd3/OkrUgSuj5ygBZlSlnc5RmNGrRuzpLP6Aa97wWYrSi/R0p2rfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ViIgPYrO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ViIgPYrO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 482381A3628;
	Tue, 19 May 2026 10:39:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B9D4606E9;
	Tue, 19 May 2026 10:39:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1F01107E8AE5;
	Tue, 19 May 2026 12:39:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187171; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X+JiQ9ah3Zg0b42ga8MWBRYlO8NHJoM8q4bf6PzICZs=;
	b=ViIgPYrOdMaIUxl4rsKNrq8C+yslUUqrVKwjWnKL2ohmjs+1qBBlpZl2gzAKMY9GcKoCrm
	jP//QcpyRsQDZHyFNRiwjAn+7nIRRnvPYWGLlz+0auQ4bh2z/FTrY2943moaikGI+FGIuA
	Lz+qmrdRIBvZbN4Jf8WGuWadl65302xV1NR6+fHDwxgGwy06B0r1VG9H+vflq9oxZfW8WH
	2HDF3kw3WtXvoYtyG+WiSLj9myhaxrBzHXXsjz9rOvI9pjZIeZmUy3W+49mlXfMHv5lZVa
	LIlKglv0v+lO5V4pkypRNrb6UyeMfbYAnaAP5IroqO3guOkc1rFtatTIx2R1zQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:37 +0200
Subject: [PATCH 20/37] drm/bridge: samsung-dsim: attach: return
 -EPROBE_DEFER is next bridge not yet available
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-20-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

When samsung_dsim_attach() is called but the next_bridge is not (yet)
known, it calls drm_bridge_attach() unconditionally. In turn
drm_bridge_attach() will return -EINVAL because the bridge pointer in
NULL. -EINVAL is propagated transparently to the caller, resulting in the
whole attach operation to fail.

This is fine for current use cases, but not when introducing for bridge
hotplug, which implies the next bridge could be hot-plugged later on.

In preparation to support bridge hotplug, consider the absence of a
next_bridge an -EPROBE_DEFER, not a hard error.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index cefb20ec68ad..3c70a45c5dce 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1828,6 +1828,9 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
+	if (!dsi->bridge.next_bridge)
+		return -EPROBE_DEFER;
+
 	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
 				 flags);
 }

-- 
2.54.0

