Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1702B32C94A
	for <imx@lists.linux.dev>; Sat, 16 May 2026 18:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778957011; cv=none; b=dvdiTfVL8mJmIc6igf5clORKhIJHR/XxzSj6SUKxQiQ378/qVk0CPEVpMmvJLrt2heFS8IvZYqtzO/RUk2/FzjY9u5SD9GWyv40+HlBQhf/B6ZwC95zgeqJeazceoVwMvnH2eAcf8xr6++JznWsW1fpAqi2cD5BZr6uocvU7TRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778957011; c=relaxed/simple;
	bh=nTOl+0wmbj6DoxgllvsuJQRuCtKzqm3lSTm6w5topqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NO7peHztPS9VI+5s67bhBUrc4BUQsbGmpYjP+qRi2Nkdh1zH8gL6R+OB8c0GK9Y/LNYtrA2jUhT1NlU3869nNDvdywYWAr9/Kljfq4XVj6sE3ztevWOZ7SfZUY8QdzewFZ2Z7BKxurNuDaj9WAHG1+ncvbclSpXicZ12uT9rn8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=vfh3pBLl; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="vfh3pBLl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778957008; bh=w9gLcIjrWFUo1B9oSiBZ5ajnppXXlJddCFjM0GCTYiM=;
 b=vfh3pBLltotu+UHxH4q2etWYfEBnhj6PQIRBSQpsD8fSoltGI8bIeUvKTKlVB/bkeFvgSS+32
 VriC3aEOUZ7t3i+l3NzAQIifp13EwCpF06ShANIXptdMuUgbPvZ93KrJwUVsrcoMPtcGuXMHoYI
 0Cbb0vGkSrEw1mYFCU6dPZL8O4Gu6n2YhpDvPPy3KVNER2BzdK4rwVVoMJb9E4VNNS+AxxCojbQ
 GaUiv4Empjy538uZlbXL4n3+DrCrPGDsaULfZ4UIU4hy+UdteRWXqi55/0C3cBj+04VJv3e3HAk
 LD6kIh8Qnta6clQ1z6YJT0NkT/rr2FGdlbxGlr5z1VWQ==
X-Forward-Email-ID: 6a08b9f079c7625f20eeee89
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
Subject: [PATCH v6 14/22] drm: bridge: dw_hdmi: Update EDID and CEC phys addr in bridge detect()
Date: Sat, 16 May 2026 18:38:24 +0000
Message-ID: <20260516183838.2024991-15-jonas@kwiboo.se>
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

Update EDID and CEC phys addr in the bridge detect() func to closely
match the behavior of a bridge connector with a HDMI bridge attached
and the dw-hdmi connector.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: New patch

This is a temporary change until dw-hdmi is fully converted into a
HDMI bridge in a future part of this multi-series effort.
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 2bb043d64b65..3649ccf8d994 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2969,8 +2969,17 @@ static enum drm_connector_status
 dw_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
+	enum drm_connector_status status;
 
-	return dw_hdmi_detect(hdmi);
+	status = dw_hdmi_detect(hdmi);
+
+	/*
+	 * Update EDID and CEC phys addr to match the behavior of a bridge
+	 * connector with a HDMI bridge attached and the dw-hdmi connector.
+	 */
+	dw_hdmi_connector_status_update(hdmi, connector, status);
+
+	return status;
 }
 
 static const struct drm_edid *dw_hdmi_bridge_edid_read(struct drm_bridge *bridge,
-- 
2.54.0

