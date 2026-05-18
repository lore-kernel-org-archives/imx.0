Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39589390229
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127439; cv=none; b=bVXemilt9HeBJ75HFi2xIbBhqut2JKh22in9Ur50EMjAP+8HlQjJYn4m97AaojhRrLFuy7VMm515/6xulQ2pRsnCsyGoDrndE7tj8mnXgfLyBVLesxWBrAeabSfiBdibugra3b9cq+P0ByCPkgulxCrX3inBTP6N7J61wsg4jTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127439; c=relaxed/simple;
	bh=yd+lw8+pp/vNR2yHfMljkumqCTTFezpKMrfCPZ99sFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4KSTFy5kVVxdZ6/vaW44ibJZFkGLEpRJ4eGLF7EPx7mOnkBIc3hwLdgADZ33q5VFv6eV479L6RCMox2iAzvVGwhSacRZIR0h4LJrn9Pjd3lQ0jjQckWKzViyMwaoAG+1RFvY4IIi62iF1mvxl+8x8ztLGnXUChyHXl/AfAg4nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=hF3FljoT; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="hF3FljoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127436; bh=+tNbdHFGwve4PQpiDKk/njnhtvjRkwYwD94Sgvq2l/k=;
 b=hF3FljoTFhjS5vNkTB1cXD0umJwi6oUMRX5wgMsA2hh3VGH96TGIF94XQ5JzfRyXPDRi+5jxq
 6rZTnJkEA/3SpyQqEM9/feXcAuy52Gv2kSqxM1swhlXhmWRldEkqPhPsNheXb4Z9JjO4wz0zfLr
 pCLTigJd1pC9ef4KElzgZR2L45E/utMKOmb1qA8uBOFWllbfU9DNqB0a4IKGk2Q7heHrNVJvEXu
 z2GSub8fKQxER+lhcw0Ls8lbHSThGioJtGN6Sp8Cr7FLzMayYFfjo98i+BkOR7lA3c8DVh+9wVa
 arq8B0cAOQFHvKL7SVD8ZZvL/ARZHsTh217RtEjB+HBA==
X-Forward-Email-ID: 6a0b5489b84dbc72d2275016
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
Subject: [PATCH v7 23/23] drm: bridge: dw_hdmi: Merge top and bottom half IRQ handlers
Date: Mon, 18 May 2026 18:01:59 +0000
Message-ID: <20260518180206.2480119-24-jonas@kwiboo.se>
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

The bottom half IRQ handler only modify delay of or queue a delayed work
used for HPD handling. The mod_delayed_work() called is documented as
being safe to call from any context including IRQ handler.

Merge top and bottom half IRQ handlers to simplify IRQ handling now that
HPD event is handled using a delayed work.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: No change
v6: Collect r-b tag
v5: No change
v4: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 34 ++++++++---------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index c596534510da..99dd62b6becf 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2993,30 +2993,18 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
 	if (hdmi->i2c)
 		ret = dw_hdmi_i2c_irq(hdmi);
 
-	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
-	if (intr_stat) {
-		hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
-		return IRQ_WAKE_THREAD;
-	}
-
-	return ret;
-}
-
-static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
-{
-	struct dw_hdmi *hdmi = dev_id;
-	u8 intr_stat;
-
 	/*
 	 * Interrupt generation is accomplished in the following way:
 	 *   interrupt = (mask == 0) && (polarity == status)
 	 * All interrupts are forwarded to the Interrupt Handler sticky bit
 	 * register ih_phy_stat0 and muted using the register ih_mute_phy_stat0.
 	 */
-	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
-	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
+	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0) & HDMI_IH_PHY_STAT0_HPD;
+	if (intr_stat) {
 		enum drm_connector_status status;
 
+		hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
+
 		/* Set HPD interrupt polarity based on current HPD status. */
 		status = dw_hdmi_phy_read_hpd(hdmi, hdmi->phy.data);
 		hdmi_modb(hdmi, status == connector_status_connected ?
@@ -3028,12 +3016,13 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 
 		mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
 				 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
+
+		hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
+		hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
+		ret = IRQ_HANDLED;
 	}
 
-	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
-	hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
-
-	return IRQ_HANDLED;
+	return ret;
 }
 
 static void dw_hdmi_hpd_work(struct work_struct *work)
@@ -3343,9 +3332,8 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	INIT_DELAYED_WORK(&hdmi->hpd_work, dw_hdmi_hpd_work);
 	disable_delayed_work(&hdmi->hpd_work);
 
-	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
-					dw_hdmi_irq, IRQF_SHARED,
-					dev_name(dev), hdmi);
+	ret = devm_request_irq(dev, irq, dw_hdmi_hardirq, IRQF_SHARED,
+			       dev_name(dev), hdmi);
 	if (ret)
 		goto err_res;
 
-- 
2.54.0

