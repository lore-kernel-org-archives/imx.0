Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B47C2D7DDB
	for <imx@lists.linux.dev>; Sat, 30 May 2026 14:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149639; cv=none; b=Up/6h3iybKpE3GeL8SI0QEqPd/nMHNLXFNMPh2Kg9AUIviWoZXlQjL6w9E+YzlEMqDX+3fsDYgnGxqPKLUUh71QAIkHxVXkrlaZyJWvXCDQeO+0tCNACzlGbCwKhbTU3A4O+z7Z5kHK3QVgfCdKv8OfYFWP3ZleXcDb1D8PqhwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149639; c=relaxed/simple;
	bh=IjRf0txpCYJIZmi9hcQ4pAYa8Snt6z9j3RlL/eHE/mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmM4XY/i1e9+DMcpg5xv6qp/5yF7z0ZmUe0cftykS8N/hpiskKcBJb0yTa1woJ/v6qXgBDGBm2/NlsIGhK6f1CxL8nZDK0d9+fidPEvXVtgrRFXIyQpRdqA8uDvKy3LzVrlaQmljatChiSecvf8RQEHp1oDHdpVwS9lYZeRkksM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANhSNCfb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANhSNCfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5CD1F00898;
	Sat, 30 May 2026 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149638;
	bh=Oq0lRQ+8Sk6Egw0LQS10Zvw8ImiJhD6KCyyYOg/jK4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ANhSNCfbgYZFQFfM849jORfcC5SLKmOHlYjP4GcGPt29x6HEm/2kpMHx72LfJEdIY
	 ZYcRWT61i79lj8u+sonPBvOqv/Pzw22IkWUOcpWklU6w+iVySxfkn1e2tXTLiiWUIK
	 1kIMLwYsj9oLF4/rW3xoq1LW2LnScOUT8DSIeaSHkEx/nkuALfpowBczypWGaj89An
	 hiYgNDguhrOBJPafhtDjBSSdYoRowrMKzZEHNM6VckNDysuTd7vtXdHSklJJG1U6z9
	 BX0uq9ZsryCzY4dAs5eD3gvhIZJFPmthZMPiazVVXlKFVwCW9ankOTbYwPCM0/8Dnz
	 W/mX2BujEclrw==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:21 +0200
Subject: [PATCH 16/76] drm/bridge: imx8qxp-pixel-link: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-16-875d828d31bc@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675; i=mripard@kernel.org;
 h=from:subject:message-id; bh=IjRf0txpCYJIZmi9hcQ4pAYa8Snt6z9j3RlL/eHE/mk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb23iPk19wL7HrGr3yimX2f4d0LbPC+XZO6nife0Hp
 +0/V6YrdkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJJLxjbDh92vDvo8LNH556
 Tz5+/MZbJulbj04ytVbkeHPIuSxZG/+oZoLboW33Czxbg8L2bRSdzsBYn6zEWWh0M81T2XfLhsW
 xqySfz3zkzvn2RFtTYn9TWPXWkKMznUXTegS/bSyymvJa5+1WAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

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
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index ee6b6dbbe952..92b8b1ac35d0 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -227,11 +227,11 @@ imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.attach			= imx8qxp_pixel_link_bridge_attach,
 	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
 	.atomic_enable		= imx8qxp_pixel_link_bridge_atomic_enable,
 	.atomic_disable		= imx8qxp_pixel_link_bridge_atomic_disable,
 	.atomic_get_input_bus_fmts =

-- 
2.54.0

