Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C378C1AC435
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 17:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675653; cv=none; b=ECIelsmi8Qiqd4w6filY/j7FT/zfcpx+qpLsbN/sOcnqO25NXYYR25o9wicSSpLilnQMA7Hz0JX0hexZs12P4rYWBtdG7lACo0fxnWarmm3BsjQSX8Oi+ZBWPhTl5HB5SqSlUhHDlDmAS31q6uWrTHvA5TPcS8vW3nWGcLpQgjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675653; c=relaxed/simple;
	bh=lJCI8cAh6NNF7lIhhI2Uoaqso5IKOxQtgSBm6q4x5P8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=COtchg2d6GQNlgtIrQjTqiIwZaSdOhradYhmizY2/tLFmI2hiZqgW4gPev6UknG7i9M/M45y0A1u3XS/QiI5mHadTC5bLYuKS/iwyC1WM43UauOmFq14JtW1n/X5UMCGWW1SqNnJFR0o07Ik2tZQeB7IrC/aqDsp/BRVY+8iuj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Dht51g+x; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Dht51g+x"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9974B10382D2E;
	Thu, 27 Feb 2025 18:00:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740675642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q26ojWAAylCPuoMLGOHqBQ6+h3mcIEfd6MruX8qYHg8=;
	b=Dht51g+xd3YUY6OVzoH5ZCFVhCw3MS+2/ORkxydauJ/ck/5yRSevkr9YFqUk15eukCUmbv
	si/5W/ge65fTX5WEEO+9fZRC2jeqRgKcdfzKlmKMuoQYPWPG9pYAZJE1p93/SCGJw6ZhxS
	1ho2vAvjHs+B8EBSO1g8fNTXTddD1hJ1NMAHcT5+v5pnqlJJOuTdkFKH8L8oEZ7yzF1ywz
	qruceRJRP76YaxDiqZiVr7c8tH46YWtCDsUKQ5WCz+T1tKzsq2qAO3LIqxPg/ooGYRlnNK
	MDCYKLuiUBUYh7bDp82KYc4sbMrFNib7Wb4TOiL8iB7GF+AhRIZoK7w4yqWstA==
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
Subject: [PATCH 0/9] arm64: dts: imx95: Add support for Mali G310 GPU
Date: Thu, 27 Feb 2025 17:58:00 +0100
Message-ID: <20250227170012.124768-1-marex@denx.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The instance of the GPU populated in i.MX95 is the G310.
Add support for the GPUMIX reset via simple-reset driver,
add reset and multiple power domains support into panthor
GPU driver, add iMX95 GPU support into panthor driver and
describe the iMX95 GPU in imx95.dtsi DT.

Marek Vasut (9):
  dt-bindings: reset: imx95-gpu-blk-ctrl: Document Freescale i.MX95 GPU
    reset
  reset: simple: Add support for Freescale i.MX95 GPU reset
  dt-bindings: gpu: mali-valhall-csf: Document optional reset
  drm/panthor: Implement optional reset
  drm/panthor: Implement support for multiple power domains
  drm/panthor: Reset GPU after L2 cache power off
  dt-bindings: gpu: mali-valhall-csf: Document i.MX95 support
  drm/panthor: Add i.MX95 support
  arm64: dts: imx95: Describe Mali G310 GPU

 .../bindings/gpu/arm,mali-valhall-csf.yaml    |  4 +
 .../reset/fsl,imx95-gpu-blk-ctrl.yaml         | 49 ++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 62 +++++++++++++++
 drivers/gpu/drm/panthor/Kconfig               |  1 +
 drivers/gpu/drm/panthor/panthor_device.c      | 79 +++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.h      |  8 ++
 drivers/gpu/drm/panthor/panthor_drv.c         |  1 +
 drivers/gpu/drm/panthor/panthor_gpu.c         | 12 +--
 drivers/reset/reset-simple.c                  |  8 ++
 9 files changed, 219 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx95-gpu-blk-ctrl.yaml

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

-- 
2.47.2

