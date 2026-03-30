Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7260F397E68
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 19:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774898859; cv=none; b=AVNoCGCwJnY0OQ7FnaC3Ugjt8SYN+YiWNAVG/oYWSfh5b0U8PHEbcBEAub3DjFzuByWXMvvvStitBbjoEYywmSUJcjnMOgrHXf2qVhe9YdWtE5sd+3kGpR02hDl7bChC+dmueMbKzJqvyxxES5tiS1J41H4evmBwYLjdqjB0GL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774898859; c=relaxed/simple;
	bh=Jt9K1sF+2992vS0R60lkewDb/SpPcd+jIzSohZ+ZTbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KmtFoZoxxZKqELfB/P5AfywMG3lfOVLW9nQB2XgZ13Nj01UPjF9RSxHgG29JPN2z+R3WHSQ+JZjUEdYWS6KhTERwdFpPoF1RiRW1ALVnuC5xsD+C5rcZovAk4BJWC0TtwmUVgShxZZ+3Jtw3miKoMg6337F1QbSlv2kSd12Z29E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0PHcwA9M; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0PHcwA9M"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2DCE04E4286D;
	Mon, 30 Mar 2026 19:27:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F26E05FFA8;
	Mon, 30 Mar 2026 19:27:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 787B710450A1D;
	Mon, 30 Mar 2026 21:27:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774898853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZQCvJ0TS+BQKrCcbzDTIhBi7S7lbQ8/4UUzm3mUzHd0=;
	b=0PHcwA9MH+BPxLX1X1X76wr4T/ZiDnYRrsgGd5aSJttwZn06EPMbR9TRdzEGTyxXvGvdAa
	NUKsDs2NCD6QwZzAzOYzUN9LSbv/c/WVciVEY1hHkzS5d0YNiDesYS3YsEMeVij1GcoL3E
	mSoHHJzbnotYkv+Vo0TwRvnKjf+9qPy0mLYKi37AlnTsgA7Pd2S4Z9Znm8bMn4CfD1cgsj
	lQ15GaDEBTur2T1xGQTkxCZd6n9FJ/q27uBqoA7fgyLM+UZuYU/gGYsY1LO+Ni27o419Mb
	5TgvctnpmMSscCzCMhvlKhvqOvvwBVWiaqB/L5DotE0u5hbBS8nU1FEUCHyACg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 30 Mar 2026 21:25:47 +0200
Subject: [PATCH v2 06/10] drm/bridge: dw-hdmi: warn on unsupported attach
 combination
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-drm-lcdif-dbanc-v2-6-c7f2af536a24@bootlin.com>
References: <20260330-drm-lcdif-dbanc-v2-0-c7f2af536a24@bootlin.com>
In-Reply-To: <20260330-drm-lcdif-dbanc-v2-0-c7f2af536a24@bootlin.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: Damon Ding <damon.ding@rock-chips.com>, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Fabio Estevam <festevam@denx.de>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Gilles Talis <gilles.talis@gmail.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 Heiko Schocher <hs@denx.de>, Josua Mayer <josua@solid-run.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 Richard Hu <richard.hu@technexion.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Vitor Soares <vitor.soares@toradex.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3

dw-hdmi can operate in two different modes, depending on the platform data
as set by the driver:

 A. hdmi->plat_data->output_port = 0:
    the HDMI output (port@1) in device tree is not used

 B. hdmi->plat_data->output_port = 1:
    the HDMI output (port@1) is parsed to find the next bridge

Only case B is supported when the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is
passed to the attach callback. Emit a warning when this is violated. Also
return -EINVAL which would be returned by drm_bridge_attach() right after
anyway.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Tested-by: Martyn Welch <martyn.welch@collabora.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8MPxL/MBa8MPxL
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Note: Returning when the warning triggers does not change the functional
behaviour of this function. It is not strictly necessary in this patch but
it will have to be done anyway in the following patch.
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0296e110ce65..ab1a6a8783cd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2910,6 +2910,10 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
+	/* DRM_BRIDGE_ATTACH_NO_CONNECTOR requires a remote-endpoint to the next bridge */
+	if (WARN_ON((flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) && !hdmi->plat_data->output_port))
+		return -EINVAL;
+
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return drm_bridge_attach(encoder, hdmi->bridge.next_bridge,
 					 bridge, flags);

-- 
2.53.0

