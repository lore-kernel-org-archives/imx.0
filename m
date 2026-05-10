Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B8938A71E
	for <imx@lists.linux.dev>; Sun, 10 May 2026 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778417050; cv=none; b=sVkSt91oXssTr+0xr+8iCZUKMR8nATmWXfbjBhr5dRiLK47iXFS771cl97r4bi38db5hcqqcuij0cq5TJdzZNzmcfpqzvbJviblMSDmagu2oruAqcl5HDQWjdTU5JmrUawxn3EhQfSl36Q0+TljADBVkoNK9ZMVr5OKubjbzeUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778417050; c=relaxed/simple;
	bh=Ao4n3Znuzp3tDLNB8ibWJ0RFtfWC0tKlDYySbMxTHgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuTondoMcmlzblpqwCTIxH4FnbnQ6sdgoHQcqLbuL0SX0WG56WAXkzvck+tB/VnJZdYeYpiT7mdL/LqAUcBOzAD59lCxTSzaGNXZ2KBMDiyPW9QmgJRmbmYDuRPMsYj8Z4V/cqlSsInbc2AhmD+2TvDEZDZr2ZGq9/owTHv/6kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=B2dDSWbw; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="B2dDSWbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778417048; bh=mqYIr5XYCPPm4zN6s5d5jbCM07Px6OPI7bSs1N/w+Ak=;
 b=B2dDSWbwN+6XcmjwkC4iUJANJzjAfzf/mKUlr+p9hQNKLC1b7/nwVXc5RnkCKxmvVNsaVafaz
 GNDcCwb//xVWMmWSRgct5a3o1PkSXDMb+JH29H4di7mYpathvEN/0MI7TZxok+8hA50SyDpxu6G
 AYrQTclVFPZkRCBzcnzbk5oU8MiSY9rrr3EZYUKmVWpmyVnBJCnr78u6/7PhfSC8eF/OFUiMD6t
 rxbGwwdoIEJVePaS+6jzrcavmrlkCpg+p9Vw1bVc/fNsngaypyVLDWtgaRybV+hDctTWoleF9LD
 pMwS69BmKYSYrfCr4fNogy6M4ccDPha25LvwqNPxYVBg==
X-Forward-Email-ID: 6a007d4b0d91f03a31a0bd72
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
Subject: [PATCH v5 20/21] drm: bridge: dw_hdmi: Merge top and bottom half IRQ handlers
Date: Sun, 10 May 2026 12:41:04 +0000
Message-ID: <20260510124111.1226584-21-jonas@kwiboo.se>
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

The bottom half IRQ handler only modify delay of or queue a delayed work
used for HPD handling. The mod_delayed_work() called is documented as
being safe to call from any context including IRQ handler.

Merge top and bottom half IRQ handlers to simplify IRQ handling now that
HPD event is handled using a delayed work.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: No Change
v4: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 34 ++++++++---------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 70068764deaa..2ea8ce5eca36 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2984,30 +2984,18 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
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
@@ -3019,12 +3007,13 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 
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
@@ -3324,9 +3313,8 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
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

