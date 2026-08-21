Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13831435A9E
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323197; cv=none; b=JLwa3012aUmoBOkMgQmGktYMswjW59rnh66hp6khjUk6NgB29fJ236hkVTMkyVN9dlAyrx/InWFTagZ2fHwcLkybP91M4hZy+QX0gQv5a/EQ+v8vOY4MWV4QNmKMJ5bsMfB7dC+g700njj4rqDM/qoL+Ii/y5R35OTmGjY96dTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323197; c=relaxed/simple;
	bh=Ca6eRPATWkcV43mpPkL/zTcT/coMFjquiGfHGka5N9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X9zDB5bJFjtXvCswrM5M5wgiqfo4xiDDRMHLlJHylsHtKS04Cy2/CfZ6J/F35TdIpRpwcXtV1KRTXx2x321GY9BTZgBFNPUzm1by5CROfcBcLOVV1wp3MEJIg0DxhXe0FSOoKbSyR7o/hDYQFrLWHz4m0lKNU/GLg8Kph7dx8hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eraA2zU3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eraA2zU3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2495A1F00A3D;
	Fri, 21 Aug 2026 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323191;
	bh=JOs2+92j21kZF3ujFGvST6NaCrCbHTaczAAAGWDfPsw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eraA2zU3FCsk0s1HRAukCzVTvy2R+gGaO3vcyK1nKG9Ie4ymMHJjCjF2O6Qmt6aTG
	 mR9mSoJ/jlib1eDIrxjCtEX8iWRtiSUfHjT6xLt7Sa2uFslw5at08jCUmG94sJNkfM
	 Z2V2QZFhP21GVeIkRKritvibAAiR9ze9l4ks2ZZxlFVBtutJcOCIibzpgT+gpZ6BT8
	 T9D2rNLKOHxKmNBEB7p/uHo2Ak/LchqXA5etgTG5+3J0Rf8fD7A7Os/i2E3xGY/Pre
	 +bPJKxRQrx+JemznogSIIX4SI9Lc4MT9t23Et3bYVb1Q33uODjXc8gjZa9OQ+pDp2w
	 qGBzMFkUQVeUQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:38:48 +0200
Subject: [PATCH 12/70] drm/imx: dcss: Switch to
 drm_atomic_helper_crtc_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-12-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Ca6eRPATWkcV43mpPkL/zTcT/coMFjquiGfHGka5N9o=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdSX/DfvpM8P1w81Wnp7382puKQkpJHY8cri6b1Mxxy
 2p3d2h5x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIAV7GWkkPQQbt0/t+rW+o
 KbsTsZtLwP32HeXP16/Me/9kudrB1suc/q6Tfm+vZQ0wX68zP4B3DWPDp3nCb3OCsm+f1dT8t0f
 618xLlVuPXjzas39S5nkhVc8vHxmfmwWtFQo+aKa7wUgt8PQ7AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The imx dcss crtc implementation uses the deprecated
drm_atomic_helper_crtc_reset() as its reset hook.

Switch to drm_atomic_helper_crtc_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev
---
 drivers/gpu/drm/imx/dcss/dcss-crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-crtc.c b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
index ab41759a9f52..5e9ee3f09d51 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-crtc.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-crtc.c
@@ -43,11 +43,11 @@ static void dcss_disable_vblank(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs dcss_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.destroy = drm_crtc_cleanup,
 	.page_flip = drm_atomic_helper_page_flip,
-	.reset = drm_atomic_helper_crtc_reset,
+	.atomic_create_state = drm_atomic_helper_crtc_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 	.enable_vblank = dcss_enable_vblank,
 	.disable_vblank = dcss_disable_vblank,
 };

-- 
2.55.0

