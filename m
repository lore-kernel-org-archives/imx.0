Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2719B4DBD68
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187171; cv=none; b=THjzk7dKu/x36WquCFEL5QyBfLvwKZ9ReVxB62+dKolfdsYLEXEw+XZ3rSdYQwBOOhi+urzQs3YAxvZJ3UUK7ZMpeNockJ+JWskJVKkA7GZqJKcbO1ZCtgv9d8YjyVBeNRcZEAUztg7g5CuR4wWTOwOWZW88hkjiT7S6BI9Mpug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187171; c=relaxed/simple;
	bh=avAnBR6BIJzQQBJfeRfYXgmcOJAAOyJbcO+kCfQGJXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZBfQB6bPchfkliLllUfWNKKJsyrXNq0hYbmKg6Wh9QbV2AH7W5evGpy1YVfssfN0FlUNbqPKjpLSUyhe1+efJ9F4Hg3LZcrzojNjROR7T8Tf3ZeCByAWNiFrazjGeXFp2ojFwRPZ87+8HimzPybdo0I5vbrAbHUu109c+G6W3+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IIQiFWvN; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IIQiFWvN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1910DC2B9DB;
	Tue, 19 May 2026 10:40:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2635606E9;
	Tue, 19 May 2026 10:39:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA268107E8AE0;
	Tue, 19 May 2026 12:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=viok0NZbuZ8e/hD57hUPyDwRDr0DwR3pZjydZmRPEJY=;
	b=IIQiFWvNhiB4jeRRZP+AbU7H+nswsdO7rN2CHIxfxHWCb9p85Lo2MX8g+God7kNUYM6QqT
	eex8Oq4KVgVP9LWOyYMRfAtUclVVk/qVJRvY9MlyVUrWnVDpqNLn9ZoIzsPdubT6m+0ozZ
	72wGxTOzSj0HhmcJw6q+bYhj9qV0r8yqb9QAIoHN1Rna7oNG1nd+FO2saAWOQOkmOho3+g
	zwELy0KhvMn3tJ2XTIYYkEZUzYpm0NUYi7oP4qnhOdKczQfLRT9egTI3gpnAuqPFfgDPdT
	W50AuSHxDuUytCTc5ai93A0f25XxPAXswScof0rdzd2njB/4mGJhmR/wMJ/YZA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:36 +0200
Subject: [PATCH 19/37] drm/bridge: samsung-dsim: move drm_bridge_add() call
 to probe
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-19-45e2bdb3dfb4@bootlin.com>
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

This bridge driver calls drm_bridge_add() in the DSI host .attach callback
instead of in the probe function.

This works for current use cases but is problematic for supporting hotplug
of DRM bridges. The problematic case is when this DSI host is always
present while its DSI device is hot-pluggable. In such case with the
current code the DRM card will not be populated until after the DSI device
attaches to the host, which could happen a very long time after booting, or
even not happen at all.

The reason is that the previous pipeline component (the encoder in this
case) when probing cannot find the samsung-dsim bridge. What happens is:

 [1 and 2 can happen in any order, same result]
 1) samsung-dsim probes (does not drm_bridge_add() itself)
 2) The lcdif starts probing multiple times, but
    lcdif_probe
    -> lcdif_load
       -> lcdif_attach_bridge
          -> devm_drm_of_get_bridge() returns -EPROBE_DEFER because
             the samsung-dsim is not in the global bridge_list
             (deferred probe pending: imx-lcdif: Cannot connect bridge)

The samsung-dsim will not drm_bridge_add() itself until a DSI device will
try to mipi_dsi_attach() to the DSI Host, which can happen arbitratily late
on hot-pluggable hardware.

As a preliminary step to supporting hotplug move drm_bridge_add() at probe
time, so that the samsung-dsim DSI host bridge is available during boot,
even without a connected DSI device. This results in:

 1) samsung-dsim probes (and adds to drm_bridge_add() itself)
 2) The lcdif starts probing multiple times, but
    lcdif_probe
    -> lcdif_load
       -> lcdif_attach_bridge
          -> devm_drm_of_get_bridge() --> OK, returns samsung-dsim ptr

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 2af287221e22..cefb20ec68ad 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1980,8 +1980,6 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 		     mipi_dsi_pixel_format_to_bpp(device->format),
 		     device->mode_flags);
 
-	drm_bridge_add(&dsi->bridge);
-
 	/*
 	 * This is a temporary solution and should be made by more generic way.
 	 *
@@ -2014,7 +2012,6 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO))
 		samsung_dsim_unregister_te_irq(dsi);
 err_remove_panel_bridge:
-	drm_bridge_remove(&dsi->bridge);
 	if (dsi->panel_bridge_added) {
 		drm_panel_bridge_remove(next_bridge);
 		dsi->panel_bridge_added = false;
@@ -2040,8 +2037,6 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
 
 	samsung_dsim_unregister_te_irq(dsi);
 
-	drm_bridge_remove(&dsi->bridge);
-
 	return 0;
 }
 
@@ -2242,6 +2237,8 @@ int samsung_dsim_probe(struct platform_device *pdev)
 			goto err_disable_runtime;
 	}
 
+	drm_bridge_add(&dsi->bridge);
+
 	return 0;
 
 err_disable_runtime:
@@ -2255,6 +2252,8 @@ void samsung_dsim_remove(struct platform_device *pdev)
 {
 	struct samsung_dsim *dsi = platform_get_drvdata(pdev);
 
+	drm_bridge_remove(&dsi->bridge);
+
 	pm_runtime_disable(&pdev->dev);
 
 	if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->unregister_host)

-- 
2.54.0

