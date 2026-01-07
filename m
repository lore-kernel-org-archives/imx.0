Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8B431B825
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791654; cv=none; b=GDn03WnkZGFM5coPhpW9+pIu4PN+Yo/S2gPOdCNS6feaWinD5HDaTJgcXFobowRFY/+Jo8SB8crA+OG+pl2KF67oLNiykAVunpFoWrlGiBtV2p0ud4J8EOGUaEThhoPcsDOiIYk6ijhGPDVxlyfXCwHZR6wuPjdwlLLyDDnm+BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791654; c=relaxed/simple;
	bh=p2xqvlTZ38I+1807hP/0GR2fRtEE7HbvzGFnNU82AaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s+3H07XDN16wiuCEJZJlS1BrsXEsQS3HFBN75AlwoMgaMYwZFDOcjB4wzdyO39RHb6Nh15SDGl9/PIwk4mhjTY5HrzkxxWTCxD+cAx2uAxFywlMTwYpUtCkeDuQ7jtFwrwys4faBF+Kswytb0jNWhWplifkLm+C5M7rhQ/2cuy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=umQzvQVN; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="umQzvQVN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E45601A26D8;
	Wed,  7 Jan 2026 13:14:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2687606F8;
	Wed,  7 Jan 2026 13:14:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80936103C8740;
	Wed,  7 Jan 2026 14:14:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791650; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RBqUSZHP9faWTOajqmUZYb1s0xdbzsuq/IoY2BwG7wg=;
	b=umQzvQVNUyRPS5y24EHZZCJXGxuMgt0642mKmxUXB3y5Sj0BkjvtYs0fk/IItPAwaqaHJw
	CfaZS1ynKbR0Mu7BixQ6QT3drbM9K8MsK202+MIvpbKadB62+ccfrmJ5EhY1M7dbsZQwio
	V2iTg3xkRt8E0/PGd3K3KGjrvzhPIKthtTCSmk4381g9U+MZGLNk3x6WQNJYT1cXXdsqf9
	GIRuLvxBxHgfcNAlRouxvK+q86uA44tjBZoMDWbdk3+4d3Mx5+u8WqD3rjn20n8p/RPcIq
	4awG2rTD5N/kyJk0WD8sxxDvfLHLkfv55sr0tMFyxSjxJ828grX4UdEMAONqRg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:13:01 +0100
Subject: [PATCH 10/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach:
 use a temporary variable for the next bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-10-283d7bba061a@bootlin.com>
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

As a preliminary cleanup, add a temporary local 'next_bridge' pointer and
only copy it in dsi->out_bridge when returning successfully.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index eabc4c32f6ab..b3003aa49dc3 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1886,6 +1886,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 {
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
+	struct drm_bridge *next_bridge;
 	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
@@ -1924,17 +1925,17 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 
 	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
-		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
+		next_bridge = devm_drm_panel_bridge_add(dev, panel);
 	} else {
-		dsi->out_bridge = of_drm_find_bridge(remote);
-		if (!dsi->out_bridge)
-			dsi->out_bridge = ERR_PTR(-EINVAL);
+		next_bridge = of_drm_find_bridge(remote);
+		if (!next_bridge)
+			next_bridge = ERR_PTR(-EINVAL);
 	}
 
 	of_node_put(remote);
 
-	if (IS_ERR(dsi->out_bridge)) {
-		ret = PTR_ERR(dsi->out_bridge);
+	if (IS_ERR(next_bridge)) {
+		ret = PTR_ERR(next_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
 		return ret;
 	}
@@ -1967,6 +1968,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
+	dsi->out_bridge = next_bridge;
 
 	return 0;
 }

-- 
2.52.0

