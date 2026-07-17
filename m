Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CB23B3C1B
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290743; cv=none; b=cRO3IAz2M1Lfhf+tsspEOpzSpaZCINBmUkWAxygvSUB4d0pgZdEf+LEQ5nkxJm1HcRJtB00ks0UwnzedjBRgkGgBFijPNPGsVJrMwYPOme0Gkz/yLk752ia7+TEzpg2/b4T+czAjl55tR4bBWGE8265g6zyBt+eEgclePS3DByY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290743; c=relaxed/simple;
	bh=nfj/BTUApQT8H7OxDEHVrQZNLtCjSLm/HkwcLPjE6JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idnFiWSXuHeAAyEaOTL0t9+BW1/+/1FdKOBtkqUDt4aKO8LJDcrfbIJ6veUQrbhbmQhjxQJ1Hb1MpKV5ALhxEITt83aWQ4NWqSIhlo8EbWs9jMzrrTaUy9r81LI/X6feWOamvb7UFHzh6z3DnBxJgNZgOWkeQge33/I6F8P6a4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=sm61I0gx; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="sm61I0gx"
Received: from francesco-nb.. (unknown [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 58EC9228C8;
	Fri, 17 Jul 2026 14:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784290740;
	bh=PazjzQ9/RAMBhl8ZObuStg+aPYI7SBm0oUOl0yW6hLs=; h=From:To:Subject;
	b=sm61I0gxuOE+Ck67P8NErrRE02PHdi7FDQo8FiyUzhiCDIbot3migWkACx8gMhy8P
	 DV/wfx1yAJp/waYlAOJEvqkeX9vD7E5/ghbiPuOah8BNFCJISrVevO/c2ew/gJyS/n
	 78PCwcQaQy0Gx4pXCk7MAzQJBRfrxg2Buiw7CclfJRjI5KVjRn5Tmxgv9F55TMs+Tt
	 BxfxgqSK3rieJ3dtY5rMYaabs4GKFDCTEAyJXCZg7Oy7ONlVuvD/NlsA6q5eozF0l9
	 Lo0o76Omnq95LmKSR8tonwHkvhgX+0Zw/z/mDbv6whJOsbAYqv9PqYdyzOepYJS/pu
	 C4VwK0SW0db6A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/4] drm: mxsfb: Allow optional LCDIF interface format override
Date: Fri, 17 Jul 2026 14:18:44 +0200
Message-ID: <20260717121847.488148-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717121847.488148-1-francesco@dolcini.it>
References: <20260717121847.488148-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
format reported by the downstream panel or bridge describes the display
input, but it does not describe how the LCDIF data pins are physically
wired on the board.

These can differ. For example, a 16-bit LCDIF bus can be connected to a
24-bit display by wiring the available color bits to the corresponding
display inputs. In that case, using the display's 24-bit format to
configure LCDIF selects the wrong data-bus mode and changes the assignment
of color bits on the LCD_DATA pins.

Read the optional interface-pix-fmt property from the LCDIF node and use
it to select the media bus format used to configure LCDIF. This allows
the LCDIF bus mode to describe the physical interface independently of
the downstream display format.

When the optional property is absent, continue using the format reported
by the downstream display device, preserving the existing behavior.

This follows the same approach already implemented in
drivers/gpu/drm/imx/ipuv3/parallel-display.c.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 16 ++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c |  8 ++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 9b8fbda85d28..edf347968fd2 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -12,7 +12,9 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/pm_runtime.h>
@@ -209,7 +211,10 @@ static int mxsfb_load(struct drm_device *drm,
 		      const struct mxsfb_devdata *devdata)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
+	struct device_node *np = pdev->dev.of_node;
 	struct mxsfb_drm_private *mxsfb;
+	u32 bus_format = 0;
+	const char *fmt;
 	int ret;
 
 	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
@@ -236,6 +241,17 @@ static int mxsfb_load(struct drm_device *drm,
 	if (IS_ERR(mxsfb->clk_disp_axi))
 		mxsfb->clk_disp_axi = NULL;
 
+	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
+	if (!ret) {
+		if (!strcmp(fmt, "rgb24"))
+			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		else if (!strcmp(fmt, "rgb565"))
+			bus_format = MEDIA_BUS_FMT_RGB565_1X16;
+		else if (!strcmp(fmt, "rgb666"))
+			bus_format = MEDIA_BUS_FMT_RGB666_1X18;
+	}
+	mxsfb->bus_format = bus_format;
+
 	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index d160d921b25f..f64800f06a69 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -46,6 +46,8 @@ struct mxsfb_drm_private {
 	struct drm_connector		*connector;
 	struct drm_bridge		*bridge;
 
+	u32 bus_format;
+
 	bool				crc_active;
 };
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index d8ebebc5314b..8b482727aed5 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -386,6 +386,14 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (!bus_format)
 		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
+	/*
+	 * Prefer bus format set via optional "interface-pix-fmt" DT property,
+	 * over panel or next bridge bus format. This is necessary to support
+	 * 24bit DPI panels connected to a 18bit interface, for example.
+	 */
+	if (mxsfb->bus_format)
+		bus_format = mxsfb->bus_format;
+
 	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-- 
2.47.3

