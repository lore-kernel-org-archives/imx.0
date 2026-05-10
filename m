Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5396A38A73A
	for <imx@lists.linux.dev>; Sun, 10 May 2026 12:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416963; cv=none; b=tIsLU1JJVcMJobeXTHck6t0a6ErQLz9BvhW10y/heQecly2lyAYwpLpB0g35uRIv0G1LrFSpthknQ6b+jCuLlo9X1LiXJ4RPX15rHH4RHFHKPfxs9ZIO62fseCfmIDwi7xc2oFg4mptX7D0VtsJd7ZxeIJS4dK5mDEW7NOKdLGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416963; c=relaxed/simple;
	bh=jghgzDdCQml5a0x+rXTzdA2scD7qZkXELcuhyLhvMyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpH1PqWE5HinvYY7xPUfmWDEjpasqhYVGuAp57Jb7ut3lFGoM+0sdawXzzHT5c/DN+UXnjAZQFuBOzM/MaikTxd4wCmq0FbcXJarT9Ruoq2/Uxfhj0xsgJTYt2XXRW/D+U0w+AaZ1McNatGTsPfJaIICxAOEytee1udO4pnpjWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=KtUvgFYO; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="KtUvgFYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778416949; bh=er0xhzvCLlN0qh9ZkIzd2DuMHrfTOjO1xjORGDDCi3A=;
 b=KtUvgFYOScH0JxtiHiEdQks5VUYerouKIk8zPgLmFIqtFmI5Bb1MWjNkPf6dhmwetGm0ilTdo
 LCgF8z3RRCCyMFWVyO0o33rX0alBU0Bh1xKGLZqGziH5xpWGH/Hf8TcuGVse+T5jYf5BPgyrn/q
 tDqYUlAOtVxc4Q9rMp4hHXp/KYvIQNlgHOkWYs8kI7mvzHck16yzPcyfLrxZYD/1q6P38HFftzY
 hApV+BdYeaYLQl7OpcHpb/RZk9nxUMsZbP6RDFZpnmTckUtabstihxz5dk7nLF53jRS4M6iXs7y
 SfNkNxZt6fYNTDmLPjZRSa1FxNdNcdSel5fyTMJBK2SQ==
X-Forward-Email-ID: 6a007d050d91f03a31a0bb6e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/21] drm: bridge: dw_hdmi: Fold poweron and setup functions
Date: Sun, 10 May 2026 12:40:49 +0000
Message-ID: <20260510124111.1226584-6-jonas@kwiboo.se>
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

Fold the poweron and setup functions into one function and use the
adjusted_mode directly from the new crtc_state to remove the need of
storing previous_mode.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: No change, rebase on next-20260508
v4: No change
v3: Collect r-b tag
v2: No change
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aa12397b3343..607faf4da967 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2254,9 +2254,9 @@ static void hdmi_disable_overflow_interrupts(struct dw_hdmi *hdmi)
 		    HDMI_IH_MUTE_FC_STAT2);
 }
 
-static int dw_hdmi_setup(struct dw_hdmi *hdmi,
-			 const struct drm_connector *connector,
-			 const struct drm_display_mode *mode)
+static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
+			   const struct drm_connector *connector,
+			   const struct drm_display_mode *mode)
 {
 	const struct drm_display_info *display = &connector->display_info;
 	int ret;
@@ -2396,15 +2396,6 @@ static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
 	hdmi_writeb(hdmi, ih_mute, HDMI_IH_MUTE);
 }
 
-static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
-{
-	/*
-	 * The curr_conn field is guaranteed to be valid here, as this function
-	 * is only be called when !hdmi->disabled.
-	 */
-	dw_hdmi_setup(hdmi, hdmi->curr_conn, &hdmi->previous_mode);
-}
-
 static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
 {
 	if (hdmi->phy.enabled) {
@@ -2969,15 +2960,19 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_commit *state)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
+	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
+	struct drm_crtc *crtc;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = false;
 	hdmi->curr_conn = connector;
-	dw_hdmi_poweron(hdmi);
+	dw_hdmi_poweron(hdmi, connector, mode);
 	dw_hdmi_update_phy_mask(hdmi);
 	handle_plugged_change(hdmi, true);
 	mutex_unlock(&hdmi->mutex);
-- 
2.54.0

