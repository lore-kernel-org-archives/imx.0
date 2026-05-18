Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3935438654F
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127394; cv=none; b=a91J9qDgPsq8YUsruiSKaX6m9MAg0CLSue8FZ/92egx7M1s/Wo62ORMLQqNP/jzniz0n5ZR4CrCoupqW+/dNZ416jIGOgbFjpIeS8P8r/6rDznIqdmn1KeYQ8H9E79Jrbj+N5oYNhGMr65bdxXNuhtLTIXRFnXrmV7VOFC7kaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127394; c=relaxed/simple;
	bh=OtMHuXOw5CZXWHUwo68fFhxzMybcZloconXv/fdFaB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wo0oV0eW5YEDLLsVw2E+x+2PuCSPaRR11dP5Tl1oPerY2T5ooOTeY2PRzGcj6kj4b4AqEGSKWdNMLgKIj0Cdm6BR0pLaHCVkp+BCWuBIbnM107fMQDcishpwyzun6u8bsLLx+LawkhIkixnlHiQ8TQzA0S0ED7f1DlC6N7ULOJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Pbgpp2PG; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Pbgpp2PG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127391; bh=lr3z/DHKRf4suiaEwJ9iTpcatjgqAyObdCZqCekB2Iw=;
 b=Pbgpp2PGg/C8Dy2k/6XgldOI/MPH7aK93OfzC3x8xfLXEdig9kFi2qDPdgAV4ppNQ/wSBjaAw
 nv6iOhxHUa8EjM34sVe+p5Ts9G08iZ7dJmFMKvAzMyJgxurEJKhSgf5KltSuT3Z01onKqNUM/GO
 fdNxIWDhUSCNsV6q2gfU0rTZDeihgVzI04OJNfPcfbfzaJH8roesYmpkqqfqF38Qn4M4BHjCB4x
 F3aBR6xkNsJsmZn3WzN8dlvlWCT/s/fCDLCkd7EmrNgNG0wYShd0WLiUqv9gQKPv0LfH/e3JPjj
 ecsWbldy1pm9LS5LCNZgw14XkpCs1N1ncpybr9bbnR/A==
X-Forward-Email-ID: 6a0b545db84dbc72d2274f08
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
Subject: [PATCH v7 13/23] drm: bridge: dw_hdmi: Use dw_hdmi_connector_status_update()
Date: Mon, 18 May 2026 18:01:49 +0000
Message-ID: <20260518180206.2480119-14-jonas@kwiboo.se>
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
v7: No change
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

