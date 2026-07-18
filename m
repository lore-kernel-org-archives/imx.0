Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DEF379C58
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417783; cv=none; b=S9xV3xnEycCqQ1+3ZQgZb8NBNI+++1ffX2IrHFYE9UEsDMdCkAI4sclvqW57ciNoUWf8HX7HdlGAJWsBRO7CqxJNhtMn6FAKRX3MQVuZ38uzUNwPq1J/4rR56UlZ+OsuxJABv3RwzG3E9KTmHwpV1TPN6duOY3Ixnp9lEFqWJOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417783; c=relaxed/simple;
	bh=uAbddcMyRgpLPl1Ml7UGFgQr7U5XL5NUVGp3YEItfuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FtM+xWtMBjbtqiX9fkzxHKrs3uLnATP0n7CAoTGxkI+l8g8ursV/qxDot3JHZynT8oj/lFoEs8COYyMBsrrJ9g3SxkdQNSobkaQSfv29HHzRQIQFTcx8NQRCHMPjhXrML2YEyCXkalgSCAWtD+USRaQ4sbWX+XmBOloszxyQdU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIgXPSBw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIgXPSBw"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f707e5d75so150303f8f.1
        for <imx@lists.linux.dev>; Sat, 18 Jul 2026 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417779; x=1785022579; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=GIgXPSBweDIyieRteuTVVmHEcKIj+lWVup9uS5KT+cNRwhXthCaoAW9DIf0Zc2JJ5I
         WkAfDP7igxg0w4fUIYZg5171PJMOC2tU2xdq99QeN1cHEPPOz+KyAuwQOEE+FsE6960U
         JO29UCaEueqDVyfQrNXU+kZ2SZrwwqDuuOFRq+DDjyq4vTmfj4gZZ2e8uCGO82y3rbsE
         GqqKbnyVVlkZuem4uYGMa2uylwZd2toh4hVttbjyX8/kRB2raWSV4LgkkZIhXCGprYbF
         rGKPBa3hocDAj98HLOH8P/orWuZ7yLHcGkz+rQla8zJqi3QHS+KNso3jFLPumjVBffba
         +mmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417779; x=1785022579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=Z746FrNl8hlyqDhN3yfFjY2t7OhRQHgpX9cei99jrZaVFAQ2GHoe3Cgli7Y32tvk9d
         WQBq6fULzE925Lv9rc3grEeeM6raJ7ILgUnbIE5X9HWrfpbP+XdydiffJ+7Xtrf5q1ty
         Ux3HQGyCzxPI2x7E5cPBhBMZqrmfwIxuzuWmY1NycEbK5DNIC6dfbd7oKfmf2yR4KS4k
         Zhp6NL3ZjSMg5/JAkrYMgQ42PRIcqXtFS46O0I099VEWEwDl0tT7vF8Oi+VKPjG2ue0l
         rBka6WMuK666B5/uFs/sEVP2NV6ngIgsPu4ftcZzdUAr2mlCQuaIz5vD4InED1IUpY3j
         f4ng==
X-Forwarded-Encrypted: i=1; AHgh+RorIXjeTaWzzxxDjAyUfm+ilEj770ZD0SM25EmF8Bf5cAFeqJ+MYjk/OddTn7MkBFL78aA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXw8XsO2FJm82s1BBechKvbDhpGxT8dLvQrRVjG4lPWL86orwM
	OLivAIHli/xN+9KEPQyANnEUQgc2q+u5S8DaAoWAVcQe611Er4VoPCmC
X-Gm-Gg: AfdE7cnafA3DGHyGnOQSZqzDDWJohHN9f5/zzm+ULjdbMzOLCzBO6qXHlNj7S0R6uSQ
	Xd109T7O1sEIPm5iEfkUxyZLkPVVDjnnRrLTmfH3UBgUQyQdqXyf4oCLUW41Wu3fiJE1FjXRcoA
	N17EBX40qfsApl39K5M+nmxXRNTAsDY3VedTBn3u3PkapQDKqIe23gE4LHsQFqgjSD5pqKXcQD2
	Byl6atlUQ/QKbr1xuBkO9yJhObDKuk9RV3rzZKJOtISdxR/aOggBqJ/ZczbqANC7unDQuOExYU4
	gRcM/l142ri6NogCyUwPelrprJ77tgcnBC99/lV26CmAngkQOuJ0oPp7DkbIlB+q2ZBg5L2yTg4
	yo17QE0FOnB7LJHe9szuRx4vZZYt6ANQGMuArSpt1eD8elkbOvUXB4mpDrZiOQiMUSt6XlvKlmB
	tq0iVhLFTSe6qf17cDFFWV
X-Received: by 2002:a7b:ca50:0:b0:495:3fe1:4ce4 with SMTP id 5b1f17b1804b1-4954a40c110mr70449165e9.26.1784417779234;
        Sat, 18 Jul 2026 16:36:19 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:18 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:37 +0200
Subject: [PATCH 06/15] drm/virtio: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-6-a78c509e3062@gmail.com>
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

