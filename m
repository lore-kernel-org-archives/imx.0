Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05606377EB9
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 23:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417772; cv=none; b=OTo6wdYPuBF+8GobIU0iQOHGZf8em3W6/cNMxrEyQd8etHIz2QzOiJY5sEMOjUNp+tNjtRRGvvLW1Z7+HqpwUW0t+i0ru5h/JZ4DNsoCe5HMz4NBrEym5Vdsw1sqRYngkEGYd2rqg/CRNlrRMrrwbPUGKsuG8dnhLdusI4qruv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417772; c=relaxed/simple;
	bh=vUlV0bfkxAr1ke6u+O++/m3ul17qgcqKWxREUGJ4Esw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oevCnAed11WZBGXT9ik6QnAtv6jmJzPZMtWizlAEOK4bzUG0R3Dce70CMStaHt85p/OpyYfK7U3er6es8sPeuQgH4jnNVjkGiQ0R2dog59QRaZc67ViawoGlhKbD6IK0moV6y8nqcnrYAb4JoHU74XTkjZlGL4lsAneJJ8GsEbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7uL6tKr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7uL6tKr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954afac04bso15719925e9.0
        for <imx@lists.linux.dev>; Sat, 18 Jul 2026 16:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417769; x=1785022569; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FjNP86ptWMOuru/pKfvMOeLrB2j6SXLcAuojoL3wm4=;
        b=k7uL6tKrwyICWnkRLSjyX7j+YfI7ImOoYqPKjv5A+xPCa1mkYGw+dPwW09yOWCY1oe
         du+qUzdDy0nICNGAWCexPkdeapEdK566CQ3QqdaNN8LdRHMdbDN9MjU0ohRbk8a0+Tmo
         sLg7iiA2sF8p5HtEFlyBb589unhK7I3uYNRQJtGh3Q8zL3hBhzIrHJpvW90ABIfx7t+/
         NwF0Wh+pQC5aaTT9rCBEsAzQM54jgW0q9YEfN2fiJKa3QOztW+ULfIgiPJ3zlhR9mmz6
         MWCFeaByd3dQv1/U64pnlMP3FvpLQ81aJmGgUoMtyy5Nfr+N6C/l0C8f0GHYyHE2oQ5+
         P2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417769; x=1785022569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FjNP86ptWMOuru/pKfvMOeLrB2j6SXLcAuojoL3wm4=;
        b=I5GEjsoTZJiaR8gggys4P6zmsxPZxqLYwspPaSzK+iNgDF6LyHfZabHHVz5Qx6lKbu
         nEyeDQzL4eQ8wrhGrNFXDS4AOT+ogMkHjoVBed+2yVv66IgMlkTVJTrLx7N9GGgO2o44
         fqfPA/WxSIkSTyFG2WNh+p/G4WHA3tZ1CxIKem3gVba6V7SPmZHHjQrwSGbcqKBAQO3g
         qejaATEvofBjbNxPGXKBHxfIqQEIeu5WCL0Dj8c8F5FIHpmlzfRjkVRBLFqXht0s2waR
         4TnKVWtTbFUtzf/XKlYWVcjyNYzytEzDwNfmOf+dQNI1koqUSl3mPOSX66GpKEYsk9R3
         MbsA==
X-Forwarded-Encrypted: i=1; AHgh+RqcuL0qXptScJmyKywDJaF3ZvW+qur9fyQqMPiYXWHq/GYtTMNBqrO/3pXhA+4J5S7xw1A=@lists.linux.dev
X-Gm-Message-State: AOJu0YybuhNfpbn5b2zCzPnOZ6hWGQO7+HwKFXAx40+1SAuGt7t0VU/U
	7M0Mp8W4NUEihMpkpQvTrYLDlOZC6rNbAoiiEqOTNbrlaRF3uZWD6GcI
X-Gm-Gg: AfdE7ckTMyS0Y+uhK6mlaUF8DzjCgxR6BxEbEMc9U9Iwya2y8ttgWeSadyvirhHNwvO
	BUesZOj8Ur7xjxXv82z2v3lEI2IcI+3yM8+BtrICWcMvq3eE21RdWq0Yk+AwD1PsyQ6VkWwJche
	rwSqsyROHTgO88ZJyVgyAcyXG31H+AVnyCyxhcRa/R5L8dtH0Gmpq6rr47qjbMEdH6dcJ+dgywB
	G4L0Tkqy1IV7Ub5Ctej+YQli9msGgmUltwpnXQk5kh6eTMnY69R2w0eYPObDVdQR38OZi80W+S/
	GuIpOV7smKvVeGW74UGS328MpqAMVLnZOHD2cCCHlCgmZczVuS/FWqVIwd+NT+dfvuxOKz3VB8t
	PbrJkJY7GIN0TeNpQll0LOFyJy8ZNcg+m9gnh/sZlv2sr1RX53aPY+Wr/vVGXVMvAsRhCXYoVRh
	DTimc8LS5ex+rLbj03Vlz0
X-Received: by 2002:a7b:ce84:0:b0:495:4487:61af with SMTP id 5b1f17b1804b1-4954a51659emr61464735e9.36.1784417768965;
        Sat, 18 Jul 2026 16:36:08 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:07 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:34 +0200
Subject: [PATCH 03/15] drm/tegra: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-3-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
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
Also check the return value from drm_encoder_init() to avoid silent
failures.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 17 ++++++++++++++---
 drivers/gpu/drm/tegra/rgb.c | 14 ++++++++++++--
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index e7fdd8c7ac12..840e118716b2 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -20,11 +20,11 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
 #include "drm.h"
@@ -1055,6 +1055,10 @@ tegra_dsi_encoder_atomic_check(struct drm_encoder *encoder,
 	return err;
 }
 
+static const struct drm_encoder_funcs tegra_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs tegra_dsi_encoder_helper_funcs = {
 	.disable = tegra_dsi_encoder_disable,
 	.enable = tegra_dsi_encoder_enable,
@@ -1078,8 +1082,15 @@ static int tegra_dsi_init(struct host1x_client *client)
 					 &tegra_dsi_connector_helper_funcs);
 		dsi->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-		drm_simple_encoder_init(drm, &dsi->output.encoder,
-					DRM_MODE_ENCODER_DSI);
+		err = drm_encoder_init(drm, &dsi->output.encoder,
+				       &tegra_dsi_encoder_funcs,
+				       DRM_MODE_ENCODER_DSI, NULL);
+		if (err) {
+			dev_err(dsi->dev, "failed to initialize encoder: %d\n",
+				err);
+			return err;
+		}
+
 		drm_encoder_helper_add(&dsi->output.encoder,
 				       &tegra_dsi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index e67fbb2362e6..337925c30d67 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -9,7 +9,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #include "drm.h"
 #include "dc.h"
@@ -194,6 +194,10 @@ tegra_rgb_encoder_atomic_check(struct drm_encoder *encoder,
 	return err;
 }
 
+static const struct drm_encoder_funcs tegra_rgb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 	.disable = tegra_rgb_encoder_disable,
 	.enable = tegra_rgb_encoder_enable,
@@ -305,7 +309,13 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	if (!dc->rgb)
 		return -ENODEV;
 
-	drm_simple_encoder_init(drm, &output->encoder, DRM_MODE_ENCODER_LVDS);
+	err = drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
+	if (err) {
+		dev_err(output->dev, "failed to initialize encoder: %d\n", err);
+		return err;
+	}
+
 	drm_encoder_helper_add(&output->encoder,
 			       &tegra_rgb_encoder_helper_funcs);
 

-- 
2.54.0

