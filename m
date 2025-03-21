Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955FD22FE13
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 20:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742587635; cv=none; b=gu3wbm0HNQr1nLkxv1CtR+z0/e/R/U550eI1Mwn215SkeTIAFXkTu6fNaEGBmFk5A4p73emyXPK5Vd88UEfCunTuyZaVMtAS8rEcvnLlp++I1x2vH/NZeCuRXIeDMISZjoK6ttPU8b/D3RGMDgVjT5nXsO1ZaOcvF2L3uf1msis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742587635; c=relaxed/simple;
	bh=m+jIY1T4eyz21TINrPgEFPMu+47prDtNw3GAIQ9rUw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MSDLmzET9c4YyQKJZvgh+ln/N6ka0EKN1MYrfU2AjmaxZNmprOXfHxKcP5L13cBfYvIyAlNccrwUYMrVUyk2YVmRNMIDCY7U+7XOdIMuMTqHoT9PCOD7I8pE0nj2DQ2LHgcL3/u7KGnjwumJ+PST9ISiQRtyMoq3TyHMw4t6J/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Ujh3YbJp; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Ujh3YbJp"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46EF310206773;
	Fri, 21 Mar 2025 21:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587631; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=tbl1bzwd72WBMUHQVUL0sGP9LINKYez4xzgILWcrQd0=;
	b=Ujh3YbJpP0w6d7Vq3HH9Q30e9e0u1qTMHdtq9Vyg79Vb6a4W2PuiLeQJ7PDrgp0QIRoBYn
	hqoNE1AGZ3HPtUgaGbGXHzJM/LZfXFqVRQPSMH59yZurKeJQ1p6ClZGURG8can0C36aQJi
	I4VyO8rBrbPYSAUPosCoJ6rKTRmxtzGi15XRyfEUG0Kkwg11l8BFjTEFkzmD8xz3gy7TVN
	Mg8/V70meiqDVRvhoSsIaqmF75S4kjGVipBKH9b7w5wG0DxyqzhYVW0o5NX/a0eNa1iXIr
	pMfEogdxrjt6VOXYT6rEpn2rq/svVdni5lsfJbddgnL0lsXE9Yw6UfoPhbXqFA==
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
Subject: [PATCH v2 4/9] drm/panthor: Implement optional reset
Date: Fri, 21 Mar 2025 21:05:54 +0100
Message-ID: <20250321200625.132494-5-marex@denx.de>
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

The instance of the GPU populated in Freescale i.MX95 does require
release from reset by writing into a single GPUMIX block controller
GPURESET register bit 0. Implement support for one optional reset.

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
V2: Drop the select RESET_SIMPLE from Kconfig
---
 drivers/gpu/drm/panthor/panthor_device.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index a9da1d1eeb707..51ee9cae94504 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -64,6 +64,17 @@ static int panthor_clk_init(struct panthor_device *ptdev)
 	return 0;
 }
 
+static int panthor_reset_init(struct panthor_device *ptdev)
+{
+	ptdev->resets = devm_reset_control_get_optional_exclusive_deasserted(ptdev->base.dev, NULL);
+	if (IS_ERR(ptdev->resets))
+		return dev_err_probe(ptdev->base.dev,
+				     PTR_ERR(ptdev->resets),
+				     "get reset failed");
+
+	return 0;
+}
+
 void panthor_device_unplug(struct panthor_device *ptdev)
 {
 	/* This function can be called from two different path: the reset work
@@ -217,6 +228,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		return ret;
 
+	ret = panthor_reset_init(ptdev);
+	if (ret)
+		return ret;
+
 	ret = panthor_devfreq_init(ptdev);
 	if (ret)
 		return ret;
@@ -470,6 +485,10 @@ int panthor_device_resume(struct device *dev)
 	if (ret)
 		goto err_disable_stacks_clk;
 
+	ret = reset_control_deassert(ptdev->resets);
+	if (ret)
+		goto err_disable_coregroup_clk;
+
 	panthor_devfreq_resume(ptdev);
 
 	if (panthor_device_is_initialized(ptdev) &&
@@ -512,6 +531,9 @@ int panthor_device_resume(struct device *dev)
 
 err_suspend_devfreq:
 	panthor_devfreq_suspend(ptdev);
+	reset_control_assert(ptdev->resets);
+
+err_disable_coregroup_clk:
 	clk_disable_unprepare(ptdev->clks.coregroup);
 
 err_disable_stacks_clk:
@@ -563,6 +585,7 @@ int panthor_device_suspend(struct device *dev)
 
 	panthor_devfreq_suspend(ptdev);
 
+	reset_control_assert(ptdev->resets);
 	clk_disable_unprepare(ptdev->clks.coregroup);
 	clk_disable_unprepare(ptdev->clks.stacks);
 	clk_disable_unprepare(ptdev->clks.core);
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664b..fea3a05778e2e 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -111,6 +111,9 @@ struct panthor_device {
 		struct clk *coregroup;
 	} clks;
 
+	/** @resets: GPU reset. */
+	struct reset_control *resets;
+
 	/** @coherent: True if the CPU/GPU are memory coherent. */
 	bool coherent;
 
-- 
2.47.2

