Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F44433025
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562073; cv=none; b=bl0d+oAuMnEk2p+G93n7BkCjcasHZiRGX4M46+OcUJOb/go2ZRW6kZcoi5Z78FNPwr+awwcIBTYu/zq0JVtsDHhY3TueJ+MK+6wneuMA9+G+DCs3oufVPkNLj6daVfk3iE4qoyTOav6Mwa9dDt81IcrqwmDyT0zmyVKoAjehtNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562073; c=relaxed/simple;
	bh=uAbddcMyRgpLPl1Ml7UGFgQr7U5XL5NUVGp3YEItfuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfuJiWwWxg23TR7XeY1OvccCwmKKWWvSW5jZZlanfsS6jtixiHOALZcLMd+jFqXdxAJAbBEs9JtnRIH6NREIih8EFSFAl8lQdZYfxvAalsZYPfeqap+kjX1wK/lqI8U2SWCPjT1L47QN+QYm+PYbsRTdFlkWr9lrY0TL1yhgy+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaEzz6xV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaEzz6xV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso19358405e9.3
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562069; x=1785166869; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=gaEzz6xV+RHtypBrxLmJCU81v3Y9Erya153zcdtWGbrU2Eon4a9AgskiUIlrNlR00D
         rQgn4v21QsA18jAd12tFT3LwoIKS1rVlTn+yxEXKxtBY0pssqzlo1yX+pjbmWjcmBnBp
         ThdPSV6HMcwkOp+q1DKKkTVeDUSIKVkFK6kkym9jWnwgeJMSfPvDKJM6CkNiY8RnPTUO
         lOJB0lTfL8+nFlNPvGGUfqpDm4XIXaBsR+UeShdJ8Ruddk3Hlx0mX1WeH039umBxQ4Ic
         uc7wJOpykttVscx3OpghabHAPfSnfpPoJTWlFeEZGOeLYkzoHOHsgNcOewhtoZ2tTGwg
         Endg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562069; x=1785166869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=ouNY3uYmif5kMxTXx6EOMtUpf1eP0agsstnfPvVAKDbIdGm7diCuVTe1SM+Zivnvx0
         uQS0l+TTvb/O1n2PoxKzst/HITxt1AIw+bKwM49eCkLSQSfWUMNTKldHzhhu2CuJlees
         e4rArGvbcZnLG3MWSE2gWMGXJu59PDllME+isfy14DZ9BLT0h9nZqpsat0PtQYWBpkxA
         j665rAiw4pns4Gwj5E1J2GrCKuK3yeI7lU5HXixSg4ljbaOqha89Pq7VYq3TLOYFCtdH
         SXK7yZXn4Ja0FxrFqhSXB989PxkOtWtX93Yj4hY8aNtcbulLlnIEafsSc5vCvibdpdrQ
         +16A==
X-Forwarded-Encrypted: i=1; AHgh+Rp0Uf2IXiJq/s+wSon00fDkrAOao6+9YU0w+QCDSWM6CdbDakLn1Vv1zVWmWx4PkEzqr2Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIUak73+G7zeIo+dubMdSUtZGyJiffU9ZbEteTkEGaJAcC9XzH
	uLpsE8b5JwEHkQGsrGIxCahU+DhoeomGDBYi/N95sdJJwtDxtP005/1Y
X-Gm-Gg: AfdE7clI2ZBOGVB7AmYCcx5F4iyvH2XQGk+7HCsKBkTza1kTHPGecO5t4Rd+9U5zVvi
	SdN//oFHhWiChvXBUOuv3wvmED6pHvpErzMAVaTZgvEOWGM1BLSGp2CnOlp/H/ng8ubj2Q1fpST
	/ck9HBDDulUwN+MbPFR6bcqIGxIIukJH+F0UL8bDR+DNn34/AYrO9TA8ivkAsBGxfVXkP5Oitol
	Wk2S3WiQ2H6GbtfZLEbWaAAOQXG+Wf1mVftuJhZcIQlbFdf/5g0mzyxrfAs41gw075gFBNtoKEX
	NVPKA+S4tYYx9N4WvA8REtnZFVRuJD+T7seYIg2xFKnBCKObnmZx+D4NJzJq1e3p8MdEoamBjox
	t7o++4PuuprHc8QQw+zN+Wa3s97FOB9znM53Tb9+mjboW6Vd2YRuIFxbwQ1CcJ1pekc8apcO4N+
	UFV1yPQXABYw==
X-Received: by 2002:a05:600c:1f8c:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4954a3e6e29mr174459165e9.5.1784562068798;
        Mon, 20 Jul 2026 08:41:08 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:08 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:38 +0200
Subject: [PATCH v2 06/15] drm/virtio: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-6-5020b630668a@gmail.com>
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
Also check the return value from drm_encoder_init() to avoid silent
failures.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 44ffffec550f..67023d91d40b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -28,11 +28,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
 
@@ -232,6 +232,10 @@ static enum drm_mode_status virtio_gpu_conn_mode_valid(struct drm_connector *con
 	return MODE_BAD;
 }
 
+static const struct drm_encoder_funcs virtio_gpu_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs virtio_gpu_enc_helper_funcs = {
 	.mode_set   = virtio_gpu_enc_mode_set,
 	.enable     = virtio_gpu_enc_enable,
@@ -306,7 +310,11 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	if (vgdev->has_edid)
 		drm_connector_attach_edid_property(connector);
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	ret = drm_encoder_init(dev, encoder, &virtio_gpu_enc_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
 	encoder->possible_crtcs = 1 << index;
 

-- 
2.54.0

