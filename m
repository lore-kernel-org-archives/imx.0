Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020765;
	b=PCvxKHSkQDwp/ODejLXN1bqQcql4Lhzzxz3susSfy3o/++QipBTHBOr36mRl4ZIkhbOb
	 PMaqTsxHzUUsodwAXUZvLfonAJDcSSypbg5S6aWRrjNsCkKHKxkzrN+YUEMiQmCgmiqf3
	 ycWv0WSd4JKB4rTcod4fNx5BRUDa/0w9lqzeCZxFg3t2uocZt5dNs0XGfPsodarGUwQJn
	 szmalchHLeO3GQ4xNl034zolLVMI7v8C8XjywAkXgcParC/OkNsMkDNwrzcSfkxztXqnn
	 It0gJJCPCIimYNEnySfzIcPpw/Jp0t5WmesADm7Jm9gGCi3MLa0XikGy+iaYUzEri+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020765;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=WjS1TnU5G3NX36BJmuETJgLua1a34Ccm5l9F2qAupl8=;
	b=eXFn2mXsFJc2kRoFUwQBysP6UTN1nd4R0Uph4hPDkDJdgOMUTgVhkQ9fxdjr6Dw0yqzv
	 8+ezXprhPNFqFH6Ks8clx1f15PfsRkRfTruwUGewqTvXfyEY4eZOygE8hPwwwg2R0Jwfb
	 o4gWiyCMG2h7P+rT3SRyHFmxPA610rV3Mn0vf7MJFisaiQ3kL/zlxycdyPWJKN2ATNCPb
	 uXBykZH2hc7zuVmISRpS2xvuAyiKzgJX5JJ3QcKFQd8xTFGWfZr2Ua2IJ6jIiM9EGriS5
	 Zp8ptOQltvnZ/7pPADpozWrYGxySDJtvhLccKI/opMZp3c4ZEp47soXSKVRFM6PRU9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WTG9wZ4V;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA9D60A3838
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA9D60A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WTG9wZ4V
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C46BEC4F77E;
	Wed, 18 Nov 2026 16:52:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB1E55FE9B;
	Wed, 18 Nov 2026 16:52:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E2CA11BC28EE;
	Wed, 18 Nov 2026 17:52:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WjS1TnU5G3NX36BJmuETJgLua1a34Ccm5l9F2qAupl8=;
	b=WTG9wZ4VyVIGQ4UVZlXnb2w4efL7atDAKfqbP6xwYOhTVsEM6/Ftdd8i3cuRRR3J0vtEyQ
	4M633/W4wxKOISwgz9uQ1U+euEtb9PZljkIJDeqseRGvX4HzZsYdZ4+FCSkn8yCsmrGJXy
	z4jifcUUx95b388z+pbsyXZOzU9n4pCPwowHpekULkh5mTt28DmxsLAyPSpUMcu5jddSwx
	N1D/+Eyzka/W9W2BuORGq/XdBF1mG2lSw9UboJ4xoPF9kAqPNt8cYS9iijKgjZarRQfd+3
	7v1Jsc7ognwPhOcE9aVErcqsGC6RHV9cv3IN98veu1CeZcvASMI+vExX/jJqnA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:07 +0100
Subject: [PATCH RFC v3 24/31] drm/bridge: samsung-dsim: implement
 .get_next_bridge
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
Message-Id: <20261118-drm-bridge-hotplug-v3-24-44bb3b4a828f@bootlin.com>
References: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
In-Reply-To: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Add get_next_callback func to expose the next bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- add missing drm_bridge_get
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ad595c749957..230ac7b13a17 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1821,6 +1821,13 @@ static void samsung_dsim_mode_set(struct drm_bridge *bridge,
 	drm_mode_copy(&dsi->mode, adjusted_mode);
 }
 
+static struct drm_bridge *samsung_dsim_get_next_bridge(struct drm_bridge *bridge)
+{
+	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
+
+	return dsi->bridge.next_bridge ? drm_bridge_get(dsi->bridge.next_bridge) : ERR_PTR(-ENODEV);
+}
+
 static int samsung_dsim_attach(struct drm_bridge *bridge,
 			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
@@ -1832,6 +1839,7 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
+	.get_next_bridge		= samsung_dsim_get_next_bridge,
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_create_state			= drm_atomic_helper_bridge_create_state,
@@ -2204,6 +2212,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+	dsi->bridge.ops = DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 
 	/* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts HS/VS/DE */
 	if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)

-- 
2.56.1

