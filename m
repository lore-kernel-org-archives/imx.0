Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3943E6DD3
	for <imx@lists.linux.dev>; Mon,  4 May 2026 19:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921894; cv=none; b=Avz6lhelCdwR1/Sd2UlY9OOgsWliMXxoGALPq9IgxwTTYCl7HWJ4Ei679B9ZXpVdQfo87yuhJnvOiIiOchfcwKQLsMJ3uic/xGBqwgL0Mn7z6+ElLMalPnn7jKO7y0/VmFYJKV935yL/oUu6gitfy8BybbKuj14paiKUnZi28SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921894; c=relaxed/simple;
	bh=2vNRIV+X9aziqWVgNJH/9Q4i1l9GuFJGxG9rk+Nehaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wu7rCZJ5caZpxl2SQsJJc57+loKEXt7oemlIwHjvZEONGfoi8L7zkj06wlezRXtz3lEuxgpCfSdU5zDEw1V1O/8Qu0sJC65zAQRmS+iXhY0zPK0y11dMnM5gc2xI1HZMyHFjX8fl2fWRvOEeywib3eFal1hYS1phg1uj65WCIDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=wpyjbIBO; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="wpyjbIBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921886; bh=ztwyFtJ+PIzunu61Ma2kZpnK7+L5uIsvetgCX3r3Ivg=;
 b=wpyjbIBOYkAV0/e12jKgGYTRoqi7x5GbxBIvHptaXM38nWmCPa3TIZTvrWzz5lXfwuZcldiJG
 FzLf6aC3sGgn3la1RlsaQdTBX+IeDQ2PsLUCys4N2Fx8dBk7RFaDt6POxKT6vwwmWjtsvXGDkc8
 mz5RFMygjXeEv3HbewJOeUgoPrwWQiP+SOcQyDyc4YtpwdxuS9+QXeZCaf28GfcAMS7JFhHkS08
 IdnYIqfwxdp+zx08DOEWP7zwS4F87IEfiYE7adnIq6TsqQMs/jyz8MuWmY9ksaJw/B8ScWzZcg1
 7CHnkFaUnP8zfDw+V9DEmmzm2LK8fYmVT4hr4ZMxVEHg==
X-Forward-Email-ID: 69f8ef5a04bb1dff846bb86f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/17] drm: bridge: dw_hdmi: Use passed mode instead of stored previous_mode
Date: Mon,  4 May 2026 19:10:41 +0000
Message-ID: <20260504191059.275928-5-jonas@kwiboo.se>
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

Use the passed mode instead of mixing use of passed mode and the stored
previous_mode in dw_hdmi_setup(). The passed mode is currenly always the
previous_mode.

Also fix a small typo and add a variable to help shorten a code line.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: No change
v3: Collect r-b tag
v2: Update commit message, s/type/typo/
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 4ecad0d2eeaa..f028a4b71aad 100644
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

