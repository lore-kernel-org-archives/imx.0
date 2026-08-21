Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0B51DF980
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 14:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323298; cv=none; b=SMw9+JC7oXHiAciOARTc/bD85a3Y6bjCLZCcHkB+fjJo4hRCyC7BB5bncjsXFuEaPZvQv0+AJ6f/5mufAPb7XTHMZLXDWx8+l9/wuwwjYAKK8Hf7QKkOCdzMs3/UlvwjCoNcTkB/r4uvQsXWy8/IkeTpNrb9I9ESBickbdOi8NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323298; c=relaxed/simple;
	bh=QDaJrKua2s3tk+JyjZAGBJwqt552ARvhZxmU87Kbaxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFZTy0m4U7gu1KG36d6r2JNkeBvPeGe2TKLqz66oc8tCGQoKCCsAofE1t37S1fPIH7D395mKomutZ+xzCckb8yk/qC8/HnsDBOYGez1veC6kF+nG1plHTrbRm+dZH5ZuZwAtA0mQ48dJZHGMJ9YXYbL2yhnWyfDO0BOLmuRz0u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JfiRo+RB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JfiRo+RB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81AC1F000E9;
	Fri, 21 Aug 2026 14:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323297;
	bh=CnsmaFAgylDWKtDZ3FHx+2lPuiUhX1z8iAZ1+V/AvJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JfiRo+RBLx4ZLpIAxGhT4G3KF1ljHCCMOLKGrq2H7+U2Jl1SyRNE8YHh2htqZaf+K
	 qG62o0grWpcQkGq1rd3tmBxZkgsRHHzOqjFOG+IdanIL/6e0GI+066iMcQ23N3A3KJ
	 Rn+lHh2FLwPt7kB0MpdQmPuhAqddal/D67Fyk2iMHxQZvxIoc/eDHJu973IEgGCoNt
	 Z4e+6XRb+3lN+FARpxDcFSwtucvn7yUSUFswFAb9jMWJgG2rsaGp5YjN8GQTkH9ej+
	 SRR72jdWSeFC8DpCGgXXpcJrvGpY2/c6x+Hv9LY+VlWcBAx8Dbqakx15cWFFW49FZH
	 h2J4Oe9s1LYog==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:39:32 +0200
Subject: [PATCH 56/70] drm/mxsfb: lcdif: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-56-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Marek Vasut <marex@denx.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, 
 imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520; i=mripard@kernel.org;
 h=from:subject:message-id; bh=QDaJrKua2s3tk+JyjZAGBJwqt552ARvhZxmU87Kbaxk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdyYK7dximvJXboPXnxbXTUwS3Ruzcm5L0f0vMHMMjH
 9Znv6+d1TGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmInKJsYp5Y8iCsueSjfoW
 us/ikvhPLZGaYcpkGlT880byg3f8S/lfeJhF1/K2q4p+uHB0V+/Ni4z1ZalBfg2sTj6TuOSvtR9
 VktfR3MIrvj158ZZTNqmTNG5k8KzRvX6o38HgoRBz69Fbul8B
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The lcdif crtc implementation provides a custom reset hook. However,
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
Cc: Marek Vasut <marex@denx.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Stefan Agner <stefan@agner.ch>
Cc: imx@lists.linux.dev
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 79e0f483ca20..5f0fbec3a390 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -594,22 +594,21 @@ static void lcdif_crtc_atomic_destroy_state(struct drm_crtc *crtc,
 {
 	__drm_atomic_helper_crtc_destroy_state(state);
 	kfree(to_lcdif_crtc_state(state));
 }
 
-static void lcdif_crtc_reset(struct drm_crtc *crtc)
+static struct drm_crtc_state *lcdif_crtc_create_state(struct drm_crtc *crtc)
 {
 	struct lcdif_crtc_state *state;
 
-	if (crtc->state)
-		lcdif_crtc_atomic_destroy_state(crtc, crtc->state);
-
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
 
 static struct drm_crtc_state *
 lcdif_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 {
@@ -657,11 +656,11 @@ static const struct drm_crtc_helper_funcs lcdif_crtc_helper_funcs = {
 	.atomic_enable = lcdif_crtc_atomic_enable,
 	.atomic_disable = lcdif_crtc_atomic_disable,
 };
 
 static const struct drm_crtc_funcs lcdif_crtc_funcs = {
-	.reset = lcdif_crtc_reset,
+	.atomic_create_state = lcdif_crtc_create_state,
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = lcdif_crtc_atomic_duplicate_state,
 	.atomic_destroy_state = lcdif_crtc_atomic_destroy_state,

-- 
2.55.0

