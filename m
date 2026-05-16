Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B1534E760
	for <imx@lists.linux.dev>; Sat, 16 May 2026 18:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956797; cv=none; b=bMjwgevDyz+YEOmHK0fa8fHzDiU8hwwlUNUrIQ/BZJLGi5zbuTk3yGUg/0uoqV2PD3yUIJISv7DBImMEUeLrX70mtL+kCCKi7GD5SynC4bzHQ6Lup2gteb5bUIFOeMrqmCGmozlqrPLj1QpnXU/D++mFNlp7vZxf6xDQ1QKSuyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956797; c=relaxed/simple;
	bh=biRK7lpYBBo3s4DsfmsAT+i4tX2+fR771uTjQH+76jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntsdCi2xVu0VE7AJGSVxRGuqtr8VyfmHPJhYPtAitw5Hg5qSqrGAFEHnC/bucGOJ9r2dU93eMESth3ID75aFjUjHje08VG/FURltIOzS4qPxYzMzTIK41QkH9KE+6EV1KNuBgbuO+dYOhEW8LZRRETI1NLUzUcubS6SO0CIuJfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=tvPyjnEc; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="tvPyjnEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956795; bh=kFmdEA7lLMUeMCYib0u0AXUGOtneg4blGy8SvPLQFtU=;
 b=tvPyjnEcEmKy8mgCeI5xfsyosQ0e+gAwv3fk/c+1HpaQGRYrsiDYj94h96ml8ZuHU/pm8Wnek
 4z6OYdRlAc7v01X/vhcwkjdcz+bImvxrOdxB+n1thtrOnzLtF9L0X6ZTCuFHTQUWmUMCWrXz7U0
 sjXTRlYsG4/tfIbQelZzJVZfSIDtgl9R3CW07psnKLn+rYK4k81SD1ji1QuHiZfqsLBXZwfU0mo
 MWrpIyAqxKjeL8hdLLSIcNTTWfnqckxbeV8ldfQy3CZGAFUsGn2G3rFZJooflyn4PVqfpGo10pn
 PWJcDjuL1vrbpOu70SlmCvX0N+xp3q5YM85RYYv5Q3Gg==
X-Forward-Email-ID: 6a08b9f479c7625f20eeeea4
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
Subject: [PATCH v6 15/22] drm: bridge: dw_hdmi: Declare bridge CEC notifier support
Date: Sat, 16 May 2026 18:38:25 +0000
Message-ID: <20260516183838.2024991-16-jonas@kwiboo.se>
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

EDID and CEC phys addr is now being updated in bridge detect() func,
making it possible to have CEC notifier support using the bridge
connector.

Add the CEC notifier bridge op to instruct the bridge connector to make
use of the generic CEC notifier helpers.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 3649ccf8d994..1402b3963ae1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3537,6 +3537,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		pdevinfo.dma_mask = 0;
 
 		hdmi->cec = platform_device_register_full(&pdevinfo);
+
+		hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER;
+		hdmi->bridge.hdmi_cec_dev = hdmi->dev;
 	}
 
 	drm_bridge_add(&hdmi->bridge);
-- 
2.54.0

