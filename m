Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760058;
	b=gj4tKXr9OQbe9U5tVMZ/rAgi27659V4FBrjvYX9vICBvRRZqpO8uw3daRU5FYKnsjdg9
	 AVUHFmmAkPnHPF7R+VQswcxtF+2wL1+Vm/6GmqfpWfjB/0Fmh79VPaSan0tnKXpPVcNzb
	 fyPMCrSUBCgxgrqDU04dQcWyxKwXpt+ibUIIhELQj31zKH8RS1qRSzyCijyi9TH9t0Nh6
	 6NU380U8zrT4DzZtg8ej2sj7X5dc2muY+4+fSLnz40ACCJmQR2XpXBXhccp6oD+/GQh0L
	 LJhpMtjdEheg4z+v/YYorhdjP59lfaHpsNgQe+vzeX9chHNqcQGnMO5lsMWUIACtYAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760058;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=dJtjUKsAS5jn5DSW4j3hvjzyOW1nbsZJdUInSqKVW9o=;
	b=nlIB0Ui21dP5CaemzDimGCd6jG9FYyvEvhoyP2DLkrwMacz4F09G9m1U2IsGwgwN1/Ms
	 W6pn8SS+8wQmCWAyxqu054/GpVKH5iHOIBl9hCwN4Rnv93k6pqDO95zijnby644oh/Iyd
	 a+tlU/wbecTYD9bjLnyxO/Oj78uO+gRScofEj/F2CkG+d5AFt7fYeRS8bu9nXDiA4X5Mc
	 nHgDj+YuZgeLp9nLhcgPbfMQ1PoSLdUMeS+SaCQGDBmbfKmX8wFA+KiOaM//XctrXS56A
	 e0VCfeBQHpqiJDa4Lxfp97OLSJIv8HTDu/XanoRGcHsxQQv0nqFAHmQO89QSN8jTDsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A0C606A31B
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 02:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A0C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACHsvwsm+pqr7k+AA--.5351S2;
	Wed, 04 Nov 2026 10:40:44 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/bridge: imx8qxp-pxl2dpi: put the companion bridge on the dual-link error
Date: Wed,  4 Nov 2026 02:40:52 +0000
Message-Id: <20261104024052.1508737-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowACHsvwsm+pqr7k+AA--.5351S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF4DCr1UKF4xJw1DXr4fZrb_yoW8GFyfpF
	47J3W5tryxXa12yr48Ar1xuFn8Can3CFWFkF97t3yS9w4rZFy5tas3t3ZxtF98Xr17Wrs0
	yFn8G34xJFy7AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBjb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267
	AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07bfdbnUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRQBA2rqY-nVdgAAsm

imx8qxp_pxl2dpi_parse_dt_companion() takes a reference on the companion
bridge with of_drm_find_and_get_bridge() and stores it in p2d->companion.
That reference is dropped by the bridge destroy callback, which bails out
early because p2d->bridge.driver_private is only assigned at the very end
of the probe.  When the dual-link pixel order detection fails, the probe
returns an error and the reference, and with it the companion bridge, is
never released.

Release the companion bridge on that error path before returning.

Fixes: 900699ba830f ("drm/bridge: imx8qxp-pxl2dpi: get/put the companion bridge")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index dce1a5b36024..e0d06a968724 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -374,6 +374,7 @@ static int imx8qxp_pxl2dpi_parse_dt_companion(struct imx8qxp_pxl2dpi *p2d)
 		ret = dual_link;
 		DRM_DEV_ERROR(dev, "failed to get dual link pixel order: %d\n",
 			      ret);
+		drm_bridge_clear_and_put(&p2d->companion);
 		goto out;
 	}
 
-- 
2.34.1

