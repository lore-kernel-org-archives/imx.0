Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BC4192B71
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 17:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675656; cv=none; b=hqMRspl4us/i/P0mGhyTEVEsEmEJurzHB+RxbDSOIhZEn6SgRStVq5MiiTIdypm/Pov+40ud1SVE6+NaB9aQM6xQoOza46XL3g2Pnw3yHgltYF8Fqp0aQvV2xuYCcaReZ0PgWhbRv4U+5/1Qt3d1Vnvq0T1kiCFmDMSxEQnd+JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675656; c=relaxed/simple;
	bh=sUdk99y7SDRlidjsuSX+iCtqB2lteXvpG+w0rIi0BcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=td9uYYdwgyFFxBkreOEQ4wNAnVdX1aMzNTuQe25AgD+kVAC8gWdHy2zPRz9AXZCmq6gm4CJ97I6V/1JsoqYZAgrzPCRNYJbR9TEoCei1wmi1KZztHAVPcBvV6A7PAoz8NvN8ErNA2cTsOqNxMH4YFwT9heLBvmpnUL3wicPFnuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=QkDgSvx6; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="QkDgSvx6"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 719C610382F1E;
	Thu, 27 Feb 2025 18:00:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740675647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iVuupfJxe+koLI0yNqZJPyXcPdbXN4NhcUu5eQOsaOs=;
	b=QkDgSvx6fm0XF7Ki7aCEqP2I1+aCtG49/hYEhC1CvHgsX0b6wEjfnSAqLiKujc9WtcCM0c
	+f8Tx6KiKm0tlUvnY82KovdThYQUmqkmlsjOXaerWv/4ILJvHJ5CtH9N3mW75WSCMDhYpN
	QwK0mbA2ZaE2t+m6K0pG/nLei3HnLEfObNQloNKOg2ETpOlw0JcR23sAdnwkrWDyubd2Il
	WWoo58A1l/qUU+m/zAnKP4oTvBHcxbX7kWmJVHJ2mR83nv9nfvk+zmJrP7PhCCTlVKeJV6
	K5mZRb83fo5mj1OZ+AKKT0K/0W30vx6wWFuZmHXgxFgJ45wXGM8x1gWcLIaDOw==
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
Subject: [PATCH 2/9] reset: simple: Add support for Freescale i.MX95 GPU reset
Date: Thu, 27 Feb 2025 17:58:02 +0100
Message-ID: <20250227170012.124768-3-marex@denx.de>
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

The instance of the GPU populated in Freescale i.MX95 does require
release from reset by writing into a single GPUMIX block controller
GPURESET register bit 0. Implement support for this reset register.

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
 drivers/reset/reset-simple.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 2760678398308..1415a941fd6eb 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -133,9 +133,17 @@ static const struct reset_simple_devdata reset_simple_active_low = {
 	.status_active_low = true,
 };
 
+static const struct reset_simple_devdata reset_simple_fsl_imx95_gpu_blk_ctrl = {
+	.reg_offset = 0x8,
+	.active_low = true,
+	.status_active_low = true,
+};
+
 static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "altr,stratix10-rst-mgr",
 		.data = &reset_simple_socfpga },
+	{ .compatible = "fsl,imx95-gpu-blk-ctrl",
+		.data = &reset_simple_fsl_imx95_gpu_blk_ctrl },
 	{ .compatible = "st,stm32-rcc", },
 	{ .compatible = "allwinner,sun6i-a31-clock-reset",
 		.data = &reset_simple_active_low },
-- 
2.47.2

