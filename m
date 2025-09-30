Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5589034BA29
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759230060; cv=none; b=K2KS1EQ2OFyIZX5+0VQtEXJfp9Ez21Vh5pUfISGzXhCd0A+04SaxGa6UvJq7Fj5Y6KebwVgi1qNKhgjrUI9+a4QsiMpnrakEyQ8VqlomNWBsCLBhlS6zdZhna7P5iuK+yX+tKvziygoG/ScInMwMLL4PjK+gHOqqVmP0iWZRl/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759230060; c=relaxed/simple;
	bh=86mQn5KQe4ZAdKQShvgUTY8ioShLlRJo5ZDwJwJLDnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PTRN3UuF+sg3kHwlGFpdMKU2/Jg1ulo4hgsVQkc8ZuRpx3S/vIjLkDtq2yfyfXjZXyWq/h6XRvjqe5Zmp28svcXgJwn3BAW6QrX9yl7DfKpTIRMul7Us3K3WlSi96ISA9/OauWC+QLfn8FV8gKq8WUoHCEUWvw3QW2xzdxoR9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkPxGgv9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkPxGgv9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77823C116D0;
	Tue, 30 Sep 2025 11:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759230059;
	bh=86mQn5KQe4ZAdKQShvgUTY8ioShLlRJo5ZDwJwJLDnY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hkPxGgv9XKQyGIQrHR5U76l4LiNVqX6VT67/nHMJ8D1CKE+it5A+oethPO8whWdup
	 UevNc7J49kmrS5V6GW52/WJDWFdsOo6A3CpaXOXKzarP6nCCufyaZBjbYgoJuzMiqq
	 LDyAWQulxoTJazxP8Zb6b+jIlNUG9qv+kPjQUm0MLaGnEiv6xYt3bLI6+lwCecP2Rs
	 5pNOaMqSyCkE7EvSys8gGX7jH0ye4bc8e95FYa17YFGR/p9uVfeo/2f5aXfihOEChI
	 MtH/r61AscuajfE0dQNLZUjMKpYMav3rO7Leb51yoCW+islwXtmWSewO18CI28ALlT
	 KgA2OetYicFpQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:34 +0200
Subject: [PATCH v5 19/39] drm/imx-ipuv3: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-19-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
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
 h=from:subject:message-id; bh=86mQn5KQe4ZAdKQShvgUTY8ioShLlRJo5ZDwJwJLDnY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6jLlM4X8EvKfJFd/11rsih7kN3iI4u3/GdI0pjDe
 PvNsbSajqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCROn7Ghhufud2f8J4uet+b
 VZbxKO3ZcZZTS1aLnRYSVug69mqx569+41uXlIpvMxmsT/60Rkr+J2N9vEViqUw2b2WG4ss6i3u
 TJh2bx+Y9Oc67N/4hl7vul29nYxmaM5MvGx5rl90QbBVkvhQA
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
2.51.0

