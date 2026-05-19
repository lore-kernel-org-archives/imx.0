Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D196F32B11A
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187224; cv=none; b=YM/YSUVz26UO5u0TLYH+kKttuGenUHtQGdmZIW3J4ur3h/XHOCPS1DwrTJL6eHq7y4Nza/OmQeVnWtL62kU1Pr7OuJKOvX7jKZNDmnXTKc1j5wujItHdHJ9acNAZK9ywGJC/Gi2+B7Cv15EQ0FQImtnKZyCxJLwWwyc7duuZg6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187224; c=relaxed/simple;
	bh=ONLQc83h4Q903nt7lxQvcjnrVgTdM1Exq6bpKKvAAXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VwurqBUsNj9HAN9726meG9nVKJoMGEfK6e24EtJlLc13LrxTEDKQBHdubeSs0z3/6mTB7rK4Xzg00JoHatCD9wlhr8yioBg3poYvDg9tdDRRnGkERMZRHHIH3jGKnIHCLpZuikYWs2irCWEvJXtQ2LQkAs3FyIRvRMEtz19aK2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WBwRoQB2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WBwRoQB2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B7DD81A3629;
	Tue, 19 May 2026 10:40:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89DB0606E9;
	Tue, 19 May 2026 10:40:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00428107E8AE7;
	Tue, 19 May 2026 12:40:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+x/+hMZvd/mY+TDvxza1mQa1Krz1zW9d6N4aDdm3aVo=;
	b=WBwRoQB2t0CAFsznoKOix9Z+FB3ieKpmwoYJe2twTcy+zrteCXP0AgYjTvwyQ+qDJGu2wT
	L+fP1EFHkAMtjbPmdXt46zuZ4zim0qERMoM26egm1+ZR1WickXPEDb7WpmX5Y0osWAGXEA
	aciEyB09WzQnr72p76ZOvtoLlwBrEm+havQfRZotfkG8ZsG4e3W65g78XPYvujZfM1Crmh
	ATBR9qXlaUAQzz/RVbLkX1fslGsbSyFntJRvKnyVmMMoK3aXEaAds3eP/f1aNFxrVTY/P5
	I2yAzeW0APKtbE77qMXAugpfEEhtpa+DzGyyNjtLeqzheYIc+a3SyDHHfzkC1w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:48 +0200
Subject: [PATCH 31/37] drm/bridge: panel: implement .is_tail
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-31-45e2bdb3dfb4@bootlin.com>
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

This bridge is always a tail bridge, i.e. it never needs a following bridge
to complete the pipeline. Add a is_tail func to expose this.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/panel.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 4978ec98a082..102f987b1235 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -58,6 +58,11 @@ static const struct drm_connector_funcs panel_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static bool panel_bridge_is_tail(struct drm_bridge *bridge)
+{
+	return true;
+}
+
 static int panel_bridge_attach(struct drm_bridge *bridge,
 			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
@@ -206,6 +211,7 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
+	.is_tail = panel_bridge_is_tail,
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
 	.atomic_pre_enable = panel_bridge_atomic_pre_enable,
@@ -297,7 +303,7 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	panel_bridge->panel = panel;
 
 	panel_bridge->bridge.of_node = panel->dev->of_node;
-	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
+	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_IS_TAIL;
 	panel_bridge->bridge.type = connector_type;
 	panel_bridge->bridge.pre_enable_prev_first = panel->prepare_prev_first;
 

-- 
2.54.0

