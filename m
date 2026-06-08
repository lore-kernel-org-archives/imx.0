Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B973B3BF0
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929514; cv=none; b=YpIIGEi0t7axsTUR/XGJ0x7Of/Th0gTBuUen+0ixqihEWWfeoZYepMpanCc4qsbNmWN5XP7Ezew9+SH35iJLVx7Gp43LmR4vXI7A696s1Db+uy0uxuFGJmdx0QXak5cSlT/FCqLNFKh1dJ9HbHUfLqNTJcPFaILifMKGs9my/T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929514; c=relaxed/simple;
	bh=MfA+vFaXbqTAVMVSt1LE9XSkKBD3WIqzlMHPHCFR7F8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B44xbNyMVPH/2zPwq7U0/UDDelhkZBt4AQxY13ktSR78iY+Y7t2rZJUlctKDQf9Sk1VIK9e2+o/RBLn5mhNmZTWSRHsFcxDEog6683i0ca5Pa63/wKLhmxltA2trTfbDdLjPxdlibe+75lc1c9Cv0A2S81bouaoS/NWR98jX4ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+kPONuZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+kPONuZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BE61F00893;
	Mon,  8 Jun 2026 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929512;
	bh=ejYuLC3YgIldB7/W/QtuK8IPfcFDE7A7qlLMr+VD/dw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Y+kPONuZDqDFAqfBCCrApTtboEvw/5kKGLNNurHwbf7GjiTwzZ7sj0O/f5SJtGPav
	 ZDXJoT29Ko1MCCfLJuwFAQI7y4UZNhZy5X2ZjfrPZojT2xp2ccCGZLi60OAH4V3vo/
	 xZ+lnwXwtUw8MTZhbguSzU8K01YAZfazsO0JCZz3G+hm+Gni31Y7EYhUlxEC2quNb/
	 Ox+nNx7Ra5vrAJqFGl5Wh8/rvuKbeNdW8aQvpPpZsSLn2s311vkrQaEXkSKTBHy+7u
	 tWKqPTDgiMMqh78W+tD9F8uHuDIAY7nqCyqcn+CBuBh/R/YAd8z0U4zb9aBWf49/2g
	 f/3suo4k9RBtQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:29 +0200
Subject: [PATCH v2 47/78] drm/imx: parallel-display: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-47-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MfA+vFaXbqTAVMVSt1LE9XSkKBD3WIqzlMHPHCFR7F8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlqlyNbu7Pbj73ZzXh9e+6+kuT7R9bt75bfzXbA+5uTM
 PcOf837HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAityUZ68x+29a4l5c9d1ju
 c9r/6veF/Z/Wb1tqW7Gt+pCLlnXtihXLnf+nWByy/ug+07mn0v7PZMaGbc8XZiyqCXqxfn6bVd/
 0ny7JX17/k55+UPv07aLFRzzVY17/No1Kuv7norrBpE6VyKP+AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 0f06db95f00f..eb75827394f8 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -178,11 +178,11 @@ static int imx_pd_bridge_attach(struct drm_bridge *bridge,
 	return drm_bridge_attach(encoder, imxpd->next_bridge, bridge, flags);
 }
 
 static const struct drm_bridge_funcs imx_pd_bridge_funcs = {
 	.attach = imx_pd_bridge_attach,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_check = imx_pd_bridge_atomic_check,
 	.atomic_get_input_bus_fmts = imx_pd_bridge_atomic_get_input_bus_fmts,
 	.atomic_get_output_bus_fmts = imx_pd_bridge_atomic_get_output_bus_fmts,

-- 
2.54.0

