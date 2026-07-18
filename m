Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612FE373BF3
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 23:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417776; cv=none; b=EEqwCILvmjaE41XdCmfb0RhapdX1I7Dam1Row69oZZDzBMGMOXMjWsL09vkYawRWpDmVacYf4ddDYpjNqqRRJSM25o5putosg8ma34NB+OcCccF5Ag4IcCL0N/3xmVLAZmF4+glOhTRZqSGDlnEIXTwRKihf9cv+8tjSBYCV/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417776; c=relaxed/simple;
	bh=4Aj055TlPMxBq8UoEMyCmOSuvgCOAi6uSPvqm4WRBDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUCTRxIgfjI8UKSmqOLPJuCON25e9RA+sft7v3lsnPwt38OlzpnJSVnLsxcilMBR0+5URyh5esXdcgHy7GbJUZNNZwMcNd8MWnou27raMleNYdduiS7byRVGh5Y7KzUeG1Ypd1dNFG1RYDAVKUxP4yrL5j+aP7oiAXPVD5jYSls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHqeuMWe; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHqeuMWe"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49557167508so2714935e9.1
        for <imx@lists.linux.dev>; Sat, 18 Jul 2026 16:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417772; x=1785022572; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=bHqeuMWeT+jmwM7wjJhDHnM5lkzhHkxRWC7YBKIyQLVf+LbaXWWt+7nBdoBp5MSDTe
         MCzF07rSc+zXGHIVzU5xvJ/vkodzO2q2DUCsynjZlMMvK9ifrIkjyNEBbJWEkO6fy5n2
         5dG+kLKKr5rb6sduXENmlqAVVegAn4l+P6zWDotM5GcfH+B74AKlkwFPLsuNx2/+C88k
         aivyoHwuQ0oi8Lq5pBXCNUE0EjfaxsZJcXkq0sNh225ZghUhnvFyXHxq7rz4tdzvJ+Hc
         EgJuYKsFBND+e6+nz3Cmeg5QeOa7izjfpekrp1y+8YxQmPo2K2KvhC2xf3Zn8ATS/opR
         Mx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417772; x=1785022572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=RsZ+I1W6cFk4wOJsK24FwZdeMZhbjeaWijUGYf8pPxSeMHgsHORIgxBHQu+qZRQXX7
         pA/cKnIH7mWz1ypWGjOUZEiMff3nF/I5yH3KCVIS5P4Eoj1apyDY+iGt9dbZ3nQaIPQC
         F1T36kAV9JF2lvolVOph46m0cl0tusuYDwcARj2J/tHZ4ppuceD2FYiTpLbRS+6zoXXz
         RrL4z/d60I7WSsuuYdykv8oeIgc+UdfzxG2qR+ZMRXxIzINRdnOBDDMaBFrnLYO9aMAK
         UKvMDG0Xts2nyywW3k8PF6E3yb4Q5TcPyLMzqvrEmyFAON9pxB5JqdEkCAD1tMJXxymW
         QoLQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro51pWOyGSizHus+prGGU1A0ALuROuA4tZGcl6LVLjl+Rxbk4JQ/2kbs7RMpb4Po2PvFx8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtjOR+hGmzcy8pnZ6B2xfm6Z98LbvcYT1uls4jvCeARjqXJaDS
	xej/31WL6cFsYqUyUvr/lLtPaK/yddRULw5jg0dxeN+j9COm/w3hltj3
X-Gm-Gg: AfdE7ck49SKmnwBESmyNA/d6/d27XSX1c2jMkuAeDaxHOGn5qP7aRZlr7NTGU3G6Pfr
	c8xIvhic1FiuUoD/fPcfOONdw6BVr8DO7uuDgVls+/m0flnsM8V/rwdZ+i0f+I3snpGZwPElZg7
	u9o+r/odMiEgfl4dlUyrzuC9+kZckGfbCDXs974Sv2oXQuXjZdE9Fe1xAR1SXyPb4voGAlhBy8d
	/4UEHyURn1ifR+cLdwHiFUKs1vIZ5S97KCoTvVhHM478CVwZ7tdunUbR34nEngteT+QfXb03XaY
	mli6C+O4tYdyynwE3KJzJMsvaMG0q9uQMB161wol5ejH/y547xhbZQlKJY7zo9unCb3BK/IxsFC
	Dv0aIWfa2gsbDH5yRfZ9LU//BQVX0TlyBGKr01Kc9xpXeUypvu5F9u2ITAeIC7WuUl7u1Bye5Uq
	p+fF1svIZOcg==
X-Received: by 2002:a05:600c:b85:b0:495:5365:c0d1 with SMTP id 5b1f17b1804b1-49553d85ea0mr35374355e9.14.1784417772455;
        Sat, 18 Jul 2026 16:36:12 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:11 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:35 +0200
Subject: [PATCH 04/15] drm/fsl-dcu: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-4-a78c509e3062@gmail.com>
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
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 84eff7519e32..c2b788bfa8f9 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -11,14 +11,18 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "fsl_dcu_drm_drv.h"
 #include "fsl_tcon.h"
 
+static const struct drm_encoder_funcs fsl_dcu_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 			       struct drm_crtc *crtc)
 {
@@ -31,8 +35,8 @@ int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 	if (fsl_dev->tcon)
 		fsl_tcon_bypass_enable(fsl_dev->tcon);
 
-	ret = drm_simple_encoder_init(fsl_dev->drm, encoder,
-				      DRM_MODE_ENCODER_LVDS);
+	ret = drm_encoder_init(fsl_dev->drm, encoder, &fsl_dcu_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0)
 		return ret;
 

-- 
2.54.0

