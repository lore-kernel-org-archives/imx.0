Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EA73233ED
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871937; cv=none; b=WnP3QryyBns9cy/110/2zJ3uVGPm2oCMmdFxZBpGF7ZwzeNsF2Xnu02nhp5yoRAwY7gO3qIsI/ZNeGc9hT0uVwM1LSkfosMhXEC/TuLPQBVsMCKcZMpZtW/usB/P9/g1iQj9mlmsUEoES0o+gGKBnu5oxPAiYo0cHkyhgYEcIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871937; c=relaxed/simple;
	bh=lNh5oV/n8/EUzkNfMs5+aHUSFUX8P2sI5jHfvY6aCT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1Lw2y2JK3CKP3djvclwvI2cadivCEEweDkg2SEzbXkfOuZ0+8S8KkoDJtfnNThXd5bgxl2UkyvBsNGkrQ7S2tUZb4bPSNUkYKS4MRjrVTCLHc0B75PoqWM9Vryf5DQw5qI2cLTk3e/k8rrn4COIHnwMA2GXdORf3i7HAaGQ1k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIc/SSd4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIc/SSd4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D011F000E9;
	Fri, 19 Jun 2026 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871936;
	bh=ykcLps+Shu0CrNHX9F1utrPYhUTEb1kFSaYzGD/riok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bIc/SSd493x31+XrYNvQqaOiokRDpni/al0WTynbN/bZq8+ixD+loex4EX7doYcGl
	 s5jlFbrBREY6Ghc16ZKiofoLbwGSJ7JyPEGfI9qeuX2apoABvYgtM5d4Ql/T6A7+Ds
	 TQoD0EWLqEMZv//JOacYFcXoQVMqI4FzPu6h+ze4cUf7adbaU7d018luPKq9ISoRWN
	 W7VSgvqPSR3Q5vEzfUi1w7SuJs9iUw30SfSmBYSvLVB0aRWBdwCvTIbiN16GWxnv/V
	 bsekKrY8gxOWW0ijQyNUBWLAP8KrANrgpXD3hsvDKr/2cj+BqFTXNwj3aOgBIlj0c1
	 oxiA/rjf6EjDQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:23 +0200
Subject: [PATCH v3 18/78] drm/bridge: imx8qxp-pixel-link: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-18-ff399263111b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lNh5oV/n8/EUzkNfMs5+aHUSFUX8P2sI5jHfvY6aCT4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJh9vM3EdOaH9OSXsRIaoIKPMf4VDkxc5+bHp2ty23
 vJ0XfCajqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjAR7/mM9VU7eM8t/iGrq7n7
 ZcQJ/uPdIpenzN3rk7HVwUGBS3bKwpwb72f+77MIXttZUj1pX/UBGcb6zEWZ5RrTbdS+M05/GMX
 S53V0jViB0VzBqCWJxnIpzwtXdB6Rc1sgw7EgmHFN9QGHq1sA
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index ee6b6dbbe952..56ce6aa76181 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -227,11 +227,11 @@ imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state	= drm_atomic_helper_bridge_create_state,
 	.attach			= imx8qxp_pixel_link_bridge_attach,
 	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
 	.atomic_enable		= imx8qxp_pixel_link_bridge_atomic_enable,
 	.atomic_disable		= imx8qxp_pixel_link_bridge_atomic_disable,
 	.atomic_get_input_bus_fmts =

-- 
2.54.0

