Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4CF433BB1
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562080; cv=none; b=DtMt0ljFPwUg5Z2pyEMlWgFW3YCZqKJV+hUSoZEorHOSxzYnoR87ZIoaEmimEBR//DFEJmNjUFw3dFdHHNMta7SXKx3mTV5ajbcod6/OvvASISjo8NrzAz41xDPE3JX7Nb9bE/BQ5p/ESZWQVmlCdxhUODDgR5yaoXXvU8+6+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562080; c=relaxed/simple;
	bh=BI9R2SvxdH2gwqK0B92kFqt0y5mZiDZk7s7kVtduUr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6Z1JJbHdjdlnZFD1Cuu7GH/ClN0JGGrHiDYZRZkwvWB7XjVr65kjt81SXM6SG6VQdJvTYwiinHbvzK745X96j4cOrD9JKtbs3fn0mGYIpxW42HGAiiBXwR6lA69lKs4T8R4WiQ7z8PuenQFsZcGw4I07obJJ1/42KynM0UGo2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XT1O++46; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XT1O++46"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so78722515e9.0
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562077; x=1785166877; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qoMRiXvV6BHSei+lkJBYDW1cqZXXpht0BCmlOitIE4=;
        b=XT1O++46N5Nnkp+Zz8A8j2trpHzrBU3yMEf9Tb0KKD0JdzHfacnswkWnlmpCaHKhqr
         uVEYMMx6vHnonB1OGmyGd6lETy4TUzbzYE2xmPtUwop9CXwmyNafE43V+YGI2gvztytq
         m1n7GcLDAXsKsrmtTxGJAluZ2LSHbGlfUS+xIZXrFVhG3B31HsGyIgVqIZnt8KLmO2eE
         seAQzbQY3y5jYMMUY4BeJPaG2Cf7ZTM7gzw9PKicxGKwuGDJAWSylQmsXr8KVzG7Mk+6
         brnZnB5gBH2wIFnLY7fAB/iDhk22kUhjvQu3sobSe6qIDsWzdGACwv4g0IGFfzDbi+KJ
         g1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562077; x=1785166877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qoMRiXvV6BHSei+lkJBYDW1cqZXXpht0BCmlOitIE4=;
        b=bBrpXC99T/L5H4yEIm4WuzwrRrK32jbZGk04tBwU19P+9dEjknZZ6AFQDnPNOaYGCz
         Et8KXcDQ6bzp90NX78xbEbvytg2IolQZ2NPLOJKV6Y33fg67ngrthvkn6OvCk4KRSplK
         27GmsIHGEnWv9gqy2Z0oL2NhHBPJ65keGnxAAfW64nD1AJSbO7zt58GX88vbD/mt68x5
         B+b7Aj+izi3QlBtXy/TAhrlJgjqM51aY20LmTWUmeO41SsyZX/4eo7coAOnc+1+aon64
         FKwj7VFdTCK21um7uLpyAQATHlpw4yPX+SM2Lbf4r95Io2SIceGGajLYOBeZWjidvoVw
         AJJA==
X-Forwarded-Encrypted: i=1; AHgh+RpcjQJcx91Cx6Zn5eV2hZedVUhEIM9w0vlg2Ovj4evk2OnBbq4kVq2h0bkMaiOwzlCrE0M=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSn9UQRPbdA60dmn4sxaxhYmZNXmjV6Cnq4vWJUSpW7c2XCjjZ
	4IXWmdg3Ak5Geso6hUl8xaPU06zULYel1UWtj2wnl7yH5mw+OCmVl4mC
X-Gm-Gg: AfdE7cmUYKjKYhxaeMMBGONegUx1+u+aHFuh2M7dpYjzEdoAK2mQPAr9I1zIwImAs8L
	s6+Mo4ynQZVHAjPqbU6L1PJwZ6+yatGvuCaSV7ppFEaTLLbjCnkaNgiA+rOLtWKwW5n/9otQ1kB
	UD73pB1xtvFIuEwGFBubeOz0rt4BXkqgk4HGpxL2HIyLdxikj52zCmf6DKKue1G1+17ac2T6OQj
	5AhEJggiOkpBtD3ttbCrSzREXXaVt1Un4lYGyRzfg9E9iMX0Y8EhhLBXru/bsNWLItLkXT+v2PB
	tuyN02oy+tAxMhnT6q6jJLPGn/CPAGY8/5JU9DtUgBcMVTXXxtiMqknudtozYpJ4bkog26J14YX
	6v8lLmkKD5UT/88pywjY0aT8+7wcznuoN6G7qILlub6yYAADlgAurtONsu26QI60B3ObDQIgC77
	ZXD9VGbTNmWg==
X-Received: by 2002:a05:600c:6b69:b0:493:e583:7053 with SMTP id 5b1f17b1804b1-4954a41431cmr113435805e9.35.1784562076586;
        Mon, 20 Jul 2026 08:41:16 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:16 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:40 +0200
Subject: [PATCH v2 08/15] drm/imx: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-8-5020b630668a@gmail.com>
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
 drivers/gpu/drm/imx/dc/dc-kms.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-kms.c b/drivers/gpu/drm/imx/dc/dc-kms.c
index 0f8cfaf4c4d1..a9adcfc68b84 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.c
+++ b/drivers/gpu/drm/imx/dc/dc-kms.c
@@ -17,7 +17,6 @@
 #include <drm/drm_mode_config.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "dc-de.h"
@@ -30,6 +29,10 @@ static const struct drm_mode_config_funcs dc_drm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+static const struct drm_encoder_funcs dc_kms_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int dc_kms_init_encoder_per_crtc(struct dc_drm_device *dc_drm,
 					int crtc_index)
 {
@@ -55,7 +58,8 @@ static int dc_kms_init_encoder_per_crtc(struct dc_drm_device *dc_drm,
 	}
 
 	encoder = &dc_drm->encoder[crtc_index];
-	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(drm, encoder, &dc_kms_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret) {
 		dev_err(dev, "failed to initialize encoder for CRTC%u: %d\n",
 			crtc->index, ret);

-- 
2.54.0

