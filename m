Received: from mail-m3281.qiye.163.com (mail-m3281.qiye.163.com [220.197.32.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE3D33B95A
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765964040; cv=none; b=j3dlz9vRHeqWGqEFxbk3Kr9nfQtE8r/d6UM3AQHMq7/jNg2fmL4mvDzVr2ijk35YyZTJdSBIGouqYVS+mH+jy30ZEolO5WjIfd5+0XikfRh/2uKRspQzqH9xwFgJRuMzSoD0SrhAWaNauIBKKFiDnPmcLwIoQ+dKa8kEZ+xgQfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765964040; c=relaxed/simple;
	bh=7tukIHqKlPtvQo85AEe+ZHcpQ275Xm52vAAd47MIYic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hx9iBMnZJXBF4UFECd8IY+v6ojB0RiRaWYct2/N6mIjEGQXJYFTHq6faeMjT4C2wRoqOS0p5mkEBQhFlwEzGBFVy3rEMQUpumZiBDo8+WtPNyK0w5cge3W/qMj+1IN95N2cl2MloWNHtJR6h0JyE6eqaKGQh+AQvT2e8Kdv/r3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=MobRGV91; arc=none smtp.client-ip=220.197.32.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="MobRGV91"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d931e535;
	Wed, 17 Dec 2025 17:33:53 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v8 07/18] drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
Date: Wed, 17 Dec 2025 17:33:10 +0800
Message-Id: <20251217093321.3108939-8-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217093321.3108939-1-damon.ding@rock-chips.com>
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b2ba8ac1003a3kunma9c945a29ee70
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxCGlZJTUtPQ0tJGk1IQxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=MobRGV913OHfd1e3iHyPttOR5Zv2K6hCkDboCGBRxqD7rWi2DP/+CwIZWxi/5NPey9a4zI5gjRhzw2WsCgx5JmuspawyUMRxNuyLtF6oqMbvUQ/q3ra42/bn4T9WSUnUg2AAwyD9Pkzo9KtLAjwNNrbYLcCCKYH81oOLFDrmZKs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=W7hscjxrhMolqP2gEq4HitXov1btGjuXKeTkNPaU3R8=;
	h=date:mime-version:subject:message-id:from;

The &exynos_dp_device.connector is assigned in exynos_dp_bridge_attach()
but never used. It should make sense to remove it.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

---

Changes in v5:
- Fix the 'drm/bridge' to 'drm/exynos' in commit message.
---
 drivers/gpu/drm/exynos/exynos_dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index f469ac5b3c2a..e20513164032 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -35,7 +35,6 @@
 
 struct exynos_dp_device {
 	struct drm_encoder         encoder;
-	struct drm_connector       *connector;
 	struct drm_device          *drm_dev;
 	struct device              *dev;
 
@@ -102,8 +101,6 @@ static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 	struct exynos_dp_device *dp = to_dp(plat_data);
 	int ret;
 
-	dp->connector = connector;
-
 	/* Pre-empt DP connector creation if there's a bridge */
 	if (plat_data->next_bridge) {
 		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
-- 
2.34.1

