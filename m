Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA0839098C
	for <imx@lists.linux.dev>; Sun, 10 May 2026 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416967; cv=none; b=Lg0z44a9jWjzuunH737JQSoEaX1zSZU+6bJF+wXTFRc027un66Ynx/iJtxM8XG81UgJk44B/U6SJ7MciKbuG5K7a7eJllP04ufohZAo0HbWoCWK6XYFNYelBasq/Vy2Pbgfhgeb9r62GFAP3y47OQddbvF0WHVSBegYBy+Oiw7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416967; c=relaxed/simple;
	bh=u88pPLlebCf8CGskjX6LHC6x8osVWaxB8Hzz2gjwvdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBjZrdtrEQdJymwj3HrpoYgd3B/VqVnWdFCePYWa3sAOTpRWF50HGZbYRkLANOph+QOOJeF+YGg3pf1FfqkkRn8gESpoxSW1hmkuG3O6o6dvtqUOHbseeQANePxHy79efoKUriUaiRI75mJbn/2dmn2/rFhtoYyEF2BqpFaQtmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=plDzOflT; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="plDzOflT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778416954; bh=6bbljhWGbuqdXDsgmGYVzdY0KhxBYB2J1W7cZWHXuxI=;
 b=plDzOflT3OHMpZ1vHebXn4bb/sy61Gh1yMZyGC9ne39P+Ns194EhYzmYIbbVh2YLPALNxBlft
 GmII77/phC0sS0UDWhxmTGMOq3JNURJnXs7C6KimtUJxZRic+QO/MOK2SVqhaYQT5HxfALjTQyP
 KjAx5YmrYBLQNmuOBYgwPmTr6ZSq/rZ63Et7VuA9YY0PnzTt403zC9v5aJG2cFGSuOn3mSf1L+y
 GxqIO+ex+9lNDqoSN44fbaoQjWWbEbIPBF7oVM+hp60DYQq95RmcdtSmuzcxweMUr28UXUMs+6J
 YO9EK73I8AUmQ0RvXnT2OEaSjrOQLLbexcB/2gfRLJsg==
X-Forward-Email-ID: 6a007d330d91f03a31a0bce5
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
	Liu Ying <victor.liu@nxp.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Chen-Yu Tsai <wens@kernel.org>,
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
Subject: [PATCH v5 15/21] drm: bridge: dw_hdmi: Add common suspend helper
Date: Sun, 10 May 2026 12:40:59 +0000
Message-ID: <20260510124111.1226584-16-jonas@kwiboo.se>
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

Add a dw_hdmi_suspend() helper as the suspend-side counterpart to
dw_hdmi_resume() and call it from the i.MX8MP, Amlogic and Rockchip
platform PM suspend callbacks.

This is a preparatory change to route suspend handling through common
dw-hdmi code so follow-up changes can add shared suspend cleanup in one
place.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: New patch
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c |  4 ++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   |  5 +++++
 drivers/gpu/drm/meson/meson_dw_hdmi.c       |  2 ++
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 11 ++++++++++-
 include/drm/bridge/dw_hdmi.h                |  1 +
 5 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 8e8cfd66f23b..f15b3f8e1dbc 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -176,6 +176,10 @@ static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
 
 static int imx8mp_dw_hdmi_pm_suspend(struct device *dev)
 {
+	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
+
+	dw_hdmi_suspend(hdmi->dw_hdmi);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index bf893c754539..a6f2702bca83 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3568,6 +3568,11 @@ void dw_hdmi_unbind(struct dw_hdmi *hdmi)
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_unbind);
 
+void dw_hdmi_suspend(struct dw_hdmi *hdmi)
+{
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_suspend);
+
 void dw_hdmi_resume(struct dw_hdmi *hdmi)
 {
 	dw_hdmi_init_hw(hdmi);
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index fef1702acb14..9ba83bf4787c 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -809,6 +809,8 @@ static int __maybe_unused meson_dw_hdmi_pm_suspend(struct device *dev)
 	if (!meson_dw_hdmi)
 		return 0;
 
+	dw_hdmi_suspend(meson_dw_hdmi->hdmi);
+
 	/* Reset TOP */
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
 				       HDMITX_TOP_SW_RESET, 0);
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 0dc1eb5d2ae3..9677424075eb 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -651,6 +651,15 @@ static void dw_hdmi_rockchip_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &dw_hdmi_rockchip_ops);
 }
 
+static int __maybe_unused dw_hdmi_rockchip_suspend(struct device *dev)
+{
+	struct rockchip_hdmi *hdmi = dev_get_drvdata(dev);
+
+	dw_hdmi_suspend(hdmi->hdmi);
+
+	return 0;
+}
+
 static int __maybe_unused dw_hdmi_rockchip_resume(struct device *dev)
 {
 	struct rockchip_hdmi *hdmi = dev_get_drvdata(dev);
@@ -661,7 +670,7 @@ static int __maybe_unused dw_hdmi_rockchip_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dw_hdmi_rockchip_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, dw_hdmi_rockchip_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(dw_hdmi_rockchip_suspend, dw_hdmi_rockchip_resume)
 };
 
 struct platform_driver dw_hdmi_rockchip_pltfm_driver = {
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 8500dd4f99d8..d587c4076a25 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -184,6 +184,7 @@ struct dw_hdmi *dw_hdmi_bind(struct platform_device *pdev,
 			     struct drm_encoder *encoder,
 			     const struct dw_hdmi_plat_data *plat_data);
 
+void dw_hdmi_suspend(struct dw_hdmi *hdmi);
 void dw_hdmi_resume(struct dw_hdmi *hdmi);
 
 void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense);
-- 
2.54.0

