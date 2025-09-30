Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EF134BA29
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759230057; cv=none; b=JjNnewZDl16AkSJ2zmfE+mzU/IsWbO1bMCdNxfjPIcMOzD1mQ+4gnV35x24Ln3CSbZuQpe9mP3RhPE9D/gRmeZBWfzMRUpd3Tu33pgpzNEgS22WPaGzABdYBaVdGQZh3bonN4cJih1MaeuWCd97sPSu2/riAfSLbnb+RaUB7H+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759230057; c=relaxed/simple;
	bh=H9hqFHvwbtkJd4dxZlrZcyX7fGT5t1hZeWG07doE/BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTkAa9s946zd3fQUgJ9Awe3HuzH158YUzDCUYQ2SORL//QVzXQeQo9KybqlrNg1U8mwaVpzNJZr1IXpupFansBM+Ng1lWv5wivzuswWJt0r9xGcyimghNirODEdJqyOwDaRXaW3TPsSSYqiG9l+1FEaF7P8Q+CefGxBtXE4G5rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsG2YUnA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsG2YUnA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AFCAC4CEF0;
	Tue, 30 Sep 2025 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230056;
	bh=H9hqFHvwbtkJd4dxZlrZcyX7fGT5t1hZeWG07doE/BQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VsG2YUnAXHy9g2tAxDWA6ZBkon7sU0o42HzM7kFcBeIrvOLrga8qPPTC80FZp/lyd
	 h634WWExBHpIxWqOm3D9iU8XeK6DPflT5lTccAR/phGNRmmCWILYdtF6w/fSb4TxlN
	 5/sJRC/NlKqGBY9YKHAFFdHF3ueFcNjp1FWJ0hdhdv9FSKRyCEXXwudCe5fONG0+5x
	 6c3tsYh/I0KDiBlknq8Z3r5jvRwiINcQr4BTEgy88SuIGsJIzKKw5gQnmDWlzF+Wcp
	 oRvTJOirVAKKI7V9UGzArvx+bk/7BmfoTl9McuDtcDMWIxlf9YMBHFAmywlgFCiizP
	 I8Yj2ewDxbA5Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:33 +0200
Subject: [PATCH v5 18/39] drm/imx-dcss: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-18-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
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
 h=from:subject:message-id; bh=H9hqFHvwbtkJd4dxZlrZcyX7fGT5t1hZeWG07doE/BQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6jbvOFdLqBz1T/S8o9kwMUXi1+e++XB/b/TZ8GZc
 3PWL9JY0TGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmsqaFseErX8qGWNn5E8T0
 rxyRubh6UaOv2LyCTedmR/05d2lKVyDr9uvqnjGmFbYOng8tBF9O82esdw1ccDdIkKN05e2DkVv
 DYztZntT+SijKOtSpoynw9LJeyuTKE8G/Od7oJLqVvDl+qswcAA==
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
2.51.0

