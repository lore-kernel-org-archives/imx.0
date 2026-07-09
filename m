Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBAD2D877B
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597927; cv=none; b=SvVBUfiBhwLgTxYau/EbkNbfsNCQMGShFD/Hu0bekq/H1pkMG67peptzrL4BxAamf/qnHVlIDGEUVDN09tB4q4iewuQ++g6cPNi8KjMuPROHVJU6rZbu3Vtg+YkVbKni5pAaHR3NYK6yO9XTTXt0NAmvadCyBONEMjFrEzDDO4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597927; c=relaxed/simple;
	bh=YtCcbLp50K9TPu7Ouja3Zoa3mE9DLOLjAe1pk7yc5tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsKon053/BKNUaARAdo8367fmkJsvT9453VfeYhVHmwub21PuvT4lcdKyui50mYfxuZUon+z/qUc1a6nuAOh4NHQg4XEG8iP/Ht0peFu7y1JL3Re8dpoopoJeFe7LkjkU2qCi5lavGS34VVX+efx93fYGsG9H0D69pSphVTG4Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxiYWCVH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxiYWCVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4FF1F00A3D;
	Thu,  9 Jul 2026 11:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783597922;
	bh=7M+7uC8nKBfCAQhppnMx15BPmGmv14yCNbkDWJSe4qQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mxiYWCVHry4XCktviRkoLVkoqIkUQ/Fs5pKyscQ6QKxB59hsavLofWwdFfLV41j6j
	 /bUORnM8WA9p8XB5OO4ABbOl8aB4BhxROlss4xLWqTUlPgyKwED//n0uX8TOI9zqFu
	 iMM7qfhDlmm4kkMDIAhZmtQp2mR5R8aBJtuqCg6QqV9BdQDAMvOqX7T0A+Lw579/QJ
	 leT5NhBjkyOWyLC2xF2aZ2RJHUdQ0/hV58gf6ReI2pU8OyVFqa7XFiKuzOzvYud5Q9
	 fC43yNSWfzox9SRr36NiL3cz+fmWQo8TzfXL5rEC2cAvJ30F5UdabOWOfzEoaBpzl9
	 +0H30jEPQGsTw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 09 Jul 2026 13:50:51 +0200
Subject: [PATCH 25/60] drm/lcdif: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-drm-no-more-plane-reset-v1-25-302d986fe5f0@kernel.org>
References: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
In-Reply-To: <20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Frank.Li@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>, festevam@gmail.com, 
 imx@lists.linux.dev, kernel@pengutronix.de, marex@denx.de, stefan@agner.ch
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6141; i=mripard@kernel.org;
 h=from:subject:message-id; bh=YtCcbLp50K9TPu7Ouja3Zoa3mE9DLOLjAe1pk7yc5tw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFn+3SLKvHY+FhE5zmyvCuuY+Vp0O4z4P7P+k53VLPi+Y
 Wtx36yOqSwMwpwMsmKKLE9kwk4vb19c5WC/8gfMHFYmkCEMXJwCMJG5lYz1ab1Bp/04jz+4LaH+
 84paU8rT2yelZzUkr1zweOb/6vW35smH3AtVZGz5svJB+npn8Zw5jPVBipdfT3uxalZZTbDfZv0
 /fOtsdO6s1FT326g9L5qzp9zpwo7ca4ffP1B+vMzv1vtnkTUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The plane only initializes a pristine state in its reset hook
using drm_atomic_helper_plane_reset(), which is equivalent to what
atomic_create_state expects. Convert to it.

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
Cc: marex@denx.de
Cc: stefan@agner.ch
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 79e0f483ca20..4bd826e1de4a 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -722,11 +722,11 @@ static const struct drm_plane_helper_funcs lcdif_plane_primary_helper_funcs = {
 static const struct drm_plane_funcs lcdif_plane_funcs = {
 	.format_mod_supported	= lcdif_format_mod_supported,
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.destroy		= drm_plane_cleanup,
-	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_create_state = drm_atomic_helper_plane_create_state,
 	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
 };
 
 static const u32 lcdif_primary_plane_formats[] = {

-- 
2.54.0

