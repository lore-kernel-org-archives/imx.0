Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D787234A3BF
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 14:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323287; cv=none; b=gh1129SZI525cAiIaDDtHiDDNR2XV48FQaNXAynfIZIHLXOfGP91194dsepO0J12i+iO5Whilfli7uMwdphjzmwHmrzyHYMKSZxnLq2ucYIWGGeG1zyUZ5V7p4rZbbqLYhzsMW9LO7m0QNT7mZYeY2ao60MgAsecBAMZL/kq4VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323287; c=relaxed/simple;
	bh=Nvb3sQSKT/NUjKleR2Goli83CcxF9NgzDQ8KwXZNHb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyTT/VVYrjeJD3PdQQE+iu/BVJv4Z0OiAPokc5UsOy8oqz0uFgLwjn8MZ1mPmY9dYvQNE9+wrqHlTIYpWYsDJvdNg00pMklySJtjbkyrw5VMFGsKcphrUpzzq5tnXMaz2KVNbD/xQ6t+ZD9qrYvrzH0ZGBxeIKBb/ruZTWsvgbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mb8A6/ck; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mb8A6/ck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9E11F000E9;
	Fri, 21 Aug 2026 14:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323280;
	bh=HnuPHnPR0uKGZFBF2hT+lAFN0XPjFtH3e7QDR603AVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Mb8A6/ckbLdiosXJZAM2YVojp+yWH+zEL7jl++sb4NFMmxJ0blFi3mf/sAQ9ex32v
	 Gidmh3y5jcj/KoHv/ALd1g4vpMIqELnGclJX3kmERCdB5aXkiQPOtDtbLtQ0i42QBd
	 xpgeohoEPP5eAenySN6WMxYtxjeXFO0bfsoWRK8NItYxmccsBjsRFAbqmzJawsyhEf
	 uBpQwzW62fAYRuFk/XNpA3xyobZxHxgyhYFY7Ew+FmXM6mdZgx5Sg9gjRVgeuERSMl
	 IbKgI4SiHmhL8ZPvhYwcG8RuGoOgcdi6hJivryrHx9WP5/fRfcWTLmU2Maxi3oN+AW
	 WHRAmSglTY2CQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:39:25 +0200
Subject: [PATCH 49/70] drm/imx: ipuv3: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-49-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2506; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Nvb3sQSKT/NUjKleR2Goli83CcxF9NgzDQ8KwXZNHb0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdyXx+T3JVvsXsF5rY9Fm6S9/MdGfiQ3e1fu/GrAlnn
 2+yej+vYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExE05SxPlf3f4BI/eLiWFPR
 kw0BZvMX94cFaz04HRPAn3D4zFwnqbWPYp/vuDDzjsSpmqJVVWe7GavZHs00fWHv++PfC5GbOmW
 bnyyLlRIoclmuOXH/7gNaFd0/nPNnxvz/uLrlVYF70in9hBoA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The ipuv3 crtc implementation provides a custom reset hook. However,
this hook only allocates the state, initializes it with
__drm_atomic_helper_crtc_reset(), and frees the previous state. It
does not perform any hardware reset.

Since this is exactly what the atomic_create_state hook is meant to
do, minus the old state cleanup which the caller handles, convert the
implementation to use atomic_create_state with
__drm_atomic_helper_crtc_state_init() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
index 1405e50ee56b..f4fe1842cfae 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
@@ -105,23 +105,21 @@ static void ipu_crtc_atomic_disable(struct drm_crtc *crtc,
 		crtc->state->event = NULL;
 	}
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
-static void imx_drm_crtc_reset(struct drm_crtc *crtc)
+static struct drm_crtc_state *imx_drm_crtc_create_state(struct drm_crtc *crtc)
 {
 	struct imx_crtc_state *state;
 
-	if (crtc->state)
-		__drm_atomic_helper_crtc_destroy_state(crtc->state);
-
-	kfree(to_imx_crtc_state(crtc->state));
-	crtc->state = NULL;
-
 	state = kzalloc_obj(*state);
-	if (state)
-		__drm_atomic_helper_crtc_reset(crtc, &state->base);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_crtc_state_init(&state->base, crtc);
+
+	return &state->base;
 }
 
 static struct drm_crtc_state *imx_drm_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct imx_crtc_state *state;
@@ -162,11 +160,11 @@ static void ipu_disable_vblank(struct drm_crtc *crtc)
 }
 
 static const struct drm_crtc_funcs ipu_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.reset = imx_drm_crtc_reset,
+	.atomic_create_state = imx_drm_crtc_create_state,
 	.atomic_duplicate_state = imx_drm_crtc_duplicate_state,
 	.atomic_destroy_state = imx_drm_crtc_destroy_state,
 	.enable_vblank = ipu_enable_vblank,
 	.disable_vblank = ipu_disable_vblank,
 };

-- 
2.55.0

