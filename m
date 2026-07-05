Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14A02EAD1B
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 16:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783269366; cv=none; b=fJNut347v7QXxZ7H4BF6FMRhw3GkoHlQvDz7flYpC0U7046RJb6mfD3o+o6HguhHuMNOVHSXQLp0tzmtll1XtaDoL1rJuuYRx2m0FjiFPzJ/3u3U7QPAqKB17Z1+ar1Y9cPhXqtWYB2Zc8g5ERAFMr4vBtmZ03c8K/57yxpJrds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783269366; c=relaxed/simple;
	bh=6xbZjbrXk1dVqAjU7CwpJKC/AiWpv4lpwinO5ZPYIIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BglvxtMUXfeGA5qghVDAuzvk7naz7SX274j5HvH1MvVBW0y/4HEotVeIjFqvFeZZM3DkjeMtBjl2cUBUF4ckvyKcER+XZJiBxkZGmUHxl08Zf9GE8RoSv2A0ypGUg+cJZb1AegpQdNnhuGn7/WXnDLKWCOHC8W9laE6tS3Nk/gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K9agOq9E; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K9agOq9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=oHSShcJl397/HFNYBPP/veNd+JpVpT3y1XWR8oMTxew=; b=K9agOq
	9EfbMhjGoL6xdXXD2iruAtiKiCJ8sRV41oQoAfXPKxUNejUIbjGE9tKTbgQ3+Clf
	gyGX1ir87Jqal/RMSePdYGpxLxmi1fW+WrqRAu1uded4o8XMuH3j7GNk4Dv9Lhbd
	RVdz7+H0yVcPa0Zhod7Sx3yuL/8syDrN766Ri3Y6AypneDT1djO+yl/ZhGohkIH4
	kh/LjL5oIzs6Y2mYwjedS+zd2qK8noyiZYGE6Ft3Z/XXvWT/uWTF3V0d3VhSlWvy
	SoHWmjPuR/dEDsvcGuw5BDvDS+5tGe/koFETGpLPKVPhpfQoJdqczweiOzmAEV2f
	2TOSIUwdx+/uK1tQ==
Received: (qmail 2287450 invoked from network); 5 Jul 2026 18:36:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jul 2026 18:36:01 +0200
X-UD-Smtp-Session: l3s3148p1@TAfQwN9V+gdtKjFj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] drm/imx: remove unneeded 'fast_io' parameter in regmap_config
Date: Sun,  5 Jul 2026 18:35:37 +0200
Message-ID: <20260705163536.1850-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
References: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/gpu/drm/imx/dc/dc-cf.c      | 1 -
 drivers/gpu/drm/imx/dc/dc-de.c      | 1 -
 drivers/gpu/drm/imx/dc/dc-ed.c      | 2 --
 drivers/gpu/drm/imx/dc/dc-fg.c      | 1 -
 drivers/gpu/drm/imx/dc/dc-fl.c      | 1 -
 drivers/gpu/drm/imx/dc/dc-fw.c      | 2 --
 drivers/gpu/drm/imx/dc/dc-ic.c      | 1 -
 drivers/gpu/drm/imx/dc/dc-lb.c      | 2 --
 drivers/gpu/drm/imx/dc/dc-tc.c      | 1 -
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 2 --
 10 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-cf.c b/drivers/gpu/drm/imx/dc/dc-cf.c
index 2f077161e912..6431ecd442c9 100644
--- a/drivers/gpu/drm/imx/dc/dc-cf.c
+++ b/drivers/gpu/drm/imx/dc/dc-cf.c
@@ -45,7 +45,6 @@ static const struct regmap_config dc_cf_cfg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_cf_regmap_access_table,
 	.rd_table = &dc_cf_regmap_access_table,
 	.max_register = CONSTANTCOLOR,
diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
index 5a3125596fdf..7a93dda20c59 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.c
+++ b/drivers/gpu/drm/imx/dc/dc-de.c
@@ -37,7 +37,6 @@ static const struct regmap_config dc_de_top_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_de_regmap_access_table,
 	.rd_table = &dc_de_regmap_access_table,
 	.max_register = POLARITYCTRL,
diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index d42f33d6f3fc..bde6173615eb 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -77,7 +77,6 @@ static const struct regmap_config dc_ed_pec_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_ed_pec_regmap_write_table,
 	.rd_table = &dc_ed_pec_regmap_read_table,
 	.volatile_table = &dc_ed_pec_regmap_volatile_table,
@@ -99,7 +98,6 @@ static const struct regmap_config dc_ed_cfg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_ed_regmap_access_table,
 	.rd_table = &dc_ed_regmap_access_table,
 	.max_register = CONTROL,
diff --git a/drivers/gpu/drm/imx/dc/dc-fg.c b/drivers/gpu/drm/imx/dc/dc-fg.c
index 28f372be9247..fdf5bc34554d 100644
--- a/drivers/gpu/drm/imx/dc/dc-fg.c
+++ b/drivers/gpu/drm/imx/dc/dc-fg.c
@@ -122,7 +122,6 @@ static const struct regmap_config dc_fg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_fg_regmap_write_table,
 	.rd_table = &dc_fg_regmap_read_table,
 	.max_register = FGCHSTATCLR,
diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index 3ce24c72aa13..003476ac2fa1 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -49,7 +49,6 @@ static const struct regmap_config dc_fl_cfg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_fl_regmap_access_table,
 	.rd_table = &dc_fl_regmap_access_table,
 	.max_register = FRAMEDIMENSIONS,
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
index acb2d4d9e2ec..96bc3c7c8f9b 100644
--- a/drivers/gpu/drm/imx/dc/dc-fw.c
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -51,7 +51,6 @@ static const struct regmap_config dc_fw_pec_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_fw_pec_regmap_access_table,
 	.rd_table = &dc_fw_pec_regmap_access_table,
 	.max_register = PIXENGCFG_DYNAMIC,
@@ -72,7 +71,6 @@ static const struct regmap_config dc_fw_cfg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_fw_regmap_access_table,
 	.rd_table = &dc_fw_regmap_access_table,
 	.max_register = CONTROL,
diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
index a270ae4030cd..f1c371a95cae 100644
--- a/drivers/gpu/drm/imx/dc/dc-ic.c
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -76,7 +76,6 @@ static const struct regmap_config dc_ic_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_ic_regmap_write_table,
 	.rd_table = &dc_ic_regmap_read_table,
 	.volatile_table = &dc_ic_regmap_volatile_table,
diff --git a/drivers/gpu/drm/imx/dc/dc-lb.c b/drivers/gpu/drm/imx/dc/dc-lb.c
index ca1d714c8d6e..4f5c15833efa 100644
--- a/drivers/gpu/drm/imx/dc/dc-lb.c
+++ b/drivers/gpu/drm/imx/dc/dc-lb.c
@@ -92,7 +92,6 @@ static const struct regmap_config dc_lb_pec_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_lb_pec_regmap_access_table,
 	.rd_table = &dc_lb_pec_regmap_access_table,
 	.max_register = PIXENGCFG_DYNAMIC,
@@ -112,7 +111,6 @@ static const struct regmap_config dc_lb_cfg_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_lb_regmap_access_table,
 	.rd_table = &dc_lb_regmap_access_table,
 	.max_register = POSITION,
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
index 0bfd381b2cea..54b56dadbe36 100644
--- a/drivers/gpu/drm/imx/dc/dc-tc.c
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -44,7 +44,6 @@ static const struct regmap_config dc_tc_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 	.wr_table = &dc_tc_regmap_access_table,
 	.rd_table = &dc_tc_regmap_access_table,
 	.max_register = MAPBIT31_28,
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index e861b8b9d8fa..cb09c3f23312 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -460,8 +460,6 @@ static struct regmap_config tve_regmap_config = {
 
 	.readable_reg = imx_tve_readable_reg,
 
-	.fast_io = true,
-
 	.max_register = 0xdc,
 };
 
-- 
2.51.0

