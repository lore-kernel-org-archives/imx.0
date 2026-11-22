Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361469;
	b=CL92BVltIK8Xo8RAqd34zZVXq2A4Fj0e5pwM12W32ZeXPVHARJJK/fCuvkKwsHqW2vgH
	 3XkUdcBzSYs1VC71Vr5nDnLfNSJUNe1ASh3M2L6Hual3Ht7BEUf6Yq7D3BDzAW0hZih0k
	 3Lq272h4a832aAx56R9J+itfgSc7XnMk6VFTS7OzPEpfP9abqoAZyM8cld/FbmGADdpxr
	 pbi74iKQ8589CmGRu/F8OLgpYs7ZvhRk8F4UZoFdp02J7Z0sTpz7UFlO3Lq8BwBAjqJWA
	 x4dttVJCg6JaEHvosJOnKxfbkdiB7UuLTdtbHVONVb4jcdzQMYnYbgA96GQCf3YcaVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=da6eqqr5+mNyqLPiJjh9XR2U6FENUUFBFqpSoPRBQAU=;
	b=1P2udWK8D5b34VWlSmYpI3cKn3mFwkx2UzaRePPR90oGyun2BZMO/FyoEhBJDCS+dKeR
	 ULI47nEw7p+RTTJTE7zplKXdNl1iRZcBl8N0kJQqWxIL6Q/GIbetqj1Jh/dvzcAGBjaxr
	 Uhm7M2KxAw8huFOpBzR40WTAA0Ks5ZI5+QJ4j9l4XShhBTUcQZEnBGMWm8dWJ242vBkzK
	 SCaFZ18ZLyDFJQLy9LYED+bTeZ0q7gi46poXXBkaTvpDqEmrzm2IgsmUIjwzdSz7wL0Z5
	 6hcf32/Y/1kbo4hNqz1FeARlSom+sDsM62kqIXvB5OxGNVSWxlXsfflQn1+UAEjON0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JwobW7cN;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA3E606A32C
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 15:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FA3E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=JwobW7cN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so22552925e9.3
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 07:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795361467; x=1795966267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=da6eqqr5+mNyqLPiJjh9XR2U6FENUUFBFqpSoPRBQAU=;
        b=JwobW7cNPk/csw05qYtF7VcLGKrF3H+74wBoyeZh92jwARmgR7nLZiSySsguZek9m7
         txvyOV+8U9FNju5z4vfBrWslAhwuP16+E0oqtehZ0aw7KQI9gNYKClyX8MpjKacmmw/Z
         OQCIxLh35ETTJtrMKu14sVNBf8h8H3NDU7088=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795361467; x=1795966267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=da6eqqr5+mNyqLPiJjh9XR2U6FENUUFBFqpSoPRBQAU=;
        b=ul+Ydx0WL3ArK80pQ192RagaPE4lKSzmKbitatY3SthRk8Kv2LQkMe2pGwpyBKjyu9
         BGsNaurULF0m3j+6jOEH+LYf+ZYVrLciD1H3NraY77SyfjkCEV9jkFA3GZzN3TfCXiz9
         oFR7RqGbBmmAwQ3NrjGbjXL2pTUADb8AVXbTMsAMkvmeQNYBxZfZ35Pj+vmokzypJEOT
         E4b+8SknF5sDEqAO1Jl6QhAHBwGEv7O2V1CeI1YhqYqlLI8IKqCwMpplPHNwMgq9iIHU
         PgpZsWnPRCar0xh+gk+SrSB85E/N9ZPH+949xSm+oQU1LyRHS5MRzlL6MRTxK7q8eErz
         MgRg==
X-Forwarded-Encrypted: i=1; AL+hErFzEnmry82Kwv7/XT9CrLE9sw4sV75lbDLJ0E0cwDrYEIecilxye0Dz7o4PT6JcRycWLS0=@lists.linux.dev
X-Gm-Message-State: APuU4Z985Lt+Lu8dSqPV5OSvYrsQ0SkKUR+Bs57+gv1+nGOxUZhGjYSh
	10ZNLlQO4K2XQuPTQ+S9Lm7u30k9lCo8PhS+3VwGDAkxvuSbqJeMi2Mzz6NLeawXFHg=
X-Gm-Gg: AZFdTZc+i0kwVfjBEs0015WecQTeywxNjdv/spTcJfU39cULARujUCyvJhHit6ZwlRK
	WSakfRMEhfsbxTpyzgPkz8gatYCfUdknz7U/EOgckfC9T6T2IRwUgDGB/hy0IfCDwbsr+IL7RFC
	TvTZDwEaBRyXAJYGLl4rK3ZVyjYYyiBU225Ul8P8VQtMFkmVapDffXM2iV9tvftAoJtglhlF4kx
	rHQkVK+iaEOPOaqlMFpeeD3vwq5ckd/kkOra/NbrjwGD9EZsxmjaSTJjLSu0DMwZJv8kwfXfry4
	AVRkKfBivtDqYj8PgAY0Tq5A4zhwM/nUh4bTXmym03+chCplnu2l7WRjExLxpTjj6d3pO5V6v3f
	oiTb/+0bT47snPrgAQz1KRgK/ctujLyvhLw11mzid1yThFvo04XyXpbDZyHCJR9JXoDsXISmR0O
	/BuZnBjBO5zc1AythcpyMRARvheVJJxWKXsNfcoqtWKvU30wy86cvtZrgh2DgWmnyi0E+WV5vqM
	aqzUR5lDCpKU3Jwq3hzIoRGn3tC9g1kMobbV79wmj4/UxbkgWYJrmiLjt6TO+vx+LaNp+Trc91i
	H9YQk1XHRkCOjZDJHeRrivLrv5rgJvT/sVpPl+VYdIcMgMJiD44/qYjp1aIeg77WdJnXWgn5tgi
	8y1ZSyN989xAlBsaZDf3xKbvci0QbLW/xxfzvn/kFRRHQEzU2+PNI06ZbcinfqJLoJY0YlyqRV2
	wm2t1wX8IvTR2IA3ggyQkHG5dYnYTk0xZyH7zTpSoYG/+VBz0=
X-Received: by 2002:a05:600c:8287:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb887e064dmr198299585e9.1.1795361467514;
        Sun, 22 Nov 2026 07:31:07 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm237833815e9.9.2026.11.22.07.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:31:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/8] drm/mxsfb: Stop the controller in hw_reset
Date: Sun, 22 Nov 2026 16:30:05 +0100
Message-ID: <20261122153032.2782768-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the hardware state can't be read out, a controller left running
by the bootloader is reprogrammed while running on the first enable.
Stop it in the hw_reset hook.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/mxsfb/mxsfb_drv.c |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 33 ++++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index c8bc79264361..ef4a47d238ed 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -31,6 +31,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mode_config.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -110,6 +111,7 @@ static const struct drm_mode_config_funcs mxsfb_mode_config_funcs = {
 	.fb_create		= mxsfb_fb_create,
 	.atomic_check		= drm_atomic_helper_check,
 	.atomic_commit		= drm_atomic_helper_commit,
+	.hw_reset		= drm_mode_config_helper_hw_reset,
 };
 
 static const struct drm_mode_config_helper_funcs mxsfb_mode_config_helpers = {
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index bbc2a2df9f16..96cd80c6e76c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -35,6 +35,18 @@
 /* 1 second delay should be plenty of time for block reset */
 #define RESET_TIMEOUT		1000000
 
+static void mxsfb_hw_get(struct mxsfb_drm_private *mxsfb)
+{
+	pm_runtime_get_sync(mxsfb->drm->dev);
+	mxsfb_enable_axi_clk(mxsfb);
+}
+
+static void mxsfb_hw_put(struct mxsfb_drm_private *mxsfb)
+{
+	mxsfb_disable_axi_clk(mxsfb);
+	pm_runtime_put_sync(mxsfb->drm->dev);
+}
+
 /* -----------------------------------------------------------------------------
  * CRTC
  */
@@ -205,7 +217,7 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
 	writel(CTRL_RUN, mxsfb->base + LCDC_CTRL + REG_SET);
 }
 
-static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
+static void mxsfb_stop_controller(struct mxsfb_drm_private *mxsfb)
 {
 	u32 reg;
 
@@ -221,6 +233,11 @@ static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 	reg = readl(mxsfb->base + LCDC_VDCTRL4);
 	reg &= ~VDCTRL4_SYNC_SIGNALS_ON;
 	writel(reg, mxsfb->base + LCDC_VDCTRL4);
+}
+
+static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
+{
+	mxsfb_stop_controller(mxsfb);
 
 	clk_disable_unprepare(mxsfb->clk);
 	if (mxsfb->clk_disp_axi)
@@ -433,6 +450,19 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 	pm_runtime_put_sync(drm->dev);
 }
 
+static void mxsfb_crtc_hw_reset(struct drm_crtc *crtc)
+{
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+
+	mxsfb_hw_get(mxsfb);
+
+	/* The bootloader may have left the controller running */
+	if (readl(mxsfb->base + LCDC_CTRL) & CTRL_RUN)
+		mxsfb_stop_controller(mxsfb);
+
+	mxsfb_hw_put(mxsfb);
+}
+
 static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
@@ -493,6 +523,7 @@ static const struct drm_crtc_helper_funcs mxsfb_crtc_helper_funcs = {
 	.atomic_flush = mxsfb_crtc_atomic_flush,
 	.atomic_enable = mxsfb_crtc_atomic_enable,
 	.atomic_disable = mxsfb_crtc_atomic_disable,
+	.hw_reset = mxsfb_crtc_hw_reset,
 };
 
 static const struct drm_crtc_funcs mxsfb_crtc_funcs = {
-- 
2.43.0

