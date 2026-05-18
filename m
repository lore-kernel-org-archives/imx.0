Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E30392836
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127443; cv=none; b=eScqgsrSRUuuC/IjE1UysjZWGTdoKWW7Ecey7l+40RpArYJaSEhJzIblQW7Nz4gY8stxC5lGw4IFvE1gGSi58wzO3Cvsu+Gu6yW9/O16ZvR733cUGaU5uHJJ+8PhEC/WbtQswSEaqgvkgFBQj21Hcbc4py2x7UQ/XAaybttWQMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127443; c=relaxed/simple;
	bh=VxZ1Kez/06U4VoDeHYL41XHk0JGP/YzohyWCreMpChs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJH5HsQHTw9s9q9zflKANQVbFaX2QgONEqwGyrxHXlC/9uwDIYbvC0jT7wUbY18pfUn1zV3PTOmxhm0BUhuZvpcwu7aVHOytEpii4wZuePakNqNaII+PAfijyW+gxeJB3Pstr+upUjPIi7/8TUPX1sfGM7bQPPrNLpuGOFY6HMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=kNp0bBff; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="kNp0bBff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127439; bh=znz3x9aHiZWJo1Ge4Me4toMEFecshVWA02u6IfcfS5U=;
 b=kNp0bBff3O+YOKragQeifC9YfTEgyd2OM8QSbB57rWTJSRitux13QhzuhqHGcc6q4C+NHRsh+
 SqZsMIZ/7hg9rG6K4nw415/TAZyq2RPDDxjuHyX0TR0d1zoCzRkAkNVnSA3oxhKM2VVbfZF6m3y
 gmJjm5BP3AOSVRIs4/8HIRM6qYJ3KNOiwarhQqp6jGUTzygxTc+C4e0UraXuC9ADC6XdhvyyECi
 8Fj19aKikfQbwo6DGP9RODALj4RK6x3SXqerqUODeuAtCK2U/0RDGd8EdgUJFI0Fjg9BFPEUbJH
 3gkiKmm2b/Gj5iz12hKsLYlruG9P6y85QTjhNiuLHRkg==
X-Forward-Email-ID: 6a0b5450b84dbc72d2274ea2
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
Subject: [PATCH v7 10/23] drm: bridge: dw_hdmi: Invalidate CEC phys addr from connector detect
Date: Mon, 18 May 2026 18:01:46 +0000
Message-ID: <20260518180206.2480119-11-jonas@kwiboo.se>
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

Wait until the connector detect ops is called to invalidate CEC phys
addr instead of doing it directly from the irq handler.

The CEC notifier is only registered for the dw-hdmi connector so this
has no impact when the bridge connector is used.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: Update commit message
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

