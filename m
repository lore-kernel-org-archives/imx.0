Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643CD34B1A6
	for <imx@lists.linux.dev>; Sat, 16 May 2026 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778956782; cv=none; b=eT+LN34KXBEY52F/3yzJL0JXQFPPdKNqzQfDkuAquF55Xezf1vz3+2/dyL5mMr4HYn6WzQP6pVlmTlVaPPJ8pzelHEfIwjeHXL9L42i9xHeeCvrwQe8h6/SSvvq+S0122FJiWVkQHJKdCVP2w5tgXefIMhzXIbQTVboMzRIM9is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778956782; c=relaxed/simple;
	bh=KrkKZTGrTZAGWebAJLxv+24DPejbdEBDJqrGz4EBP4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+MSd0+OuRwNIgYOzGLbgVEtiBjVMMR+fU9qyn0wtojDXePxbFDHXeTqZ8Uy3w/hBoBZISwoYwBlTx3vQL6/Qnz0+7nFnKZ0U60ROye0UW8KMr4RTT7UC7khzIzxbASNzwKmo6rswzyDk71dTTiJaX1jr1+pIdFz7Hh/4Pquyq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=jezv0RrQ; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="jezv0RrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778956776; bh=TV52XSycf6wnHw1EkncvtVnQ2hwR4mxv/EgMlgr2HFE=;
 b=jezv0RrQB7tZtshsuBpy25sWAQco0nLZZ22jWVGuPhzcjm1/+upcI8v18zYSOtMK33ahNjzFx
 KgGNxJO9PTrKYbUe4ELB+0VTye3AyRVVBTbksc17IWBkS/V0laWWPdNVtWAKSXSKiXtMe1Ukz6k
 0uJQXp0JTvHFYfeT1HtQvM+dp316qxiMQ8wK3XT1CrgLYkFrmlppQsx9F/o2CkVqwJCkKnwSXur
 YKVxgpPB5ZDRZlSJSBBIsJ4oN8hcrHTMjxzk+oszdocPyHDoKtl3r8HrybK2U2FzIwCz+yF81ko
 qn4yPi255sEgkR50bVKETv+U/dRRBafQ0e0EK0FbpmuA==
X-Forward-Email-ID: 6a08b9df79c7625f20eeee1b
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
Subject: [PATCH v6 10/22] drm: bridge: dw_hdmi: Remove cec_notifier_mutex
Date: Sat, 16 May 2026 18:38:20 +0000
Message-ID: <20260516183838.2024991-11-jonas@kwiboo.se>
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

With CEC phys addr invalidation moved away from the irq handler there is
no longer a need for cec_notifier_mutex, remove it.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6: Collect t-b tag
v5: No change, cec_notifier_conn_unregister() call moved
v4: No change
v3: No change
v2: Collect r-b tag
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index aae1b890167b..0dd4c823c60a 100644
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
@@ -2542,10 +2538,8 @@ static void dw_hdmi_connector_destroy(struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
 
-	mutex_lock(&hdmi->cec_notifier_mutex);
 	cec_notifier_conn_unregister(hdmi->cec_notifier);
 	hdmi->cec_notifier = NULL;
-	mutex_unlock(&hdmi->cec_notifier_mutex);
 
 	drm_connector_cleanup(connector);
 	drm_bridge_put(&hdmi->bridge);
@@ -2612,9 +2606,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 	if (!notifier)
 		return -ENOMEM;
 
-	mutex_lock(&hdmi->cec_notifier_mutex);
 	hdmi->cec_notifier = notifier;
-	mutex_unlock(&hdmi->cec_notifier_mutex);
 
 	return 0;
 }
@@ -3323,7 +3315,6 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 
 	mutex_init(&hdmi->mutex);
 	mutex_init(&hdmi->audio_mutex);
-	mutex_init(&hdmi->cec_notifier_mutex);
 	spin_lock_init(&hdmi->audio_lock);
 
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
-- 
2.54.0

