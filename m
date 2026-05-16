Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B443348896
	for <imx@lists.linux.dev>; Sat, 16 May 2026 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956826; cv=none; b=AL+tI9Xx8F/YFzeu0eigT06brxsPCIw1h4WoigNwSX1k4s7G+INObKvL5OaQjoDPiSb8ax/kSQ7PuviWGGcyWxm8WY5xfpI8TBpAElWjABjZGucJ8jQS85Pr8AtW4TAOFgaBhbdyS6RmeImcWte9O3WdqBRao9mn4BMg23ujeA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956826; c=relaxed/simple;
	bh=EIzgXYxOPVPE5G5nLTh4GP7uzPwLhv3SUhPYlsUpuL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPLrx8q08qBZabHlzbM8rTu6RhnynhJur1CkngezH5eHUpnn48nb+Bxnyrahuu9gxJXkqrPthxsxBuNmPWpg1UjYoU6ypKNhcmyne5yuSF3qAo+WVMXXdekuCzvXaBGGVHJqiOkamlWtfQbTz+8tSegzgv97nk7puCz7sTPlrqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=JQh0wVp8; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="JQh0wVp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956822; bh=La8Pp28MA1FscyJmMaeuUETZMDR7fnDjFGmU5JireP0=;
 b=JQh0wVp8LGiYgcKj74kE4uQ8BQ+jQbDh36FO7w0gaBX4d7de8MSWlU6wbpfyQnFCscZ7MdazQ
 iaSYLXCfGpcAIkcWTpPEat5EICtOtq0v1nScQkbc+eXddQYN/qIIIEXvz797RhjfWFBVlIVpDYS
 pNJ8L/856ulqqFgCh1/ZHd7+M4TK5yDa4elokUp2QXeikX+DkqFfpgx3TILfwvxYXrx6box2seU
 8Ezd4lzI7+UALnSeA5mI9zNVfB6znsVmR+CzyISBnFu+Jh2cAsdSZMpxe+AMHF9ho0NP8egvqHm
 LaA9pVi1Ednd32Mp8ShLTKphhuvj9f63Ks+zulNviWrQ==
X-Forward-Email-ID: 6a08ba0f79c7625f20eeef4a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Liu Ying <victor.liu@nxp.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Christian Hewitt <christianshewitt@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 21/22] drm: bridge: dw_hdmi: Remove the empty dw_hdmi_phy_update_hpd()
Date: Sat, 16 May 2026 18:38:31 +0000
Message-ID: <20260516183838.2024991-22-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516183838.2024991-1-jonas@kwiboo.se>
References: <20260516183838.2024991-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dw_hdmi_phy_update_hpd() helper is empty and no longer needed after
recent RXSENSE and HPD rework, remove it.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: Collect t-b tag
v5: No change
v4: New patch
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 -
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 7 -------
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 --
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c      | 2 --
 include/drm/bridge/dw_hdmi.h                | 4 ----
 5 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 8e8cfd66f23b..20d389dbfdc5 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -78,7 +78,6 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
 	.disable	= imx8mp_hdmi_phy_disable,
 	.setup_hpd	= im8mp_hdmi_phy_setup_hpd,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 };
 
 static int imx8mp_dw_hdmi_bind(struct device *dev)
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 59864b9084f6..79851ae27496 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1687,12 +1687,6 @@ enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_phy_read_hpd);
 
-void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
-			    bool force, bool disabled, bool rxsense)
-{
-}
-EXPORT_SYMBOL_GPL(dw_hdmi_phy_update_hpd);
-
 void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data)
 {
 	/*
@@ -1716,7 +1710,6 @@ static const struct dw_hdmi_phy_ops dw_hdmi_synopsys_phy_ops = {
 	.init = dw_hdmi_phy_init,
 	.disable = dw_hdmi_phy_disable,
 	.read_hpd = dw_hdmi_phy_read_hpd,
-	.update_hpd = dw_hdmi_phy_update_hpd,
 	.setup_hpd = dw_hdmi_phy_setup_hpd,
 };
 
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 0dc1eb5d2ae3..7136e713df2e 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -413,7 +413,6 @@ static const struct dw_hdmi_phy_ops rk3228_hdmi_phy_ops = {
 	.init		= dw_hdmi_rockchip_genphy_init,
 	.disable	= dw_hdmi_rockchip_genphy_disable,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_rk3228_setup_hpd,
 };
 
@@ -449,7 +448,6 @@ static const struct dw_hdmi_phy_ops rk3328_hdmi_phy_ops = {
 	.init		= dw_hdmi_rockchip_genphy_init,
 	.disable	= dw_hdmi_rockchip_genphy_disable,
 	.read_hpd	= dw_hdmi_rk3328_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_rk3328_setup_hpd,
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 4fa69c463dc4..2ac99b8ce8c4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -221,7 +221,6 @@ static const struct dw_hdmi_phy_ops sun8i_a83t_hdmi_phy_ops = {
 	.init		= sun8i_a83t_hdmi_phy_config,
 	.disable	= sun8i_a83t_hdmi_phy_disable,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_phy_setup_hpd,
 };
 
@@ -395,7 +394,6 @@ static const struct dw_hdmi_phy_ops sun8i_h3_hdmi_phy_ops = {
 	.init		= sun8i_h3_hdmi_phy_config,
 	.disable	= sun8i_h3_hdmi_phy_disable,
 	.read_hpd	= dw_hdmi_phy_read_hpd,
-	.update_hpd	= dw_hdmi_phy_update_hpd,
 	.setup_hpd	= dw_hdmi_phy_setup_hpd,
 };
 
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index a612b9fa6dbb..10013b8d3adb 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -118,8 +118,6 @@ struct dw_hdmi_phy_ops {
 		    const struct drm_display_mode *mode);
 	void (*disable)(struct dw_hdmi *hdmi, void *data);
 	enum drm_connector_status (*read_hpd)(struct dw_hdmi *hdmi, void *data);
-	void (*update_hpd)(struct dw_hdmi *hdmi, void *data,
-			   bool force, bool disabled, bool rxsense);
 	void (*setup_hpd)(struct dw_hdmi *hdmi, void *data);
 };
 
@@ -213,8 +211,6 @@ void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi);
 
 enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
 					       void *data);
-void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
-			    bool force, bool disabled, bool rxsense);
 void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
 
 bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
-- 
2.54.0

