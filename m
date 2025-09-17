Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0FB2DECA3
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120425; cv=none; b=OiPzvA5VA0+Kfzug3APFtdCC8v396ugNJVrU1YqIow50iDpgM/KfOHH/MtbXLAU3xEfBbxwqgamy0sYBaBGp54UIF+UHsYTJpCczeX3dgJYm7Zcy2Hfk1Ky8j9mir/7l1BdVowgxm+2QiewK7kEcShfAAxRbRgS2mDX9n3njBiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120425; c=relaxed/simple;
	bh=HLj2DGv7X+3GgN4bhH26Lcv2FafvzGSa38moFQKbr3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKQMaWpWBSXxt8t+LIZvdW0hpGvGP4jMOXN4Azo2N6EsphsWNOwaiTX5Th1npC9MGP6iAIY5oYzhyXukIxSEg59LZDyDvjB9jpIpP1Z897esCaYgLCmqEuc5fNb9oZmUsWeVRHPAktPFyd5ORkibcJCdvh3mdvbgWlxl++ilPDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWYoLutd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWYoLutd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A97CC4CEE7;
	Wed, 17 Sep 2025 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120424;
	bh=HLj2DGv7X+3GgN4bhH26Lcv2FafvzGSa38moFQKbr3M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hWYoLutdpGzJBRy9cqdChREz709dZkL1RbSG2YPcvN5weUO/BDqAHtTCjlsu1I839
	 zZDFTe4lwW6IEFv6K8H6FLWVo8HZwV3Ef4Fw5la7zLa4kkwKkzmLQ8BsOHgIYIEMpg
	 wTNSPuAgNd8Pirv29Px4MZfBHJuPZ5CDXVyqLXvEXMLFCKLFE66uz4LKqQ4lbWIir+
	 v08HtM/CXtykRz/9jY1698zvoNV6n19WVrcqnOIWN1js8xBfdvPP1qkC4Fx/yLVV2N
	 vBWKaOAQCQzGUCUWHCXklaDzSVDcIDVeKJAXh73ecsoDQ9Uoh3i6Qt9J+lX9EpHw6h
	 x5SseSxHElXHQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:00 +0200
Subject: [PATCH v4 19/39] drm/imx-ipuv3: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-19-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi5fwbk231kgIulA4zbtoItBJfnynpx3jnOmB0yZ9
 cvSLyCvYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEyk8QFjrYCozfv1f35Lv//x
 KWnRwpcRdd92Jub2iPsrrJtc/c9G9MHerXXMpXe4epzig52ypgctYqxP3mSy7bRgnJii+NJcvc6
 HWRHn4tXXljCqbHp4akbepFDRkkslD6Wbtn3WXThZdprIxCUA
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

