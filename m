Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EACE3BE155
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 22:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910931; cv=none; b=mpY684JzUeCuIJVrpjp1YORydo4jmC+SFfUSSs6UY2FPrTTaaSMDdjGaNHe9WZVIlT303zixH4MvhDReuPjDrhRTMOuCDJy1eJSaNB8d6VscQI06aKUQWBwO3fvhx58/aEn1tzLNLClq79wm5aX3gfAi9XgF/ROQqdIU2Yta/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910931; c=relaxed/simple;
	bh=BDu8zVLRrmrMyI13kZXCcPD25JNJC+k3QXgHpDLucIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=knA4KNUea3sOpeXXtWKw9DbGxpd2ZADR564j/BdsN8qo4KryBukNXOCTUPRCIc7jcugiFxpCJAG+zUwgAlKd5XC1v5w/libHtH5NEgFExpW6vcklzsWGURTLpDd7jNF011jnTJVKI8iQ3noH5RGm/fVYKYewZagppr0whhJyoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 46EDF1F80041
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 22:48:47 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id B8B3FB2EBCC; Mon, 30 Mar 2026 22:48:46 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id E60CAB2EBC4;
	Mon, 30 Mar 2026 22:46:31 +0000 (UTC)
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
Subject: [PATCH 2/3] drm: lcdif: Use dedicated set/clr registers for polarity/edge
Date: Tue, 31 Mar 2026 00:46:18 +0200
Message-ID: <20260330224619.2620782-3-paulk@sys-base.io>
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

The lcdif v3 hardware comes with dedicated registers to set and clear
polarity bits in the CTRL register. It is unclear if there is a
difference with writing to the CTRL register directly.

Follow the NXP BSP reference by using these registers, in case there is
a subtle difference caused by using them.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index a00c4f6d63f4..1aac354041c7 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -296,18 +296,27 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
 static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
 {
 	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
-	u32 ctrl = 0;
+	u32 ctrl;
 
 	if (m->flags & DRM_MODE_FLAG_NHSYNC)
-		ctrl |= CTRL_INV_HS;
+		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_SET);
+	else
+		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
+
 	if (m->flags & DRM_MODE_FLAG_NVSYNC)
-		ctrl |= CTRL_INV_VS;
+		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_SET);
+	else
+		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
+
 	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
-		ctrl |= CTRL_INV_DE;
-	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
-		ctrl |= CTRL_INV_PXCK;
+		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_SET);
+	else
+		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_CLR);
 
-	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_SET);
+	else
+		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_CLR);
 
 	writel(DISP_SIZE_DELTA_Y(m->vdisplay) |
 	       DISP_SIZE_DELTA_X(m->hdisplay),
-- 
2.53.0

