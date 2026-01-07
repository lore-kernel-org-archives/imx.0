Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DBA322B6C
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791663; cv=none; b=oFeK7GORSgVmvCUrbJYtM9uOSZMiyWv8Tb9Kcml8G5ruxcLjWreL2t6OQMSjKH37QaH/sJfLY8P/hXT1f1q+FZcgaHpp8Z3AOT2cigHWKHwjF/2OMYg8bpZ/Dn6Urp7ciiItrXzYRj1ohKZ9YNhF3oX6SzYZmhcLVi7EHZt57Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791663; c=relaxed/simple;
	bh=0zQVGQ/4vnMKUoATvjh9ov37C2kOf7XhFIToOSDaJxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTbvswJssqayVSu5cAFLLF/JozWkbUk2kXjbyLWlPP0gLDNK+fXugjZZsbVniaKZly6bo5r6x4sC/qucRf6LxuviRYWKTYMoEwhGRy2d17UfZyKMEAJjzjZ62H1Oz6bnMAASEw7r47mQrEfVFChvLaNihGhu5UwYfuJw+mEK+94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VPL/1gSh; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VPL/1gSh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5B2754E41FDE;
	Wed,  7 Jan 2026 13:14:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2DFA7606F8;
	Wed,  7 Jan 2026 13:14:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40055103C821A;
	Wed,  7 Jan 2026 14:14:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791658; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z8r3jhEkERM/j9025rqzIp7DIcuzLrYHrvr0V9IN768=;
	b=VPL/1gShHDsKx9jMEWgIqLrVVM7kCFpCsvxC4qNSIJb3iL6T3s56oIpAjStpykLoAUSHAS
	d7vvs+y0WliMB/fzjw+qOpFrV+zPFwUHp3YLtBXTfZ9Uts98xj6KWgMb7I8xU9Simjifig
	OIIx3UrO38SoY3MESGgwWiPhD5K9Ez9db6UGwyiVa80VMW0G4k9zN4SzdeEcZi6OROnUM7
	434KVNJYaz8Ib/K303k1qdCQlKQ+YpXc54zgN5s2V/jDr1s5rp8tf2sGOWIso0oesLN2qo
	wb1ZtWfQKj3Iy2amidNZTo2v9ndsRzBt3FV80e+FsBD3rbXJMV7IRHP1E8eadw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:13:03 +0100
Subject: [PATCH 12/12] drm/bridge: samsung-dsim: samsung_dsim_host_attach:
 convert to of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-12-283d7bba061a@bootlin.com>
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done. Also switch to the drm_bridge::next_bridge pointer.

This needs to handle both cases: when of_drm_find_panel() succeeds and when
it fails.

In the 'else' case (i.e. when of_drm_find_panel() fails), just switch to
of_drm_find_and_get_bridge() to ensure the bridge is not freed while in use
in the function tail, when it is stored in dsi->bridge.next_bridge.

In the 'then' case (i.e. when of_drm_find_panel() succeeds),
devm_drm_panel_bridge_add() already increments the refcount using devres
which ties the bridge allocation lifetime to the device lifetime, so we
would not need to do anything. However to have the same behaviour in both
branches take an additional reference here, so that the bridge needs to be
put whichever branch is taken without more complicated logic. Ensure to
clear the bridge pointer however, to avoid calling drm_bridge_put() on an
ERR_PTR.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 19 ++++++++++++-------
 include/drm/bridge/samsung-dsim.h     |  1 -
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index d6ef64e68623..e10c01672efd 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1828,7 +1828,7 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 
-	return drm_bridge_attach(encoder, dsi->out_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi->bridge.next_bridge, bridge,
 				 flags);
 }
 
@@ -1886,7 +1886,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 {
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
-	struct drm_bridge *next_bridge;
+	struct drm_bridge *next_bridge __free(drm_bridge_put) = NULL;
 	struct device *dev = dsi->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *remote;
@@ -1926,10 +1926,14 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
 		next_bridge = devm_drm_panel_bridge_add(dev, panel);
-		if (IS_ERR(next_bridge))
+		if (IS_ERR(next_bridge)) {
 			ret = PTR_ERR(next_bridge);
+			next_bridge = NULL; // Inhibit the cleanup action on an ERR_PTR
+		} else {
+			drm_bridge_get(next_bridge);
+		}
 	} else {
-		next_bridge = of_drm_find_bridge(remote);
+		next_bridge = of_drm_find_and_get_bridge(remote);
 		if (!next_bridge)
 			ret = -EINVAL;
 	}
@@ -1969,7 +1973,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
-	dsi->out_bridge = next_bridge;
+	dsi->bridge.next_bridge = drm_bridge_get(next_bridge);
 
 	return 0;
 }
@@ -1988,8 +1992,6 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
 
-	dsi->out_bridge = NULL;
-
 	if (pdata->host_ops && pdata->host_ops->detach)
 		pdata->host_ops->detach(dsi, device);
 
@@ -1997,6 +1999,9 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
 
 	drm_bridge_remove(&dsi->bridge);
 
+	drm_bridge_put(dsi->bridge.next_bridge);
+	dsi->bridge.next_bridge = NULL;
+
 	return 0;
 }
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 31d7ed589233..03005e474704 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -100,7 +100,6 @@ struct samsung_dsim_plat_data {
 struct samsung_dsim {
 	struct mipi_dsi_host dsi_host;
 	struct drm_bridge bridge;
-	struct drm_bridge *out_bridge;
 	struct device *dev;
 	struct drm_display_mode mode;
 

-- 
2.52.0

