Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423993E5EF5
	for <imx@lists.linux.dev>; Mon,  4 May 2026 19:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921928; cv=none; b=UtaXyi1fp3XyAXswNAqNlH1rTBpjRmNMfjOwrluHSi04OHSe501bpZJYAXup4GtGOPyXV0iZKIaNE/H2V4n9eMx76YORKNvu+WxfTsZ3Yy0tEmzbn/gi4M0LeA77wlMIVLOyG0aU9dedZMJH0yalZF578AvINSufnqtze6PRM98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921928; c=relaxed/simple;
	bh=x0VqNjDgMAx0NQishXOijMj7JPsPLQzxh7+zHOQ9Ppw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTLnqBhHYTg/IQAyCQ2YeM3Ep/gVO+19U99Q31CKiOdt/wJr9mBCuBbzCAyRGKjVnSnRr/QJXa5yR00ej1ylf/HafzU5p5gCmDyLZLSZf6XtoZXgrUA4kYizPe7HVMEehP3p8iOqSh+sRjeB9pXuHdeJtW+GABhk8zMyK8IpXAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=MYtoNOgL; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="MYtoNOgL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921925; bh=Pky9kczMC+5Jgxszkenl0PmmnnhOhGsGHf/TrtDLxNk=;
 b=MYtoNOgL35lHBWUKnJ/h8l9cMK3ZDWLEY8V7Z+lBHgZZjDzatreCUKk9YetOX880IynzQsd6U
 Llq8ZEVGjsMxZAzao+2Ch9UDQL6nHAbvNRs9QysUjwdZlc8r6ATB9j8ELXrf8+cA5w2b7a7kesN
 urtzYYmVj8aY19jXEu+IMaNVRULL/Cg4ZNiQP/6st0a1J2jY2G/ptlfkZtlvZ3hB+MDNecB4L0F
 6o4wqGfAbKv4Gm4NoopLbhmqvMXK0MNlUjJnlSbHhi7WbXLF0hozb4T0qTdfWqLrTVlvVIWDXHx
 1znbgIuaZAhOnTqhHskoX3Ia4HmhQc1TQeunihhtuEdg==
X-Forward-Email-ID: 69f8ef8004bb1dff846bb97f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.7.7
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
Subject: [PATCH v4 13/17] drm: bridge: dw_hdmi: Use delayed_work to debounce hotplug event
Date: Mon,  4 May 2026 19:10:50 +0000
Message-ID: <20260504191059.275928-14-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504191059.275928-1-jonas@kwiboo.se>
References: <20260504191059.275928-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HDMI Specification Version 1.4b chapter 8.5 mentions:

  An HDMI Sink shall not assert high voltage level on its Hot Plug
  Detect pin when the E-EDID is not available for reading.

  A Source may use a high voltage level Hot Plug Detect signal to
  initiate the reading of E-EDID data.

  An HDMI Sink shall indicate any change to the contents of the E-EDID
  by driving a low voltage level pulse on the Hot Plug Detect pin. This
  pulse shall be at least 100 msec.

Use a delayed work to debounce reacting on HPD events to better handle a
HPD low voltage level pulse when a sink changes the EDID.

The delayed work is only active between enable_hpd()/hpd_enable() and
disable_hpd()/hpd_disable() calls from core, i.e. enabled after
attach/bind/resume and disabled before detach/unbind/suspend.

The 1100 msec hotplug debounce timeout was arbitrarily picked to match
other drivers using same const, and testing using a Raspberry Pi Monitor
seem to use a 200-300 msec pulse when going from standby to power on
state.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: Disable/mask delayed_work until enable_hpd()/hpd_enable(),
    Read connector status directly from HW regs in hpd_work
v3: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 59 +++++++++++++++++++++--
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0aa29b92327e..193bdba65758 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -50,6 +50,8 @@
 
 #define HDMI14_MAX_TMDSCLK	340000000
 
+#define HOTPLUG_DEBOUNCE_MS	1100
+
 static const u16 csc_coeff_default[3][4] = {
 	{ 0x2000, 0x0000, 0x0000, 0x0000 },
 	{ 0x0000, 0x2000, 0x0000, 0x0000 },
@@ -185,6 +187,7 @@ struct dw_hdmi {
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
 	enum drm_connector_status last_connector_result;
+	struct delayed_work hpd_work;
 };
 
 const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi)
@@ -2517,6 +2520,20 @@ static void dw_hdmi_connector_force(struct drm_connector *connector)
 	dw_hdmi_connector_status_update(connector, connector->status);
 }
 
+static void dw_hdmi_connector_enable_hpd(struct drm_connector *connector)
+{
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
+
+	enable_delayed_work(&hdmi->hpd_work);
+}
+
+static void dw_hdmi_connector_disable_hpd(struct drm_connector *connector)
+{
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
+
+	disable_delayed_work_sync(&hdmi->hpd_work);
+}
+
 static const struct drm_connector_funcs dw_hdmi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = dw_hdmi_connector_detect,
@@ -2530,6 +2547,8 @@ static const struct drm_connector_funcs dw_hdmi_connector_funcs = {
 static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs = {
 	.get_modes = dw_hdmi_connector_get_modes,
 	.atomic_check = dw_hdmi_connector_atomic_check,
+	.enable_hpd = dw_hdmi_connector_enable_hpd,
+	.disable_hpd = dw_hdmi_connector_disable_hpd,
 };
 
 static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
@@ -2946,6 +2965,20 @@ static const struct drm_edid *dw_hdmi_bridge_edid_read(struct drm_bridge *bridge
 	return dw_hdmi_edid_read(hdmi, connector);
 }
 
+static void dw_hdmi_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	enable_delayed_work(&hdmi->hpd_work);
+}
+
+static void dw_hdmi_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	disable_delayed_work_sync(&hdmi->hpd_work);
+}
+
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -2959,6 +2992,8 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.mode_valid = dw_hdmi_bridge_mode_valid,
 	.detect = dw_hdmi_bridge_detect,
 	.edid_read = dw_hdmi_bridge_edid_read,
+	.hpd_enable = dw_hdmi_bridge_hpd_enable,
+	.hpd_disable = dw_hdmi_bridge_hpd_disable,
 };
 
 /* -----------------------------------------------------------------------------
@@ -3079,10 +3114,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 			status == connector_status_connected ?
 			"plugin" : "plugout");
 
-		if (hdmi->bridge.dev) {
-			drm_helper_hpd_irq_event(hdmi->bridge.dev);
-			drm_bridge_hpd_notify(&hdmi->bridge, status);
-		}
+		mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
+				 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 	}
 
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
@@ -3092,6 +3125,19 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void dw_hdmi_hpd_work(struct work_struct *work)
+{
+	struct dw_hdmi *hdmi = container_of(work, struct dw_hdmi, hpd_work.work);
+	enum drm_connector_status status;
+
+	if (WARN_ON(!hdmi->bridge.dev))
+		return;
+
+	drm_helper_hpd_irq_event(hdmi->bridge.dev);
+	status = dw_hdmi_phy_read_hpd(hdmi, hdmi->phy.data);
+	drm_bridge_hpd_notify(&hdmi->bridge, status);
+}
+
 static const struct dw_hdmi_phy_data dw_hdmi_phys[] = {
 	{
 		.type = DW_HDMI_PHY_DWC_HDMI_TX_PHY,
@@ -3376,6 +3422,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		goto err_res;
 	}
 
+	INIT_DELAYED_WORK(&hdmi->hpd_work, dw_hdmi_hpd_work);
+	disable_delayed_work(&hdmi->hpd_work);
+
 	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
 					dw_hdmi_irq, IRQF_SHARED,
 					dev_name(dev), hdmi);
@@ -3508,6 +3557,8 @@ EXPORT_SYMBOL_GPL(dw_hdmi_probe);
 
 void dw_hdmi_remove(struct dw_hdmi *hdmi)
 {
+	disable_delayed_work_sync(&hdmi->hpd_work);
+
 	drm_bridge_remove(&hdmi->bridge);
 
 	if (hdmi->audio && !IS_ERR(hdmi->audio))
-- 
2.54.0

