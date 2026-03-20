Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568E13806A2
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003651; cv=none; b=Um1YGH0ahCbwf92hcsZwsnUIGEIfTsj0Y2kgqo0EzSdRYk1c0uyJCUnJ3CwJuQ01GanHghQbe41iLmdoJPuk/qvHQs2gowJpgkL3xpw6wuTlnGJje2N0Znm9N4zagrgKri8tT0LoM7epiKSXhGjGYt4V/s2x1OSyR0pStc5H/1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003651; c=relaxed/simple;
	bh=p+eMap3mH3REm8nRAr+tgfNilhf9vKt5CevjwuJG+Fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYeroRZfjDwTvN1CsJ3QEKn+v4cj1GCxS13kJmDlRRQ3EiMPQtBWCEi5Ylbgmae7aueNFYJznYFylN+GEd6cG+TOJhCx2kdeRJGZoj6Daf7groiWwPRcG1T9NGREpdM7qq2NYhu4RsySEjpDI3nwPcHzv+qySZWwc97tvz2uK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QFcWkJ82; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QFcWkJ82"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1ECF31A2F16;
	Fri, 20 Mar 2026 10:47:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3BC3600E0;
	Fri, 20 Mar 2026 10:47:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD09B10450B8F;
	Fri, 20 Mar 2026 11:47:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003645; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=epcCiuzdQ1u6Epk9LtsHc2oPHZxzaiyD1zsIWDZOAME=;
	b=QFcWkJ82ylexSInmRDANxSHTwK9A3hbd2iBAlyZTtBzfzAVgv+6As+Ei0+Wta0tVjL7Ssx
	SPWbAZ0u+l/hMNJTKx9n3x8MrOPvXLipwrF81cdfYzOsavnoCiPRKtFSo0LHi5nDPIe0V1
	o0TYKsw3af8yoeUp8EfMqeVsi48IAE1dl5zsMAoV/ozrOYbRTQptooqq2KXIHLF1vOiuT5
	podhqzqMnp+IyZhdUOWauEpLjRYJH86d6kQX5n/BfQNQhEzK6YFTxQqBEguZ4IhG/winEv
	8fS+1HybWGBqBpniQ8l5tNxoVC7H5uuhYbZP9DhqxwMgryivMYGSC+b2qs2h6Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:16 +0100
Subject: [PATCH 5/8] drm/bridge: dw-hdmi: warn on unsupported attach
 combination
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-lcdif-dbanc-v1-5-479a04133e70@bootlin.com>
References: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
In-Reply-To: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
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
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Anson Huang <Anson.Huang@nxp.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Fabio Estevam <festevam@denx.de>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Gilles Talis <gilles.talis@gmail.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 Heiko Schocher <hs@denx.de>, 
 Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 Philippe Schenker <philippe.schenker@toradex.com>, 
 Richard Hu <richard.hu@technexion.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Vitor Soares <vitor.soares@toradex.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
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

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Note: Returning when teh warning triggers does not change the functional
behaviour of this function. It is not strictly necessary in this patch but
it will have to be done anyway in the following patch.
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index ee88c0e793b0..a668d66aeece 100644
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

