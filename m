Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07ED1DDC16
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 17:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675662; cv=none; b=By9jgVCO1XVTt1syqLrrrHNwm4+bJa9sInmZarK6TwKMXON5Ca8clhrWeTApKnq4nOEQ/Pc3JUrlJSsO5MM+JjV6AJloD/U4oz2NT2Jq5wsae77imYL3N6ZXpfFPD6zssG4p9xgHnM5lRGBfBpHXW4xxmDLmpUCgu7AdVCY3s2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675662; c=relaxed/simple;
	bh=BSgCx7NE6nrinVvv1LAiEbgFR+HeYzjL62HCTacxYjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WqZfMRYItIT6ZBn/3i6/uH935gQDSnID8A2LX1+VAt3FNJscdHMFe6LbrJen/6R9K1jROlHvLgoRbCo7SPPXqox8KcfkdJbE+LQzWs/BnJvJxzsi1Mh4AOupjCR2G+/gkY0ZGzX09Z1bGZSTRCzw13SMk1Z1Wz9DhWEyvXzFi1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ODvEJVWI; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ODvEJVWI"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19ACC10375A1E;
	Thu, 27 Feb 2025 18:00:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740675658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLRiMt6/Dpy2Jty4UVTf/yvA7e/j44jHTgLx5ffQrLk=;
	b=ODvEJVWIhWmh+IobAVZwz92gr/HgIwjafRAW0V3ehEqsbQUOr8VqAzwPsDu2OOFd38Z/YT
	/wk0C7uAVnPyhMroKz0MWro3S9ixeeI2xnoEY24vjN5zYyXWxNnOgyIqABdJF2aJzPLsss
	GG3m1Rd+Zl7k9oUaNlQ3EXbMv0fdx6JaKbDXuC6nXa/Y5IOM2bvBu72UaRv6E/VkLteRIM
	SK3OCq+ZqoCaZj7dX+2s6osBzXmB8XJaqIu6jY+Haz/muhMDPTFLDvFUreBNOdlhc/Nn2U
	ICc84CI6rDTYs9nrjDEa6sJfB1LYz527IAMr52Jwa0uLyZjm5lLrG7ZWkbB46Q==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH 8/9] drm/panthor: Add i.MX95 support
Date: Thu, 27 Feb 2025 17:58:08 +0100
Message-ID: <20250227170012.124768-9-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250227170012.124768-1-marex@denx.de>
References: <20250227170012.124768-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The instance of the GPU populated in Freescale i.MX95 is the
Mali G310, add support for this variant.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/panthor/panthor_drv.c | 1 +
 drivers/gpu/drm/panthor/panthor_gpu.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e320738..2504a456d45c4 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
 ATTRIBUTE_GROUPS(panthor);
 
 static const struct of_device_id dt_match[] = {
+	{ .compatible = "fsl,imx95-mali" },	/* G310 */
 	{ .compatible = "rockchip,rk3588-mali" },
 	{ .compatible = "arm,mali-valhall-csf" },
 	{}
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 0f07ef7d9aea7..2371ab8e50627 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -67,6 +67,7 @@ struct panthor_model {
 }
 
 static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g310, 0, 0),	/* NXP i.MX95 */
 	GPU_MODEL(g610, 10, 7),
 	{},
 };
-- 
2.47.2

