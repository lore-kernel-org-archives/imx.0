Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C193E868A
	for <imx@lists.linux.dev>; Mon,  4 May 2026 19:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921908; cv=none; b=r5787lO9J/q7priYJdHHgr3891A0mfQxjpF8Zbe4KtpJz+VwOKDIFWsj3B4zzMwNzFGEUc6hY68L1qk8rZLd2LDA3qsDW+sk47Lg9NDMJA3ynH9Gxc1hcsTTidi+BeZm0JPfvrer/JJGdxy7KGpjS3HzYBXmAjSU4JPaFA1WOio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921908; c=relaxed/simple;
	bh=4GuOi9Y/xyxwNVfen6gmLBp9AjAOT+1Xf4hGPiFsy80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzaMeJqBO6FXhoIZ1dHm7/aCfvPYweXa7zPP0IhJ9OsyI6MpTjR/5kGftuO1PBVXEjAJr/l/0HeDQ4LFOqjJVLL8jlJ3ugoSGaSxz1UCDQ5ISvC5fHLqp1bRFCY9EA7XHyQiOjEtYry1J75dAA/ALkzwHFz/0PYuuXspLkS36to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Rw0WqTMn; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Rw0WqTMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921906; bh=XGUigRl0dHn2l3h5bXexuTyn8UnpuWF+VIfFWcyqNco=;
 b=Rw0WqTMn2JKrNhz8YfhYeSb26LoUxABRas08nLBJpmr+xn3Zequ1x/jRiKxfakf1a2WCkX/QX
 kO+TOjABx2oetjAGfJSijZT69gCNz6q5pAwr+JvlRGE9/gy/APpMRBpyh5jENzzjJdQ6VA545ad
 PQBxUcNiz2YHmhVV/nr1EJ7kjP39e8nHtkOr+GpgpjrE5uuY1uB23b1xqAyncU4F+JezvgUT2WU
 aR63GfV1kwrxhPZVKQJBiLYEpL6w7Z5AdcxDDjZp5Irw5vquBoY34Usl8hTq5yi0se60uvQmJ5a
 uOao3CFuwaMaEt3gcUKfghLASYZnbq/fJ5HI4+oYhLkw==
X-Forward-Email-ID: 69f8ef6b04bb1dff846bb8db
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
Subject: [PATCH v4 08/17] drm: bridge: dw_hdmi: Remove cec_notifier_mutex
Date: Mon,  4 May 2026 19:10:45 +0000
Message-ID: <20260504191059.275928-9-jonas@kwiboo.se>
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

With CEC phys addr invalidation moved away from the irq handler there is
no longer a need for cec_notifier_mutex, remove it.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: No change
v3: No change
v2: Collect r-b tag
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 059f1d241fef..fc4f255c2a2f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -189,7 +189,6 @@ struct dw_hdmi {
 	void (*enable_audio)(struct dw_hdmi *hdmi);
 	void (*disable_audio)(struct dw_hdmi *hdmi);
 
-	struct mutex cec_notifier_mutex;
 	struct cec_notifier *cec_notifier;
 
 	hdmi_codec_plugged_cb plugged_cb;
@@ -2476,11 +2475,8 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 	status = dw_hdmi_detect(hdmi);
 
-	if (status == connector_status_disconnected) {
-		mutex_lock(&hdmi->cec_notifier_mutex);
+	if (status == connector_status_disconnected)
 		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
-		mutex_unlock(&hdmi->cec_notifier_mutex);
-	}
 
 	return status;
 }
@@ -2594,9 +2590,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 	if (!notifier)
 		return -ENOMEM;
 
-	mutex_lock(&hdmi->cec_notifier_mutex);
 	hdmi->cec_notifier = notifier;
-	mutex_unlock(&hdmi->cec_notifier_mutex);
 
 	return 0;
 }
@@ -2910,10 +2904,8 @@ static void dw_hdmi_bridge_detach(struct drm_bridge *bridge)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
-	mutex_lock(&hdmi->cec_notifier_mutex);
 	cec_notifier_conn_unregister(hdmi->cec_notifier);
 	hdmi->cec_notifier = NULL;
-	mutex_unlock(&hdmi->cec_notifier_mutex);
 }
 
 static enum drm_mode_status
@@ -3316,7 +3308,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 
 	mutex_init(&hdmi->mutex);
 	mutex_init(&hdmi->audio_mutex);
-	mutex_init(&hdmi->cec_notifier_mutex);
 	spin_lock_init(&hdmi->audio_lock);
 
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
-- 
2.54.0

