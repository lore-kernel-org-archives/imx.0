Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FA62652AF;
	Thu,  4 Dec 2025 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841601; cv=none; b=UT8ye6EMgJhKcP2odzFKdgNzBjazmW1bpJrcPAz6c6b465xyhQCysbxxr35sFukREalPlVB0XN6jvHWhHq7379I5TWaoRrgkUZFNdgiVMgVg91VXaow+sXk2yfgpsQV4qBz5V659a5tqM9VftIoIqG+ojfnts4lDcZLIY5YLUjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841601; c=relaxed/simple;
	bh=3Xo6KEFNNleLs7NQbRdlOybDeYxGnm96HhQ7ttb1sa4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PIHte1el5VMEKwBQ6tu7ytV9oBMTOEaTFtzPGQafsQQbHnVifNUraOKiSon2dLufTftIsw5WJTbupX3SDHPl9WHqJBkCqMDjDSpm4kpaoxVUbDpH/C4yk2i7cN5vjsoKNcaWLgztVKf45rjrNP2Qi2j08d/xTbl5/KkB54U4ASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qumC81uX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qumC81uX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51CFC4CEFB;
	Thu,  4 Dec 2025 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841601;
	bh=3Xo6KEFNNleLs7NQbRdlOybDeYxGnm96HhQ7ttb1sa4=;
	h=From:To:Cc:Subject:Date:From;
	b=qumC81uXbcWCwG/Jll8DFkNziiV0b8/vPnQBlJ04lGwHHzGWUFixsy1daHL5jZjcX
	 fwdaSlJ/2UV+bUwlSJ89XbTwiordBco22NN1g7Lu/FLMOLeACPJF4lIAM7SEfAe+PJ
	 vW532CoWcoOjz1dPWVHPSK+qLw5lnVYG7kURBf7/SJBthZqAYSfQPKySL4ohENGJLd
	 JdN+lRwBfBfxLjYYZXijwlyrLORrrmT1SDQYyS/9Q6urK5sySCmtUHx1I+cSSM7/PE
	 M9KiK7UAvHFmt6SS0wuCdeOCAJVch8U0PQOpRU8YhC8y7HDNdA1NvozuCVQp/24y4g
	 41l/SwBo0Zcfg==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imx: select DRM_DISPLAY_HELPER as needed
Date: Thu,  4 Dec 2025 10:46:26 +0100
Message-Id: <20251204094635.1030724-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

CONFIG_DRM_BRIDGE_CONNECTOR is a bool option that turns on features of
the display helpers, which are in a module controlled by the (tristate)
CONFIG_DRM_DISPLAY_HELPER. If the display helpers are in a loadable
module, a built-in driver trying to use the bridge connectors fails
to link:

x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_bind':
parallel-display.c:(.text+0xcd): undefined reference to `drm_bridge_connector_init'
x86_64-linux-ld: drivers/gpu/drm/imx/ipuv3/imx-ldb.o: in function `imx_ldb_bind':
imx-ldb.c:(.text+0x224): undefined reference to `drm_bridge_connector_init'

Select the DRM_BRIDGE_CONNECTOR symbol as well, to ensure it's built-in
if anything needs it.

Fixes: f94b9707a1c9 ("drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index acaf25089001..1c3825a86380 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -13,6 +13,7 @@ config DRM_IMX
 config DRM_IMX_PARALLEL_DISPLAY
 	tristate "Support for parallel displays"
 	depends on DRM_IMX
+	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_IMX_LEGACY_BRIDGE
@@ -33,6 +34,7 @@ config DRM_IMX_LDB
 	depends on DRM_IMX
 	depends on COMMON_CLK
 	select MFD_SYSCON
+	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_PANEL_BRIDGE
-- 
2.39.5

