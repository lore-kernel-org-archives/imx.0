Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFC32DECA3
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120422; cv=none; b=Q3zY4UUAe8FYZoL6oQOfa7JT4HyxVRZkmLnsN23zbVHo/6NPSaIVmLPfGqkOfpRvso84hLrtl0/z0T22cJMC1eNwOUy/V7mW+N+0kncswW2S29svFfv7PcEWcQQ7xo8VKAxrjFD/uQcI30ODQ2+8WFhHuc04U0k/+rejapbvEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120422; c=relaxed/simple;
	bh=wIIA34sMjqdACOJSvYzTP2Jt6YsaPcn1jljZ4TFuAY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3bxsntR00Dp2J3YhuACZygsKBiHaPNJAJAW9Ztyy/QP7rGFT59MXdMYmFqkwX3Zrpi7oPh2KedX8LSrvi5YkI00Sf/hQfsNwrSv43yMA6qcKNJroKos0jxQZkt0EEbyokeB/cx6u1eCL3Pxt3L0cqjkZ5R1hsASYyhicHnCLN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2gPqM4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2gPqM4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C76EC4CEF0;
	Wed, 17 Sep 2025 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120421;
	bh=wIIA34sMjqdACOJSvYzTP2Jt6YsaPcn1jljZ4TFuAY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H2gPqM4uLpnsh0x9OW+9ovm6mQtywd1YkxR8o/yTylke9otb+QaKHPZaVCu8noxqG
	 TRv9ndYQ0LqAF3lAgalu8ng1GSL1hAqjwIQkofki1QQSDfdsf2Cewfoaf0R9mATecG
	 09TEPU4epGTDtt5s3CmJZ8yThfVyj9jv7SIbqUUUZiivIMRefFgRH81c7a+mFryb4Z
	 UFoah3p+aRKBbRsWopK+DhidFuwHt1QhIbFdmwyhDeCsA2Nx5hFnTZuz5Dj9b9Ior7
	 k/DemE1E0SiCTv5YnYFx709S2gz6a62ZPZ7Zs278Z3pKsCWobD9oilW433IgvUIBhm
	 ERAV3dRIifeww==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:59 +0200
Subject: [PATCH v4 18/39] drm/imx-dcss: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-18-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wIIA34sMjqdACOJSvYzTP2Jt6YsaPcn1jljZ4TFuAY0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi63+GLYvejmgb9rnu3+cWLRsiylehutd7HLnvGY3
 nNecKT7TsdUFgZhTgZZMUWWJzJhp5e3L65ysF/5A2YOKxPIEAYuTgGYiOEnxvqoboXU6ZKTnbx1
 Necl/3Jhu3jhn+PZEFFjG+mWqshlC/RmKsixT7CU6TqUM2//xYuhTIzVrDzbGna/KLp9etOXlP1
 Jzkd95URuP/Kq6Sx1XWez61X91NlGEb8NF4eY/9x1sq2yO8MOAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The imx-dcss atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index ab6d32bad756d080e1c56d7574403febceff94f4..3a063a53c8dfa6bc5bbbf9afc7ff6519199c2f19 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -157,12 +157,12 @@ static int dcss_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	WARN_ON(!dma_obj);
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							new_plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
 
 	hdisplay = crtc_state->adjusted_mode.hdisplay;
 	vdisplay = crtc_state->adjusted_mode.vdisplay;
 
 	if (!dcss_plane_is_source_size_allowed(new_plane_state->src_w >> 16,

-- 
2.50.1

