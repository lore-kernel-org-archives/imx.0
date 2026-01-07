Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13D4322B75
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 13:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791629; cv=none; b=Ie9NTb2RbszN93010Mg0Y6zGpsYXACNNvtSb2dvC72VUnuupztsheQBT0fQKPij9woXDCn4WhW/yuzIN1SVpsYucBMNrR8zznjhG9yIJ9WZUiYZArxMDF4AKuMYhti3P+m0zC1NW2tCPaKz0KQU7A4umRelxBIxEZt4gx5YjzaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791629; c=relaxed/simple;
	bh=4ylN1pBdc0e/pl84O/LNo2jXs53jzp+L0ARfG3VDe8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fGjQPLupWmY+g2UqD/x57ZthX6J8fsrRbQ4YOQY3FEEVgnKO88s49hOeN4XNt0cYp+SmBTY2w2raCULMJmwyLrlq5Jz1J9ei/GEEriVulvCcQkB9mf0RfFUA1PL76gLfI7aBLiGNtsWz/WYnSyJvDuYSEhhiS0viYsMRBvpy9FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dfq0fNtO; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dfq0fNtO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0150CC1EC8B;
	Wed,  7 Jan 2026 13:13:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1C945606F8;
	Wed,  7 Jan 2026 13:13:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F64A103C8741;
	Wed,  7 Jan 2026 14:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kcPTDN7TfpXL+5tbxQ2V14FG9zJXkIPfnt9CMkeJHG4=;
	b=dfq0fNtOTSUa9Ae1iTqDZCcgA0P+8l1KsU+tx56jFXhdxp3NbglAEKOkeS+qqhJCjOM05w
	B1sJJ40Emdj3FCPgFIpcYEvxDqoMPFwIA9l1LFbzxql6wtkOJKfn7Rl0gqi2IP3pXf42Qt
	fqkSi6AlE5KOW7Rlwm3Ksz6ABMZFaL7Z7/35mTrvHrRFrPu3KDMnBMKU1sHsJ0PZ8FBQsK
	bIiHH0XXyEDvSJULVP+F8pmizTaMxUpDdQufVzWFLf71pMZZ8HqpidQsqm3UZ2lkhg1/Mk
	KP1mcGlA+a0f4/wDR45L2cVEBghP1XBBFAb8VkvcOmJz0zKlkiDWFFp1QfByiw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:55 +0100
Subject: [PATCH 04/12] drm/bridge: thc63lvd1024: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-4-283d7bba061a@bootlin.com>
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
is put when done by using the drm_bridge::next_bridge pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/thc63lvd1024.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
index 2cb7cd0c0608..c804222846c3 100644
--- a/drivers/gpu/drm/bridge/thc63lvd1024.c
+++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
@@ -32,7 +32,6 @@ struct thc63_dev {
 	struct gpio_desc *oe;
 
 	struct drm_bridge bridge;
-	struct drm_bridge *next;
 
 	struct drm_bridge_timings timings;
 };
@@ -48,7 +47,7 @@ static int thc63_attach(struct drm_bridge *bridge,
 {
 	struct thc63_dev *thc63 = to_thc63(bridge);
 
-	return drm_bridge_attach(encoder, thc63->next, bridge, flags);
+	return drm_bridge_attach(encoder, thc63->bridge.next_bridge, bridge, flags);
 }
 
 static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
@@ -132,9 +131,9 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
 		return -ENODEV;
 	}
 
-	thc63->next = of_drm_find_bridge(remote);
+	thc63->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 	of_node_put(remote);
-	if (!thc63->next)
+	if (!thc63->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,

-- 
2.52.0

