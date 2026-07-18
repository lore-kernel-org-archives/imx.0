Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E3B37DAAD
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417799; cv=none; b=D/TZVHwiRdtL7vYIERstNqGg6XHEvIkHmPtVSS/ckdHvgFTVg9Cxv9ZjpCgipyLH+BAgqum8RCfmh/6oRDam7gmgFzSEJB5GRzKkie7uLufQKiUYFfUWken/iWV7+DCxa+YFL0U5Xik0/w+6hv+6YBHSMvUQvTUAqJz0kJB2gzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417799; c=relaxed/simple;
	bh=b45v6y+LLUGyopM335rc2RHdtrcJI8ZwsczKTNDgp+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J4j/Giadddj4cSBrEzr4ukD5+FZEeH0pLovH4GqJVwegVjs3NlazKPvHbKYIcGuOpd5qg5K/bweZ0b8x2Fut6iyr8XgexlFiEWxHVqH6/OSzqoFsk+yTx/esspASWyx049Hbui5ok7jj/4jtDbVYMHuLRuA2xiziPNWM5nygELI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=en6UbFzt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="en6UbFzt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49547fc63a0so7752405e9.2
        for <imx@lists.linux.dev>; Sat, 18 Jul 2026 16:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417796; x=1785022596; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCTzuFV7eFCGxIzO9ORcmzHtSM3Ggk/jrKBR0xDgYaA=;
        b=en6UbFzt7BC7k9p+y4TUHMVmcG474zDozW/URm9dycPkg35hSPcG89zg7FOdwsWbPq
         R2aXGK24irL+az9fsYkys++IZU3lsjalZyeG4oGZokXq0rBgnc944j0ZBhzJkWlzapGq
         C71JkAUWuxb0KmsWqwcVi8nbW4pJ5cxXQ3DyxqyjEbBxk0ddgqIIobF4eebae+58h3mx
         4lj35e3oCIuE931SA7X7Im2q5BTMFvSXnPMz74luv5Puqo5AEZmoa/xRcX0FmIJk9aCS
         xFmtDMkm8cRnADYRtww1AmEtKnqOQCtHhGp2OkRxIfXZgubyB6aFw4RE7ScNuvsRbFnF
         y5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417796; x=1785022596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCTzuFV7eFCGxIzO9ORcmzHtSM3Ggk/jrKBR0xDgYaA=;
        b=Y0L+mLdSXEjVMWk9Dgn3u3T01gDWg3eHY1AeSBQ82U6L03YHtqX0ap4jMs/cgKZ8aN
         wVbr1puS5fmPesqT2edxqVLWcdsypHD1CmC4jwt09Q9GYYUE0cPJhSAW3h3gxafh3oej
         F+z8csJ3a7dstyF9fc33lyVg4AGRCtXErmzaw2s6No/acqx43Iatg0wblDyCTHJ6eytg
         nszFbnA0YryppqFbZU0Ex0HWVbSwVwE64wv1fc6rwrxCxWkTuVGG4cWu3CNHN0ovdePz
         Bywm2+oc1qqoeMGfaQWSsKH0IxdvBZIponbdOGkxYqCEMRLcaV853RJs6QGFQfA6CGYc
         4Djw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8UC0z3lcSNJs4Gr4ozLdd0hr6wozPuaXH9dAFdg+HttVfHS0ERnJ3nj+yLrw6lxIaFpc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz62f1cGl8AAMOHbjO2FbY1/L/3vLbj+bqp9xF5E+x+Xbq1e4NV
	P0noJG2rxRnArRap4nB3dBbchr3GSVJOM39gQsQrMJXQYJscLFLDb9gS
X-Gm-Gg: AfdE7clFBjtzDcR3viuVDDK3u5AdWmsJydp9LAyeWG/GX89iiAXOWe4ugAenz/4WhZc
	AKFDsNayxZGkrsOySYrrBcIqwGBpANDssTu5nQDXmG2ujO7lwiIfNPvjNEFZZgvuZXnwIl9IrHc
	kxN1yPR+sA55D1XEA2ATpHIZsw5b1E61+FskUEv6jA7mvGwYbYBzSN/6ESR0BXQyU0m9jUywIXt
	i3AFawApQDTtY8+78cDAWKGY4tYJ1XEe5wQdo0046jvgbhJ4A5YvyimmIPgOBDYIOjqldy6b0Ic
	jFg6EMg3skCoH0mEXnDKFADLuNlIrnBrb7gE5Ous7c5+4z27PoOswmnLkJecZQojNVkk2MckqIo
	CZyn2Y3Q8HKtz3Mx+401588k3RvajBIH8eT26ljV5mjUa9k+IKNOCG8Y4mB9cY71LjQToyouo+x
	3PkcusTnZQRg==
X-Received: by 2002:a05:600c:3b91:b0:495:4c62:9d43 with SMTP id 5b1f17b1804b1-4954c629e5emr98503215e9.34.1784417796224;
        Sat, 18 Jul 2026 16:36:36 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:35 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:42 +0200
Subject: [PATCH 11/15] drm/hisilicon/kirin: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-11-a78c509e3062@gmail.com>
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

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 15042365dec0..62c5bd3277da 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -20,11 +20,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "dw_dsi_reg.h"
 
@@ -687,6 +687,10 @@ static int dsi_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs dw_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs dw_encoder_helper_funcs = {
 	.atomic_check	= dsi_encoder_atomic_check,
 	.mode_valid	= dsi_encoder_mode_valid,
@@ -708,7 +712,8 @@ static int dw_drm_encoder_init(struct device *dev,
 	}
 
 	encoder->possible_crtcs = crtc_mask;
-	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm_dev, encoder, &dw_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		DRM_ERROR("failed to init dsi encoder\n");
 		return ret;

-- 
2.54.0

