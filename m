Received: from mail-m19731119.qiye.163.com (mail-m19731119.qiye.163.com [220.197.31.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DA93AC0DC
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773909074; cv=none; b=jsrg8ea7pDOzmVbjszVFkZHUTgO/kIfKGqqzyi4DkDUOSR4eKe5WqP8Vo3eOCA/majh5pyFxlq93R1SLWwHzJ+1Axb7XLpAanRGAXPF3dmL0zCkFRSfZZ7vuG6g7D0Z1tJvLe7XhgWKSiOXc875a8x/8Hsk0G3fgrj9uTOcFrKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773909074; c=relaxed/simple;
	bh=fYiL5xAaF9o6BilI2+Y05gJkjFe/8LqCeJiRie4+l8c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mmKxnCVdmt/+jryEXuJ/VwOXiyPoX7nIGKKep/O8nRJmlL7eYC6x8zpdtsRzIaGhCZmAGDiidFfNNmekPTO7csdmMWMwEc2503Blroo8xM8S5t2Y/fR2X1Zih07qJfAaTHs+pV2L29JC6bVzJb1EP/nzDuDb8JqFKhAWYvARNNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=elmFdaKi; arc=none smtp.client-ip=220.197.31.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="elmFdaKi"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37887440d;
	Thu, 19 Mar 2026 15:15:26 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	victor.liu@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alim.akhtar@samsung.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	nicolas.frattaroli@collabora.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v11 07/17] drm/bridge: analogix_dp: Move the color format check to .atomic_check() for Rockchip platforms
Date: Thu, 19 Mar 2026 15:14:42 +0800
Message-Id: <20260319071452.1961274-8-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319071452.1961274-1-damon.ding@rock-chips.com>
References: <20260319071452.1961274-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d04f2fc0503a3kunm86e540ee396580
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09DSlZITRhCGkxOHUkZGUtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=elmFdaKiP61Q5k6DDOjly7iy6d/87Fxc4rqhAMOH5/56ybZkDgQFvUEz3bPBQjMEd17LqmzyOaI/p90R0BXDY1vaUbZbfxeQGR+Rv5Z8iBTW6aneT2lGipbA0eRhUo2KIaWsfCbcj/YKjJ9zQzE220nAT5emJgdjqwP5VvPRjWs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=3rkQ8jPKQUXQ5Fcb5jzjcMRfHXjYelN4FuQCG5UEL4g=;
	h=date:mime-version:subject:message-id:from;

For Rockchip platforms, the YUV color formats are currently unsupported.
This compatibility check was previously implemented in
&analogix_dp_plat_data.get_modes().

Moving color format check to &drm_connector_helper_funcs.atomic_check()
would get rid of &analogix_dp_plat_data.get_modes() and be more
reasonable than before.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

---

Changes in v9:
- Add Tested-by tag.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +++++++++++
 .../gpu/drm/rockchip/analogix_dp-rockchip.c    | 18 ------------------
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 4606ecc3f480..5bf41b364aba 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -894,8 +894,19 @@ static int analogix_dp_atomic_check(struct drm_connector *connector,
 				    struct drm_atomic_state *state)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
+	struct drm_display_info *di = &connector->display_info;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
+	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
+
+	if (is_rockchip(dp->plat_data->dev_type)) {
+		if ((di->color_formats & mask)) {
+			DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
+			di->color_formats &= ~mask;
+			di->color_formats |= DRM_COLOR_FORMAT_RGB444;
+			di->bpc = 8;
+		}
+	}
 
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 	if (WARN_ON(!conn_state))
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index fdab71d51e2a..70fe5ae69e2e 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -166,23 +166,6 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
 	return 0;
 }
 
-static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
-				 struct drm_connector *connector)
-{
-	struct drm_display_info *di = &connector->display_info;
-	/* VOP couldn't output YUV video format for eDP rightly */
-	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
-
-	if ((di->color_formats & mask)) {
-		DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
-		di->color_formats &= ~mask;
-		di->color_formats |= DRM_COLOR_FORMAT_RGB444;
-		di->bpc = 8;
-	}
-
-	return 0;
-}
-
 static bool
 rockchip_dp_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 				   const struct drm_display_mode *mode,
@@ -481,7 +464,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
-	dp->plat_data.get_modes = rockchip_dp_get_modes;
 
 	ret = rockchip_dp_of_probe(dp);
 	if (ret < 0)
-- 
2.34.1

