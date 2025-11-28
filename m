Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FC727814C
	for <imx@lists.linux.dev>; Fri, 28 Nov 2025 16:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348896; cv=none; b=InyCPtiuy+u7ZmM/SbUEXIfMHhdnE0ByQAm+EK4AzBlBTK7ckrI1SykYTCUqilb+PyO4XmmZ5cuWpZ8pL7iO7gg0NSbMjEtfBAHcMbU/y4RvfLBjkipNscWZVSkOX9M0luRsSDTi8DMhiWYEgNfnBtt1g36NJCyvXRxHq+b0Le4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348896; c=relaxed/simple;
	bh=T5Y1ykc9T6Psz075QDOSbHMLYllzvjHkButlyWNsND8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6gqkL267tIW3B/OjKWufYZrLyR/oa8DZvJefs49WW7/WyYoBPBEdvVCNBkS+nhmPgpQ864HiLrOiSGu9AYqWZ8Pn+NJ1rz86XNWb5IbTO/9dKFcRB1yZvwK4qX3fyzAosjHOXqQAMHSUvktnlrCs0LNj8gPO3dCGXhVVF1fsTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kCaY6lw2; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kCaY6lw2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29447C16A3C;
	Fri, 28 Nov 2025 16:54:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 159D260706;
	Fri, 28 Nov 2025 16:54:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEB0910B02189;
	Fri, 28 Nov 2025 17:54:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764348890; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DfHUWtPWvbu3eARUdwnswYnDDC4l4suslzNcl7SiWqE=;
	b=kCaY6lw2TkOz8NsEsE/O3s3txQGE7b0kmIQUcnEYDZRPxllyDCOem+VsokmC5GC0MkcOQ1
	/ABpWXr2URocnohRhfdSV4JXwyRc4iCD8Y0T68GFLMLkQrRDkQUWFpQ8G6avSlKnnt4qUG
	uy9LX8dVx2TgrL/isxmjHsDEyjmgSpI7fALUKrUGHsWwywLlHdLk0pcqXqMBjDG1LTmaZM
	iOyA4K7AlUUISKfhlx4wZVrB1gbSFcUBmRAxy1Wc9sKnbxlm+ZYU98t8ZzYCoNvyuoKAnG
	g/URZBOPXlHVv9s9ZmhwpTDEanJAW9uGfHad5RKH6O+w6OFlf5r5xDF3Xd7GPA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 28 Nov 2025 17:50:31 +0100
Subject: [PATCH v2 21/26] drm/imx/ipuv3: use devm_of_drm_get_bridge() to
 put the next bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-21-88f8a107eca2@bootlin.com>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to devm_of_drm_get_bridge() which puts the bridge
reference on remove or on probe failure.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
index 07e5f96202d4..4479f74f0491 100644
--- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
+++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
@@ -241,7 +241,7 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
 	if (IS_ERR(hdmi->hdmi))
 		return PTR_ERR(hdmi->hdmi);
 
-	hdmi->bridge = of_drm_find_bridge(np);
+	hdmi->bridge = devm_of_drm_get_bridge(&pdev->dev, np);
 	if (!hdmi->bridge) {
 		dev_err(hdmi->dev, "Unable to find bridge\n");
 		dw_hdmi_remove(hdmi->hdmi);

-- 
2.51.1

