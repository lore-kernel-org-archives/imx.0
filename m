Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790CB4C77BC
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323194; cv=none; b=VS1SAQ0M63WefwFjztv4PmkAh+oG5y1u+di1dPJ6Dhw6sI79sMFXT0p/yeUB5BsmT7sBjleha3WLNjlmYi4flXqVRHx8jNnrfVpCaF/rVmQxRu2MpgMJmBuG5xLado6WsEE5kzhmU9LiRo4wBJ6GlqqpoVQR4kWT0UgSNWzfWvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323194; c=relaxed/simple;
	bh=tsTVkYe0Maw90V4DKAaothNCGq7ljO8IchXBfzTS0U4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJe77RX9xFVBWgXibPEAQpjg3vu2mVvkXs9k4071WuMnjWILoQ3bFd0Ln+YZltJIpqX7eoHJcxFIs7Nkm3hde9Jic/Iax56LyOHrkqyEF7dQASo3whCig0fveUbfQvt1gaue4DfX4z15d8rQ4d5jH18947w8LjwfTvqNkEv9QNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVo8wKvz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVo8wKvz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8341F00A3A;
	Fri, 21 Aug 2026 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787323189;
	bh=hwxL7XtcEAZjaVbDHCW+agdAGFexEJhyXRtDWZOhhHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FVo8wKvznr/UdNjOv4+3cIE/erZ6Mxiv1IlPcdqOhw6eTTED5QueF5TF2nvJyotCd
	 aGJXs4Iw05/mTGccrq2b4EKP7gCsbGQjq94bJgOqiFZQBC6LTWWaGvjPDGYo/yQg6C
	 W2l09pHC+OH0mjDi8ENvnvNC31Y6KatbfmzGtR0/UKMAhGY+kunhdvhvJgFrlKwzTF
	 vBlTaYTIytCnpxzWe3dV3zyiHwo/S7EZVFHQB+joOOf6hIfwPTRpgoPD0I2kA7Gj1U
	 rOSElbferaAI87/NDB/fVPG6APd24sRQFfoLUPBm7NayeEUjLzPon438MLSVyNVkbX
	 5GwjcDehQsheA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 21 Aug 2026 16:38:47 +0200
Subject: [PATCH 11/70] drm/imx: dc: Switch to
 drm_atomic_helper_crtc_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-drm-no-more-crtc-reset-v1-11-fb793475c05a@kernel.org>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tsTVkYe0Maw90V4DKAaothNCGq7ljO8IchXBfzTS0U4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkdSX/Y3ffv8vru79HcnmX6wMU/xmCN/Jadfh9f6gc3v
 PsiYu3WMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYysYOx4a90Vu2N1M5Wb+e/
 p3s7202mcm+Re3x6/5qkG6fmHqx1j1jtmqnN8f+yddyseM7VNmabGOtDm6Jf3Mp+XGV6JKLD3eG
 LYWdf5BKhP2GGzOufTVCtrlYQ++6zVub42lsdn/X2M4kobAIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The imx dc crtc implementation uses the deprecated
drm_atomic_helper_crtc_reset() as its reset hook.

Switch to drm_atomic_helper_crtc_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev
---
 drivers/gpu/drm/imx/dc/dc-crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 764510ff90a4..0d64186a9901 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -96,11 +96,11 @@ static void dc_crtc_disable_vblank(struct drm_crtc *crtc)
 	/* nosync due to atomic context */
 	disable_irq_nosync(dc_crtc->irq_dec_framecomplete);
 }
 
 static const struct drm_crtc_funcs dc_crtc_funcs = {
-	.reset			= drm_atomic_helper_crtc_reset,
+	.atomic_create_state = drm_atomic_helper_crtc_create_state,
 	.destroy		= drm_crtc_cleanup,
 	.set_config		= drm_atomic_helper_set_config,
 	.page_flip		= drm_atomic_helper_page_flip,
 	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,

-- 
2.55.0

