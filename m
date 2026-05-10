Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC32E387377
	for <imx@lists.linux.dev>; Sun, 10 May 2026 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416992; cv=none; b=h6JHlEb7QMs4SHqGlTpS4O3S3iBtJaY750TDVWanyKrF0bWCzCVdC7Ba4k1FVZXDDPV7cZw9/obVng8tDfbOdtuvLjBMRGPPM+v9oQ2T0Y6Vb+GWiPLpAJqROCkory28KUJTMrST7h+fWl4heZWis+H0C+sD474ikytTw3+P/Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416992; c=relaxed/simple;
	bh=szjSlANmYwTQ18ELmAQ8Lftj9MpHv+oGXrnroNgsjd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EVyDKCs0XtRU/baeEyycKgXkkqDRES8w/txggeClzhaRDXEp2NJEw45Yej8IzrlW6Ip3L1lkSlmCzqQh2sZoniN+wPe1o0qCd3CVImDzenKtYEk3EVk+2EMJN4Y/KhP8FBiFhmZaX4BLamRCDAOg0JO4sNbfNWQ1Miliv+ELORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=WPOBAqvG; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="WPOBAqvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778416990; bh=3GqVsmYGwtYL1lA8+dzYuKNA/PzhqGwOr6aKWiXkMl0=;
 b=WPOBAqvGwVe3rP/0T0n1ismaj4xpWzS3v7nUeGZjVCO3lrO3r/xDE8BoQdHgBXCen3CTcPbRh
 0ESKbJc0lMM1ax5rE/JGKv23gHrX0MDZNhbeJ6qPGguRZyIhuJoYN0f70lVM0X/Sq7XmQ1BPma9
 zWB8X75EdCD7h1g36MhCZM9LIAre+NXnFeME3SKaajyfptPKq5VjZtnfaDZd0CENyfl6Opxvo2e
 EORYF86xiAPoM3NZIaWKeGFuWvOmP/+5PQHif1jjaBD7brHIdVzNKsoZTKp3/DxGkCQCzGXvyAh
 gVmdbOehoeF8cck16tG1k1v8dEv2k2yT27fv4AmShtPA==
X-Forward-Email-ID: 6a007d410d91f03a31a0bd38
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
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
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
Subject: [PATCH v5 18/21] drm: bridge: dw_hdmi: Remove the empty dw_hdmi_setup_rx_sense()
Date: Sun, 10 May 2026 12:41:02 +0000
Message-ID: <20260510124111.1226584-19-jonas@kwiboo.se>
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

The dw_hdmi_setup_rx_sense() helper is empty and no longer needed after
recent RXSENSE and HPD rework, remove it.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: No change
v4: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 -----
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 3 ---
 include/drm/bridge/dw_hdmi.h              | 2 --
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 7fd2de41bc02..a388efeb6a87 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3000,11 +3000,6 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
 	return ret;
 }
 
-void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
-{
-}
-EXPORT_SYMBOL_GPL(dw_hdmi_setup_rx_sense);
-
 static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 {
 	struct dw_hdmi *hdmi = dev_id;
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 9ba83bf4787c..3ad84cebf2c9 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -524,9 +524,6 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
 		if (stat & HDMITX_TOP_INTR_HPD_RISE)
 			hpd_connected = true;
 
-		dw_hdmi_setup_rx_sense(dw_hdmi->hdmi, hpd_connected,
-				       hpd_connected);
-
 		drm_helper_hpd_irq_event(dw_hdmi->bridge->dev);
 		drm_bridge_hpd_notify(dw_hdmi->bridge,
 				      hpd_connected ? connector_status_connected
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index d587c4076a25..cea6618f097c 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -187,8 +187,6 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
 void dw_hdmi_suspend(struct dw_hdmi *hdmi);
 void dw_hdmi_resume(struct dw_hdmi *hdmi);
 
-void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense);
-
 int dw_hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn,
 			   struct device *codec_dev);
 void dw_hdmi_set_sample_non_pcm(struct dw_hdmi *hdmi, unsigned int non_pcm);
-- 
2.54.0

