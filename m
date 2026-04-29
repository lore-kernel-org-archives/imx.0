Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FAA3F54AB;
	Wed, 29 Apr 2026 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471231; cv=none; b=R5NpttTwftQx3lQZ34fs3TW7D0P3AXAocGIP7vYfqLlTzkeoUtOnc3wkgZTmgBOrcMksjTFndDk7Qb0rBsJRfNSujAevG07RDh7WarfVwkqxsbWvFM7daZIGJ/z2x1mOR7FORczWQR55mAhxwNh3M6yF5BGxm0feVwwFwV/6MQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471231; c=relaxed/simple;
	bh=F3GzEF9HBE73GG0R8Bt2iGJHocP/9FQBL1y46O6CYIk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S2q2l6cSTdFUH4lLIK9RGNVAGD3pg8DxQka3YZ6ubeB5trUN1I6vvHPajMTOOLzqtQuEGal5VxLtkVNToljfQMES680LGAzJO0Bb8jn+JpbFpO0zy7P2XY5axf5tlGSPuEsJQIi+btAZ9rb9VJ+ds/3RGGIaNHvg7H3jrf2hXAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXh8zcvf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXh8zcvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2548C19425;
	Wed, 29 Apr 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777471231;
	bh=F3GzEF9HBE73GG0R8Bt2iGJHocP/9FQBL1y46O6CYIk=;
	h=From:To:Cc:Subject:Date:From;
	b=CXh8zcvf0zV5rKnkbZFJjguU4eFmEebyNGs236rdo7v6OuE8LZ9jvreMjYM012inf
	 XhXagHWxywWUI8y4z+obKm248CLEnUa5a65eQmxwmMb/fot5N6pt+nSWYEQD+HDmqz
	 vEranRw7Y7tVUSxuqEiZdpCY5cEWmioYxypsVXbaSwLfQn39OeavhkDsgXjYArSRay
	 yVj4NPKn+AR8fde34ZdoG1O5ijNlzwHbFqJqmJTAtTPzKheEmqnsMxn28NXQrAi9jx
	 x/WOnifdTgnC4HmBqHpZjP+6CGlDLAxDMKRkkKyBqpoB08zWrwrYnQr1VWm/GNf940
	 iFgdaqO8vJVNg==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Damon Ding <damon.ding@rock-chips.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ipv3: add CONFIG_OF dependency for DRM_OF_DISPLAY_MODE_BRIDGE
Date: Wed, 29 Apr 2026 16:00:11 +0200
Message-Id: <20260429140024.192432-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Without this, not all dependencies are met here.

  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=n]
  Selected by [y]:
  - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]
  - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]

Fixes: ba2db93cf3d5 ("drm/bridge: Move legacy bridge driver out of imx directory for multi-platform use")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/Kconfig b/drivers/gpu/drm/imx/ipuv3/Kconfig
index 351dc65913eb..3ca237515e46 100644
--- a/drivers/gpu/drm/imx/ipuv3/Kconfig
+++ b/drivers/gpu/drm/imx/ipuv3/Kconfig
@@ -13,6 +13,7 @@ config DRM_IMX
 config DRM_IMX_PARALLEL_DISPLAY
 	tristate "Support for parallel displays"
 	depends on DRM_IMX
+	depends on OF
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_HELPER
@@ -33,6 +34,7 @@ config DRM_IMX_LDB
 	tristate "Support for LVDS displays"
 	depends on DRM_IMX
 	depends on COMMON_CLK
+	depends on OF
 	select MFD_SYSCON
 	select DRM_BRIDGE
 	select DRM_BRIDGE_CONNECTOR
-- 
2.39.5

