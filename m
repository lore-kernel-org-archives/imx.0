Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F98A287268
	for <imx@lists.linux.dev>; Sun, 10 May 2026 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416931; cv=none; b=h5YCrXGQ2UXu62SpQacbEhEPE5zOjvciTRrAlsE34rte7VRYTOkm6TpABjYqvASDGgIyvgxyfJXv0AJLxM+Y7SZs9LOd6hTY2HwcFjWxKLTePJBJFiOrs6ebImAkli5oeATBlG6W7V8rygORNoY3tZP0KpOfSQ64D2ZMWlljO5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416931; c=relaxed/simple;
	bh=icexU5CMtRCStl6NNkvlkrzztdsTVgYec9+/gXOnQxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SK45lcxeF0Sp2AJiUi2/Jrsix/j8JNeUxmxYtds79+5ZMOX/xeIocOkBjmulAletIOrHJn129ODgXmc8TtnCTRvL3iiZKmNYq0ANixmLyP+haDML/i5dN+vlVYLAWOHMKWkh7tQQegXSzPBeHe1OQ/aks1yZu4s6hDqSm3XbYPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=YhlkrLZR; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="YhlkrLZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778416916; bh=YPElDtV9eg2ObFwq32yfRisczcjIwpWrEjsNQBlqzi0=;
 b=YhlkrLZRWwq2XbbsDUaX02ZVag0jmccag3rZh+RSlfDnBQDkTZyXmZH8pRNV6l9JWPXF+7ah+
 Vgzr+nHsz3guIBk5A6qUSqpnA6/WtI+oUvEGY8Usj1tnH169506G6AXTLyvJbIGu2wEXuxBJtuJ
 yebUcXI8neZBhETIL9wa8rK180nvQ4PanpJTh/wCP1l3ZP+M80IA+16GQIL1iLmFH7gvgJOXCGB
 a2tEN/AIiK6B3KtnpafCdvi3bW18bcbsJ7oaNDTcUBI+16ifKk8n/iPif344k89aVaMkZKsMn3Z
 l6MPaR2IWeM73XdFv9phtcSpCdyxtDVqtsRsD1bVKMzQ==
X-Forward-Email-ID: 6a007cf30d91f03a31a0bb02
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
	linux-kernel@vger.kernel.org,
	Christopher Obbard <chris.obbard@collabora.com>
Subject: [PATCH v5 01/21] drm: bridge: dw_hdmi: Disable scrambler feature when not supported
Date: Sun, 10 May 2026 12:40:45 +0000
Message-ID: <20260510124111.1226584-2-jonas@kwiboo.se>
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

The scrambler feature can be left enabled when hotplugging from a sink
and mode that require scrambling to a sink that does not support SCDC or
scrambling.

Typically a blank screen or 'no signal' message can be observed after
using a HDMI 2.0 4K@60Hz mode and then hotplugging to a sink that only
support HDMI 1.4.

Fix this by disabling the scrambler feature when SCDC is not supported.

Fixes: 264fce6cc2c1 ("drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling support")
Reported-by: Christopher Obbard <chris.obbard@collabora.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: No change
v4: No change
v3: Collect r-b tag
v2: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 41b3a9cfa2f5..d3e6a6562870 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2135,6 +2135,8 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 				    HDMI_MC_SWRSTZ);
 			drm_scdc_set_scrambling(hdmi->curr_conn, 0);
 		}
+	} else if (hdmi->version >= 0x200a) {
+		hdmi_writeb(hdmi, 0, HDMI_FC_SCRAMBLER_CTRL);
 	}
 
 	/* Set up horizontal active pixel width */
-- 
2.54.0

