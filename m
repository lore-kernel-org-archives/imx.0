Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA3F344D9D
	for <imx@lists.linux.dev>; Sat, 16 May 2026 18:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956775; cv=none; b=aOCOA/6XriveqhsAcOtn/MtkWTyTh5b1/pKkrM/xZEMY5bS/EUczu5b5H+1SNyETNbeNzVrltez102lb/6Wf6eZ3GE2bx9Ipv8EOqgVZ1MBq+3h5hX7ym5H2nx0nm4STfYR3KFwQS4dMqJMvCF7kwcpqR3LUu5M8vVusdhuq9no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956775; c=relaxed/simple;
	bh=Wi3qmhV2qgFH0unRdWJDntHMzTnjZStJiQXJ1/mFUgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLEJ7cKCC8Mz5GcJmuNS/BrDdBaczYqp6y0LsiAINvync+svYQAK1oQAszA0STWoWlWnDbf3d8EPLd/AuzW3e2Ppk89rKRZjIc3LUGI0sVj2oxQVcvqagZ5ByDfP2TPieGBPKGbnwIi21ExBM6fzTxf8ZItGCltcL2pjCFV864I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=YAdq6p7l; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="YAdq6p7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956773; bh=7CYPmVz1SxlBbGAJK0dfY+LC2aAK8s0zuK8cfxzH2cY=;
 b=YAdq6p7l3ds9gFaEzW9uHTOYjhjCw0VgOVfU89cwVCrV34j4yI2Cg1TK7pH8BG/waLEQ7Onmx
 PdkcOSh++T761bcmjQMjLSQ0Swy/1cdOCAgb7oHFMlTjYmE2P56QqO6tT8jEXxzYX8L/4Rg92hH
 CZuieRUjfY79IXDS0QqRcAdPz155+H4kIIuXYqJNUfHanW9bDGHwkDBxUNePuYagAtHNVxR4QMn
 BsXBT5YplYd9fPcHOdoQG1HzEEtwkHq7Tih3t5wOuNJHq/JlOopOBdAMN6ju8Lk94li9JyCfVCN
 8uA9rd+7VzzSTFkYYmPkOl0u5kNecGyuXHameDnNhawA==
X-Forward-Email-ID: 6a08b9c679c7625f20eeed58
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
Subject: [PATCH v6 04/22] drm: bridge: dw_hdmi: Use passed mode instead of stored previous_mode
Date: Sat, 16 May 2026 18:38:14 +0000
Message-ID: <20260516183838.2024991-5-jonas@kwiboo.se>
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

Use the passed mode instead of mixing use of passed mode and the stored
previous_mode in dw_hdmi_setup(). The passed mode is currenly always the
previous_mode.

Also fix a small typo and add a variable to help shorten a code line.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: Collect t-b tag
v5: No change
v4: No change
v3: Collect r-b tag
v2: Update commit message, s/type/typo/
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 8f7949d2c7f2..aa12397b3343 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2258,6 +2258,7 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
 			 const struct drm_connector *connector,
 			 const struct drm_display_mode *mode)
 {
+	const struct drm_display_info *display = &connector->display_info;
 	int ret;
 
 	hdmi_disable_overflow_interrupts(hdmi);
@@ -2303,12 +2304,10 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
 	hdmi->hdmi_data.video_mode.mdataenablepolarity = true;
 
 	/* HDMI Initialization Step B.1 */
-	hdmi_av_composer(hdmi, &connector->display_info, mode);
+	hdmi_av_composer(hdmi, display, mode);
 
-	/* HDMI Initializateion Step B.2 */
-	ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data,
-				  &connector->display_info,
-				  &hdmi->previous_mode);
+	/* HDMI Initialization Step B.2 */
+	ret = hdmi->phy.ops->init(hdmi, hdmi->phy.data, display, mode);
 	if (ret)
 		return ret;
 	hdmi->phy.enabled = true;
-- 
2.54.0

