Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020770;
	b=b3Q1akdisjcA+tHD0OZVOSrfRbStPYe0jItIQfSX0Y/49u9opOPsOsEQmZAdbbAxONtb
	 bxlrxMSzbJndtI9J95hMlYseHBJJearM7xo/78YPk0JxMMzpVZPpj6GKXqKoclXS2plFj
	 QPP2SXSecmM2pW48eRgujJx8jCk510Z2vWmXk1gBWf2Uaa66Qf2S0j82MdHgDLpeyTTsR
	 SgrTW49HFGs4iMuN4LO3tsH2UxCSYVm7TifxRRBiM+RKZFTr6Z/5+PJt6UDzxLw39Ggh+
	 sruReSIZzbGdYAxBrB2OuR4FwNhNvQ9vT0dhHumfNmR66nkUXJW9zF7oemuqeEpQEFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020770;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=El3w/0saMJR4Cg0hO6gP7gJK+ccnbO/QuF06gZeD5gI=;
	b=oqeqFHoW6DzfsWvIR8A57KPDt2AhOmXFsicXEjDu87AMT/WFDqV+wJGk2EH1o9X9XEpG
	 nNc6VERwJnxFQFeEGydXTw0yas0JdBnkY8RbNFOhvgaBcn400aDNfttRx/1FiF60V9kj1
	 vfQCwQm85aDS914BI8QBOXgnmjAs8KbiBc7ycVnVdXFkJzUCm4DpcrWCgXDzsAgl+gmpB
	 AXqcX9SN14x3cg79xKAoFBVVUPSfKnll85vlazKy+HVaaRpG+0Cy5of0sdOfgnPyE4zCz
	 W7EyzasppxIxLsYlr60AguMNa1Ku6149P8hCR9hqjSKoR46TuGD54Pt6o7nNcUeSHmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=h0MjVZZX;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D24B60A260B
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D24B60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=h0MjVZZX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2BF9C4F77B;
	Wed, 18 Nov 2026 16:52:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 082095FE9B;
	Wed, 18 Nov 2026 16:52:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8522911BC28D2;
	Wed, 18 Nov 2026 17:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=El3w/0saMJR4Cg0hO6gP7gJK+ccnbO/QuF06gZeD5gI=;
	b=h0MjVZZXVSczLoEXHDNG3wv+jntZZsmqbMQV5jBo6uI8eRFlz5sndqOdPK4kKU6Ue+f6Fh
	JxYrfzYmg6VNPoEt6s38Ry/wxRhUzwwbEP3/1vE/eGe++RGMgwkv+rHByW84P/+LFw84ua
	oY2DtjeJeroIo4O7eEwaC4uoPkmNkp3bZKfCwlZRkMzwbn+qlMhp3Q9sV3hVN/MssZegBd
	IEVHZQM7kPXOMz+3eiE5m8wYjZk1QCVk+GzMwh5JZUC4f/ZN56beIr9R3lOkMowUqU8LYx
	f92ZVmsXnNkndD9dJUfzLdo8sXT7Fb15JlEYYX1bs2y2P9/7kui2ySka3dsK4g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:08 +0100
Subject: [PATCH RFC v3 25/31] drm/bridge: add drm_bridge_detach_from()
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
Message-Id: <20261118-drm-bridge-hotplug-v3-25-44bb3b4a828f@bootlin.com>
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
index e0a1e016b37c..a29f3e60bb24 100644
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

