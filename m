Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FBD38839C
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127429; cv=none; b=Os06HPKIUuctI5fzENV7Rr/7PRKOOORRBgFenYIez0gFGwQ9boQG0V7Pcq9C6xr3v8fnEHqSCWSI0L70vK/aCQEaX7GDBXf1F1ox+cLEPszJLhmtD5YZb1+Uxw6EHo3+IvlzrS5hgl2f9X+y5x7MziyknDNJgsizvmErPNaBfe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127429; c=relaxed/simple;
	bh=hNfz02kud7vQ1qzBwfbaPhDzpXrskyFcSXhrexaep80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbQCSWSF1GmuuOwqjXIZitMJWU1uQtj+Grylr1lP6q4x8dweOdVOqngyOvXrMnkblxEFxCT6w5DaYDXqhDZfC7eECLPBQ8f3OFwCu/uA6ZukhFzlsrJqXyU4CZeClf7MK+1XFrJWVrEwmXUxls8XvTHS+OoAA6yNc+JfSRzAoyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=ybJwveAQ; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="ybJwveAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127427; bh=Ry3rWikgNkPVoNnWVwwoiFSRnwKwUJAQoPLjpbMoazU=;
 b=ybJwveAQ5KtDLujeB0PCEw9vYPCqjRQE9oAllIBYKdq4x9UVDQSvwv6bCs7FIBMy8GtoNpOWr
 JMWAXeimUUEdPgJtPaJ2bpC6DTa65u5PvKQvQJ3qQnTtf0cFcYrmXx/3I63BDuD78v9LpRGhAOr
 nUX+GmfUKsRgCk8d4JnOSRMiEkAezfkbemAwOfZeJ8TUgPFPUV801Jx0z8LRlZ+BFt92tpecB7D
 kb3X3rnSpADujPu7FoOOo1Bda4pZHdj5AIt44lSAnxKG6UYgOBrHe38Eu7SljvgZ3KaBaWWoOwV
 0LD2M2V7bXTHHS71N5Xo0TiwmWLUwRiop2CYVD0sG4SQ==
X-Forward-Email-ID: 6a0b547fb84dbc72d2274fe0
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
Subject: [PATCH v7 21/23] drm: bridge: dw_hdmi: Remove the empty dw_hdmi_setup_rx_sense()
Date: Mon, 18 May 2026 18:01:57 +0000
Message-ID: <20260518180206.2480119-22-jonas@kwiboo.se>
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

The dw_hdmi_setup_rx_sense() helper is empty and no longer needed after
recent RXSENSE and HPD rework, remove it.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: No change
v6: Collect t-b tag
v5: No change
v4: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 -----
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 3 ---
 include/drm/bridge/dw_hdmi.h              | 2 --
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 2e09bff5faf7..42d630efb875 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3009,11 +3009,6 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
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
index fef1702acb14..2a8756da569b 100644
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
index 8500dd4f99d8..a612b9fa6dbb 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -186,8 +186,6 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
 
 void dw_hdmi_resume(struct dw_hdmi *hdmi);
 
-void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense);
-
 int dw_hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn,
 			   struct device *codec_dev);
 void dw_hdmi_set_sample_non_pcm(struct dw_hdmi *hdmi, unsigned int non_pcm);
-- 
2.54.0

