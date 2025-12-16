Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CF3296BC1
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 18:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908063; cv=none; b=HV/g2oUH8RYR9JijKUKRYCcLsvOfRvhWPEfW2zhUmS6A76w/uRtZJVH7XTYRXIIKemiAC5XuxZwAbjUnc+A5BAit5DZtq+AxPyuDCkxUIwCtdoLQXQQDeItKrknqoJbFQwkrAoZBiepW1Q+PEh8xDPgmS+oaCalYeIbq/QdT7Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908063; c=relaxed/simple;
	bh=6N7YEwpKDt7bQqyCGFJvtLdgyFUyxLuyVKzPVK2yVwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBarcpnlh2qPJT/BCbx67GwYZVcjkVUr3Z8OFmEy/GGYI+J+zJ9WQMuWlpDdMXRMPEBmWy5Jt8vbsph/u3E5dAOquNONkyy+pnGa5QHJZPRim0gP2SjUJvjNHblJmlXTSn5LtBA2x7e53qEC3IecKEF1+oU/Ji274vjHIsDUHh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rZPXmq3R; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rZPXmq3R"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 175964E41C39;
	Tue, 16 Dec 2025 18:01:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D42A56071C;
	Tue, 16 Dec 2025 18:01:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1ADD6119A9811;
	Tue, 16 Dec 2025 19:00:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vphgdK3fv94n1zonuUG7zDk53Na3mW4h7l4BRt8Xt1M=;
	b=rZPXmq3RtPX/5ScJ+KjOqb+0dehOnxx5Ww5McS0CngQLq1HGvBFTli4zqUVQcgqJ4eeFtc
	XWH8dcmTk5TMxeiPjnH/9NuKqFJ7SwIsTsLB27rYhtepxUDXmyHtQJevFCnmCqKmPaxtaK
	6iofmkwfXXijRzWuiWfV/hQ74s7FsDyzCTdW+5Ub2Z3zvxLDOsXVYPL7aBv4Ax+Orr05CV
	yYGvU2R3SY2Z/TaO/k0Dgm9GyIqRDGlKdzCpFFZEJ5y0PHQeoY4dJGnr+VKgJ5AumWpdJV
	+LG9sQLB4wbnNibGxLpaO/hdA4+twpf4UJNUGz/eJH4avxnLwS2EGWPOU66/EQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:53 +0100
Subject: [PATCH v3 20/22] drm/bridge: imx8qxp-pixel-link: remove excess
 error message
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-20-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
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
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

imx8qxp_pixel_link_find_next_bridge() already emits a DRM_DEV_ERROR() on
error except for -EPROBE_DEFER. The caller emits another one, which is
redundant. Remove the message in the caller and keep the one in
imx8qxp_pixel_link_find_next_bridge() as it is more informative about the
error cause.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 2ecc3c1051e5..0c5ed06eee1b 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -369,13 +369,8 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 		return ret;
 
 	pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
-	if (IS_ERR(pl->next_bridge)) {
-		ret = PTR_ERR(pl->next_bridge);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
-				      ret);
-		return ret;
-	}
+	if (IS_ERR(pl->next_bridge))
+		return PTR_ERR(pl->next_bridge);
 
 	platform_set_drvdata(pdev, pl);
 

-- 
2.52.0

