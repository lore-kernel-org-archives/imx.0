Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108C93F7A83
	for <imx@lists.linux.dev>; Mon,  4 May 2026 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921912; cv=none; b=C9waBiBsB3jQ+A9C1bIcWrScllAmq1Hf9ZAaw651uaPAWodI6s7m4H3bV0EazJYa9pvJ0Pm218JdFWmCGdfrI3qHxukDb2oCCO7Z8vG0H95mhS+wrLlsmncR7l5U/+9+0msD1R81DR5YX9giZx3BZk6i4uEyC30rxrPtO6Zk1W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921912; c=relaxed/simple;
	bh=BCXhnYotRzW51iTO6yZ9t+4t1/ooy35XNejXLNnlnvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EK3AGWDSreZJyMIwe8ooJjumaNY8FVBRqwrAf8eokRBdm+JWeDvs+rMi4CrIM0dMG7GyxDcLphmGdXo09Dy561X93akfuWyCPVlU9KEZoXb5FC1saDQRBIrbUFJpVkuY5nqDUUw+I6m2OnqRnOEJJ+Ik1oKPPO95+P0Ji7QvKPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Kc+uzIiI; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Kc+uzIiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921910; bh=tJeJ6vpBhtsiw1KolH4aIn7bCSe8O7mTHyzB0UBThGs=;
 b=Kc+uzIiIQVCdE0jXmZi4iI1bkeU4kTxfQ9LJTkKHTQpbmYtGieUJjbjGCkjk37/H9VRJhiNcn
 ljGnRf70DS3v4DryxNqX+43kfu39vGSyVmojuYeD4kAfERAB5w5pFXRQ/qesqxVhpN1pGcRCnvF
 spfbIuprVgCQp7eq/iX6IFvAalDRNWmdm3/9LWXbfRW8q5rVyykW8uth64nR33/ii5OExjftmth
 GwjYr8PfQicknxtfaQugKNnFSHPF8J9qzmloAHt0pEdUdqAR1YvSybZiJTX87YmCGQm8AlbHev4
 2s/e25C8cRj/Z2HDMJDHoyTVHc7O7fnf2+RTWb408qvQ==
X-Forward-Email-ID: 69f8ef7304bb1dff846bb92e
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
Subject: [PATCH v4 10/17] drm: bridge: dw_hdmi: Use dw_hdmi_connector_status_update()
Date: Mon,  4 May 2026 19:10:47 +0000
Message-ID: <20260504191059.275928-11-jonas@kwiboo.se>
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

Update connector EDID and CEC phys addr from detect and force funcs to
ensure that userspace always have access to latest read EDID after a
sink use a HPD low voltage pulse to indicate that EDID has changed.

With EDID being updated in detect and force funcs, there should no
longer be a need to re-read EDID in get_modes funcs, so drop it.

This change make the dw-hdmi connector work more closely like the bridge
connector does with a hdmi bridge.

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: Move last_connector_result assign in force ops to this patch,
    Collect r-b tag
v3: Reworked 'Update EDID during hotplug processing' patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 25 ++++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0b56ad7316e3..47616c11fcd7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2473,33 +2473,36 @@ dw_hdmi_connector_status_update(struct drm_connector *connector,
 	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
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
+	dw_hdmi_connector_status_update(connector, status);
 
 	return status;
 }
 
 static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	dw_hdmi_connector_status_update(connector, connector->status);
-
 	return drm_edid_connector_add_modes(connector);
 }
 
@@ -2529,13 +2532,15 @@ static int dw_hdmi_connector_atomic_check(struct drm_connector *connector,
 
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
+	dw_hdmi_connector_status_update(connector, connector->status);
 }
 
 static const struct drm_connector_funcs dw_hdmi_connector_funcs = {
-- 
2.54.0

