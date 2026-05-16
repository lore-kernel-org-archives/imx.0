Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B3A342510
	for <imx@lists.linux.dev>; Sat, 16 May 2026 18:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956801; cv=none; b=psUj6bDHTE4i95JAKYaKdySY+busXnqlnECm1HvI6kg/y/epLw6UwO9pNXTxNneFA5LjksvUBchU1aw4vmucR75eqpOqEQhHlO4VYu8pJEjOzZvoHCXMbqdShbZETdIzlSajtRE45eYP/H9cMutotrT4esBxzhHrRLI5P0DpSj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956801; c=relaxed/simple;
	bh=y+veDA534xd0yO4G2YM+bTpWsaQ6EL7YDLn19kVe+yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bThUXQDtDZhnf5o2/dXooUZ+CYcnhMRt+mb8zReCD7I8xafY8eqpX3EG+M0mlDabfbBkWkNO3pkga9g4anHyHHv4VEnlJAOE/CwMtrIeq2TXzgSijsoqbZYFQthQer9c3FH3NtBy5upyH+ZbT7pIk4KS0WC1Ja5o7XOaaPeTIuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=fGj+qNpZ; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="fGj+qNpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956798; bh=q6oJRtq3nxYHTSv0l15nZn4LSwId0laraARb9whniTg=;
 b=fGj+qNpZD1mmMz+FgBlWM5xT3s4LZIpL3/J6HhiVfdvxl/WVm0+tKX2T4pCf6YQvm9nOEnFaH
 d6JslUBJhq/qa3frf1tzrRvDLLhLouoO4wKqvR0EHOvqLFlooeIYq4Sojbjoe81fEaT0LMzifgD
 5L/eRM8T4moH4NAkjkkVVl6NwRuzroyq511+nBuwv0W9QNvVoE+X6ZnhjRXiqYtnCPPInhISLNF
 0MECDrNDIQ1B+TwBDMyZZVrICH3mnIcx61h2lfu2MVFLCbuc7lBrFPyw0k2yA44gDcWgpqT59Gv
 uryLNcjvOtAFse/RiIjHvZ9GQi73+4yKbWOQlM5ckPCA==
X-Forward-Email-ID: 6a08b9f979c7625f20eeeebf
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
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Christian Hewitt <christianshewitt@gmail.com>,
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
Subject: [PATCH v6 16/22] drm: bridge: dw_hdmi: Use display_info is_hdmi and has_audio
Date: Sat, 16 May 2026 18:38:26 +0000
Message-ID: <20260516183838.2024991-17-jonas@kwiboo.se>
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

drm_edid_connector_update() is being called from bridge connector funcs
and from detect and force funcs for dw-hdmi connector.

Change to use is_hdmi and has_audio from display_info directly instead
of keeping our own state in sink_is_hdmi and sink_has_audio.

Also remove the old and unused edid struct member and related define.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: Collect t-b tag
v5: No change
v4: Collect r-b tag
v3: No change
v2: Collect r-b tag
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 32 ++++-------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 1402b3963ae1..e9c4e24c090c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -45,8 +45,6 @@
 #define DDC_CI_ADDR		0x37
 #define DDC_SEGMENT_ADDR	0x30
 
-#define HDMI_EDID_LEN		512
-
 /* DW-HDMI Controller >= 0x200a are at least compliant with SCDC version 1 */
 #define SCDC_MIN_SOURCE_VERSION	0x1
 
@@ -146,8 +144,6 @@ struct dw_hdmi {
 
 	int vic;
 
-	u8 edid[HDMI_EDID_LEN];
-
 	struct {
 		const struct dw_hdmi_phy_ops *ops;
 		const char *name;
@@ -157,8 +153,6 @@ struct dw_hdmi {
 
 	struct i2c_adapter *ddc;
 	void __iomem *regs;
-	bool sink_is_hdmi;
-	bool sink_has_audio;
 
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *default_state;
@@ -2053,7 +2047,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 		HDMI_FC_INVIDCONF_IN_I_P_INTERLACED :
 		HDMI_FC_INVIDCONF_IN_I_P_PROGRESSIVE;
 
-	inv_val |= hdmi->sink_is_hdmi ?
+	inv_val |= display->is_hdmi ?
 		HDMI_FC_INVIDCONF_DVI_MODEZ_HDMI_MODE :
 		HDMI_FC_INVIDCONF_DVI_MODEZ_DVI_MODE;
 
@@ -2289,7 +2283,7 @@ static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
 	if (hdmi->hdmi_data.enc_out_bus_format == MEDIA_BUS_FMT_FIXED)
 		hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
-	hdmi->hdmi_data.rgb_limited_range = hdmi->sink_is_hdmi &&
+	hdmi->hdmi_data.rgb_limited_range = display->is_hdmi &&
 		drm_default_rgb_quant_range(mode) ==
 		HDMI_QUANTIZATION_RANGE_LIMITED;
 
@@ -2309,7 +2303,7 @@ static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
 	/* HDMI Initialization Step B.3 */
 	dw_hdmi_enable_video_path(hdmi);
 
-	if (hdmi->sink_has_audio) {
+	if (display->has_audio) {
 		dev_dbg(hdmi->dev, "sink has audio support\n");
 
 		/* HDMI Initialization Step E - Configure audio */
@@ -2318,7 +2312,7 @@ static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
 	}
 
 	/* not for DVI mode */
-	if (hdmi->sink_is_hdmi) {
+	if (display->is_hdmi) {
 		dev_dbg(hdmi->dev, "%s HDMI mode\n", __func__);
 
 		/* HDMI Initialization Step F - Configure AVI InfoFrame */
@@ -2432,29 +2426,13 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
 						struct drm_connector *connector)
 {
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 
 	if (!hdmi->ddc)
 		return NULL;
 
 	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
-	if (!drm_edid) {
+	if (!drm_edid)
 		dev_dbg(hdmi->dev, "failed to get edid\n");
-		return NULL;
-	}
-
-	/*
-	 * FIXME: This should use connector->display_info.is_hdmi and
-	 * connector->display_info.has_audio from a path that has read the EDID
-	 * and called drm_edid_connector_update().
-	 */
-	edid = drm_edid_raw(drm_edid);
-
-	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
-		edid->width_cm, edid->height_cm);
-
-	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
-	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
 
 	return drm_edid;
 }
-- 
2.54.0

