Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020737;
	b=QiBM2f3CqrWRW6dXEHv/8ezoRXw/mwzplDRB8cJxGrFmEMz+qBgQBiUCYFU58Xorf426
	 uY8ZxBgSUo6l4xDUsYSDDxfvqwJXw0jADXLMkgZuGIGbbwujem9/obcdUBrlgTnx87zjK
	 i1d86nJqXrEEHpC9Y5Yhadsbah240teOifo4tqr++cTloOtDUbuSKXlk1+NQ8w3MUZL38
	 4RJLtt+5NE0RyZuA2kYpAUVByhvxMaxuP1/nhKhPzdIWto2BiUEXRtNCU1X+Vt983FI9Y
	 BPptBms6Ft6AogdGafk220RxqLSyMYcpXQ5CYtvafnxEnW5el+lhRrJUszeuV9mmnXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020737;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=aN7ZfX2fzTUuVA8ldlfQcBZtVWylxKsPo5u6oPKsLgo=;
	b=iwdIxgwFKCq6yjbryN62tLxuYWcJb+izjV9TvZuH9qjr/uPW7JLO1i9sh+0rXU8Tu9bj
	 CZ6PZvn87QN5AzYkwGMvmPr9JW02330cQku+o/do7lr3SECEufmF5gC+bIXzpo8nZzmzz
	 Yaehs1E1PDhvmPBz+y5ocpQf7U1fO5NLXjFQcWzNeMMrWrCIIDy46QoG7ys5DSj0kruWr
	 G2Sbf25vZtHqXjFTRop/zN2xNRC7rB0A9TJaWLbv2i2AF+T/WX73nIRozA9cFIJzK2gJE
	 CCWPU96NJKZRkUVFXGC1fV2a1l4C0ydlt32QyFhBaP1BmnqKMS9aEKpsy0ZpUhvu9JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bgNX4NAP;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8D60A2639
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC8D60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bgNX4NAP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 76E6A4E41635;
	Wed, 18 Nov 2026 16:52:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43C5F5FE9B;
	Wed, 18 Nov 2026 16:52:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8CED11BC28D4;
	Wed, 18 Nov 2026 17:52:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020733; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aN7ZfX2fzTUuVA8ldlfQcBZtVWylxKsPo5u6oPKsLgo=;
	b=bgNX4NAPXcaG5Mb9ugUFKhvQfe61a1fXQ1SyKiFu2HgkLUHvmT8G0SceNCkza9LwVilR++
	/NwCiXLLAkGFaqZzNYNwlA17e4yvK7p2JCyNPFGCf2HpMFOlMzhYiTqJdu2kE/XbZ7D1SD
	CGUCT3RR+A79/NwHumgamxuw8A3jgf+p3nyEsq5MolqESxyljokP+lzvItH48k2OMj3Iq5
	TxCvwBE1aYkJiHSzFr8e/fm+LdV11S73YMiphwmXphNRTjqt62B7FN1WbywupCyL/3g1Tp
	PpmHDjfY7KgAqbnsBg33tFnyZw76ZtyxvYFJVmCFS7rDnZmPqJwo3ZWIkYXJLw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:03 +0100
Subject: [PATCH RFC v3 20/31] drm/panel: implement .get_next_bridge
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
Message-Id: <20261118-drm-bridge-hotplug-v3-20-44bb3b4a828f@bootlin.com>
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

This bridge never has a next bridge. Add get_next_callback func to expose
this.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_panel.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 560ea57591bd..11ca2d192669 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -77,6 +77,11 @@ static const struct drm_connector_funcs panel_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static struct drm_bridge *drm_panel_bridge_get_next_bridge(struct drm_bridge *bridge)
+{
+	return NULL;
+}
+
 static int panel_bridge_attach(struct drm_bridge *bridge,
 			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
@@ -227,6 +232,7 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
+	.get_next_bridge = drm_panel_bridge_get_next_bridge,
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
 	.atomic_pre_enable = panel_bridge_atomic_pre_enable,
@@ -610,7 +616,7 @@ void drm_panel_add(struct drm_panel *panel)
 	mutex_unlock(&panel_lock);
 
 	panel->bridge.of_node = panel->dev->of_node;
-	panel->bridge.ops = DRM_BRIDGE_OP_MODES;
+	panel->bridge.ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 	panel->bridge.type = panel->connector_type;
 	panel->bridge.pre_enable_prev_first = panel->prepare_prev_first;
 

-- 
2.56.1

