Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B13369D58
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187250; cv=none; b=C3gcquSapjYyCB4mZ/Od1uCYkTk/w9qHWzffMLDrbaMDpf25HdfrrrmlvjGITY7dc1tyv982SJ/UaLQUUItTCYeSlEpxKlaSW+/X+HmFyc9FfQOruOIy2aey8FRgAP4dsBeHX+vfi6KRH1z7ffu/cxrlj6nPy910kvD9tIto3es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187250; c=relaxed/simple;
	bh=M+hVvxnQejdHxo+UYdJvd5gFmRwFi2byDjqLlPnNc4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cCQXq6oncxFW53LNC6jaIYe4vBmUWaZHG4VCtHdkKihvDl45XPcYQI8xVN0fGZPJh0DRq9Gnkdqjd2uKTeuEbpmzX6fdWQi+yUk7TTJpxAgvk6HBFNFgODWecOr8P4oAjwzcl2locIKSBeBmsxu6XB5HJFc5JEEUnxLDDq18ndY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z4gYPq7Q; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z4gYPq7Q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DEB454E42CF5;
	Tue, 19 May 2026 10:40:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B1F81606E9;
	Tue, 19 May 2026 10:40:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 765BF107E8B03;
	Tue, 19 May 2026 12:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a85Cizij9kXPn9Kt9sHvek1PwQkqP3FwMIAwRQz/a8o=;
	b=Z4gYPq7Q2NDsQG86vprBtBK5lBZtFpPE0bbnPnYGs+sZFFnP+Mx3El6bvsqAlrqEDPrXvG
	Bc6deDtultuXkpkS+kJUU8sSQq/k+pG0sItxEciHnatzT1rMygUpHH1JVeKOaP0J1Wexc/
	g/d4eNtw/H9oBJkG//mVXKZR/uVaCRtS8RAQ6qfLnFu5XaZyAtgT35XTgHuW9ibLocjq8R
	pLWk+i1KMpk9BL78GCZHLpZLA92njKTPr83cHZVLYHUtWgj2WPuCeG7b3LNkUMTb54/Jok
	3p/XrWjvtJaaf8BMe3w6qRFOoMGtCEbNgAY6cjGIIP5pqupG/gqzbwNnvMRT4A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:54 +0200
Subject: [PATCH 37/37] drm/mxsfb/lcdif: enable bridge hotplug
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-37-45e2bdb3dfb4@bootlin.com>
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

Switch to the new drmm_bridge_connector_init() so the drm_bridge_connector
will handle bridge hotplugging.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index e2173c4d6fc2..0a7c197dbc1e 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -58,7 +58,7 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 		struct of_endpoint of_ep;
 		struct drm_bridge *bridge;
 		struct drm_encoder *encoder;
-		struct drm_connector *connector;
+		struct drm_bridge_connector *bridge_connector;
 		int ret;
 
 		if (!of_device_is_available(remote))
@@ -94,9 +94,9 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 					     "Failed to attach bridge for endpoint%u\n",
 					     of_ep.id);
 
-		connector = drm_bridge_connector_init(lcdif->drm, encoder);
-		if (IS_ERR(connector))
-			return dev_err_probe(dev, PTR_ERR(connector),
+		bridge_connector = drmm_bridge_connector_init(lcdif->drm, encoder);
+		if (IS_ERR(bridge_connector))
+			return dev_err_probe(dev, PTR_ERR(bridge_connector),
 					     "Failed to init bridge_connector for endpoint%u\n",
 					     of_ep.id);
 	}

-- 
2.54.0

