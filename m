Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020798;
	b=PhpKq1Lecxs1yaM0yjPjPqSHDfX+KW4+xs6zQ6WVyHtbP4NTI4LaN3npzqL+bJFEfm+t
	 Qjnzj0+K72Afx+d6vyzdGAwYIhfHeB5GD3E6qRq39Gu3WetfsfjoZ3B8kG4NDWfYol12f
	 O2x8RH/uywBFOFw1c6R2Rwle/xP9p3CzEFLHykcPQh7Dww08dMuFEKqzhspLwTp4lu2Jg
	 sSd8C6aKkgWSjpbcyRTQe+FvDPganF/wh7CRFJdHna8vXNWJqoRS64uoIHqCpL3LPQqLP
	 bBetn8XSwv2g/TBsJhqJM+hOnDso1b4WXVUer1kCrvhh4yh7a/LeCaG9DZzTLm+aicQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020798;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=iAGzeSzQwFqFiRrdmKxP4pGyOW++Nadr+7x8PnEbmSQ=;
	b=4V8xFx7de6Hi0y84D2wdYwK7lQ6Emg6vCY5WIRRL/gHsyLkizLm/82gs6NAgNxCjNLlh
	 CfmRC2nvJmperlLgRYDIbGTA5MPNuwmgf0v302AOxwqws0DED1nX1IoFyG+A95emCOp8J
	 5hDcosXSN8hkPVzcXKsk5icTpRIewtRW75mLiLW4ZQxhPx8f5bg48V1OjZbm5YI5JYVvF
	 ybcsziQPtViHFR5qD7lrzBZJi2iiAvXykknLgsKy5XUQWpGgbVA9By0Wo4r1v2PzWQYLc
	 p74F70oC4iibbe7Z635twzZ73JF6r9tz0YhTtqnYkbI414zqmHH/XCaoGBkgJVCvh9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Wjyl9hRE;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2943606A338
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2943606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Wjyl9hRE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B2E521A16CA;
	Wed, 18 Nov 2026 16:53:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B7A95FE9B;
	Wed, 18 Nov 2026 16:53:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69E0D11BC2904;
	Wed, 18 Nov 2026 17:53:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020789; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iAGzeSzQwFqFiRrdmKxP4pGyOW++Nadr+7x8PnEbmSQ=;
	b=Wjyl9hREMsVMqqx8rCv7E+eKTYNGdme+CXHkd+Ur19lrSkXoO2ThBhZcJ2lyIs8SzB/ENw
	5CDky1x7oVwGE+vZsdE0JmKyWqYkTOdrO7ZjjlylRmaqAiiM4FyWSkUnwGli7DTpA1tXkA
	MdS1BV8nhaBY8zBkX/9QSv3YHV9zL1Al4qsMERa3Mx2qBYpS0Bo1R9+Gu4j+jGFpjtAmAy
	JI/JxB37auZtFDTLLezPIFumutGvWlhvcSWViXkVFjRUtSELI9l/5pYHiGokcFYZq7bELg
	WJZX7xHCWRg2XqVzTL2ZC8pfGPTWPX3R674Me9Wy2T0vemWo4mVdLPVTKxFBYg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:12 +0100
Subject: [PATCH RFC v3 29/31] drm/bridge: shutdown encoder and detach
 downstream bridges on bridge unplug
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
Message-Id: <20261118-drm-bridge-hotplug-v3-29-44bb3b4a828f@bootlin.com>
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

With the upcoming support for DRM bridge hot(un)plugging, bridges can be
removed at any time. When this happens, shutdown the affected pipeline
components and detach from the encoder chain the bridge being removed along
with all the following ones.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

changes in v3:
- do not shutdown the whole card
- adapt to use drm_bridge_detach_from()
---
 drivers/gpu/drm/drm_bridge.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index ea7ed2c3bece..0c2295c8137b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -29,6 +29,7 @@
 #include <linux/mutex.h>
 #include <linux/srcu.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_debugfs.h>
@@ -547,9 +548,17 @@ static void drm_bridge_detach_from(struct drm_bridge *bridge)
  * it won't be found by users via of_drm_find_and_get_bridge(), and add it
  * to the lingering bridge list, to keep track of it until its allocated
  * memory is eventually freed.
+ *
+ * If the bridge is currently attached, also shut down the encoder pipeline
+ * and detach this bridge and the following ones.
  */
 void drm_bridge_remove(struct drm_bridge *bridge)
 {
+	if (bridge->encoder) {
+		drm_atomic_shutdown_encoder(bridge->encoder);
+		drm_bridge_detach_from(bridge);
+	}
+
 	mutex_lock(&bridge_lock);
 	list_move_tail(&bridge->list, &bridge_lingering_list);
 	mutex_unlock(&bridge_lock);

-- 
2.56.1

