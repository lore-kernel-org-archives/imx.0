Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7834E43784B
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562099; cv=none; b=LriG7cbA8vZ7Pgj3cLAh310AWad+wxwd3hzv0HFpTAFfRYZHn3it/cl8mTLlKfi6/17PaaBJ8wvTsvv/5eIeErFy75Es5Lc6WnT6nmM2Ql0NQrv2qGACff1jhqAmu9usOTSdXlOMJigIgpAvq5WfDjRLJAgEYQkquF0Ha9GxOmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562099; c=relaxed/simple;
	bh=0WsQRBQILDRGD9A8dPkA4+m9eQEodKM+eJPiDyQ5lmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uBjIGkY9CCjvSriFH0SxQ118pvXBC2ZGVSClkz6WczEUWGAo5JNJWhvJA7Nfh/JKT2QgXXKt1iumvYcwggYG3OmkjuH9snhFgGgDYL5lUcA6S6V6HtNlKnQxywkt12lpyDN1nrHuA1SQ0fJH2M06rH+PGPk208hFLBHRRS41UWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFcC9Nue; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFcC9Nue"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47640541585so5197030f8f.1
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 08:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562096; x=1785166896; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITwMWTyjPOpmiBS75ZF02CenxzeBHARaB0ED7f6Tp6A=;
        b=JFcC9NueZSm4rQOuCQqy61W52L4qjugfaKHjwnw8pCHxMQEA3Wp+CYCQZC2sqR9EMh
         X0d/66AcwEeleNLHZCwTh0BtQCqvkOazRIIbsOsJx8TmLbIGoClnvntlnEaIWJaTis4u
         4XdE7oRwhCIkkOz/gA91g1v5GTJpKluNeqPY3LyvQz0dY4MvZeRHn9R4cMkwFBvwH5LV
         +9HOpCJUxa6psKmFIJAIT0G1gkAzJybVZEZhPbd2t4z5jgRSM0tbeyLYGBUufD9BGPDt
         8PYit0mxqNEAXiYpXCjtSJDlhZsYH7DhkVVYzS8o94MTqjEYunrXF2jSxGs5KjXXNPrL
         rhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562096; x=1785166896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITwMWTyjPOpmiBS75ZF02CenxzeBHARaB0ED7f6Tp6A=;
        b=p+SLBFpQJ2TBK8YxXfBCUFpiDVd1900bE5L6CJCYkmM/dta+u3R3HITAKla2eI/VNe
         xWRN/vPIUf47f9NMD97GP2O1qfou7mb43ZEfTFyjOt5pP/u70QL6fQ7sqYf465JbymAt
         5ON2qFxnVq2BcIMVrQRKUT5V5vPqYZ2zg5hUJNUQVoh6NznFIH36X9jGZAQ33TCj+2o9
         I9GWKnqeRl8rDgqjTINstJiSFVBMKezC25acgY85SOUajkY5FQVZ7Nn3dZAodqBSZ84z
         ytTemHsDW6ueR6wfi8RiCgVUrtVrsLhfidGUn8joeM0gWHMuSDRHVSi7lWk3GX5bKCEZ
         2O0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqX26jVx1j9LuAsM14U3WKRahRYzuKDNX0bj95iLsxz7U3wACTCLWAuTZm+9FQj3FRCi4g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVCeWekpnfvUtbHFAITYyTpXLXC9G9oQXUL1gsZzi3ybVivKtN
	D7rv5KBSASeuM9LMSLBAI1SuFuQxfN3QQt3eIKWcLgVSXKcOi6NVdoXu
X-Gm-Gg: AR+sD10VId0cultEu4n2+R5MX+ZFwElCt888wSwwIeRAla9KaxbYH/fsJ2OJzEjk+GY
	whQRg7vFTTNdfwe+1CYYDmv/DREvdWIKlX6IS6IXDXKfkoAFjPSZ3qoWqyUa6JGkja/A3QuGv2F
	kbcWEklM9SjU3lG54zR+YPYtaaKxSg/dVddn67fAy1lbytZnU6rzUh7gUb9+2mi/mVl/Q5qLm/U
	w2Q5r11t3F9npA4qwmZR4S3gcc0U7+gdp2taPckFbHP110m50HN/iofxIa2kPEtJxqxTDJwC/zD
	5loL+S9QC+S3vEMlXKX+CRl8RCKuREvGu9E0/iEWt+OshYrmYEgWj9N+yGf8sxw2xyVwaEgCAie
	nRWhfUXopQbLkQk+2OOrp6GQ1PVYPkUOVINHgbA0MrWjzqNJseY8hT88sr5P5IN+HChXPVVDBpr
	cAvnt5uS0I9lLgNh++q7Uk
X-Received: by 2002:a05:6000:18a6:b0:47f:6f98:4993 with SMTP id ffacd0b85a97d-47f6f984b87mr10186539f8f.29.1784562095536;
        Mon, 20 Jul 2026 08:41:35 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:35 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:45 +0200
Subject: [PATCH v2 13/15] drm/meson: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-13-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_dsi.c  | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 11 ++++++++---
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 22cacb1660c4..cdb84d2283f8 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -17,8 +17,8 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "meson_registers.h"
 #include "meson_vclk.h"
@@ -218,6 +218,10 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
+static const struct drm_encoder_funcs meson_encoder_cvbs_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_cvbs_probe(struct meson_drm *priv)
 {
 	struct drm_device *drm = priv->drm;
@@ -257,8 +261,9 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 	meson_encoder_cvbs->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
-				      DRM_MODE_ENCODER_TVDAC);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
+			       &meson_encoder_cvbs_funcs,
+			       DRM_MODE_ENCODER_TVDAC, NULL);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to init CVBS encoder\n");
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 3e422b612f74..faa309cb97a6 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -10,10 +10,10 @@
 #include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
 
 #include "meson_drv.h"
@@ -99,6 +99,10 @@ static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
+static const struct drm_encoder_funcs meson_encoder_dsi_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_dsi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_dsi *meson_encoder_dsi;
@@ -133,8 +137,9 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	meson_encoder_dsi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
+			       &meson_encoder_dsi_funcs, DRM_MODE_ENCODER_DSI,
+			       NULL);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to init DSI encoder\n");
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0c7a72cb514a..c4355c5cc340 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -23,8 +23,8 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <linux/media-bus-format.h>
 #include <linux/videodev2.h>
@@ -369,6 +369,10 @@ static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
+static const struct drm_encoder_funcs meson_encoder_hdmi_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_hdmi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_hdmi *meson_encoder_hdmi;
@@ -407,8 +411,9 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	meson_encoder_hdmi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
+			       &meson_encoder_hdmi_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
 		goto err_put_node;

-- 
2.54.0

