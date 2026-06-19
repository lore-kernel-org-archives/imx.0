Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610AD3233ED
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 12:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871926; cv=none; b=js25T9ttDgioYlt9nuVluMdLVo8k71T9uETPjigap1NrojiQ7SbSYhSC8mX3pE2ONXGrdmrJZjhN8FsbJUbhTZhjPlXpZ1dA3+gFQ24ql2tdzF/JNjMgAoiEO9hSSLW4OwYPAlgKn8iBFWKx5Z9TCDfmOK2GmHchEDe2ZCFmDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871926; c=relaxed/simple;
	bh=KuFeLlizsRvtSY3JcOJkNEE7zKArWS4qTTvUTXf2P+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kmpWUMc2r1fZzTmcliguzYJ21V8witNU6x/LkR2lr3ofMMpYk92eLRcLEnjQPD3T7gx0jLQ3WV3U/l6JD8Nqy1oAtu+lWUvjnb/Ex+THStvM4q+WVvTWKuazlVr0ItaTR5hfYQ5WBM6wXku5zzXsUd18lFTRXHSJKpCS6DxSG7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9JAcNxW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9JAcNxW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830ED1F000E9;
	Fri, 19 Jun 2026 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871925;
	bh=y+t6t9GV3XLbshIxqCQCxa/naPEa5kl5TLbZq97cjwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H9JAcNxW3da8Pp1RwPRetGWyCeLhFrt86QpUI2GZV1IW4/pUQ7HKTzdiR0ihjVbwo
	 0QZg384tXwAkx2Tm1Te4K1pXGzw2D19c2xzqI3kFlGxZixBROTIHkfqMSoZtpzU9KI
	 LLTaFAxTiM1o7kxp9C4d3kEUbPQE33imBkThRDaOGA+xB4Az1okwhIPjFrjRdg+D+e
	 fSaniR+LSSw0QZc0aFxcA1G+qKEj6KNY431saxo++B5vizxkDN1Vb1qbYKxr3P5O/B
	 FH3ZbtW93WAz1FxqGpl0g/laCAf7K66neDJ3tuBO1DX22sA2c/h7dh6xHLd/9pPt6Q
	 KhinA797t8IHA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:19 +0200
Subject: [PATCH v3 14/78] drm/bridge: imx8mp-hdmi-pvi: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-14-ff399263111b@kernel.org>
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=mripard@kernel.org;
 h=from:subject:message-id; bh=KuFeLlizsRvtSY3JcOJkNEE7zKArWS4qTTvUTXf2P+4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJh+25szcWymwIN8hcGK3dgj7g4+nTh8RCq85JNpzk
 f/vb4nnHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAipfmMDR/+XTlWrhCQPDn5
 R8PqVvHAXUliITpcl5ntF0RqL/t/4fqK74yzX76yEXmzIJ37Z3ZKAWPDr7yHByIbD/Xcr6zs0Y5
 0uPdmvl97xblNMlu/e7m9+lL9c/kDb/Og14nXNcuWtcm/slIEAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 7d5fda7173e5..a31d4fc76f35 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -129,11 +129,11 @@ static const struct drm_bridge_funcs imx_hdmi_pvi_bridge_funcs = {
 	.atomic_enable	= imx8mp_hdmi_pvi_bridge_enable,
 	.atomic_disable	= imx8mp_hdmi_pvi_bridge_disable,
 	.atomic_get_input_bus_fmts = imx8mp_hdmi_pvi_bridge_get_input_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 {
 	struct device_node *remote;

-- 
2.54.0

