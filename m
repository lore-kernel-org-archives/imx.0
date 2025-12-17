Received: from mail-m3281.qiye.163.com (mail-m3281.qiye.163.com [220.197.32.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D004F254B19
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966150; cv=none; b=trtQblZKgocSOG4c6+KLGkY7Za3tuJckimm/f5VGzo2W42MoR4L94bqzvx0KVqLEEpc3GrzHccid12EfXZNjJqXNKLpvx4fN4zUsy4KbrDoz0zXzIk6WZ9ZuZOIe+EDila3DAeYi0vGMRRrZaB6URaQVTC7BCXoIaNNfXW+heVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966150; c=relaxed/simple;
	bh=5vy6BAkybpHjQsgQpPoIbCY2UKwgnuHyhnz4ysaDDSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kep17E43YSFbyeaBAbsVbF9zVPATUu22xrKHEUK+cihru4/XRZ4ViFFO86G5H6KM8MvWDHIGn0171/mEcoO+PRRIqaowXuVQCG8XgyXuUozo+qiLHmpi5lkr2dlxVXfChxVpnbx7CWJw1W4ICIp8UoGWQM69fuiIEorUpGx3Czk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=QWUz382M; arc=none smtp.client-ip=220.197.32.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="QWUz382M"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d931e4b3;
	Wed, 17 Dec 2025 17:33:38 +0800 (GMT+08:00)
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
Subject: [PATCH v8 01/18] drm/display: bridge_connector: Ensure last bridge determines EDID/modes detection capabilities
Date: Wed, 17 Dec 2025 17:33:04 +0800
Message-Id: <20251217093321.3108939-2-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a9b2ba871dc03a3kunma9c945a29ed9a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhkdGlZKSRgaHkxKS01OGBhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=QWUz382MLHrh4SaeV+BD/QjhkFn3QXZ1RSqJk7ie6m+cI64udPP/tdQTPQmKK5nD7h15vz83LRECQmGentL2MFzlxdND0wy4tlqlSJnYv8uacHmLKq6YdQ51agMcBMs0Bz8K8OXA5iX4dkKBUmv+wLYiSstROwFiCQthiamIaq8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ARC0eRZH6xtSv1qtUSRKKwKr4pOZEQIYOR1R2EYV0Ss=;
	h=date:mime-version:subject:message-id:from;

When multiple bridges are present, EDID detection capability
(DRM_BRIDGE_OP_EDID) takes precedence over modes detection
(DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
determined by the last bridge in the chain, we handle three cases:

Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
 - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
   &drm_bridge_connector.bridge_edid to NULL and set
   &drm_bridge_connector.bridge_modes to the later bridge.
 - Ensure modes detection capability of the later bridge will not
   be ignored.

Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
 - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
   &drm_bridge_connector.bridge_modes to NULL and set
   &drm_bridge_connector.bridge_edid to the later bridge.
 - Although EDID detection capability has higher priority, this
   operation is for balance and makes sense.

Case 3: the later bridge declares both of them
 - Assign later bridge as &drm_bridge_connector.bridge_edid and
   and &drm_bridge_connector.bridge_modes to this bridge.
 - Just leave transfer of these two capabilities as before.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

---

Changes in v7:
- As Luca suggested, simplify the code and related comment.

Changes in v8:
- Adapt the modifications to the newest bridge_connector driver.
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a2d30cf9e06d..92b9e8ec520d 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -690,9 +690,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!bridge->ycbcr_420_allowed)
 			connector->ycbcr_420_allowed = false;
 
-		if (bridge->ops & DRM_BRIDGE_OP_EDID) {
+		/*
+		 * Ensure the last bridge declares OP_EDID or OP_MODES or both.
+		 */
+		if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
 			drm_bridge_put(bridge_connector->bridge_edid);
-			bridge_connector->bridge_edid = drm_bridge_get(bridge);
+			bridge_connector->bridge_edid = NULL;
+			drm_bridge_put(bridge_connector->bridge_modes);
+			bridge_connector->bridge_modes = NULL;
+
+			if (bridge->ops & DRM_BRIDGE_OP_EDID)
+				bridge_connector->bridge_edid = drm_bridge_get(bridge);
+			if (bridge->ops & DRM_BRIDGE_OP_MODES)
+				bridge_connector->bridge_modes = drm_bridge_get(bridge);
 		}
 		if (bridge->ops & DRM_BRIDGE_OP_HPD) {
 			drm_bridge_put(bridge_connector->bridge_hpd);
@@ -702,10 +712,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			drm_bridge_put(bridge_connector->bridge_detect);
 			bridge_connector->bridge_detect = drm_bridge_get(bridge);
 		}
-		if (bridge->ops & DRM_BRIDGE_OP_MODES) {
-			drm_bridge_put(bridge_connector->bridge_modes);
-			bridge_connector->bridge_modes = drm_bridge_get(bridge);
-		}
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
-- 
2.34.1

