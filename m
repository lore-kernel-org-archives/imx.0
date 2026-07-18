Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFAC37DEBE
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 23:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417803; cv=none; b=pICOqohap/1m6bbViftSehyZ6+ifPoaFBM5vLj9YYggwzj9ucDjFSxHvJc0U3f5pkzFmZWdbrJ6YQ53qP3FlkkAgn5DA/zaW/mIcOvysHus3zvds31b2KqzpK76bbvc9MnS2FHYUDqEpGJ0DxZzNPmfkohomn4qK4Lj/+XyK8Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417803; c=relaxed/simple;
	bh=v9DwgKRLbmJruTxxwltkPfgfMQ/xrenPmg2doUmkQsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsahSCWaLE58DjDMCyMWJEt7ZAtWeik6r2ZePVIE1EvOJOVNwcY1pPyY331pCQURCxGqrgP2rP0fzLECrEYTpYqwroO1Z3hyaDsMmcdnRjwdP52tJrZQ9QS4ievZQK14Ux3jDUUF193e65GhGhrU48S/iMQMGfDhLhO1WsakVcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQI1un0x; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQI1un0x"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49553515a8bso5203215e9.1
        for <imx@lists.linux.dev>; Sat, 18 Jul 2026 16:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417799; x=1785022599; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=;
        b=PQI1un0xYLPMgt9gVJG4jL9Sxj7qEPgDSK4USV3ofdIvl+plgeXq0Tz9ZBySbTNe1+
         EJce0yqoMtE7sH+CmViz60ol58A9QEJthSnl5FEREJgPkmoO0aRnwNasEPlxoklrkCKM
         EXH9QhHEZXRYaKyImfyTaB88Tuflzvs/pBGBwdkl3JbloqKSclbGtkhYA1USGnzFylvC
         CxM62l1Bt5fqF+CRp1yD+mIwDZialdQI7zyp17hxYKZAh728Ce1vII2DJ/cckF85JEOh
         v71X9z0YCnZ10MhJsWtFFrkSWOnLF8QuaFpNtcKyR9u9wpcaoS1WOKLK+DzN9KMegONO
         0WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417799; x=1785022599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glDDRAcdG2z8u1IQ6JIBLAUYK0TMezc+/0A/g0HZvjw=;
        b=LcE6MLdoHnN9CwICtCvJg4x7WLrAKad6sykfAxphVcqOLiLp1K3lsU6NFlrpLANiGW
         V3YUezQ4SCMNykSfOxKCL4DbpUwrMdzWSvWV+E1PU7vooW64gQXOssEJxav9XzqIoP5j
         k9r+YUlGz3bdqhGSxEkBKbKukUEg7VydlvUc3lXNWLFdNsQXd58OnCMGK4dTFcYSz40T
         3HmQu0glUOBpetqzjmmy/4TAUPhihdxanCe8PwFLm8cnfHS4j/evFP5lMs29Kk3fdyKh
         m11VEbQLfvzEp9t9C46nBCF48dt9pAeLwkUM5vGDtvxzpwQSLY0nNFGyj0E7VuKYMlmY
         ylYg==
X-Forwarded-Encrypted: i=1; AHgh+Rorh9f/sgX44Ro0l7yu6gnuSzA/gjhI27pGhjTU5pd1jW9yC05ejDGJ3HvUXFI4jhMMHUQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ6CTv/qmeWeklPeS956jyCfaWxItg7a4kaDFKfJGGPwiqdAN5
	UJtQ34N6rPmeqX75LZuchV/IdAoPkbNXlamE4s7har2XQ+XIXUuckS7A
X-Gm-Gg: AfdE7cnt5HIfhn1CwY1q8eQuFzRgXhu5DXTqUWuleIj3PfsmKoe6mnz2W0PKbRv8Nqs
	nv+hBySHNrBVNHKPSUkbEVQxHCsIsHJP2CBpDcbeTnpOWV5mzZLgJex2CotSLXXkWIKpS6IZPJx
	7qlsXaKKEGTdOyLAh+logdnco3d2wwBRrjiorVbNRaJda2/aVMHGOJOMTe56WkzKC5fskj76q8S
	ZedUzYhuLWmJnFCFy5t064MNh7h086sLlo+VAbXaFPzEL0Sk7HinnKepN4pDADoTfi08ZEHQiuF
	QZ06PjDo1qigZ/vJtDEPIe+f3yAsWsi7xCfrlkrUhLXpk41i2NaLtSUl2+AFY0q0SrzOMtYMh9x
	aYw7vuubtiWsUT3Hppta/qBScHiY/WUwEJAptcvMTZ9xLhC8DJnVxDpn7g8ibth40kfuRgc4EkA
	RCZb1s95FMww==
X-Received: by 2002:a05:600c:3b91:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-4954a3d0065mr111986515e9.3.1784417799407;
        Sat, 18 Jul 2026 16:36:39 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:39 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:43 +0200
Subject: [PATCH 12/15] drm/arm/komeda: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-12-a78c509e3062@gmail.com>
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
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index e8cb782a6f8e..719568d9f7c2 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -11,9 +11,9 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 
 #include "komeda_dev.h"
@@ -635,6 +635,10 @@ static int komeda_attach_bridge(struct device *dev,
 	return err;
 }
 
+static const struct drm_encoder_funcs komeda_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int komeda_crtc_add(struct komeda_kms_dev *kms,
 			   struct komeda_crtc *kcrtc)
 {
@@ -658,7 +662,8 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
 	 * bridge
 	 */
 	kcrtc->encoder.possible_crtcs = drm_crtc_mask(crtc);
-	err = drm_simple_encoder_init(base, encoder, DRM_MODE_ENCODER_TMDS);
+	err = drm_encoder_init(base, encoder, &komeda_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (err)
 		return err;
 

-- 
2.54.0

