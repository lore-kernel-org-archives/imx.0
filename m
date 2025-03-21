Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340841EEA3C
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 20:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742587638; cv=none; b=ED22k65i5lnhV13eIMLhGKsqRggFSpnYIZfS1Ykn/Ca8Bg7NjaVbejP18lffQr07d+w8Tl483Y7PqlF8oNZ0iF4MUfurEOWeUkmMLLjM79LTI/3RYLWWji9t6ICo+1UR4/21cQJj2eb+uQnJwQOZy4lWYPVqJcrc4Z0xi7g+V2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742587638; c=relaxed/simple;
	bh=Wt7QXDsOyvbjZVJnG6MgZbyuyEInQBjemMPgoT2FvtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LuW4vW3OLhJu+q45csBUiVI3rYBBMfO4GkApj1s86J9t0947AQdTrRJbmuWlgTLt33QA6jmeSLa/fO6tt6ZL1EZePg7EjfdojxeEtYnf7JWsg9HO1YXXXgLEyPGF8emBVw5Y8YRNHASMkTBMTQMQwm4mEfYpU5e3thUOEsJlPoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=dbkJVkNr; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="dbkJVkNr"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7E5D101E8FE7;
	Fri, 21 Mar 2025 21:07:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587635; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=O8iECVKqUngmbLKesdAXdxuc21AF1mv3PVk149t7akU=;
	b=dbkJVkNrAiPA1y2flaykkwgNtX4AnewryWHqt5l/Jmoaw6Rwx0rMnsDXHOlEHmWHlDHHlQ
	kA1TiweR3QTmtoSMyfYo5B/pghhZnm24wn/bT/5ogob2FiFAQL8uVlT47avHBNP1PsaS9H
	v6UhNwzQ+eBXsTb+H3TigCcr/jK7g/cuXzb7lCrVnT8AHQdC4S5Wrd7aaqbO9hVv2bLsab
	QNJyixNjnHnTHfuBzNEYcItV0h+7tVXaELiv38kwsvH9Gya72u07w6MQAK9BpHYa2GfNdQ
	IsU7AlUuBi0Rg5eYyPQ7clJYJPC1iXpQik3JyOMyGDjyZG3SwQGgPgn8QFahtw==
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
Subject: [PATCH v2 6/9] drm/panthor: Reset GPU after L2 cache power off
Date: Fri, 21 Mar 2025 21:05:56 +0100
Message-ID: <20250321200625.132494-7-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250321200625.132494-1-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
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
V2: No change
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

