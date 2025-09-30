Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E45E555
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 11:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759230054; cv=none; b=UieYpr5an18FVOFHr2DM3z+kpbDySEvBWMSvurrZFBRVwUUrSv4thSZuGoCk2I0yYNj9Nr+LVoNnZORDVdyVC2bUoK3XCIg2wpkeq4hF7vPFTOZ16tshSaBZBBys2diRrJGmxpo93QTDbFMOn3Fv6E3bF5ZlUVBzw0vNM0CBCGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759230054; c=relaxed/simple;
	bh=mPLnr3ZEUiPa0Etu18m/cNVjSwFPhksFj4l1U6AHc38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8zdvRtYB2kcHb9eUV5/ohmZ1WFzfHR1M9kG6+tzlvb6Bsey9lTGH3Y0+zMN5Ke38eWJVvRYFiKieQ3Ahmh/UM2Up33cDF7DjgGpe1Y+EyXHmabRgyO/NoEz7FcJMRCWYSzRIZstgrIZt5r6Sb3wV1GwOnb7pjhJhbz+j/5WjiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bffwiXxY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bffwiXxY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F03C4CEF0;
	Tue, 30 Sep 2025 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230054;
	bh=mPLnr3ZEUiPa0Etu18m/cNVjSwFPhksFj4l1U6AHc38=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bffwiXxY5zqFMlGe+XbkCu3qBvIz1hacx45nWI1AXhphapmaYaG183jteg96knrYj
	 s0IHQzo2XaLhApHq08P/ogwcTC8MeT+fQ1NRq1iSTSdN1WiikO4Y/udP2am4kZkPQ+
	 0UkrzRRbCXS4DVuFlDkyjN2U5TUQSeIUfpMYBUEvqNmYZkllmz14hpshO0y9OdY4WO
	 uNlsf4s7FUWACNI5idy9WVc0Qyq92h1L6+c/NN6+klqrERy5U5xlVBlIL+6E0SWtf8
	 fC480tOcsMdtvrUeJaOVa+DkVrlut52nGBnJTy++IaQ9rqsue5r0k5hmz3hgbaQegn
	 ReW9EOHXxjIBA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:32 +0200
Subject: [PATCH v5 17/39] drm/imx-dc: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-17-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1640; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mPLnr3ZEUiPa0Etu18m/cNVjSwFPhksFj4l1U6AHc38=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6jPqfj/84fFt/+R/eKtDmybBQ3vRmUF9hyz77UU3
 r5ueQZLx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIbQHGevesNxz/qv8Yvbx9
 sHv/WTlH3xOSOw5crF9fZMzDpLvF3M9iSsMKa77nzpoLHy99E/VZirFW1NDx7D+R12yWno9evLv
 19+SpXaWhjdsvZs9m+ePa9nLlD1Hh+iXzH2elK256vcykVkARAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The imx-dc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Liu Ying <victor.liu@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index d8b946fb90de638da2bf4667307f11b06f4e77f5..e40d5d66c5c1f0d579a7a1019c0f2e00489ce15e 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -104,11 +104,11 @@ dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 		dc_plane_dbg(plane, "no CRTC in plane state\n");
 		return -EINVAL;
 	}
 
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state, plane_state->crtc);
+		drm_atomic_get_new_crtc_state(state, plane_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,

-- 
2.51.0

