Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629129;
	b=0+9VHa3nKYooXAr1iBPZINyDYW3PT6mVfd135sDIaewMVSAGw9w31gJOOIcbw+eB0Ei6
	 oCpxojKr5h0W/xuV3UxydMbKp2ciTFub2RVfGxqy4mwiYzd4SICFVMWmVjr/mRIqCRtfA
	 J+w81Hm5iEx/UoIuXRbQ0ZCtQ66F9vLnyDDFsg1yRUVC5RPDyoWJuoj3VgGLFeXhpUoPC
	 YNAUqnFIOcKtCXYDAAkTonKipdZ5AkkuxXSTd2H9jTNs3/x4wvCac5Eb3ADG7C3BsGKuQ
	 SwVySsYywctHMyoC0yda4P8+jNKAn35BgJwLO/21cQlIBK6x4bo0XVcS7PqTNnNUHqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629129;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=vuh24Tz6QmyYkaBRVNh+qXgTNEqAkTxRwqr0CV9YLZo=;
	b=auPWmVKA34NXzKZOlTk9oBVGiXprGoxW9eqKUjdHHGgeqgOyeTXZFR5bOqWxitHxRBHr
	 TN8gLJuwbEZAb57ijnHT0ypen/tnw+fg47QsMQBKQ18m8l6634JgARRLDLA+wbGKF8Ncs
	 2MlZ/7sskaF59Sa6FCz5YyeB0n40y2SvZIsnpCq4/IBm+w2QFbtTERh1U0qlyxDUWf/k0
	 7oovfFocQUkhLVmtQ5HEuuj2j3Z6lWtH2/mWERzJepVuggAVSbzsb8mxdCCT7vE2vKfhT
	 P6iGJZNyJNyJGGBJv8eXoLzCivMff3kjb/LZMW/EUgX1EQB3+Y8Y80okqdkHrjpBs6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iMMCtZhf;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F000606A32C
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F000606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iMMCtZhf
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 290651A17FA;
	Wed, 25 Nov 2026 17:52:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8BEC60480;
	Wed, 25 Nov 2026 17:52:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 874D811E6B0D5;
	Wed, 25 Nov 2026 18:51:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vuh24Tz6QmyYkaBRVNh+qXgTNEqAkTxRwqr0CV9YLZo=;
	b=iMMCtZhfwLy9rRPhKznCaOarlESxJ8Lt/UfeRhqOHmXXYES7WjoHIRrzbO6p+LRwkl8+qG
	nDU3jX3WlXAw+ptVmr4cnbZJ9YxszxGTDCTHVR8i101HmKizRDPKjSut0PQz4oWMb5v4Rp
	Mij52wSj0ooK3fVXKl14hVy08+OfuSEDH4luOUyaECpZ6mG32F12HU1AJGaCT3NBxbersn
	aRGXw4k0hSTYKTPERDeMIQDXNROtJBmNaIUpmgVJc8oyvVaQj4tJMpCgvlu+LmH9f47SqI
	/G2ji+GvI3eMwBi4o+2OGIvFyI8LGwiNmiZMNLQjCO70AEvYov3+i80Htd2KiQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:24 +0100
Subject: [PATCH v4 11/32] drm/bridge: constify of_drm_find_and_get_bridge()
 device_node parameter
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
Message-Id: <20261125-drm-bridge-hotplug-v4-11-822722850492@bootlin.com>
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

The @np argument does not need to be modified. Similarly to what
of_drm_get_bridge_by_endpoint() already does, make it const. This allows
passing a const pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3, needed for the v3 code of "drm: drm_hotplug_helper: new
helper to implement bridge hotplug"
---
 drivers/gpu/drm/drm_bridge.c | 2 +-
 include/drm/drm_bridge.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 3cd6757dffb8..76242165292f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1663,7 +1663,7 @@ EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
  * RETURNS:
  * drm_bridge control struct on success, NULL on failure
  */
-struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np)
+struct drm_bridge *of_drm_find_and_get_bridge(const struct device_node *np)
 {
 	struct drm_bridge *bridge;
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 12ca7f6fb524..d6ef020c4cc9 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1274,7 +1274,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      enum drm_bridge_attach_flags flags);
 
 #ifdef CONFIG_OF
-struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np);
+struct drm_bridge *of_drm_find_and_get_bridge(const struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 struct drm_bridge *of_drm_get_bridge_by_endpoint(const struct device_node *np,
 						 int port, int endpoint);

-- 
2.56.1

