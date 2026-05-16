Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B8B35E1B1
	for <imx@lists.linux.dev>; Sat, 16 May 2026 18:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956802; cv=none; b=rwMFZG3mUlyCD7sYaXNlPrUqQXUgNPd9sEFrzWcrzsfFwvnl5me8D9zrLDygl3m5QsuP2IQwAHGScn+RvsssV3PXI8Y3LmGwqIlOcmhZE4FZEsRExA3F1wWKpXqrJX0R6wla95RTuEZ4LXKqsV2Ond8TYszrFNQ5GJIecqBImjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956802; c=relaxed/simple;
	bh=q6Dpjyaj81EpNWhKhQiEwR2IMEzLrQ46thQEv/gnI2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/Vbwg8Gh1f/FUzkt1Wglw00lOMBLvcizRQHoDyTW6b3tz+q2uf9O2SVvgV0d+a2EEj9wtF3hQ8f4XonSvyLZlnic/hK+pQWTdhqFGtz9yXWkAIOUvemdcMm5YOvfelTdDg7skWtA252dMBkjlprNRdLYJNq6YwGmT2U5JKckRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=bmcIfVqA; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="bmcIfVqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956800; bh=LByMhDRnSw/19GAWOU8RQ0GafZjOhHwQpSIXnN3970I=;
 b=bmcIfVqAnp4sGMxRh4JgbxB+Oip+uzB3HArfhCi76ZkgXM4+3vTuNKr74ubELpnZBUjnieAem
 8eaBRt2Yea3boORzNPo6XZYzDsxTuA6zvNc0zryQ+CvdJdfj9DqBvOMbYBCAN2Dc8jcWUrJ53nt
 pBKwgngOnubspmXvZni8rPptHCjV1q4s/4k2nwe7B90SCE2J4/NmKJrY5Fc6HM080UpS4p9dXMj
 7p2SHLBp/RmOZxSHTy88r5smWS+jjK14QQby12AUTQaXj3jfC1xYUsaEnlhclA0GhW8hjxpZ+ms
 wbsFCyNz7VhHTG+JXMbMhL+6FQ9DAYqz3se0cwFWpQlQ==
X-Forward-Email-ID: 6a08b9fd79c7625f20eeeedc
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
Subject: [PATCH v6 17/22] drm: bridge: dw_hdmi: Drop call to drm_bridge_hpd_notify()
Date: Sat, 16 May 2026 18:38:27 +0000
Message-ID: <20260516183838.2024991-18-jonas@kwiboo.se>
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

The use of calls to both drm_helper_hpd_irq_event() and
drm_bridge_hpd_notify() from the HPD IRQ handler may cause multiple
hotplug uevents and modesets when the bridge connector is used.

Use of drm_helper_hpd_irq_event() cause the internal DRM function
check_connector_changed() to be called, which in turn calls the
connector detect()/force() funcs to detect any connection status or
epoch changes, and when changed trigger a hotplug uevent. This also
help ensure that EDID and CEC phys addr is updated.

If only a call drm_bridge_hpd_notify() would be used, a custom connector
status/EDID change detection logic needs to be implemented, to fully
match what check_connector_changed() already provides.

The bridge connector detect() func also ensures that any hpd_notify()
funcs are called for all bridges in the chain, so there is not really
any need to have a call to drm_bridge_hpd_notify() here.

With both calls there is two hotplug uevents, two modesets and a total
of four .hpd_notify() calls (using a bridge connector):

  dw_hdmi_irq(): EVENT=plugout
  drm_helper_hpd_irq_event():
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:check_connector_changed] [CONNECTOR:46:HDMI-A-1] status updated from connected to disconnected
    [drm:check_connector_changed] [CONNECTOR:46:HDMI-A-1] Changed epoch counter 1 => 2
    [drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:46:HDMI-A-1] generating connector hotplug event
   drm_client_hotplug():
    [drm:drm_fb_helper_hotplug_event]
    [drm:drm_client_modeset_probe]
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1]
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1] disconnected
    [drm:drm_edid_connector_update] [CONNECTOR:46:HDMI-A-1] EDID changed, epoch counter 3
    [drm:drm_client_modeset_probe] No connectors reported connected with modes
    [drm:drm_client_modeset_probe] [CONNECTOR:46:HDMI-A-1] enabled? no
    [drm:drm_client_firmware_config.isra.0] Not using firmware configuration
    [drm:drm_client_modeset_probe] picking CRTCs for 3840x2160 config
    [drm:drm_client_hotplug] fbdev: ret=0
  drm_bridge_hpd_notify():
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:46:HDMI-A-1] generating connector hotplug event
   drm_client_hotplug():
    [drm:drm_fb_helper_hotplug_event]
    [drm:drm_client_modeset_probe]
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1]
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1] disconnected
    [drm:drm_client_modeset_probe] No connectors reported connected with modes
    [drm:drm_client_modeset_probe] [CONNECTOR:46:HDMI-A-1] enabled? no
    [drm:drm_client_firmware_config.isra.0] Not using firmware configuration
    [drm:drm_client_modeset_probe] picking CRTCs for 3840x2160 config
    [drm:drm_client_hotplug] fbdev: ret=0

Change to only call drm_helper_hpd_irq_event() from HPD IRQ handler to
ensure that only one hotplug uevent is sent to userspace when connection
status or EDID changes.

With only a call the drm_helper_hpd_irq_event() there is only a single
hotplug uevent and only two .hpd_notify() calls:

  dw_hdmi_irq(): EVENT=plugout
  drm_helper_hpd_irq_event():
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:check_connector_changed] [CONNECTOR:46:HDMI-A-1] status updated from connected to disconnected
    [drm:check_connector_changed] [CONNECTOR:46:HDMI-A-1] Changed epoch counter 1 => 2
    [drm:drm_sysfs_connector_hotplug_event] [CONNECTOR:46:HDMI-A-1] generating connector hotplug event
   drm_client_hotplug():
    [drm:drm_fb_helper_hotplug_event]
    [drm:drm_client_modeset_probe]
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1]
    dw_hdmi_bridge_hpd_notify(status=2)
    [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:46:HDMI-A-1] disconnected
    [drm:drm_edid_connector_update] [CONNECTOR:46:HDMI-A-1] EDID changed, epoch counter 3
    [drm:drm_client_modeset_probe] No connectors reported connected with modes
    [drm:drm_client_modeset_probe] [CONNECTOR:46:HDMI-A-1] enabled? no
    [drm:drm_client_firmware_config.isra.0] Not using firmware configuration
    [drm:drm_client_modeset_probe] picking CRTCs for 3840x2160 config
    [drm:drm_client_hotplug] fbdev: ret=0

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: Drop the call from IRQ handler instead, prior to use of a HPD
    delayed work to avoid a possible deadlock with use of sync() calls
    in the bridge hpd_disable() ops,
    Update commit message,
    Collect t-b tag
v5: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index e9c4e24c090c..6cc7b2a860bd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3101,10 +3101,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 			status == connector_status_connected ?
 			"plugin" : "plugout");
 
-		if (hdmi->bridge.dev) {
+		if (hdmi->bridge.dev)
 			drm_helper_hpd_irq_event(hdmi->bridge.dev);
-			drm_bridge_hpd_notify(&hdmi->bridge, status);
-		}
 	}
 
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
-- 
2.54.0

