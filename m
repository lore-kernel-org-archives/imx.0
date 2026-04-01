Received: from mail-m15586.qiye.163.com (mail-m15586.qiye.163.com [101.71.155.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B8C3CF664
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 09:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034956; cv=none; b=D3MiOkjdIikiT576B0i8NORodYqv8lDbwKPGsAFIhALJXJxRW0Hk1wHZ78nUT5bH0VgyZ1tXiqDhTUAuhBUkLSBLReSctrc1ClkPU0IObdpW0/mHmxmqv0/REe6r7ctZRYUR9QgIyQcv7qbe8zL2LlQTj60W8vwJyQtyp7Nw3SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034956; c=relaxed/simple;
	bh=LNsTNEJIkd/LSXRUw5sgyldyWvhQGoOSDPBV6tMOMcI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NY3BgO+sqCYB12q4rowUE7uuBW+TSks6nbOSLLHSe1TWIuCarbmY4yoqXgEMoMmEpLufTHSgXsnTPa6mWpeW5zx3TbcLa5uGG2QBLcRL+BuRUIXI0LH1Q3apmlcxSrbhgE42zRfdJAMsAM15LVlk2yD/kzVwVB4qI7IzY31ZWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=SUJ8+mCG; arc=none smtp.client-ip=101.71.155.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="SUJ8+mCG"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3923a2fdb;
	Wed, 1 Apr 2026 17:15:42 +0800 (GMT+08:00)
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
Subject: [PATCH v12 08/17] drm/bridge: analogix_dp: Remove unused &analogix_dp_plat_data.get_modes()
Date: Wed,  1 Apr 2026 17:14:45 +0800
Message-Id: <20260401091454.25730-9-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401091454.25730-1-damon.ding@rock-chips.com>
References: <20260401091454.25730-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d4853c5c803a3kunm479af8c3b32dfb
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhkYSFYZGU9PGkMYTB5DTUtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=SUJ8+mCGecAhlsfxugPFlcktwsrUG4kBnQQY4uQP96oMMqIAwNUlS822lw7+LRQVKrD41jp4lmCa24VagjcEPPzJJkxD1sFpQymZMenrl5BVvOfzM38pThVov5oE5yW8erkZz4yhx7DT+LMo4eJAeLXF2V8PaPZCfuXIBspuyhA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ZdKrlvaVo2xDGk81enZ3I3B6rbkPsZaVMW6w7Lb/Rhg=;
	h=date:mime-version:subject:message-id:from;

The callback &analogix_dp_plat_data.get_modes() is not implemented
by either Rockchip side or Exynos side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

---

Changes in v9:
- Add Tested-by tag.

Changes in v10:
- Add Reviewed-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ---
 include/drm/bridge/analogix_dp.h                   | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 5bf41b364aba..b0bc96693fdb 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -875,9 +875,6 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 		}
 	}
 
-	if (dp->plat_data->get_modes)
-		num_modes += dp->plat_data->get_modes(dp->plat_data, connector);
-
 	return num_modes;
 }
 
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index f06da105d8f2..3301392eda5f 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -35,8 +35,6 @@ struct analogix_dp_plat_data {
 	int (*power_off)(struct analogix_dp_plat_data *);
 	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
 		      struct drm_connector *);
-	int (*get_modes)(struct analogix_dp_plat_data *,
-			 struct drm_connector *);
 };
 
 int analogix_dp_resume(struct analogix_dp_device *dp);
-- 
2.34.1

