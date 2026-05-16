Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B53B3446DE
	for <imx@lists.linux.dev>; Sat, 16 May 2026 18:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956776; cv=none; b=SaRmgMMktlzopnuccto5+S/cYECc4whku/4WhTPYax0EP5qZhfT7VrOC1i+8tjgtfyXwgYtWvJ3rsFCyokaCoyAf1T2wVOXUyQQXOWSzPWCSyjqU0dD35pilC8DY5KZVRoiI9M0euxVHXsFIbksogdnuDzoYQYQBNVGCyE97c1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956776; c=relaxed/simple;
	bh=b1larF18e7n9Ud4l2VdVtScHW2jmxxFPQrcYxYJmBB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQSuDnwHaCq/KwqjJnDjmAQMWH4uEmPfk0dreW1btShGKb5uG+SbCvohcVCBxuPz9vux34Fjp5dcsVgSBl+F4YtLMiWv5Cao24yUxdZ3uCYfJozJ+13wgv1pm8oNv8lKM8tLDfFVWRGJFLY/qGzkMrvK4Jd/WB31lnX8DAgoHzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=YnV9wxYV; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="YnV9wxYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956774; bh=dj/ugFTuxg9Y2gUue7F99f8b7+N9oaRDZ7y+GQkj02E=;
 b=YnV9wxYVbTka7ZvM+aAHIlKYXchM6d4R+2jg68LRRBE5Fk31AVR/s/lsPK6xz3KHVORDOkBZA
 r14pnE88fGwkxCIj0QXDfu8LO0dGH2CZpg10etBvA/t3cuWDGefgay10ojs3y3wUHx9QN9e6Rcd
 6IF3z4QI7yJLJtDxSXstWekbdY9nrA0d3Z01wcTWk8A8VMJyYoLQ3LSRr1aatTS7vXK01I7ax7I
 Jon8w5n5QGjaRjya9wWashFPhwhY6fXqU9lARvhY48u2/WKwZPR4q5nGwfH41ROk+asREM7mTi7
 dwfXEqJocnw5CDdxz/06AZ1aSb/0xrBuGUOS5/Uf+0Yg==
X-Forward-Email-ID: 6a08b9db79c7625f20eeee00
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
Subject: [PATCH v6 09/22] drm: bridge: dw_hdmi: Invalidate CEC phys addr from connector detect
Date: Sat, 16 May 2026 18:38:19 +0000
Message-ID: <20260516183838.2024991-10-jonas@kwiboo.se>
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

Wait until the connector detect ops is called to invalidate CEC phys
addr instead of doing it directly from the irq handler.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: Collect t-b tag
v5: No change
v4: No change
v3: No change
v2: Collect r-b tag
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 5fd26ff8f55b..aae1b890167b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2472,7 +2472,17 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
 					     connector);
-	return dw_hdmi_detect(hdmi);
+	enum drm_connector_status status;
+
+	status = dw_hdmi_detect(hdmi);
+
+	if (status == connector_status_disconnected) {
+		mutex_lock(&hdmi->cec_notifier_mutex);
+		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
+		mutex_unlock(&hdmi->cec_notifier_mutex);
+	}
+
+	return status;
 }
 
 static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
@@ -3106,12 +3116,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 				       phy_stat & HDMI_PHY_HPD,
 				       phy_stat & HDMI_PHY_RX_SENSE);
 
-		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
-			mutex_lock(&hdmi->cec_notifier_mutex);
-			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
-			mutex_unlock(&hdmi->cec_notifier_mutex);
-		}
-
 		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
 		    (phy_stat & HDMI_PHY_HPD))
 			status = connector_status_connected;
-- 
2.54.0

