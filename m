Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4572938551D
	for <imx@lists.linux.dev>; Sun, 10 May 2026 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416983; cv=none; b=XM1fFwmzMYB1WLI0XTrGps9cKFsmQX7bKeNi3LAdWNEyLPGVkRBTDrYRKw9d/gMAoPcmrD4dJ3mxuXmcY78gp44rddIXjTL7ldLhTavNTQcMHkj7P0IjbxN4SqIv1vgWSFjUDxdbqG6J1jKtFTtbRiNRebdLrYDpH107CCthI7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416983; c=relaxed/simple;
	bh=ofWvltFFN75SKEi4UQY+nolo8ycoGrWIU6z7m0c5RZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLviBuaFp9ao4TR4p4vm2Jb+GO40w2KGV33D/lcYvWdfDErOzpJUvJ1D9l23X0gW9vdVj+fW8G++pipixLthGGgkjV/pjvDUuLTCgPPWoLEl5w6+6lvo4BrqbpabysEN0Kyx87w3+zbLdNh+4Sc5/s1T4uV+L99kaYTQJ9TIav4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=t1X/0ept; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="t1X/0ept"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778416980; bh=UqGGh3H1sUTh9W3shIilOvORsLiwtCTjl7edRaUY1bI=;
 b=t1X/0eptX489v7MlvSlu8LKNRdk9t7GtR6H5bFgf1vhOyztpiD1oYk7KdY+7oFdMHf09K1Dnn
 fgPdJvybXhW18G99VmX/9anXanPtHTaIKJB2Whry65Hkwim690O2tXOThPUMUeLrghJC3G2YHTM
 DGPbizJanPNUhKs/fCL6AYFRYKeAyl524+PwwBX2GJjNpOAiuJzXAZYf7nuYUEbEkdM1S/EpHfV
 8BWur4XWzatEhiGN5L7FnwVVUag11cXz3WgcWFhttajmgZGPsf3ovVbzMyablvfliD+RwYUGPkQ
 mYlq1ZI11J8b5bPAr9BzVUNrk/hVfEaknN6iypL40Y6A==
X-Forward-Email-ID: 6a007d4f0d91f03a31a0bd8d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.0
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
Subject: [PATCH v5 21/21] drm: bridge: dw_hdmi: Drop call to drm_bridge_hpd_notify()
Date: Sun, 10 May 2026 12:41:05 +0000
Message-ID: <20260510124111.1226584-22-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510124111.1226584-1-jonas@kwiboo.se>
References: <20260510124111.1226584-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of calls to both drm_helper_hpd_irq_event() and
drm_bridge_hpd_notify() in HPD delayed_work may cause multiple hotplug
uevents and modesets when the bridge connector is used.

Use of drm_helper_hpd_irq_event() cause the internal DRM function
check_connector_changed() to be called, which in turn calls the
connector detect()/force() funcs to detect any connection status or
epoch changes, and when changed trigger a hotplug uevent. For dw-hdmi
connector this also help ensure that EDID and CEC phys addr is updated.

If only a call drm_bridge_hpd_notify() would be used, a custom connector
status/EDID change detection logic needs to be implemented, to fully
match what check_connector_changed() already provides. Update of EDID
and CEC phys addr typically is delayed until userspace trigger a modeset
and fill_modes()/get_modes() ops is called.

The bridge connector detect() func also ensures that any hpd_notify()
funcs are called for all bridges in the chain, so there is not really
any need to have a call to drm_bridge_hpd_notify() here.

With both calls there is two hotplug uevents, two modesets and a total
of four .hpd_notify() calls (using a bridge connector):

  dw_hdmi_hardirq(): EVENT=plugout
  dw_hdmi_hpd_work()
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

Change to only call drm_helper_hpd_irq_event() in HPD delayed_work to
ensure there is only one hotplug uevent and that EDID and CEC phys addr
is updated in a timely manner, independent from userspace having to
react the hotplug uevent.

With only a call the drm_helper_hpd_irq_event() there is only a single
hotplug uevent and only two .hpd_notify() calls:

  dw_hdmi_hardirq(): EVENT=plugout
  dw_hdmi_hpd_work()
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

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 2ea8ce5eca36..d9c9d03f8eff 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3019,14 +3019,28 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
 static void dw_hdmi_hpd_work(struct work_struct *work)
 {
 	struct dw_hdmi *hdmi = container_of(work, struct dw_hdmi, hpd_work.work);
-	enum drm_connector_status status;
 
 	if (WARN_ON(!hdmi->bridge.dev))
 		return;
 
+	/*
+	 * Notify the DRM core of the HPD event using drm_helper_hpd_irq_event()
+	 * instead of drm_bridge_hpd_notify(). This will cause the DRM function
+	 * check_connector_changed() to be called, which in turn calls the
+	 * connector detect()/force() funcs to detect any connection status or
+	 * epoch changes. Something that also triggers EDID and CEC phys address
+	 * updates.
+	 *
+	 * If we were to instead call drm_bridge_hpd_notify() here, we would
+	 * have to implement a very similar change detection logic or fully
+	 * relay on userspace to react on a hotplug uevent to ensure EDID and
+	 * CEC phys address are updated.
+	 *
+	 * The bridge connector detect() func also ensures that hpd_notify()
+	 * funcs are called for all bridges in the chain.
+	 */
+
 	drm_helper_hpd_irq_event(hdmi->bridge.dev);
-	status = dw_hdmi_phy_read_hpd(hdmi, hdmi->phy.data);
-	drm_bridge_hpd_notify(&hdmi->bridge, status);
 }
 
 static const struct dw_hdmi_phy_data dw_hdmi_phys[] = {
-- 
2.54.0

