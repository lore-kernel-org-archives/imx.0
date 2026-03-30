Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EAE3BFE41
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 22:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910987; cv=none; b=HxtbYvS3kOMNiKpbiKITEDDRGYvirOMIiI3wHFaufQv8GqA6d5+v7RBHaeoRbGU8cOOEafRczkp+3TVrvv0l8c1xjpWE9jy9OS/oCDZTVZCedybfOTjsQHJKLCVNeIzOe6NDkdeNSTFrOpqJlcL17OiS/R3x3IXvbrAzJQGB9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910987; c=relaxed/simple;
	bh=FxkX383IjFOFCfwB8qdVbxcnu/ydRLPuMlqZnnVp5kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goMeJH82bLpqpWWZPSVKO/JvGySGaDCb2TYGFe8JUTeq/5V6o7igL/g7Jk60BWlJT6edpmpdY/UkMYwkNZLl+EpHQn2tXJDzc+DKREUUub4p7iHk3r9XpcGbbqXeieQphnqug0VAwwZUCF7ZBE1l/HWcyo0WCdPWi2QGXe+HE3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E20F01F80041
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 22:49:38 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 6B249B2EBCC; Mon, 30 Mar 2026 22:49:38 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 71E4FB2EBC5;
	Mon, 30 Mar 2026 22:46:32 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 3/3] drm: lcdif: Wait for vblank before disabling DMA
Date: Tue, 31 Mar 2026 00:46:19 +0200
Message-ID: <20260330224619.2620782-4-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330224619.2620782-1-paulk@sys-base.io>
References: <20260330224619.2620782-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is necessary to wait for the full frame to finish streaming
through the DMA engine before we can safely disable it by removing
the DISP_PARA_DISP_ON bit. Disabling it in-flight can leave the
hardware confused and unable to resume streaming for the next frame.

This causes the FIFO underrun and empty status bits to be set and
a single solid color to be shown on the display, coming from one of
the pixels of the previous frame. The issue occurs sporadically when
a new mode is set, which triggers the crtc disable and enable paths.

Setting the shadow load bit and waiting for it to be cleared by the
DMA engine allows waiting for completion.

The NXP BSP driver addresses this issue with a hardcoded 25 ms sleep.

Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Co-developed-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 1aac354041c7..7dce7f48d938 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -393,6 +393,22 @@ static void lcdif_disable_controller(struct lcdif_drm_private *lcdif)
 	if (ret)
 		drm_err(lcdif->drm, "Failed to disable controller!\n");
 
+	/*
+	 * It is necessary to wait for the full frame to finish streaming
+	 * through the DMA engine before we can safely disable it by removing
+	 * the DISP_PARA_DISP_ON bit. Disabling it in-flight can leave the
+	 * hardware confused and unable to resume streaming for the next frame.
+	 */
+	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
+	reg |= CTRLDESCL0_5_SHADOW_LOAD_EN;
+	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
+
+	ret = readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_5,
+				 reg, !(reg & CTRLDESCL0_5_SHADOW_LOAD_EN),
+				 0, 36000);	/* Wait ~2 frame times max */
+	if (ret)
+		drm_err(lcdif->drm, "Failed to disable controller!\n");
+
 	reg = readl(lcdif->base + LCDC_V8_DISP_PARA);
 	reg &= ~DISP_PARA_DISP_ON;
 	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
-- 
2.53.0

