Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF797442367
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 16:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193180; cv=none; b=Rp09qSPj4xX1ukfraEsXVjaj7E/xgpNvpLh5POOTa+tGM+4TxHoeoEJ1GlYArgFPGt9LJQ/KJ064EyKrUf2Z4U78oNuv9w9H+ghqaG9QF8Yc+AVdJ+JDF6/LwAoMMhs8wbU6SYTLJlb6bRYQdVUyH5LvCCHp25B5/aoz6+liOis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193180; c=relaxed/simple;
	bh=FnBERb++oszycagihSz+S+BI8VfJkVlkOZtbJpsG5PI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HAhcdCHebWnJXKcHXbNyJb0BXBmYMyJriIN+xLc0ZVR7/GY15cZYFX9Lq5Lzr7nrV/xYgvXdskgEsXPio7hg1ZaerBPH9CjzCA9PjVrwFFFlJUsCFC0UNLpTAmcn9TEmQcvzX7CmowWkAnkDmgVz8qdjKi6VoIGpTw0hOT9Farw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agddjCM3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agddjCM3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9811F000E9;
	Mon, 31 Aug 2026 16:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193178;
	bh=ZNM/2V0mykS8SK6VlczMP04sxXkuh5GXRJkvZ2iCd24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=agddjCM3dURqmtcXdTJtoSk+MP/OPHly0w4P4muvMypxMdUyA17m7ID7y9qeapGWw
	 Eupdc8ZNGPBTgd2y9zXIZEO8mKlYBI7veoQ74/0AW0NeUlaxEg0aS95ZS3UTmV0qFJ
	 Oym0oXBfJZKgxRcvoi+RlpkkcAvJzb1H2Y7UTcpy/Hhue03e7zjk5rXd8j8UNUKpy6
	 epgQtKd2Q1btkGo1kcRH84YsInaexXv5Zd6hZeYdiD2QfFA93CIBFzuKzEAFyTLARW
	 11DczWgdWoYyU47CzOYm1lqW9MsnVnqid1DfY607FGgTsvmkMpxPJrvzRsUbGMF16Q
	 3nh1tsvfPMRpg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 31 Aug 2026 18:17:46 +0200
Subject: [PATCH v3 30/40] drm/imx/ipuv3: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-drm-no-more-plane-reset-v3-30-1877c7aa57b3@kernel.org>
References: <20260831-drm-no-more-plane-reset-v3-0-1877c7aa57b3@kernel.org>
In-Reply-To: <20260831-drm-no-more-plane-reset-v3-0-1877c7aa57b3@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Frank.Li@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>, festevam@gmail.com, 
 imx@lists.linux.dev, kernel@pengutronix.de, p.zabel@pengutronix.de
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6992; i=mripard@kernel.org;
 h=from:subject:message-id; bh=FnBERb++oszycagihSz+S+BI8VfJkVlkOZtbJpsG5PI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlTV8pufLom7WXZjSN/xKZq/D21dQdbxo0bFZySz3L3/
 F073UjKsmMqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBM5Ag7Y33Y7N5i5utPjI5l
 MFxmE8tsi/224jDr5EMXd+6s5izWYL/fwBh+R7Fe1fbPK+YPpR49UxnrgyZ/5o+Y8PrTZE7DTsE
 TV0zOidqkvpho6fCm8HnfvDDuKKEsvuOWn0x5N3AfWX2HT7ETAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The plane reset implementation creates a custom state
subclass, but only initializes a pristine state without resetting any
hardware. This is equivalent to what atomic_create_state expects.
Convert to it.

The conversion was done using the following Coccinelle semantic patch:

@@
identifier funcs;
symbol drm_atomic_helper_plane_reset;
symbol drm_atomic_helper_plane_create_state;
@@

struct drm_plane_funcs funcs = {
  ...,
- .reset = drm_atomic_helper_plane_reset,
+ .atomic_create_state = drm_atomic_helper_plane_create_state,
  ...,
};

@match_struct_reset@
identifier funcs, reset_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .reset = reset_func,
    ...,
};

@reset_uses_helpers depends on match_struct_reset@
identifier match_struct_reset.reset_func;
@@

 void reset_func(...)
 {
 	<+...
(
 	__drm_atomic_helper_plane_reset(...);
|
	__drm_gem_reset_shadow_plane(...);
)
 	...+>
 }

@match_struct_destroy@
identifier funcs, destroy_func;
@@
struct drm_plane_funcs funcs = {
    ...,
    .atomic_destroy_state = destroy_func,
    ...,
};

@script:python renamed_func@
old_name << match_struct_reset.reset_func;
new_name;
@@
if old_name.endswith("_reset"):
    coccinelle.new_name = old_name.replace("_reset", "_create_state")
else:
    coccinelle.new_name = old_name

@update_struct depends on match_struct_reset && reset_uses_helpers@
identifier match_struct_reset.funcs, match_struct_reset.reset_func;
identifier renamed_func.new_name;
@@
struct drm_plane_funcs funcs = {
    ...,
-   .reset = reset_func,
+   .atomic_create_state = new_name,
    ...,
};

@drop_destroy depends on update_struct && match_struct_destroy@
identifier match_struct_reset.reset_func;
identifier match_struct_destroy.destroy_func;
identifier container_func;
identifier P;
symbol drm_atomic_helper_plane_destroy_state;
symbol __drm_atomic_helper_plane_destroy_state;
@@

 void reset_func(struct drm_plane *P)
 {
 	...
(
-	if (P->state) {
- 		<+...
(
-		drm_atomic_helper_plane_destroy_state(P, P->state);
|
-		__drm_atomic_helper_plane_destroy_state(P->state);
|
-		P->funcs->atomic_destroy_state(P, P->state);
|
-		destroy_func(P, P->state);
)
- 		...+>
- 	}
|
-	drm_WARN_ON_ONCE(P->dev, P->state);
|
-	WARN_ON(P->state);
)
 	...
(
-	kfree(P->state);
|
-	kfree(container_func(P->state));
|
 	// kfree is optional
)
(
-	P->state = NULL;
|
 	// plane->state clearing is optional
)
 	...
 }

@drop_destroy_mtk depends on update_struct@
identifier P;
symbol __drm_atomic_helper_plane_destroy_state;
symbol to_mtk_plane_state;
@@

 void mtk_plane_reset(struct drm_plane *P)
 {
 	...
-	if (P->state) {
-		__drm_atomic_helper_plane_destroy_state(P->state);
-		...
-	} else {
 		...
-	}
 	...
 }

@transform_nv50_wndw depends on update_struct@
identifier S;
@@

 void nv50_wndw_reset(...)
 {
 	...
-	if (WARN_ON(!(S = kzalloc_obj(*S))))
+	S = kzalloc_obj(*S);
+	if (WARN_ON(!S))
 		return;
 	...
 }

@transform_kzalloc depends on update_struct@
identifier match_struct_reset.reset_func;
identifier P, S;
statement ST;
statement list STL;
@@

 void reset_func(struct drm_plane *P)
 {
 	<...
 	S = kzalloc_obj(*S);
(
-	if (S)
-	{
-		STL
-	}
+	if (!S) return;
+
+	STL
|
-	if (S) ST
+	if (!S) return;
+
+	ST
)
	...>
 }

@transform_body depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier S, P;
expression PS;
@@
- void reset_func(struct drm_plane *P)
+ struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	S = kzalloc_obj(*S);
	...
(
 	if (!S) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (WARN_ON(!S)) {
		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
|
 	if (S == NULL) {
 		...
-		return;
+		return ERR_PTR(-ENOMEM);
 	}
)
	...
(
-	__drm_atomic_helper_plane_reset(P, PS);
+	__drm_atomic_helper_plane_state_init(PS, P);
|
-	__drm_gem_reset_shadow_plane(P, PS);
+	__drm_gem_shadow_plane_state_init(P, PS);
)
	...
}

@update_early_return depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	<+...
-	return;
+	return ERR_PTR(-EINVAL);
	...+>
}

@update_return_plane depends on update_struct@
identifier match_struct_reset.reset_func;
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_atomic_helper_plane_state_init(PS, P);
	...
+
+	return PS;
}

@update_return_shadow depends on update_struct@
identifier renamed_func.new_name;
identifier P;
expression PS;
@@
 struct drm_plane_state *new_name(struct drm_plane *P)
{
	...
 	__drm_gem_shadow_plane_state_init(P, PS);
	...
+
+	return &PS->base;
}

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Frank.Li@nxp.com
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: festevam@gmail.com
Cc: imx@lists.linux.dev
Cc: kernel@pengutronix.de
Cc: p.zabel@pengutronix.de
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index c7ec09e557c1..afebd4fe4395 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -295,25 +295,22 @@ void ipu_plane_disable_deferred(struct drm_plane *plane)
 		ipu_plane->disabling = false;
 		ipu_plane_disable(ipu_plane, false);
 	}
 }
 
-static void ipu_plane_state_reset(struct drm_plane *plane)
+static struct drm_plane_state *ipu_plane_state_create_state(struct drm_plane *plane)
 {
 	struct ipu_plane_state *ipu_state;
 
-	if (plane->state) {
-		ipu_state = to_ipu_plane_state(plane->state);
-		__drm_atomic_helper_plane_destroy_state(plane->state);
-		kfree(ipu_state);
-		plane->state = NULL;
-	}
-
 	ipu_state = kzalloc_obj(*ipu_state);
 
-	if (ipu_state)
-		__drm_atomic_helper_plane_reset(plane, &ipu_state->base);
+	if (!ipu_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_plane_state_init(&ipu_state->base, plane);
+
+	return &ipu_state->base;
 }
 
 static struct drm_plane_state *
 ipu_plane_duplicate_state(struct drm_plane *plane)
 {
@@ -356,11 +353,11 @@ static bool ipu_plane_format_mod_supported(struct drm_plane *plane,
 }
 
 static const struct drm_plane_funcs ipu_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
-	.reset		= ipu_plane_state_reset,
+	.atomic_create_state = ipu_plane_state_create_state,
 	.atomic_duplicate_state	= ipu_plane_duplicate_state,
 	.atomic_destroy_state	= ipu_plane_destroy_state,
 	.format_mod_supported = ipu_plane_format_mod_supported,
 };
 

-- 
2.55.0

