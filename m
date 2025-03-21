Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E60C1EE033
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742587629; cv=none; b=r1Ethh6Db4IXRM9u4qfYSQJxE1RW2hdRx97t/LvB7m8Nk1KtMoW7RHWS2fAmAl7OJeCmP5GwqM8U/PxB9Y0EYJovufd2sXXfxoGSWG7+EGX7QonFwWzOYwuE1cVCXtBLk0ofOE7t/F7im3ZSlJ0LDk0ihiqLb5rXJMrVyPgq98U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742587629; c=relaxed/simple;
	bh=Z0GK26ZGEpePFXj0jfQjSxRSk5hlKuWB/kFdjK5E0eA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qLovFUpAMys+LhRa2yt6lLGw+rILafBcLMLX8Ul0IvVYayU7vTlAH0Z99SIkMKH8Kzj/k6WKbYIyQ6wSnAxMAF2CM6UuPm+7qtRv6Ca0QbPw7dQRMJj/JVqjysoRkIkCZE3P+3E84lxc72KNFLN6S05XvtoegitNfjKw37+F9YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=AgToCSSK; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="AgToCSSK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46DC610206773;
	Fri, 21 Mar 2025 21:07:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587624; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Eb1BEiAFxII1zhOSg9DeCQQ4Y+bPXdF5eBe8UOsuPVs=;
	b=AgToCSSKKYGUb2qujDBiiU0HotwJSAM4SPBu9VhEBf50yG917ZMsA1xgJy0s/ULiJVzRHQ
	Yv6CGGw+fPvIDtSg8YwtXR1qYQon3ZG1mdKFSsCBxI5ZCCzkmLbO8UDVxl+R907vC4+S/n
	+LcludsrLo1vr9/7d5FlGMh4PXr4t/40DrMnOQcsVlSsrlyyOE39byxrAWnC93aJ9HR4h3
	9k8ru63MfSefMUimVYUBBZk6mMzr7bOFWBO2loKiMNbE1jvzdjQJ39/w2IlcO93l3DmJxT
	z2P9oSH4gh6hrMiyE0i1Rwf1P0ZN1kV/QTtkFjHwSJqPgQm2q9+yvEX4FAXKog==
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
Subject: [PATCH v2 0/9] arm64: dts: imx95: Add support for Mali G310 GPU
Date: Fri, 21 Mar 2025 21:05:50 +0100
Message-ID: <20250321200625.132494-1-marex@denx.de>
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

 .../bindings/gpu/arm,mali-valhall-csf.yaml    | 12 +++
 .../reset/nxp,imx95-gpu-blk-ctrl.yaml         | 49 ++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 58 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.c      | 75 +++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_device.h      |  8 ++
 drivers/gpu/drm/panthor/panthor_drv.c         |  1 +
 drivers/gpu/drm/panthor/panthor_gpu.c         | 12 +--
 drivers/reset/Kconfig                         |  8 ++
 drivers/reset/reset-simple.c                  |  9 +++
 9 files changed, 227 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx95-gpu-blk-ctrl.yaml

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

