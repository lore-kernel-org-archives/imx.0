Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6D3387598
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127419; cv=none; b=nSQShHb1/jhBISR8MooDOHADunFBG6GzJJGwN/of5lBIMLRZnBZf9rOGHa92nVmzuo6sQCHAvD87UH6+G75YxGVumCVWP58k4hClO8K8BVSkbU+VQKXbeNrNqJ7Y4P/JAQxmgItDxHKmqQN+SMMISi3UEAC1cFDcjYFyCH7qq7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127419; c=relaxed/simple;
	bh=mc5qYkvHimozgFABBNS1IVGauTwWAU2kMYJZwG0KI34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUMyWa0OTlPkZ3DKv3uDt9patonsebvesyuecSje/I4dMnLtD7oDWGOHXGJilarpLEXQkAHLzQrrMN3NkYFp1JmUW0K9nEkTJ6+I7FAZwDOwEunii7SIjOHu6iLf0IkkSBXIlQmQc5Gl5sbMLitWMJqPAkm/bOlxeLb7qBFFQfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=RCqYrQfJ; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="RCqYrQfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127406; bh=6RF7BKuGakMjKCbN9mlVwwIB3PRUeYCX0ksZtYl9O4g=;
 b=RCqYrQfJn98+0ooRInOeJDOLgMf/XruivDxA+d8fiTw6UPIoi/SlqGKap16H01KJsxSuJhsOw
 BR4gsDR9L8v91cuE+n7/92Qp+Cw9LMtyp8Gn2etFsE/1r4EmK4abFoOMye8Vom7gpeJN6IbxH34
 lAjNX3CJztp2jAu3jQq0/iVZKIAdXwwDQENlhiOiDCxTIZrOIgNTAj6n5ynzELEI7BpHYzZNRsw
 RwXkYdh8IDYDhUhT28RY028vB1q2L19QVMcaPZDXaS1LiK/YvHRpX304RGYrLXbzSWuppyfMh//
 UilZ+QXms5FPw4lypHSVnfn8lbV44vL16njQ5VnqOpIg==
X-Forward-Email-ID: 6a0b5429b84dbc72d2274daf
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
	linux-kernel@vger.kernel.org,
	Christopher Obbard <chris.obbard@collabora.com>
Subject: [PATCH v7 01/23] drm: bridge: dw_hdmi: Disable scrambler feature when not supported
Date: Mon, 18 May 2026 18:01:37 +0000
Message-ID: <20260518180206.2480119-2-jonas@kwiboo.se>
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
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: No change
v6: Collect t-b tag
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

