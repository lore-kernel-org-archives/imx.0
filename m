Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379223EFD09
	for <imx@lists.linux.dev>; Mon,  4 May 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921898; cv=none; b=Z5pShBot1oC56Fw5P9CgelkRYUDVblJ46k1/w1bOWEwVdeDVGYvEoQ3g4eoetej1X8loNxv2iQhGPws379JrwIHwizPcGwEb9PrVyCt44I22yHMUGhaPMqaVX73q+SMR/ETZMCcxYpexh3jm1yCZGIso/qWuk3W67vS4EM0oTis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921898; c=relaxed/simple;
	bh=gPod5psDuYHeexBaonjWvaIui42g4wz0uc0rFfhdUcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6qbMRlgzDfAkhaGcRwzGgms/ReUfHREt3joQWamf8T14vfVfMRSb1ZV+qzZpBQcM/DOHeMygM2RFUycQ0oV3agj6VGc6F94O6QPKi4wQPbXpFRD7ZA1uLvnQHeqLTTJnO6FlOmbRHUDqNukZwYnyXqQB92Cpf7oS2uj0KtlOQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=QlUILbfJ; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="QlUILbfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921891; bh=NVWUpLoYoqwHrhK1PEs6caGhSJc5nSsIxxdrR4kmbpQ=;
 b=QlUILbfJdQnnyGV4CViETV+CFnhDJuDf4s4vWNpHO73YOVAvadovAJL2052evTlHQmn6rruvc
 VOSkDxeLL1YbErmtAcLD1trsSMfnPjdSNUWYCeQR4nuaaUWtz0cj1YdKrUaIa3mLWoUmHR58qtN
 MNGX2l6W+p5lQXMngwwqTQidSIQugMIncQIqXv375ZKQxjUjiKnYW3r28Kx9z19/PS6NlV+gaNA
 U1suHklRXgYRq0e0ipa9k07rVrdS0imFl85tux7O39lBh+LeyKJZi0nSYUf4PsuPmDTQhG1A9UT
 YwopGU4I/l1uQ8XhKzsavEeaKDEXs+QFSFW3ilVp4ncQ==
X-Forward-Email-ID: 69f8ef4e04bb1dff846bb7fb
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
	linux-kernel@vger.kernel.org,
	Christopher Obbard <chris.obbard@collabora.com>
Subject: [PATCH v4 01/17] drm: bridge: dw_hdmi: Disable scrambler feature when not supported
Date: Mon,  4 May 2026 19:10:38 +0000
Message-ID: <20260504191059.275928-2-jonas@kwiboo.se>
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
v4: No change
v3: Collect r-b tag
v2: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index f4a1ebb79716..248454c45d6b 100644
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

