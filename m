Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379B13EFD38
	for <imx@lists.linux.dev>; Mon,  4 May 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921899; cv=none; b=J+rXlZ3x7OA3jGOsIwddf+n8hFvIqgoWBpGCC/WKSjWNVAWRzVrr2u97qHl3RfRYUIsrz6kWqH/l1lppfFfKTGla4tsv9TMdXIA1MXB65AUd4GcWnBYtTH4AXwuNmwAJ2E01j4h9+ptciyH0yevax7+DnWAjbnpsGS57ZimTrGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921899; c=relaxed/simple;
	bh=Hsbju5pYDHmJwjHVageFiCg0C3RCNo+qYqaKYKZyrYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OuAqWLZxq2SJhdHKqEqlnyofHyeRcA9PJtrFLYcU03YfeFciR4C23Kyy/RQYlO1qnt5m6XdXYImBwhom/3Lga18gqnGvhn+2f0wQqCdVEvEDExMBNZkoIjGRHeio5PGRykrRNRzE9M37DGU2CKbY+WpNRuRgjNw3PMzyYDzGtaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=eRmgB6tn; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="eRmgB6tn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1777921891;
 bh=wSxi9Aq16jRBEzsD8DxsIyNuqkMMC7wF41X1iPVcGUQ=;
 b=eRmgB6tnUguJI0lkfKmxzRSijoZJ/Zmdia1dBRAGnzUVeOeEdrUSBWvK/kcTe0f9V4e0AvVCM
 neppLfvIYxr2qGFPfZQ7R3ytL4vI5daAB4VPVMNCBF2BWfAXdlqDwKVJOc/o3VqcWl4EC33UVFq
 MrQF/tjzk/q1y0WLIKB8RusZzohWKgl84oWfhwJtcOJnwVdT8STLZfCS17T3P4+9Bcibl/5SFiW
 1abscQ6SsNRa4UDpdmheeCtqX0Omc682/nVfnnFyTzMYsrXGuUFTeL/jlB71uCgfaEbMAsB07tA
 MOGzHnY1lEvXMAsqgMxLUU1o4y4aGI5gwFPN3rQon3kw==
X-Forward-Email-ID: 69f8ef4a04bb1dff846bb7bd
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
	Heiko Stuebner <heiko@sntech.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v4 00/17] drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID cleanup
Date: Mon,  4 May 2026 19:10:37 +0000
Message-ID: <20260504191059.275928-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a revival of an old dw-hdmi series and is the first series part
of a new effort to upstream old LibreELEC HDMI 2.0 patches for Rockchip
RK33xx devices.

This series ensure poweron/poweroff and CEC phys addr invalidation is
happening under drm mode_config mutex lock, and also ensure EDID is
updated after a HPD low voltage pulse by changing to debounce hotplug
processing.

These changes have mainly been tested on Rockchip RK3328, RK3399 and
RK3568 devices.

Rockchip uses the dw-hdmi connector, so this could use some more testing
with drivers that use the bridge connector.

Testing with a Rock Pi 4 (RK3399) using a Reaspberry Pi Monitor with
Linux kms client console using drm.debug=0xe should log something like
following:

 Power cycle monitor using the power button:
  [CONNECTOR:68:HDMI-A-1] CEA VCDB 0x4a
  [CONNECTOR:68:HDMI-A-1] HDMI: DVI dual 0, max TMDS clock 0 kHz
  [CONNECTOR:68:HDMI-A-1] ELD monitor RPI MON156
  [CONNECTOR:68:HDMI-A-1] HDMI: latency present 0 0, video latency 0 0, audio latency 0 0
  [CONNECTOR:68:HDMI-A-1] ELD size 36, SAD count 1
  [CONNECTOR:68:HDMI-A-1] Same epoch counter 10
 
 Cable unplugged:
  [CONNECTOR:68:HDMI-A-1] EDID changed, epoch counter 11
  [CONNECTOR:68:HDMI-A-1] status updated from connected to disconnected
  [CONNECTOR:68:HDMI-A-1] Changed epoch counter 10 => 12
  [CONNECTOR:68:HDMI-A-1] generating connector hotplug event
  [CONNECTOR:68:HDMI-A-1] Sent hotplug event

 Cable connected:
  [CONNECTOR:68:HDMI-A-1] CEA VCDB 0x4a
  [CONNECTOR:68:HDMI-A-1] HDMI: DVI dual 0, max TMDS clock 0 kHz
  [CONNECTOR:68:HDMI-A-1] ELD monitor RPI MON156
  [CONNECTOR:68:HDMI-A-1] HDMI: latency present 0 0, video latency 0 0, audio latency 0 0
  [CONNECTOR:68:HDMI-A-1] ELD size 36, SAD count 1
  [CONNECTOR:68:HDMI-A-1] status updated from disconnected to connected
  [CONNECTOR:68:HDMI-A-1] Changed epoch counter 12 => 13
  [CONNECTOR:68:HDMI-A-1] generating connector hotplug event
  [CONNECTOR:68:HDMI-A-1] Sent hotplug event

This series has evolved into an initial part of a larger multi series
effort to:
- drm: bridge: dw_hdmi: Misc enable/disable, CEC and EDID cleanup
- drm/bridge: dw-hdmi: Improve input/output bus format handling
- drm/bridge: dw-hdmi: Convert to a HDMI bridge and use of bridge connector
- drm/bridge: dw-hdmi: Add and use tmds_char_rate_valid() plat data ops
- drm/meson: hdmi: Misc cleanup and use CEC notifier helpers
- phy: rockchip: inno-hdmi: Change TMDS rate handling to configure() ops
- drm/rockchip: dw_hdmi: Misc cleanup and propagate bus format
- drm/rockchip: dw_hdmi: Enable YCbCr and Deep Color modes
Link to snapshot: https://github.com/Kwiboo/linux-rockchip/commits/next-20260430-rk-hdmi-v2/

Changes in v4:
- Change to use generic CEC notifier helpers
- Disable/mask hpd_work until enable_hpd()/hpd_enable()
- Read connector status directly from HW regs in hpd_work
- Continued rework of HDP and RXSENSE interrupt handling
- Collect r-b tags
- Rebased on next-20260430
Link to v3: https://lore.kernel.org/r/

Changes in v3:
- Rework EDID refresh handling to closer match bridge connector
- Use delayed work to debounce HPD processing
- Update commit messages
- Collect r-b tags
- Rebased on next-20260401
Link to v2: https://lore.kernel.org/r/20240908132823.3308029-1-jonas@kwiboo.se/

Changes in v2:
- Add patch to disable scrambler feature when not supported
- Add patch to only notify connected status on HPD interrupt
- Update commit messages
- Collect r-b tags
- Rebased on next-20240906
Link to v1: https://lore.kernel.org/r/20240611155108.1436502-1-jonas@kwiboo.se/

Jonas Karlman (17):
  drm: bridge: dw_hdmi: Disable scrambler feature when not supported
  drm: bridge: dw_hdmi: Only notify connected status on HPD interrupt
  drm: bridge: dw_hdmi: Call poweron/poweroff from atomic enable/disable
  drm: bridge: dw_hdmi: Use passed mode instead of stored previous_mode
  drm: bridge: dw_hdmi: Fold poweron and setup functions
  drm: bridge: dw_hdmi: Remove previous_mode and mode_set
  drm: bridge: dw_hdmi: Invalidate CEC phys addr from connector detect
  drm: bridge: dw_hdmi: Remove cec_notifier_mutex
  drm: bridge: dw_hdmi: Extract dw_hdmi_connector_status_update()
  drm: bridge: dw_hdmi: Use dw_hdmi_connector_status_update()
  drm: bridge: dw_hdmi: Use display_info is_hdmi and has_audio
  drm: bridge: dw_hdmi: Use generic CEC notifier helpers
  drm: bridge: dw_hdmi: Use delayed_work to debounce hotplug event
  drm: bridge: dw_hdmi: Rework HDP and RXSENSE interrupt handling
  drm: bridge: dw_hdmi: Remove the empty dw_hdmi_setup_rx_sense()
  drm: bridge: dw_hdmi: Remove the empty dw_hdmi_phy_update_hpd()
  drm: bridge: dw_hdmi: Merge top and bottom half IRQ handlers

 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c |   1 -
 drivers/gpu/drm/bridge/synopsys/Kconfig     |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 436 ++++++--------------
 drivers/gpu/drm/meson/meson_dw_hdmi.c       |   3 -
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |   2 -
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c      |   2 -
 include/drm/bridge/dw_hdmi.h                |   6 -
 7 files changed, 134 insertions(+), 317 deletions(-)

-- 
2.54.0

