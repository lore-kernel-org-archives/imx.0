Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629237;
	b=qitlLHZoCsjw8pdUAAvhwwFzf6mXE3xoRg5CMk5BbD3Pk4jnDtbHtkkQjHbm90Qy512N
	 S0GEG+wEDBUHRTH94RIQt+iY0hpAZS7Zc0Uo8w816reRQSErVFV6AQpV0/FL2LgIpPap1
	 GOOBdJ9gIYfjMfm7eoUQRNO3EcqHUHnZzB29wdO+qF48moUBI+f0T2MekNy0lijQcIHP7
	 tAfA3qojB2K7UueydTwaqVgOgkOEOmNJYJMyNw/xP01A8lOxXiznCOR8/SS8lB0WRbut1
	 URQBFHIeHkhRtfVaV82Z5S0kobeHkkW4rlmMeU7W1BdFNgW9AK3lKnDPZxloa283vZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629237;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=v41RCzBo9IyyYN2Z80lXq4G3njAq/Qw5QKCjV8DY3q8=;
	b=oBE4SjjcVlaMEAi3rAXLQUjgyXDc9wp4gg5nhua79sJgFp/DghyFgBFiwDVTp/3nBYpB
	 Pt+Ufkoz09ZENw297f6DFj1X6PGYi+44kCTeMrrE53EiiVordHsit36r1KGakkEhpgOLB
	 6HGcJBaBndQfHIyncuxCci+PGNrkpbTKno1dTehiirzVQh5p+z/Dnl8uVN/ojQ6qWr9SV
	 K+dQ+v8Ua9dmI9lp6G+4mKc3uMGhKUTyDf8JiI3VZKhm4SnwQ6eK2qUfxdw5AWVev2Wt3
	 BaZuhaEWit1zXoVbFcoiaY0fI9lxdb3/4EUhqNAHFfbNkxIHebVMkqCNSzeKth2P6RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gkJhgpfR;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A2606A329
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC1A2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gkJhgpfR
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 975294E41785;
	Wed, 25 Nov 2026 17:53:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CD1660480;
	Wed, 25 Nov 2026 17:53:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 632A411E6B0CA;
	Wed, 25 Nov 2026 18:53:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v41RCzBo9IyyYN2Z80lXq4G3njAq/Qw5QKCjV8DY3q8=;
	b=gkJhgpfRWXlcUANvk7XjEQeQja85ZP01JGW2Y57zXlWWiHNh6Jeiv/TolY807ZfuUMdL7T
	lCsFFrgM1COOYsihsoaIQK9TeZl4h7CbE1nsr/WP3l1LnNJeq+FEyLZziq9uGsL9qezGOR
	I2e1LHEJZfAKVAwHDJcXKOtDy1oCe9XQ8OGauLnmmAd3l0pIcSK38992xGexIdteqe5dV2
	uAP3Igve6vOFCN3lDkpzJuyc4/tFmQv0O1bG/9ylGuC83MCVICYVrgjSe9LwRSQD2FQCr4
	/8cyEPh0dpzXVo3S00x70Pld9TbwRNmZJaX/ImfsUwMCgMXE7aSHKGHz9FUvcg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:39 +0100
Subject: [PATCH v4 26/32] drm/bridge: add drm_bridge_detach_from()
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
Message-Id: <20261125-drm-bridge-hotplug-v4-26-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Supporting bridge hotplug requires the ability to detach all bridges from
the one that got removed to the end of the pipeline. Add a function for
this.

Take care to not try detaching non-attached bridges. This is needed because
when two or more bridges are removed not in the backwards order,
drm_encoder_cleanup_from() is called more than once for bridges closer to
the panel.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This replaces "drm/encoder: add drm_encoder_cleanup_from()" from v2 as
discussed with Maxime in v1:
https://lore.kernel.org/all/20260609-hypnotic-honeybee-of-adventure-d89b7c@houat/
---
 drivers/gpu/drm/drm_bridge.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e0e0dd7fc12b..c00d5276e55b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -504,6 +504,40 @@ int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(devm_drm_bridge_add);
 
+/**
+ * drm_bridge_detach_from - detach a given bridge and all the following
+ *                          from an encoder chain
+ * @bridge: first bridge to remove
+ *
+ * Removes from an encoder all the bridges starting with a given bridge
+ * and until the end of the chain.
+ *
+ * Does nothing if the bridge is not attached to an encoder chain.
+ */
+static void drm_bridge_detach_from(struct drm_bridge *bridge)
+{
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_bridge *next;
+	LIST_HEAD(tmplist);
+
+	/*
+	 * We need the bridge_chain_mutex to modify the chain, but
+	 * drm_bridge_detach() will call DRM_MODESET_LOCK_ALL_BEGIN() (in
+	 * drm_modeset_lock_fini()), resulting in a possible ABBA circular
+	 * deadlock. Avoid it by first moving all the bridges to a
+	 * temporary list holding the lock, and then calling
+	 * drm_bridge_detach() without the lock.
+	 */
+	mutex_lock(&encoder->bridge_chain_mutex);
+	if (!list_empty(&bridge->chain_node))
+		list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain_node)
+			list_move_tail(&bridge->chain_node, &tmplist);
+	mutex_unlock(&encoder->bridge_chain_mutex);
+
+	while (!list_empty(&tmplist))
+		drm_bridge_detach(list_first_entry(&tmplist, struct drm_bridge, chain_node));
+}
+
 /**
  * drm_bridge_remove - unregister a bridge
  *

-- 
2.56.1

