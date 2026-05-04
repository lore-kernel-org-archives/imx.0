Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383563FAE0C
	for <imx@lists.linux.dev>; Mon,  4 May 2026 19:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921942; cv=none; b=Y9HkmLgrpPEUV04+0qzvKoZ7WZ2GimpZwVNM7HvHbFEMHq9L5Nxk/uYwlZvGcRCwznVGZ73JLkKDpJx5e7UDLMZ2RF3H/SUgHI5qUWyBSJRY71LDAAGIZneww2qoSMAdDz+wnBbe25LQhrYKzCUL4P5hEMRwpLbbBLkBqYuh9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921942; c=relaxed/simple;
	bh=dKlNkl6BbsNbiX7EONwecyjQ6pKSh8XZfCupXxVIiW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5kUqFbGdsg2jSpWb0irGMYhS+LQAfdv/uuwsVkPo8xgCveTe6JeE9ZQ/qn7MfHq/63Cl5/89Jw2vcjPFtoyGryknmdVoDf1QNeFII6vUrh0phzy1V5eAvHXiWpEidV3UI7ebYeeM5FEZqwyCUJY8xYIi9MrbNSGHEmiAnTmYdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=ghEQ3Vh9; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="ghEQ3Vh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921940; bh=qxYOBVl4LCfBulQcyEr5FKsY3yyCVbMO03DTb8QuT/M=;
 b=ghEQ3Vh9T3Q+J9VfZsEoTHryGGQ++pfAxSYrqS1izljafaCMXxDonSlljOFxEBi51v7kv7Fev
 Ej0RG5olbxPlvazHWPVeO/s0Uo7QoCfQ+3hutYNIRZnhlntHt0RiwW/R3LQARmIAsxXZNzvcEJP
 MaGbn//A+EaFjwxE/4hUnziX1OWBCM+BFyrDQG4pcy8qYgp9abiSJMYAzDC+VZSLtRArPDaLd/q
 hC0bRFmujnrp62r/fUY+Sew3Np37TWb+zLxL/bGXAg2d/jbZ4P3TiMnCeGybHxJCYzo2DxqQaqL
 MdNnj5lmaiFNXXllBJswDtsRR9LEF42kqS9CY9f+813Q==
X-Forward-Email-ID: 69f8ef9104bb1dff846bba02
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
Subject: [PATCH v4 17/17] drm: bridge: dw_hdmi: Merge top and bottom half IRQ handlers
Date: Mon,  4 May 2026 19:10:54 +0000
Message-ID: <20260504191059.275928-18-jonas@kwiboo.se>
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

The bottom half IRQ handler only modify delay of or queue a delayed work
used for HPD handling. The mod_delayed_work() called is documented as
being safe to call from any context including IRQ handler.

Merge top and bottom half IRQ handlers to simplify IRQ handling now that
HPD event is handled using a delayed work.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 32 +++++++----------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index c0ed067154c7..a42c45ff0ade 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2971,24 +2971,12 @@ static irqreturn_t dw_hdmi_hardirq(int irq, void *dev_id)
 	if (hdmi->i2c)
 		ret = dw_hdmi_i2c_irq(hdmi);
 
-	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
+	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0) & HDMI_IH_PHY_STAT0_HPD;
 	if (intr_stat) {
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
-	intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
-	if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
 		enum drm_connector_status status;
 
+		hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
+
 		/* Set HPD interrupt polarity based on current HPD status. */
 		status = dw_hdmi_phy_read_hpd(hdmi, hdmi->phy.data);
 		hdmi_modb(hdmi, status == connector_status_connected ?
@@ -3000,12 +2988,13 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 
 		mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
 				 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
-	}
 
-	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
-	hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
+		hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
+		hdmi_writeb(hdmi, ~HDMI_IH_PHY_STAT0_HPD, HDMI_IH_MUTE_PHY_STAT0);
+		ret = IRQ_HANDLED;
+	}
 
-	return IRQ_HANDLED;
+	return ret;
 }
 
 static void dw_hdmi_hpd_work(struct work_struct *work)
@@ -3305,9 +3294,8 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
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

