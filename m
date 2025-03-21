Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A6622FDE2
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 20:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742587643; cv=none; b=Z/7TZbp840G87mZ+Fq2SJalrurNUvVLoNnhiOBfNRybL97c4kTQgggBYGHRMx1Kk+aC8xvn1EsRXR4TYQhXHRz20jIltdc7hqn2oSHCwFjaEl59JrkCDNi09TnqN0dKqZEBCjgapvxfQJDBX7vSwE5RUs3xMXJ3EhGmVqxqDskk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742587643; c=relaxed/simple;
	bh=wbKzdii2jrFiAnao286TS2BcF1agykShOab31xLADeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNjeQ5FM+pIVQRVjlhs3z6OIHQZOErDY246+rqCevEnmOHr6rA6zek5rcl7HUmmISu6g3M4wuFgEHM4I8A3XjjF3qVvbOrYvChiUTlCNbQcGv6KLAl6M9nYegRuAnuqMHQ3whhF6MtmIvgFlyeaRWoIW0/zFEp/VZ+E5qTMuejY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ZTaqmbiV; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ZTaqmbiV"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA41810206773;
	Fri, 21 Mar 2025 21:07:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587639; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GS0DTW8urIe1mVBYAFT1ILELcujA8A8LqLBoIuElaRI=;
	b=ZTaqmbiV6GWUzLqpmKiQCW+8deNpU3TNxYAvqgUb7GivfibYqRoLRFU7PmdpUX76XNtTK5
	SsibKYYtGFj43qbQFVnk0uXJyKU9CvCpK+v3dVs4Mo/4qAwjrjl8ksdLqU2gc5J1AywDNu
	5uk8lCJX1YrocnlB8JiVOY8Sx9V0jsCqytMNWA2gvowfl2tOJf2JAk43csHcflGkVdsBGE
	JmTS3mAZN7uC9Abcer6W4v2467gw1c7FPB2z9WbK0PjclcjS6cSDLCJjkl3XNpglOEn96n
	C7vznTE7eMXWzkUTOekiR4GJhiqfh+UqV+Idw2QiC8TPZni718gVWjwx1L8Z0A==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v2 8/9] drm/panthor: Add i.MX95 support
Date: Fri, 21 Mar 2025 21:05:58 +0100
Message-ID: <20250321200625.132494-9-marex@denx.de>
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

The instance of the GPU populated in Freescale i.MX95 is the
Mali G310, add support for this variant.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
V2: - Add RB from Frank
    - Switch from fsl, to nxp, vendor prefix
    - Fix up GPU_MODEL(g310, 0, 0) to GPU_MODEL(g310, 10, 4)
    - Remove code comments about MX95 and G310
---
 drivers/gpu/drm/panthor/panthor_drv.c | 1 +
 drivers/gpu/drm/panthor/panthor_gpu.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e320738..299ec8bafdd17 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
 ATTRIBUTE_GROUPS(panthor);
 
 static const struct of_device_id dt_match[] = {
+	{ .compatible = "nxp,imx95-mali" },
 	{ .compatible = "rockchip,rk3588-mali" },
 	{ .compatible = "arm,mali-valhall-csf" },
 	{}
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 0f07ef7d9aea7..59fc1cacefcfe 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -67,6 +67,7 @@ struct panthor_model {
 }
 
 static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g310, 10, 4),
 	GPU_MODEL(g610, 10, 7),
 	{},
 };
-- 
2.47.2

