Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ECD34A76E
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127413; cv=none; b=mS0B9y09rjSLa4X2DxXN6JiIUxsZlBoYGM+Jz0pY4jZjBTL7oo0NQ7U6bt9KOgSlBWjIhBk3J/2LbtA0MABZOhRx+z0lULn0sjLBwA2MSOALFkD31thERwRWiOV+dtVwN4KFnavWcBEPTAY/pMfwYqMSxLCvnaKJ1da5b6Rw57g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127413; c=relaxed/simple;
	bh=/bn/ib7xA0N4c3muUGNEVYXey9RC1LAI6e7bdbz04I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LCRS535vuQwB+yls3wbNfcrnwXv5+K4E6xtYUj9PUReml1V2KsdURVLQYOGKgdIc72qjJjZkCvRGhTvJRYLGhvSJZONhfEWRgtEjOWAop3FPX296MDZQ/ZJ0/6yck7XliOBK1gB1cyN/U0OUC5Q1AvGGsnt6NZgpkr184S96VDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=l8eHPFv0; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="l8eHPFv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127411; bh=HKqZrWH/mIENot9S0r7SqDZlavFSRVbiuTr0NBVKdNk=;
 b=l8eHPFv0TmAuE5YrdT6n7leBO/3MCxmMkzPr36OOoa1EzoHVYffsNv0dQlT0TKPqgq9J+RieA
 voIrVa76jwrzVHpqGbBDhpdcUB0VeJ0rHtjJoVtdyIBFidSgOmLtCTKrEbFGnkwSQOlWhQjeoS6
 eXbyZqFvpL1sfchRxuS79+Cv2qzRa8SM/U/KTqTEGHK3SWJi5lJNiFBRkX2FvqwO0/wvi9t0Rb0
 IOpYafFlN11d8K3pRJLAQOLNqBGf55Vh71ri4VW+7qqbPlcGhryaujlHvYRIQlXJnOU4nX5BZXn
 UFX2+phIfONpO3FnAzZDCcDGBDg26kGSQ8+NoGJs58Gw==
X-Forward-Email-ID: 6a0b546eb84dbc72d2274f74
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
Subject: [PATCH v7 17/23] drm: bridge: dw_hdmi: Declare bridge CEC notifier support
Date: Mon, 18 May 2026 18:01:53 +0000
Message-ID: <20260518180206.2480119-18-jonas@kwiboo.se>
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

EDID and CEC phys addr is now being updated in bridge detect() func,
making it possible to have CEC notifier support using the bridge
connector.

Add the CEC notifier bridge op to instruct the bridge connector to make
use of the generic CEC notifier helpers.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: Only declare CEC notifier support when CEC device register succeeds
v6: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0c4388e7aa5e..5dacb8a99715 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3515,6 +3515,10 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		pdevinfo.dma_mask = 0;
 
 		hdmi->cec = platform_device_register_full(&pdevinfo);
+		if (!IS_ERR(hdmi->cec)) {
+			hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER;
+			hdmi->bridge.hdmi_cec_dev = hdmi->dev;
+		}
 	}
 
 	drm_bridge_add(&hdmi->bridge);
-- 
2.54.0

