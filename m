Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F83332EC5
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 23:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417786; cv=none; b=Az/OoCjT8ZnjuI2vFbeV4U+ClS++lAXAilqZr5QEV3XZty1r9wYuAGwSr4M8dEyV/rGElu22HAW3BIQa1PfKbEJfXw0mdjaZCHM0eBDTQwnqiosX2LD6zDOaQZfBY6i28gtuXQvH8e86NpvoHf0HhAX5zGmkFrCHrbmXW+dfMJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417786; c=relaxed/simple;
	bh=HdxpWSHVTZnagqWd9UGqEZtDSs8wJ971uoSLZwkj04A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sL+myAxeSGJsSCY9vFANbInb5RO2sLD1Mwyoo2W1uYq7PImq8nugNldqmuSIOwa6PgZfTBc442I8ipJfw4EDCXo8zWiAaDOho81sTK+4pdqBFXA2kD3ukCspcKZlZ32xSsj64v77F8Z4/tnmpyY9wYm9hzP9ydFTbPewjESqJz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tow7GYIB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tow7GYIB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b966dd74so36649445e9.3
        for <imx@lists.linux.dev>; Sat, 18 Jul 2026 16:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417782; x=1785022582; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=Tow7GYIB40fbBz7Cvsh0ePbF8fAH6R0sWmLIxqttj2RJC3hwiBkkkOKwqYHHcg4naT
         gRjmFy75llZYv5Vjt4n8YOfJneVFhz05oEbAjLupy+DB019D+2omFySgwaRsuFeW918l
         l29E3unhMtVPuBX5x0H0Lg73/jKzZD57Z3YyttGK6zXlEqtER2EnqvFb4p68w9jJgyMJ
         fUgRbqJeWeU1n1eOlrvOr2QarmX0TtnVxzRWRnl0AMcXlKRxaW8ijODQm4+5q45uJC/y
         lAH6le9rcwTZyMRxFoKdqwQfyUg0U5sFukJKp9UsXMQloDGJssll4VdjxnB311pWF9jY
         uidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417782; x=1785022582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=EIqaGZWiKwSG+F22hMcRyWYAEV2ZQK9DlXBbl2VsWh7piikyZ/jTQmmDpZIltKdHzO
         udPvZSl0oWSI4Jav7ziUlDYu2N4ZGBtUGnDCp1iS2bBNGaWLWyLk9u3sg0gol5qIMCM/
         H9hwT6Dg1a+Vxqe+RgVHn0r/79V8uA7ecw3uvvBT6aEmZeCyLDVYFzYq+6J6sEAL3wG3
         mQFytQkJ2xT/JNgs86WDbWEMfhhSPWg0NWnI5ZUm40ypGXhVTIsQ+svoYSV6L76+wLiz
         Mv3ibMc18v7swpO+Qs1fj4UYD5iB+JjIB7QapIv2v1aLK+v41eY5ng5FdF5DnrHrPD8q
         Rt2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpZGxjvF8XW2WxfaESmeFF/p30KgxolJxoiajT8GCcVYnafcRPB06ylLEVwNpzWmmjmreE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzem592BjGER1gtJxop9brmehbvAbZgdzpF5m54SJxhLtYrD7e0
	dgqj4+LVkQA8AnDOUMP7+Y4z1PIHJJohgFQ6Tqu86YPmT3+qextdRTBX
X-Gm-Gg: AfdE7cmiLUggqMwIHFqaN2PrhzJU6xCgM9gheV1/+dkLjQZsIW+bQYMrZ3NxIcHoqp4
	xph/EjIgjbKjFJz6bRGkIUGka4oBeKExjgMSxDvAsls356PjtQvBGBq7DIcC0wLfopxOzL5oMl1
	N77FJn6W5tVWh758TxFASnUA/LA11tQEbjIKiW3MOKPCq9AmJ6Z12zraziKluN4ZC7BKEWsLL28
	ERKBhtlb+bQBxYI4oyh6hvHSjyNzMH4DTuE7B62d4QSW4ju5cwg5ibLsPUhvErHPkgYUsUOT8Gv
	4jqzXxt47xuJvRBBnOALVa7CH4HEWC3Avql3l2FzXuumydEGRRXmgZTT/ozaXlev6Dad2furbCE
	Ew9mFJwQg39M3aIMbTZKq88CoNV9EJf4rE2cN2CMkIKY/aTv3IzHzSqGxC76Z6I3G590WcM1dGy
	56LOfdWFTdYA==
X-Received: by 2002:a05:600c:4746:b0:495:4d07:4fcb with SMTP id 5b1f17b1804b1-4954d0784c6mr79013155e9.36.1784417782504;
        Sat, 18 Jul 2026 16:36:22 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:21 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:38 +0200
Subject: [PATCH 07/15] drm/tidss: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-7-a78c509e3062@gmail.com>
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
 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 698f8d964ca0..10dbcc6cdf6a 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -9,11 +9,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_drv.h"
@@ -81,6 +81,10 @@ static const struct drm_bridge_funcs tidss_bridge_funcs = {
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 };
 
+static const struct drm_encoder_funcs tidss_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int tidss_encoder_create(struct tidss_device *tidss,
 			 struct drm_bridge *next_bridge,
 			 u32 encoder_type, u32 possible_crtcs)
@@ -95,8 +99,8 @@ int tidss_encoder_create(struct tidss_device *tidss,
 	if (IS_ERR(t_enc))
 		return PTR_ERR(t_enc);
 
-	ret = drm_simple_encoder_init(&tidss->ddev, &t_enc->encoder,
-				      encoder_type);
+	ret = drm_encoder_init(&tidss->ddev, &t_enc->encoder,
+			       &tidss_encoder_funcs, encoder_type, NULL);
 	if (ret)
 		return ret;
 

-- 
2.54.0

