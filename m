Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124383806A2
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003611; cv=none; b=IXE4jtSviM44eYGz1LMj4DsLr3dhtlKRFw43C8WOqOcfX5kEneCeFsm0pM3J1hX+9O3O8LjyWXIGpZwbZC0S6ZInW9csALycd1vMJ5B/9y3mMeRcFhih6t4KbMPn5t+rY+TJfd4RI+0CpDWWHwSWQIPzS4DvE5jGgwZAWGCdwMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003611; c=relaxed/simple;
	bh=UzvNrvbtD1rtdXXVwhjShRJUrAybWcxGJ5+Qw1LxNwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tp57A59kRW6yHJnyuGJGJ37v2101Zc06SB1ZfqEy72spq31F3CpYCUxROtaVY+PEwkdXCsxszjIunbdmTQz2WwJKwtZwl/9tmcyY0oiIl/Gwnw/jswN6q2HPAIsXXsB4MPp8aGEi/hx4VaSo6KQBMh3DsE4IoZ/kItaqaazrBug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h5wv/hd/; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h5wv/hd/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CBF51C415B3;
	Fri, 20 Mar 2026 10:47:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69B53600E0;
	Fri, 20 Mar 2026 10:46:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D16410450B9E;
	Fri, 20 Mar 2026 11:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774003604; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BXcIk/NRj8PFc1K1TpjqRHmXNm3bb4oAqAdH6wdWTtU=;
	b=h5wv/hd/qDbYWSU41Nl9bTFsrOxNYGfHpRGn4j5J3NpByLHohDFfgi7k9ib3YGNsxPL1WH
	6qyNogfkM8j+A7nYyg9KA2y11Rhox29DSOi/3SLQYU7oS62LADuaKcMDVPsf8/nJlIpKKJ
	ZkPzL7fRmJKSdhnezmraEcpaM1Bi+yWd0Wv47tzwDmYkP6nwHtcyU9wmpJFjQDfkRzbELf
	Zmt97x3qEJUHcxGVBPxig3i2WV74+vCLZ+iNsK0x1g99DKROxbwToIAeCq9un11mX9u5BM
	bUuega/3JAhjY9qxrcphEknCXIpmbCxd86bCWMwpXr9t6XmVh22ZjQv2jkFlzw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 20 Mar 2026 11:46:12 +0100
Subject: [PATCH 1/8] drm/mxsfb/lcdif: simplify remote pointer management
 using __free
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-lcdif-dbanc-v1-1-479a04133e70@bootlin.com>
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

Putting the remote device_node reference requires a of_node_put(ep) in both
error return points. Use a cleanup action to simplify the code.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 47da1d9336b9..756ca96373c8 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -53,16 +53,13 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 	int ret;
 
 	for_each_endpoint_of_node(dev->of_node, ep) {
-		struct device_node *remote;
+		struct device_node *remote __free(drm_bridge_put) =
+			of_graph_get_remote_port_parent(ep);
 		struct of_endpoint of_ep;
 		struct drm_encoder *encoder;
 
-		remote = of_graph_get_remote_port_parent(ep);
-		if (!of_device_is_available(remote)) {
-			of_node_put(remote);
+		if (!of_device_is_available(remote))
 			continue;
-		}
-		of_node_put(remote);
 
 		ret = of_graph_parse_endpoint(ep, &of_ep);
 		if (ret < 0) {

-- 
2.53.0

