Received: from mail-m3270.qiye.163.com (mail-m3270.qiye.163.com [220.197.32.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1573333F3
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 02:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761014269; cv=none; b=Ido4CywTCy71rTUVH/eNr8Sgfs4TbxhBj/GyX3mTLD1q832AZwfsEUEUodDTgsWfTs/BQkczUyLbZC1iwqhHGhOg9IVD63LMXxIMw6GzLMepYgkUUhTHMQTPSYxtVBiDC7hk6xC9dTSu4132rhlfbZarMPOZKRdyC71jzCq64Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761014269; c=relaxed/simple;
	bh=dHwlb4zWXhfD3/IntsTsLlG/lsQcgL/CDy/1U2vWsY0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jAxx8SPMCYlbNzdq0sw8SsrMU3r8RrGAFvnYITwnBCHoZZcgAvz+XM6vwyzN5aa/EnBaX3gG0bqXxF4w4XG8/uQRv9P2fAxvugGxKfbGHCozgwgvnVfAG/f/YOxiepABa4wXOp0GK5PJRYph5futYXrTve9HNBCNl6bAXK+QZgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=cGCXVsjv; arc=none smtp.client-ip=220.197.32.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="cGCXVsjv"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26966e5d6;
	Tue, 21 Oct 2025 10:32:32 +0800 (GMT+08:00)
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
Subject: [PATCH v7 01/18] drm/display: bridge_connector: Ensure last bridge determines EDID/modes detection capabilities
Date: Tue, 21 Oct 2025 10:31:13 +0800
Message-Id: <20251021023130.1523707-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021023130.1523707-1-damon.ding@rock-chips.com>
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a049c6e9903a3kunm42a8e83d59a55d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR4dTFZCQkhJT0xCH01LGEhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=cGCXVsjvej/FbDt0ArDJP2LEZNBa2oyFzE8eYGLd1fLo3vzR0FP0eUCmj8A+0jnELOW7EYa4Wk7rGXC5tFdG85ouz/Pie0OkGEA4NqQmKA1Ne1ctdm2upQZOHUJ6uGiEUP5uii9ne6mm8A5O2ZOrbgGm6lKsm8lT3NWymdSqw4c=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=z6XpUeE8zoDoSFMUX5SO9d2HLBX2jZRTksAC/b3VfJU=;
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
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index baacd21e7341..7c2936d59517 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -673,14 +673,22 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (!bridge->ycbcr_420_allowed)
 			connector->ycbcr_420_allowed = false;
 
-		if (bridge->ops & DRM_BRIDGE_OP_EDID)
-			bridge_connector->bridge_edid = bridge;
+		/*
+		 * Ensure the last bridge declares OP_EDID or OP_MODES or both.
+		 */
+		if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MODES) {
+			bridge_connector->bridge_edid = NULL;
+			bridge_connector->bridge_modes = NULL;
+			if (bridge->ops & DRM_BRIDGE_OP_EDID)
+				bridge_connector->bridge_edid = bridge;
+			if (bridge->ops & DRM_BRIDGE_OP_MODES)
+				bridge_connector->bridge_modes = bridge;
+		}
 		if (bridge->ops & DRM_BRIDGE_OP_HPD)
 			bridge_connector->bridge_hpd = bridge;
 		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
 			bridge_connector->bridge_detect = bridge;
-		if (bridge->ops & DRM_BRIDGE_OP_MODES)
-			bridge_connector->bridge_modes = bridge;
+
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
-- 
2.34.1

