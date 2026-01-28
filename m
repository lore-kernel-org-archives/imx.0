Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79E431E0FB
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 17:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623036; cv=none; b=NepurA9hHvyES1DER/wzNcYC1KuDEjwZcrtrvVaFfLgIV1lLMTilifTgPI3OT3JFzZu34QoF0pJjq5KS1jmypWBn8uXil/Zz+2MHUfw9ihT4qTdoNEnEGevSZ/fYGmbxFAzPq3p9QbIN6e/eFeo5kGEbN+SaPwwhLe3O/0CAwKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623036; c=relaxed/simple;
	bh=hW0pvKwfrnDTUp2eTk5a+htnEGOo5SoCI1/K7g/Gmvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L36D1MZORqNa+Ht6jxZ8Y2u76aET6rL1ZN/Ug/erQf6YlwT7lDWp6O7HhPcpLGDMs20rw5o5HsSXFVTfEysCOHH8KwOU4Ph4ge3CxnY++gSugDEdnUelYWbEglUqKW2peAaxrh8gpLpMoFkf3GPNZJvbaFdqtiGtxR5SiyYr4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PlQx1TSU; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PlQx1TSU"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 27BAC1A2AD0;
	Wed, 28 Jan 2026 17:57:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE6CB6071F;
	Wed, 28 Jan 2026 17:57:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6398D119A882A;
	Wed, 28 Jan 2026 18:56:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769623031; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bnS713poB+YyzdGgaOoZvVbr5bFa2FQ/LZh7487hWGA=;
	b=PlQx1TSUk3qeikxBysclRPfrjPgUrXm4+lnXTdPPLZL0wh9H8L/gYbILXGdnr/76CI3Ihs
	CzviA3VASMkPEXbwjd32K65yDf0RKncEcqY9ZFPHR0UGNh7+yOaJeFpMclc42jw3SSLRzH
	OuYzDgnLx3i0Vhn4r7uk15VKjrZPeOViH1SqT19qG17kLJbjLkA8BKh4wnqCxyAGD58597
	ORdbzzNJJIAK3Q5WD1VsKXV2uusYLCarkBQPN8kZMV5l3BYihk6qaYjUz39KZRazkIp1C7
	bMsoqzgEv289SAdRg2oLNkZ+8QsLR5G9FKd8uo3IqGCFsgcsOUKX7DpsMbky/w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 28 Jan 2026 18:55:09 +0100
Subject: [PATCH for drm-misc-fixes] drm/bridge: imx8qxp-pixel-combiner: Fix
 bailout for imx8qxp_pc_bridge_probe()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-v1-1-2138d0933cf1@bootlin.com>
References: <20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-v1-0-2138d0933cf1@bootlin.com>
In-Reply-To: <20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-v1-0-2138d0933cf1@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15-dev-5464f
X-Last-TLS-Session-Version: TLSv1.3

In case the channel0 is unavailable and bailing out from free_child is
needed when we fail to add a DRM bridge for the available channel1,
pointer pc->ch[0] in the bailout path would be NULL and it would be
dereferenced as pc->ch[0]->bridge.next_bridge.  Fix this by checking
pc->ch[0] before dereferencing it.

Fixes: 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API")
Reported-by: Liu Ying <victor.liu@nxp.com>
Closes: https://lore.kernel.org/lkml/20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com/
[Luca: backported on drm-misc-fixes where the original commit conflicts]
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 8517b1c953d4..dc1cb094afd0 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -349,7 +349,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 free_child:
 	of_node_put(child);
 
-	if (i == 1 && pc->ch[0]->next_bridge)
+	if (i == 1 && pc->ch[0] && pc->ch[0]->next_bridge)
 		drm_bridge_remove(&pc->ch[0]->bridge);
 
 	pm_runtime_disable(dev);

-- 
2.52.0

