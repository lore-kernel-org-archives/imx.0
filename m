Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868EE38239B
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127359; cv=none; b=RNuw3LXtHNBTRBszpY5BuVMQczM7CwTasOpkrE8waLBqzlZ1V4/nLEkoV6eIHCqUp6J4h50AZa65BtV8vGzGJa2OexycmXkPgzgg7gSNR2zvJx9hI1lkxp121D9kEDHZhizaFHeKqWB7LP92i+nY/HM5UYNG27724I2ROnEuzLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127359; c=relaxed/simple;
	bh=09QitLERPIBz65/8xeO8cESTBv8KCG/K8BGM5+8dujs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UY6wBGw985IadI9mWPv2Gy3oN3tSmhgx5I2sGT0AZHU+BYDSiAunOhf4Lt3Efy59VDBkIXms2Yc3Lb5kJgBCjotJKeXr+5rIlcxOzUnMJICpgMp8ax7NyWgV+VuV0qMR9Z4kmNxRCjZW7g7M11t/+DKUF+QZm9mGn12xd/ELGK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=wFZvUq26; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="wFZvUq26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127357; bh=rHR6JQhfCZioVtWjb43UfYe+VOtInpIVxB1wWysQtG0=;
 b=wFZvUq265pmgZIn9bJUibLh7MbQt0NXimNi5/9kxcpnZK7pBG2jdjG7UoYr2pP+KqdbYGpgJG
 N9IntEIMuSXQHe5FsUUB0OVvIq9BoT1MGbk8rO0msCUV6JD5VLlAMeh5xWjMm9XdzvV2RzmD3vb
 6EIvw0npPkyXQd1p8phJme7gDqvGdpvh6mOV5UieCkX/lcIIGTntXa0jtafPFVz8hZgpI+i1w2o
 q7w5OGXr5QA7R5T7rH6SSJ3n8J1gdIGo9aDiDeyrNR+paFZj44Q5Nl/8YASd4RE2AdViokjuAmS
 iPcqHAjdRovspbzahyjLF8Lj1FpymT2hqVDuwards25A==
X-Forward-Email-ID: 6a0b5436b84dbc72d2274e00
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
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
	Simona Vetter <simona@ffwll.ch>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>
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
Subject: [PATCH v7 04/23] drm: bridge: dw_hdmi: Hold bridge ref until connector cleanup
Date: Mon, 18 May 2026 18:01:40 +0000
Message-ID: <20260518180206.2480119-5-jonas@kwiboo.se>
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

drmres connector cleanup typically run after devres has released the
last dw-hdmi bridge reference. Since struct dw_hdmi, where the connector
lives, is freed when the last bridge reference is released, connector
cleanup can end up accessing freed memory.

Call trace without a bridge reference held until connector cleanup:
- dw_hdmi_bridge_detach()
- dw_hdmi_bridge_destroy()      <<-- struct dw_hdmi is free()
- [drm:drm_managed_release] drmres release begin
- [drm:drm_managed_release] REL (...) drm_mode_config_init_release (0 bytes)
- dw_hdmi_connector_destroy()
  - drm_connector_cleanup()     <<-- drm_connector is use-after-free
  [...]
- [drm:drm_managed_release] drmres release end

Hold a bridge reference for as long as the connector exists and drop it
after drm_connector_cleanup() has completed to keep struct dw_hdmi alive
until connector teardown is finished and avoids the use-after-free.

Call trace with a bridge reference held until connector cleanup:
- dw_hdmi_bridge_detach()
- [drm:drm_managed_release] drmres release begin
- [drm:drm_managed_release] REL (...) drm_mode_config_init_release (0 bytes)
- dw_hdmi_connector_destroy()
  - drm_connector_cleanup()     <<-- drm_connector is destroy()
  - drm_bridge_put()
- dw_hdmi_bridge_destroy()      <<-- struct dw_hdmi is free()
  [...]
- [drm:drm_managed_release] drmres release end

Fixes: ed6987b67418 ("drm/bridge: dw-hdmi: convert to devm_drm_bridge_alloc() API")
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: Add fixes tag, re-order patch
v6: Collect t-b tag
v5: New patch

This use-after-free issue likely existed before commit ed6987b67418 when
devm_kzalloc() was used instead of devm_drm_bridge_alloc(). However,
v6.16-rc1 first introduced bridge refcount and drm_bridge_put(),
parts that are used to help fix the use-after-free issue.

KASAN report a slab-use-after-free in __refcount_add_not_zero when,
  echo fe0a0000.hdmi > /sys/bus/platform/drivers/dwhdmi-rockchip/unbind
on a Rockchip RK3566 device prior to this fix.
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index b7bfc0e9a6b2..9d795c550f8a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2568,10 +2568,18 @@ static void dw_hdmi_connector_force(struct drm_connector *connector)
 	mutex_unlock(&hdmi->mutex);
 }
 
+static void dw_hdmi_connector_destroy(struct drm_connector *connector)
+{
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
+
+	drm_connector_cleanup(connector);
+	drm_bridge_put(&hdmi->bridge);
+}
+
 static const struct drm_connector_funcs dw_hdmi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = dw_hdmi_connector_detect,
-	.destroy = drm_connector_cleanup,
+	.destroy = dw_hdmi_connector_destroy,
 	.force = dw_hdmi_connector_force,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -2588,6 +2596,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 	struct drm_connector *connector = &hdmi->connector;
 	struct cec_connector_info conn_info;
 	struct cec_notifier *notifier;
+	int ret;
 
 	if (hdmi->version >= 0x200a)
 		connector->ycbcr_420_allowed =
@@ -2600,10 +2609,14 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 
 	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
 
-	drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
-				    &dw_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    hdmi->ddc);
+	ret = drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
+					  &dw_hdmi_connector_funcs,
+					  DRM_MODE_CONNECTOR_HDMIA,
+					  hdmi->ddc);
+	if (ret)
+		return ret;
+
+	drm_bridge_get(&hdmi->bridge);
 
 	/*
 	 * drm_connector_attach_max_bpc_property() requires the
-- 
2.54.0

