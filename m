Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5AE382381
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127420; cv=none; b=Za7TzMIywJ2wKNgTmyGVKCBP+GK9FYMK4XuH57ZzXvgLCFCpKT0eyprB1C2kJnHbX71d3u7o4uOR+ff3ttAl1VJGnSQiDPT3xRk0WI4yVgoQ9DBlNz7GvnhJ/UUK37TiSjsLZUncHuh855v7eOgEOVMUWYj8T3ETFKQQRzvd7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127420; c=relaxed/simple;
	bh=7tdKucEB1FT5o83Pw4WOLkuAeD4Nho/RlyViLslg6WU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAHnBsxLH9GP0f2V+ksVdnvU5X4tj6kcuv91i9IvHOffqkFo3eKde+7MNjRoSpFxFyoP+JZYO3sIi7M0xbJ9RHOF7jnIva3L7LKEmNGTQS3o5oPYqigrw7hb4xG4J5ei6S5Bu8wlaWu1vYOuvPn1WXBQGUyKESnWsT+a3QWpcKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=MDnLZT/4; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="MDnLZT/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127418; bh=wJnhBtAKYj8914+p1N910J9+JVRtN9gFjiQ73Zs/23Y=;
 b=MDnLZT/4dKsc8Zw2uCNfogXIhBHdwq9wbN2BkHs9Elt65cngCEU/4sCVlZALuWTkq7oxKgy9u
 DRqa6b4Yu7DNcfyqfS22ByQC9F5QOqJN84wKmsGbKjNHVKkZT7vbAa8be/oxLWmA5VJ0HGtQBkj
 p8othvCbk5+/d3nfvEqnziGQbvvdbidYlGsY9CNFgpMatDCGCbd92clYfpSbidGPv1xPdkpI20m
 pwXuKK0Wqb95DAUNH9cxrdaoHllOBNUgYglfcbc9hEBX6SHzOF5PaXQ9PQC4bsWAlMCCFnOb0a2
 TYF19cbNc579cmbZ2Ebe/LVOwWrpFLuMm0USmLf8w0bQ==
X-Forward-Email-ID: 6a0b5476b84dbc72d2274faa
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
Subject: [PATCH v7 19/23] drm: bridge: dw_hdmi: Use delayed_work to debounce hotplug event
Date: Mon, 18 May 2026 18:01:55 +0000
Message-ID: <20260518180206.2480119-20-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
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

Use a delayed work to debounce reacting on HPD events to improve
handling of a HPD low voltage level pulse when a sink changes the EDID.

The delayed work is only enabled between enable_hpd()/hpd_enable() and
disable_hpd()/hpd_disable() calls from core, i.e. enabled after
attach/bind/resume and disabled before detach/unbind/suspend.

The 1100 msec hotplug debounce timeout was arbitrarily picked to match
other drivers using same const, and testing using a Raspberry Pi Monitor
seem to use a 200-300 msec pulse when going from standby to power on
state.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: Change to free irq before mute and clear using IH regs, also include
    clear of STAT0_RX_SENSE
v6: Change back to disable_delayed_work_sync() in hpd disable ops,
    Ensure HPD interrupt is masked and IRQ handler is disabled early
    in dw_hdmi_remove() to prevent any irq re-arming of delayed work,
    Drop use of suspend helper
v5: Change to none-sync disable_delayed_work() in hpd disable ops,
    Change to cancel_delayed_work_sync() in remove,
    Add cancel_delayed_work_sync() to new suspend helper
v4: Disable/mask delayed_work until enable_hpd()/hpd_enable(),
    Read connector status directly from HW regs in hpd_work
v3: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 80 +++++++++++++++++++++--
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 8afc9d240121..270db58a0e7c 100644
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
 	dw_hdmi_connector_status_update(hdmi, connector, connector->status);
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
 static void dw_hdmi_connector_destroy(struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
@@ -2538,6 +2555,8 @@ static const struct drm_connector_funcs dw_hdmi_connector_funcs = {
 static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs = {
 	.get_modes = dw_hdmi_connector_get_modes,
 	.atomic_check = dw_hdmi_connector_atomic_check,
+	.enable_hpd = dw_hdmi_connector_enable_hpd,
+	.disable_hpd = dw_hdmi_connector_disable_hpd,
 };
 
 static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
@@ -2968,6 +2987,20 @@ static const struct drm_edid *dw_hdmi_bridge_edid_read(struct drm_bridge *bridge
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
@@ -2981,6 +3014,8 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.mode_valid = dw_hdmi_bridge_mode_valid,
 	.detect = dw_hdmi_bridge_detect,
 	.edid_read = dw_hdmi_bridge_edid_read,
+	.hpd_enable = dw_hdmi_bridge_hpd_enable,
+	.hpd_disable = dw_hdmi_bridge_hpd_disable,
 };
 
 /* -----------------------------------------------------------------------------
@@ -3101,8 +3136,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 			status == connector_status_connected ?
 			"plugin" : "plugout");
 
-		if (hdmi->bridge.dev)
-			drm_helper_hpd_irq_event(hdmi->bridge.dev);
+		mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
+				 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 	}
 
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
@@ -3112,6 +3147,29 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void dw_hdmi_hpd_work(struct work_struct *work)
+{
+	struct dw_hdmi *hdmi = container_of(work, struct dw_hdmi, hpd_work.work);
+	struct drm_device *dev = hdmi->bridge.dev;
+
+	if (WARN_ON(!dev))
+		return;
+
+	/*
+	 * Notify the DRM core of the HPD event using drm_helper_hpd_irq_event()
+	 * instead of drm_bridge_hpd_notify(). This will cause the DRM function
+	 * check_connector_changed() to be called, which in turn calls the
+	 * connector detect()/force() funcs to detect any connection status or
+	 * epoch changes. The bridge connector detect() func also ensures that
+	 * any hpd_notify() funcs are called for all bridges in the chain.
+	 *
+	 * drm_bridge_hpd_notify() shares a mutex with drm_bridge_hpd_disable(),
+	 * and can result in a deadlock due to the disable_delayed_work_sync()
+	 * call to wait on work to complete in dw_hdmi_bridge_hpd_disable().
+	 */
+	drm_helper_hpd_irq_event(dev);
+}
+
 static const struct dw_hdmi_phy_data dw_hdmi_phys[] = {
 	{
 		.type = DW_HDMI_PHY_DWC_HDMI_TX_PHY,
@@ -3396,6 +3454,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		goto err_res;
 	}
 
+	INIT_DELAYED_WORK(&hdmi->hpd_work, dw_hdmi_hpd_work);
+	disable_delayed_work(&hdmi->hpd_work);
+
 	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
 					dw_hdmi_irq, IRQF_SHARED,
 					dev_name(dev), hdmi);
@@ -3532,6 +3593,18 @@ EXPORT_SYMBOL_GPL(dw_hdmi_probe);
 
 void dw_hdmi_remove(struct dw_hdmi *hdmi)
 {
+	struct platform_device *pdev = to_platform_device(hdmi->dev);
+	int irq = platform_get_irq(pdev, 0);
+
+	/* Free, mute and clear phy interrupts */
+	devm_free_irq(hdmi->dev, irq, hdmi);
+	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
+	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
+		    HDMI_IH_PHY_STAT0);
+
+	/* Cancel any pending hot plug work */
+	cancel_delayed_work_sync(&hdmi->hpd_work);
+
 	drm_bridge_remove(&hdmi->bridge);
 
 	if (hdmi->audio && !IS_ERR(hdmi->audio))
@@ -3539,9 +3612,6 @@ void dw_hdmi_remove(struct dw_hdmi *hdmi)
 	if (!IS_ERR(hdmi->cec))
 		platform_device_unregister(hdmi->cec);
 
-	/* Disable all interrupts */
-	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
-
 	if (hdmi->i2c)
 		i2c_del_adapter(&hdmi->i2c->adap);
 	else
-- 
2.54.0

