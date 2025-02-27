Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82DA1DD0C7
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675658; cv=none; b=WgESiicoobrzz2TOPXnc+C9RgNQi7xTj1EOuWe5+wzqY+YIdjSaEnJaD1UF7LXcC0qOd7BeiNyD+inwTLPWEq47vTDb4mSlVjW55cb86mI+xlLlyOp7nktZ+1oTOlHgFldwvjsKfeqw8aGdhLUmUEnQlgnBkvNRf3rDMGnuLJe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675658; c=relaxed/simple;
	bh=CCJUQnQMXtVc17FZL4IMOTrqzZZW4zwAlEUIPfmeMcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAHf7NqAa2OVgsTm30kmFkDbsVJwRimxPVoGdDVVWb6WQpSmC8BKN2vu5zrLW3zkHxqT5gFHlqFoRqDP1nF5jrJDixW7OqVU/So6R+iBRzEp5+2zm44MXqwemhu7w7yXj5sY636Wu1bbV5xzL6iGGg1ezjnRxYczkEu2jq/Ofw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=eBKuSDm+; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="eBKuSDm+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5027E103801B5;
	Thu, 27 Feb 2025 18:00:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740675655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mLfA893WYcW7m3Urm2lChQwvniJaazs2mTWPwNN2Oco=;
	b=eBKuSDm+Zjp/EoKicmIXcRQuuu777EWnLVb+5QMRDyvMp+w75ngC/wb9FmMdsUgiwpLDYT
	7acC7YZP+Y+QOQxjz0TM3BOyXkR12QlsTIC7hqqEjZsbwhtkpTzOZm1QBMo8zmuBHTo8/w
	ILwRXKpIET/rDOEIGlivuCNOi4dXUFHm2z9fV7BhNMaq6o8owNP8anhzpABX5OO834u17I
	7F3IyHTFBJ36UBkx13JjSrxnXIfSc+Fct6WifpZ2lQ4AoxzQMY/onYMAYQUj3tTGlt5Ugh
	+ui8X2WavrsFFD6VCgYb8gcp7C4QXo7tDzYsaEafjTanZWCp7We+FqtIkHDYbQ==
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
Subject: [PATCH 6/9] drm/panthor: Reset GPU after L2 cache power off
Date: Thu, 27 Feb 2025 17:58:06 +0100
Message-ID: <20250227170012.124768-7-marex@denx.de>
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

This seems necessary on Freescale i.MX95 Mali G310 to reliably resume
from runtime PM suspend. Without this, if only the L2 is powered down
on RPM entry, the GPU gets stuck and does not indicate the firmware is
booted after RPM resume.

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
 drivers/gpu/drm/panthor/panthor_gpu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 671049020afaa..0f07ef7d9aea7 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -470,11 +470,12 @@ int panthor_gpu_soft_reset(struct panthor_device *ptdev)
  */
 void panthor_gpu_suspend(struct panthor_device *ptdev)
 {
-	/* On a fast reset, simply power down the L2. */
-	if (!ptdev->reset.fast)
-		panthor_gpu_soft_reset(ptdev);
-	else
-		panthor_gpu_power_off(ptdev, L2, 1, 20000);
+	/*
+	 * Power off the L2 and soft reset the GPU, that makes
+	 * iMX95 Mali G310 resume without firmware boot timeout.
+	 */
+	panthor_gpu_power_off(ptdev, L2, 1, 20000);
+	panthor_gpu_soft_reset(ptdev);
 
 	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
 }
-- 
2.47.2

