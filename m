Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473253;
	b=YnAENH+Pipyy1DLyEgLe955P3QgldGfDpZGqWqFA6FwF0pJaM+1SnpD8DsRm6UHexJMu
	 gQMDdeifY+6sHAirnWeECMNz6/NNMct7pxCRvNe479SFYFRKxwfeA1cAFtwGtMS9PnEPj
	 CosC5WvmMS7TFfkTIPzIUZZD7HVUEmNvBltK8Je3sgcN/qieH3stVkMKcsoJ79UMSSr0D
	 Z68gYsv4HDgL2GHf5BKJ8UeiYF6t2TITg9m9sj0vhFPz2ezAcadb/7RFfnklcVypQigh+
	 J0iK6/r64RReTXcfYZvsc4zrBxeCtT2LohYLFwqUJA20ygDvEkLk2jQ0J6CAQAgqtbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=03w06bSm1yONRYYXB48Ye2MeketUdFgM5u2hRd5PsVE=;
	b=Sx++toJ8PRygOreoWQiP+tLe4ctLigELsAsqMVSXV4tMAXUvy9xxHr11nyXWF9NfGdxp
	 Rd9b5avZDnUQVcy0MZSr992cxINkGA9Mj02WmKBImp6DGcKaTJI2OdXVgVznpB7difmuB
	 oWm4s2kQiTTKcnjLk1cAva7Hbvk3+aRX6T1hrZVpSQngz53m0fnGWMjOtHayFG2BS97pP
	 5GADKApr3go4CC7MP96MVcNqw4qyvfGk7U85kGy+Sxi5yPbp380yi/gGYdpU3sXE1WnEO
	 1GQOccUcG3fuKrvNkpn0KV6KNnpVvomJ68gOhz1Z2MXUFkWFbxUc0HBSLKN8VrXatgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=euNsnOdv;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AFF606A31E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 22:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30AFF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=euNsnOdv
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so974252241.2
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 14:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795473252; x=1796078052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=03w06bSm1yONRYYXB48Ye2MeketUdFgM5u2hRd5PsVE=;
        b=euNsnOdvYw/mPCVrnVIs9aFKyKt9tvJWbvUkWEeBDw1nPNthHoPux1QG/PLsZYWGdY
         hBp5s6KGFSBYKzI3TsU19QJNG8inL6C/rDfxIa1VImmgxitMs12GICotAIp4wLp+GR8d
         3I1+Eh7VUNDaZq8zn0vuNZkf7XBAJlXN3hdEk94pLgHroRvhngxXiud75gubYOHj5pGw
         dO3++9PLOdLs/D8OkQDMVynTT45EHu6H7zFBYkEDq1PUlaYu2M7MLNzM4dzw6w+E+ak6
         xaeECrzhdxukuVBuWjDuqTsQT4wPHc5XNoL0Vi653Y1tj6DwN5Pw4tpatiTwem3U3yKO
         w1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473252; x=1796078052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03w06bSm1yONRYYXB48Ye2MeketUdFgM5u2hRd5PsVE=;
        b=AlpxyrTOr/jR+bpgPPyibMGhmnewIZNVtshZduLTA/spWODZrkAvI2Xc2ImVyU7xV+
         GnVvPEGiX+vwuRof8haFT+4EhDlt1xz1ilvjqomOwM5lWvWQ5TzkL2WE/urjQivRiDmi
         TFWB+FgSTqHqz9KBDDTOk5GM3ZhJNDUUta3UryG+O7J4zPFt0gFj5aT8qq7kQs2be2gA
         vxP4oYM8u57UVhOAQaTja5Tdpo08KC0hfLY9zmBzOoPIHAOUy+TAa2Gx0sSrw+AEST35
         ASOAzECXFi13X5ymaXfHN8F6UiCXCoXl7NfJuhHiJgcmEoMD9ZvBVCgMAaUVKtSrTHKH
         s5cg==
X-Forwarded-Encrypted: i=1; AL+hErFN2KUZC8sGe9d6w5fm++cmnkzFWRAaUn/dgM65WcCS5pSn7ibxbGzloi2GMtgBnzdj0Lw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8tBQ0E0oSV4fKSDRIvIWEZIEanVsWtIYeZExV4kYbl5uIFoeae
	VknSLFKnEMo8xvQxtWq9zeKeruyAnHTcpMhdBAhX+BVmcPl730emCqon
X-Gm-Gg: AZFdTZestb6zXlxrQTbm9bVwNcuBAsbUjOg85iqsmAziw339Cvn1K0fLTLJ6E3NSnf5
	rUZw5FJpWrsNS+3Y/0ZQDe7qyFUunFSytgERMfVRibkovKzcpTfXiQR15xdP3FHlVzQFIytMmf3
	7weMqX0PPXGmyWTtZFHVD+masYguzRWrg7mqnwfKMMGPRbqYOwyK+jmL59C65KMFdmKU0IRfI0A
	uYjY8Gkwz/IDGh5Y9ocmgmGjlCt7jxiT1f8vlipj1EFmM8O1bZHBTRJUsjLat2LlA6L3yQx/eXn
	LvBuasDGayhqNKIadjQHkoOjXMDJEBy9P73rQHj6c1D+GSLi83P6opAVgmsZQ+lzeaD/nPhdByx
	cl/Ne3HGdasciWZoPStxyZGZZtI73npiaoiUqQsIQacAyL/wPdv3nETBRHpUDh/CY63y4jgwqo8
	GDUtWLFqNVcIt5DHTQ3YNdJc5R2jIpFZP9nI/bTXFMa6cnvNSMekqcO/h4ANnvChY8hc0obbpXm
	MZui8xVSjkR6zAZNQMMpu/ljE82ljBwfFvruGrQOQTpglZDJBs7YsOgLcH1pnNgwE7uRhrDdBJ9
	xgknvXp+5N2qnKBI7UcHvI/jLtZD9sr/cjEQqrm2PQ0jLulCNidpEd9TWcSEeWRzb5RENAD0IDY
	cm3T0Bp5eZhCygi6iT1VSC2g=
X-Received: by 2002:a05:6102:3f16:b0:7d6:e716:8e05 with SMTP id ada2fe7eead31-7d7392a486amr5876555137.5.1795473251968;
        Mon, 23 Nov 2026 14:34:11 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:a13e:59e7:dd47:a2cb:e700])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6dec57ddsm12729378241.1.2026.11.23.14.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:34:11 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: laurentiu.palcu@oss.nxp.com
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	marek.vasut@mailbox.org,
	mripard@kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/mxsfb: lcdif: Fix use-after-free on unbind
Date: Mon, 23 Nov 2026 19:33:57 -0300
Message-ID: <20261123223357.535424-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
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

lcdif allocates its private data, which embeds the CRTC and primary
plane, and its encoders using devres. These DRM objects are linked into
the mode_config lists.

Since mode_config cleanup is DRM-managed, it is deferred until the DRM
device is released. An open DRM file can keep the DRM device alive after
the platform device has been unbound and devres has freed those objects.
The later mode_config cleanup then dereferences freed memory.

Allocate the private data with drmm before initializing mode_config so
that it remains alive until mode_config cleanup has completed. Allocate
encoders with drmm_plain_encoder_alloc(), which cleans up each encoder
and removes it from the mode_config list before freeing its memory.

This can be reproduced on i.MX8MP by keeping the DRM card open across an
LCDIF unbind and closing it afterwards.

Cc: stable@vger.kernel.org
Fixes: 1c71d925c03a ("drm: lcdif: Switch to drmm_mode_config_init")
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Rebase onto next-20261123 after the devm_kzalloc_obj() conversion.
- Add Laurentiu's Reviewed-by tag.

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index b7be7e17d1d0..bc1a9a2fc6bd 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -24,6 +24,7 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
@@ -43,10 +44,6 @@ static const struct drm_mode_config_helper_funcs lcdif_mode_config_helpers = {
 	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
 };
 
-static const struct drm_encoder_funcs lcdif_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 {
 	struct device *dev = lcdif->drm->dev;
@@ -74,19 +71,16 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 					     "Failed to get bridge for endpoint%u\n",
 					     of_ep.id);
 
-		encoder = devm_kzalloc_obj(dev, *encoder);
-		if (!encoder)
-			return dev_err_probe(dev, -ENOMEM,
-					     "Failed to allocate encoder for endpoint%u\n",
-					     of_ep.id);
-
-		encoder->possible_crtcs = drm_crtc_mask(&lcdif->crtc);
-		ret = drm_encoder_init(lcdif->drm, encoder, &lcdif_encoder_funcs,
-				       DRM_MODE_ENCODER_NONE, NULL);
-		if (ret)
+		encoder = drmm_plain_encoder_alloc(lcdif->drm, NULL,
+						   DRM_MODE_ENCODER_NONE, NULL);
+		if (IS_ERR(encoder)) {
+			ret = PTR_ERR(encoder);
 			return dev_err_probe(dev, ret,
 					     "Failed to initialize encoder for endpoint%u\n",
 					     of_ep.id);
+		}
+
+		encoder->possible_crtcs = drm_crtc_mask(&lcdif->crtc);
 
 		ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
@@ -131,7 +125,7 @@ static int lcdif_load(struct drm_device *drm)
 	struct lcdif_drm_private *lcdif;
 	int ret;
 
-	lcdif = devm_kzalloc_obj(&pdev->dev, *lcdif);
+	lcdif = drmm_kzalloc(drm, sizeof(*lcdif), GFP_KERNEL);
 	if (!lcdif)
 		return -ENOMEM;
 

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

