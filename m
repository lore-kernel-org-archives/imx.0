Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED629B8E5
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791650; cv=none; b=MEwtjHIuOQCYh0VHi7KtjYD3OtNqp6I/Qpj6O/VsOzTiDcZ0zocifd5S0/mmTicJ//n6Io/EvgZpxbq5sAXxQefLZsLLr5QcdN9yScBYsqjH9xB1jpw+hC0ykWUdGB/uB5CXwRqg5YXYvhlAXghIInUVftaNy8toY8ydB49nicc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791650; c=relaxed/simple;
	bh=VlYqIpOgcAZ/GnWhUGJoNm60ZQ6NDPIn5tE8mxST4wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NndXWzHEfNAKbyrmeeaVkVcALfYD4uxevAPBRVQ5fbKaf0yZwXvV/3zuqwUX7wA/nXzV75ebown+yBGC9NEZ1JFPt7yMrV11aqctkJ7ibop6yeGzilRL8+WYIhFvNVQswf4CXXnpXhKyyoNqyU5m9mekbQ9jY4GhL586W1Ink58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bDoK3M22; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bDoK3M22"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6C581C1EC90;
	Wed,  7 Jan 2026 13:13:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8944B606F8;
	Wed,  7 Jan 2026 13:14:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17A51103C873C;
	Wed,  7 Jan 2026 14:14:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791645; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DD7fgu52wkuLSP1OrQnM662MYsXz8TXZNWXDDQwQ/Zg=;
	b=bDoK3M229d3Yqo1LRkdQHgxhHQbMxfyeLBTmDu12N/9RZ6MJP3P6qiab7nOhRVBU//3E5y
	wfyeYa0Z09xu8A5kkQk7vtUnpxhPqQhg7Y8CotVB9XsdnrEFTo8rdx8WJ4wEcVxXC30U5D
	R5vyo621898X44DFrSwZCciEPq1J50a2Zp/GIgXrcZ+Nm3ysKLtmr4ZXc9AIEEflcTRfNF
	ZgLXjRCl0QUVde7h2IxhIjwXaRR87p8Wf8iVklQjCiQn/OcY/yRUMITlIYhz0hgP1pjmt8
	x42+VibGMp6GI5KG2ZsWyQ8ttBxePVpxwJ6y7R7EOd36bdOypxpOfsGfAI9HJg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:13:00 +0100
Subject: [PATCH 09/12] drm/bridge: imx8qxp-ldb: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-9-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 122502968927..6b80d798b27a 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -552,7 +552,7 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
 		goto out;
 	}
 
-	imx8qxp_ldb->companion = of_drm_find_bridge(companion_port);
+	imx8qxp_ldb->companion = of_drm_find_and_get_bridge(companion_port);
 	if (!imx8qxp_ldb->companion) {
 		ret = -EPROBE_DEFER;
 		DRM_DEV_DEBUG_DRIVER(dev,
@@ -679,6 +679,7 @@ static void imx8qxp_ldb_remove(struct platform_device *pdev)
 	struct ldb *ldb = &imx8qxp_ldb->base;
 
 	ldb_remove_bridge_helper(ldb);
+	drm_bridge_put(imx8qxp_ldb->companion);
 
 	pm_runtime_disable(&pdev->dev);
 }

-- 
2.52.0

