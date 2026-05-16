Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10EE346766
	for <imx@lists.linux.dev>; Sat, 16 May 2026 18:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956788; cv=none; b=O3vuhPNVUa5glXdXzD5HTXO03D6oQfSdvDXWJiA4FdlZaBnF4v5k1e08iQhiRV9AQIX8z2hgRegCl3O/2GeObDxZhHd0XKN3hmVcoGsl7dV9CpJKFH2tiY6cnj1OjdkVmlinoBLHtVvVPIruZhcGSJHiPN8RqCat2+PqV6lTbQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956788; c=relaxed/simple;
	bh=XEn2ggh9zLMCMEnjiYBN9PUFT/0dSFDuPo2yR8ilxqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eyv5dWmKPzM2S+V+qg3k0aL+dw2016obNSLw2IJPOsIObvmzYmnGR8U2qr8/zBGiLgleoGft7ZzvqdFx1XzPPDtZMPsaOdU1RYC/IN3jcdhZnGKTPpM9FMVAvwAHhqOok5mJ0zghpKlZGiH9dn3qs0Mu9YDyXvuiT/sGZYOX79c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=FF3UgCJ4; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="FF3UgCJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956786; bh=+D1KqkLN/SPso9FLi8QFUtB2wuHbBS99Pzq1qlbp+tg=;
 b=FF3UgCJ4ZCaU5IWnJmIgTaqyGpH52ambxnvx6NxH06Hb9DBhLFURTEp+MPLpOI3QZygCoGF4s
 YP3j3jGmE+X9s+4FKJgq0uosdeaKMjnWn4ydCRhATDCcb0/fcnbuk425YO58xqCsrwbwaOyPNPZ
 QwBTW5HB0MFxd3Urir5CoEr16RYidrGRtzzklgTaR77g7Qyh96wdf/13RzNrldvR2ja5pGFpdvh
 tha9HmcWzTXvB7rWp4SRn/1vUXpn4qnDTL2BA014FSO5tSs+c20NHFSXOZgAOqjn9XVqjDTzZ+A
 nvHFiF262Qtn3djhdbzG4buP2onAbcGyK+tK2ocLCEpQ==
X-Forward-Email-ID: 6a08b9e379c7625f20eeee36
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
Subject: [PATCH v6 11/22] drm: bridge: dw_hdmi: Extract dw_hdmi_connector_status_update()
Date: Sat, 16 May 2026 18:38:21 +0000
Message-ID: <20260516183838.2024991-12-jonas@kwiboo.se>
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

Move connector EDID update and CEC phys addr handling to a helper
function as a preparation before moving EDID refresh from get_modes
funcs to detect/force funcs.

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: Pass struct dw_hdmi as a parameter, to allow calls from bridge funcs,
    Collect t-b tag
v5: No change
v4: Collect r-b tag
v3: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 27 ++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0dd4c823c60a..a056e147731b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2466,6 +2466,21 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
  * DRM Connector Operations
  */
 
+static void
+dw_hdmi_connector_status_update(struct dw_hdmi *hdmi,
+				struct drm_connector *connector,
+				enum drm_connector_status status)
+{
+	const struct drm_edid *drm_edid;
+
+	drm_edid = dw_hdmi_edid_read(hdmi, connector);
+	drm_edid_connector_update(connector, drm_edid);
+	drm_edid_free(drm_edid);
+
+	cec_notifier_set_phys_addr(hdmi->cec_notifier,
+				   connector->display_info.source_physical_address);
+}
+
 static enum drm_connector_status
 dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -2485,18 +2500,10 @@ static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
 					     connector);
-	const struct drm_edid *drm_edid;
-	int ret;
 
-	drm_edid = dw_hdmi_edid_read(hdmi, connector);
+	dw_hdmi_connector_status_update(hdmi, connector, connector->status);
 
-	drm_edid_connector_update(connector, drm_edid);
-	cec_notifier_set_phys_addr(hdmi->cec_notifier,
-				   connector->display_info.source_physical_address);
-	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
-
-	return ret;
+	return drm_edid_connector_add_modes(connector);
 }
 
 static int dw_hdmi_connector_atomic_check(struct drm_connector *connector,
-- 
2.54.0

