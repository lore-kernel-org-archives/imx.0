Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F3D3203A5
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 11:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417323; cv=none; b=mBdz4vOos9NDxYq8WU5E2UyVA9lQrAxmXOuoAp29GUGIS/2mlF4IiyrR+1qB/AFeOT21oOwpTqx+9JBM4XDcUAD4Rhfj4+atgjwHhTYaCjqpsG5v4xDcIwF6uXq4Tu5ONNRjZrPJ2NAXjpX6BIynN6Q0m040N+S9OVfvmoiVb84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417323; c=relaxed/simple;
	bh=HLj2DGv7X+3GgN4bhH26Lcv2FafvzGSa38moFQKbr3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XJA1QVBIT92GzxI+N/gl+924CNHZUJUBQ4reh3HXjPDaNlETBg2759ZI8JrgrbM/UCQ8OK5RIBRinHmA4FcD9k4C1fiJVIsDnnFPxg4Ift666T52ndAglf0SEj6QpTu4uRoxmfr8mUr/J7PFTAnXNjlTGIFf054qnoyqDW44+Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOYKXTYx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOYKXTYx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250B5C4CEF5;
	Tue,  9 Sep 2025 11:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417323;
	bh=HLj2DGv7X+3GgN4bhH26Lcv2FafvzGSa38moFQKbr3M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HOYKXTYxBoRLePka7IR85rFUYegBWqtm7YsGOpIo2WqhzaodOalAmU8kq1Dtl4FFq
	 4nfZgugX207142wbo07z2HPltZo5gXcnSyX+h83RfKeWSxs332pXy3GjDwCcHWyeE4
	 uqjAGYfzjEujKshFYJx3HCE54noNr1f+f1jZCbIkwSKRzOJBoisQbtlaoH44FhdIp7
	 R3qbfLuMPtf1gjD3592EKcyqBzAfgFSZDpDuiIXl8l+K+4UX6muJFXasHOM5WV68BH
	 7QctP2mUof9tfdUyHSvKMNuBhMOkvQrdvm4r1WDQxCAUyboDeJ44VoMYfm4ldgwb6m
	 fxE6hroZHEhQA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:38 +0200
Subject: [PATCH v3 19/39] drm/imx-ipuv3: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-19-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604; i=mripard@kernel.org;
 h=from:subject:message-id; bh=HLj2DGv7X+3GgN4bhH26Lcv2FafvzGSa38moFQKbr3M=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+LUSzwpOqnp/0M3m7e1fsv++TlZasu+c+4eTs79Vt
 X/5NzFcsWMqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBMRPAKY8Miq6d5G638FvDf
 KNhitjy6wFAt9XcUy8KGOc9efxecXhrrE3+y5PnB9H6h/dn5cw7UrGGsM5hyO+DE2YTbXSu9fzW
 cbBUVPXn91aToK0bczy0vS682rpJ+6JGSbvbY9Fv7Uc5G8y9XAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The imx-ipuv3 atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index 704c549750f950c3f0ce5d6c6f637d9d7b53fb69..df19560e41b4f5b0dce97ae03947abeaf99e0883 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -384,12 +384,11 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 
 	if (WARN_ON(!new_state->crtc))
 		return -EINVAL;
 
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state,
-						   new_state->crtc);
+		drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,

-- 
2.50.1

