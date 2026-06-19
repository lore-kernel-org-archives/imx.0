Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160983815F9
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871940; cv=none; b=j487xdN/gUJ0Co2Op3BlMPQ9mUkhdo5USCoz7wWD9jziPlLOwsYQmtFSV0eEkHh/wM41S8MJtidxp16S3345u7fGXo6lveWiyoGoqAspmKu0x95lQCv+2Ow80JUBS3NYCJCdtvGwOSgyQScYHXwkelnSlLRumSx6Ts8uqPBCgqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871940; c=relaxed/simple;
	bh=vVVp8GsFRRm3nFu++DWX1HhXskP6Cx0EuWCKzLtmKBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHHBWNkI57PD6bq+RZtLVi2XsmXPORE9qvY6J0D3bChCfBxgtT0CZDbiXeCI2l5zqAZ1mxanohUK5paigL/bQhXdEK6RmRSgpgv3KCHKoNBgrzeh1DnD6XwBXBsmtE+VpWlDndK/ssy7Kkxq31KSjoYJQgkoFcScJVJ1XbUaKGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWAq/pjo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWAq/pjo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF7B1F000E9;
	Fri, 19 Jun 2026 12:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871938;
	bh=DXQOdX7XBEkUxBf47iwF7kiEHlst61A3B18dKmOcFSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eWAq/pjoQjk8ExHrC7w0y+gamZZ1eEMEXz8nU3C1yc66Mg1n8JG4tfFhIQT00JitJ
	 Jlv8VJFcXyb9w8cB/3vlZwYChlt9uwvPqnjY2Bc1evnVE3ENzvOMb+IZnpDqh6/bYC
	 8bfbtjxEyDeJ7PEVerxzimD6PA4wHJD55TNUB8UfhFg0VDDUOPGu6rsPI/GPrwAMQp
	 z8o3PwyMniRKSb0Pje4UPLFvBYsmyk3ne3ZhpeL9Ig4hTeXFh3l0Iz2FIFsl8qZTEP
	 QGIdwtYJ0kB+alCIJSdoz3LUvcpU7fG73+cJ7zjUie+i3OJgI7ksCG5KFx9fAkgysr
	 GdZRhpqeyEbSQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:24 +0200
Subject: [PATCH v3 19/78] drm/bridge: imx8qxp-pxl2dpi: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-19-ff399263111b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vVVp8GsFRRm3nFu++DWX1HhXskP6Cx0EuWCKzLtmKBI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJp9uPcyeFVzH/fjTwqNPzsqWGW+cYxZ2tseZtb0/7
 FnPhPDwjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRICHGhkPrarketanKr+1d
 JzqxVJGjbtaFzvapyenCa29MLe7/qzd/7a1LvUsiilp/mO0Rs/hjwtjQ62X5+HBv8Zk75kk2ill
 /Ck1Cdx2N3rPHf5XZOo+Ofa5vjL7NPiCjo+MzP8/gZ8nsjYIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 87305d3e0c39..dce1a5b36024 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -208,11 +208,11 @@ imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state	= drm_atomic_helper_bridge_create_state,
 	.attach			= imx8qxp_pxl2dpi_bridge_attach,
 	.destroy		= imx8qxp_pxl2dpi_bridge_destroy,
 	.atomic_check		= imx8qxp_pxl2dpi_bridge_atomic_check,
 	.mode_set		= imx8qxp_pxl2dpi_bridge_mode_set,
 	.atomic_disable		= imx8qxp_pxl2dpi_bridge_atomic_disable,

-- 
2.54.0

