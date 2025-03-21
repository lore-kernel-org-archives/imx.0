Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC3122F16F
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 20:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742587632; cv=none; b=sZRcwOK9rVgtVXTkjd2OIX2VyovUN/amhCBB2Lo9dVQXEtfeYqK0PwNGbUz0pFbP7G/zTtSygLJSfI86OPIFBqngWgGV+mY20w41pVnaDGHqSGEPlWuhZSATRBOkC+IRf6CVhn2IeJyuUR9syI1bujp2x7F9BLe5M56IeAW4IDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742587632; c=relaxed/simple;
	bh=jGyd95fnecmIGa/3Gqmu3shmKHAXPZwfCfTznsDWEGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBFyzDsJFitvp+JoKBeD7aJWZ0AMZrwV+q3lwoAEdCPhwcNbVktNRazfyhrp9JvMU9PeZFV3b53uuBFct95Zr2de8ZuEAk71XVAyb7Fs2uPqgWQfkbPMBIubdK1r8sKuZA8oiKtfTZT7S31WQbeFmq6Eq90itzEfcm1Jgm/WoPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=HPjNgGMI; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="HPjNgGMI"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9E98101E8FE7;
	Fri, 21 Mar 2025 21:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587628; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=T+aW3YqrWtyb+HJrv0NdBuH13F+b2T4tSgjYxeo3bk0=;
	b=HPjNgGMIOobFRLkbtZOxz8dZlyaVxNxU64iSONjzGGOv7RG5JKJnnmnov6KAqY69h9uPII
	M23mjnU2HDHEQRcchu/mGaePSbsLWE31IykDvLPiW4v2UrRdL40KVLDSqPWl2vev9IwruW
	5qR0dIDDjk9NYET/N9rMl/YeoVmuKZqc/+RZGvrOpZabzECShlg/fTL2Yp/eVdxG26rB99
	3gHUPXDBygq08VWoOmoSnKuDoFpAJT+QFvRGIWgDeymj5WvN3jov+3IgUqZOupfSYxRx6z
	OsV9AY94J053dyoBoEm9c0gtozsCtTrcOWSyMSlm7Ylr1L1eAWLY/AnaAS7Ojw==
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
Subject: [PATCH v2 2/9] reset: simple: Add support for Freescale i.MX95 GPU reset
Date: Fri, 21 Mar 2025 21:05:52 +0100
Message-ID: <20250321200625.132494-3-marex@denx.de>
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
V2: - Set nr_resets=1 to limit the amount of resets to single bit
    - Switch from fsl, to nxp, vendor prefix
    - Add RESET_IMX95_GPU Kconfig symbol to select this reset driver
      on MX9
---
 drivers/reset/Kconfig        | 8 ++++++++
 drivers/reset/reset-simple.c | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 99f6f9784e686..0b48e76fd0aab 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -249,12 +249,20 @@ config RESET_SIMPLE
 	   - Altera SoCFPGAs
 	   - ASPEED BMC SoCs
 	   - Bitmain BM1880 SoC
+	   - NXP i.MX95 GPU
 	   - Realtek SoCs
 	   - RCC reset controller in STM32 MCUs
 	   - Allwinner SoCs
 	   - SiFive FU740 SoCs
 	   - Sophgo SoCs
 
+config RESET_IMX95_GPU
+	bool "NXP i.MX95 GPU Reset Driver" if COMPILE_TEST && !SOC_IMX9
+	default SOC_IMX9
+	select RESET_SIMPLE
+	help
+	  This enables the reset driver for i.MX95 GPU.
+
 config RESET_SOCFPGA
 	bool "SoCFPGA Reset Driver" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOCFPGA)
 	default ARM && ARCH_INTEL_SOCFPGA
diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 2760678398308..64aeda8f76b75 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -133,9 +133,18 @@ static const struct reset_simple_devdata reset_simple_active_low = {
 	.status_active_low = true,
 };
 
+static const struct reset_simple_devdata reset_simple_fsl_imx95_gpu_blk_ctrl = {
+	.reg_offset = 0x8,
+	.active_low = true,
+	.nr_resets = 1,
+	.status_active_low = true,
+};
+
 static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "altr,stratix10-rst-mgr",
 		.data = &reset_simple_socfpga },
+	{ .compatible = "nxp,imx95-gpu-blk-ctrl",
+		.data = &reset_simple_fsl_imx95_gpu_blk_ctrl },
 	{ .compatible = "st,stm32-rcc", },
 	{ .compatible = "allwinner,sun6i-a31-clock-reset",
 		.data = &reset_simple_active_low },
-- 
2.47.2

