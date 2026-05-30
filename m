Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A68E17A2F6
	for <imx@lists.linux.dev>; Sat, 30 May 2026 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149717; cv=none; b=Irv1FTlmoH0KV1tCoSg5QR8DY8Z0CVOACtMNwSwplOgL1rlUkp9Dn6PIwJDiiCSOEM6E3FJw/mhhFMen59sREN3ZQs0IhsC8p5sRpQe2wtVdU0R8W/mwraB+Aaslw9UVpcdASkpsaBAGX16C8aLfAiJttrtQDK1HCcupyRF9ea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149717; c=relaxed/simple;
	bh=w+4/gZ5eZl1voVGoufBQrlVUuTZA//x+hgNxgwDIyZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZrTqi0pppzy0SwA+xpLOr74ifX29jXAx9kq3SQEn8SSKXXHHmsbhnfx9RPwfZwxbcJ/w/qR8R3HMBLhtp068JT90x+544REK5+DyYXiwMJ2qm5/U2hLOq4WsNzixB9iCCDMPm7arAIvhimtxRVVaQi+ZBTISj3pvI6VkgUdyWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9t6sN0t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9t6sN0t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863BC1F00893;
	Sat, 30 May 2026 14:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149716;
	bh=E//UWfyU6MGhKaC1hBQH0KYtQ8sNEvwGPvQuEq3V9SM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N9t6sN0tF3NXMCdzP4xqoI259iuS+y47S6VqQP3A6L7qBAF/2p1wjmT8YlC4pcePu
	 +TtUYB/NCtu4a0x8kFKuDRUQgP3+q+1HkJF1cyrCEOcTG98/u9OKrRSAC5iI9GL9QY
	 VAtvrj6YpXpXWd9pHL9XVZCWFBePyfXqnaF+J0BVWyFrM9UQsmIx4o7yHuMXhy0iRC
	 I82YRNcvB6ShGtosfJIAIc+pmSCieMxlBbS8FWQ5foYNVR7rTXYcPEL3dFW1aX+es9
	 HCAXXihkcWo3Qm9hV00OCf4Z9SYKUXEjr3SVxq5XXWRPNRuVg9R+TzwVyiE0PjHzTB
	 OhVTbAoR10DtQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:50 +0200
Subject: [PATCH 45/76] drm/imx: parallel-display: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-45-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1678; i=mripard@kernel.org;
 h=from:subject:message-id; bh=w+4/gZ5eZl1voVGoufBQrlVUuTZA//x+hgNxgwDIyZ0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSbz1XzKzjkDHiL31rJXpB6Kmo+q6/r0zu6mg9sZo+y
 /TTxjfXO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEVFQZ62z6Hsx82Fdfs3Sy
 UvQJK+VtE58VMkaqba8TOylb/8xx0sWH3W+4Pm+/Zhheb5v/9eyGTMaGt/cfZPDtObL3/uv+jLe
 nD4ek/vzLz6f6VVNwRwSr4V2u4+eW2FfWveAz4dvw+t20wAMSAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

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

