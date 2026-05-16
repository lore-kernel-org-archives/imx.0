Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EE4329C48
	for <imx@lists.linux.dev>; Sat, 16 May 2026 18:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956959; cv=none; b=RSAoCKBVKHdQsXejk6Py8lPN2s3X6TIlmRqfze5+pDEDRvI9gwYIAP9bSe+HHTlq0d001WP/+e9gmkO4LdYSNvqevqm/s+r43xllcT9Z7dOUmlQeO7DPDSQd9b4iMRRx+Vk9SCL0k4UUXi12bKlxjkIXhVPmG8z7LZEhz/nJJm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956959; c=relaxed/simple;
	bh=S5tu+798ucRG20MACafw1ZiiodmULSwbDl+3jCySG2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XLxgYdCvGOY2t5k5ZzhzZkCBM6/spnnDRKYrXr4wUbXMu2KRCBEbY63h8DeAu77th1H9BnfXrtMExSktHWX22UJ3F2xbDMV9mEGwbBr1lyKzr4m7TS2kCRq9xOxSE5rFCovsvwTzQ33d/vD9mFkPegc21/6vOeqmFTg0N1rje9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Km1JC16f; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Km1JC16f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956956; bh=CMbmb6BqufwrFcXTmw0fRixNzPtrB0QWtRrlp+vXgq8=;
 b=Km1JC16fJY6DBGSQUOcDzyp+xJd+0Ll/yVTVcYteajcmlCq8LJZeJ3/+SyNmgGkxXVO93GiGB
 uNakOU8l0qc8IDPFBoS2luFba7W7hLvItW9ZhfXWt3c5zDBTaNcxPoPPJo57QNmObqkyhOXdeFW
 7Ss6cX+C8V+kU8bwSuwin/y6F5eCTm6h1KxQ+Jvri78cwpoC+tNXgx5pxQS53eN+LKIgoRTB/H3
 Yp8T0KmObwJuWVpPEEbkffcKbBqAN+RWjmeQrrlC6XxEtvDJ8syqRQ/+9QyEnJHmq5ZHWPFO7g/
 rHRU7SdTo2/jSkGe9Fy66lBomUsDe/tBXKXtQEQdhGaw==
X-Forward-Email-ID: 6a08b9e879c7625f20eeee51
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
Subject: [PATCH v6 12/22] drm: bridge: dw_hdmi: Use dw_hdmi_connector_status_update()
Date: Sat, 16 May 2026 18:38:22 +0000
Message-ID: <20260516183838.2024991-13-jonas@kwiboo.se>
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

Update connector EDID and CEC phys addr from detect and force funcs to
ensure that userspace always have access to latest read EDID after a
sink use a HPD low voltage pulse to indicate that EDID has changed.

With EDID being updated in detect and force funcs, there should no
longer be a need to re-read EDID in get_modes funcs, so drop it.

This change make the dw-hdmi connector work more closely like the bridge
connector does with a hdmi bridge.

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: Pass struct dw_hdmi as a parameter,
    Collect t-b tag
v5: No change
v4: Move last_connector_result assign in force ops to this patch,
    Collect r-b tag
v3: Reworked 'Update EDID during hotplug processing' patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 28 ++++++++++++-----------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a056e147731b..a4ecf830103d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2473,36 +2473,36 @@ dw_hdmi_connector_status_update(struct dw_hdmi *hdmi,
 {
 	const struct drm_edid *drm_edid;
 
+	if (status == connector_status_disconnected) {
+		drm_edid_connector_update(connector, NULL);
+		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
+		return;
+	}
+
 	drm_edid = dw_hdmi_edid_read(hdmi, connector);
 	drm_edid_connector_update(connector, drm_edid);
 	drm_edid_free(drm_edid);
 
-	cec_notifier_set_phys_addr(hdmi->cec_notifier,
-				   connector->display_info.source_physical_address);
+	if (status == connector_status_connected)
+		cec_notifier_set_phys_addr(hdmi->cec_notifier,
+				connector->display_info.source_physical_address);
 }
 
 static enum drm_connector_status
 dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
-	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
-					     connector);
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
 	enum drm_connector_status status;
 
 	status = dw_hdmi_detect(hdmi);
 
-	if (status == connector_status_disconnected)
-		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
+	dw_hdmi_connector_status_update(hdmi, connector, status);
 
 	return status;
 }
 
 static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
-					     connector);
-
-	dw_hdmi_connector_status_update(hdmi, connector, connector->status);
-
 	return drm_edid_connector_add_modes(connector);
 }
 
@@ -2532,13 +2532,15 @@ static int dw_hdmi_connector_atomic_check(struct drm_connector *connector,
 
 static void dw_hdmi_connector_force(struct drm_connector *connector)
 {
-	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
-					     connector);
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->force = connector->force;
+	hdmi->last_connector_result = connector->status;
 	dw_hdmi_update_phy_mask(hdmi);
 	mutex_unlock(&hdmi->mutex);
+
+	dw_hdmi_connector_status_update(hdmi, connector, connector->status);
 }
 
 static void dw_hdmi_connector_destroy(struct drm_connector *connector)
-- 
2.54.0

