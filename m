Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892719;
	b=QGFd/qWRdWTslIhQ/+eNzrQqc/YhY4apFIPT3ahh6i3WonnbOLzK9XJqUy0lbO/hXM4Y
	 sHSv6jXzexopWy9L/PF+o0XRSYeCRDoSmpZ6LnWyy3ditAQvhFgZTjAvGDd3cg4LQ2OCK
	 oIHTWi5pBjDB4sBEs3qG6mofKMw/PYlWO6sDLEX72CdWGogzxANujNyYfBVK0b2V5et+J
	 NyMVPcJal08ZqMM5SCLn1KdHweQGkbThxwrbOWX+2MV/gpmO0srnrcWBMDfUxIdvO9N4y
	 IAA4WPYtqBLs59ITebiOX51ZPHyviVlRsDiN7kBXYt4Wq91/WBAmSjgfOq3bb3DzijA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892719;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3LOFNckg5sV+t6d5ADNk4G1bEFmQfPz5mEWgPPfIzEU=;
	b=4SmZnY9yX9OkZTx70hshthSn28pzVzByuWNtI3aNh6KWl45aOJNV//Vdf2VanjKKCln+
	 0qAAfqx0eyqTmjnvkWghmgS9RA/c5feZrGRChzOVui28e2EtwdgOPuczC1s6NG4Fpok5Q
	 2hvLUNtYNPDwAKmATtt+r0CysZJWUivpr8BnPB364oUQYHzBqZuTa5ncy/bDvRtrfOdMm
	 RTCRS0ElVGHZqcDqRjkbsHHjymNuVGnmEEydt120gpFA98S/LxsR8o+kmltKmdHnYkF5j
	 /LYfw6mSmiLvmw6RXz3M21XDzfE6x2cpaVe4HGPdfGdZ7bIRzpxSg68uvSTDnxznscA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ji1trd3K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D60C606D803
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ji1trd3K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2BE1F0093A;
	Thu,  5 Nov 2026 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892718;
	bh=3LOFNckg5sV+t6d5ADNk4G1bEFmQfPz5mEWgPPfIzEU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ji1trd3KJCSE6tAlpzKIrSBf6HQ1vy1V8qseIo3CfRAc7XynH7hTgiIN93qmQo5tF
	 RhZKECjDm7mC1zhGO7yzxwweekma/YDc0zlZqllKaGbnd310xh46HleXOjyblOQeQN
	 3/TIEJncNhGiQWwb3sNVumW7j8wvVPCJQp4uVSvIIM9k1y+WJ5H5VZimGXCMhFVZJo
	 7OG1oMEJHDGIrB8RVMRvvuk2LWVAqIZ17gqMbSWVrh63lzmRNivXHw/kb2mromxmyp
	 2C44DY8lFt2QcVzJiMlv9lOX7M5EVtWdIYMGilx6rbUzd9Gpj89gih2JOPNB8Of3km
	 XudFcXEsv4qCg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:38 +0100
Subject: [PATCH RESEND 29/83] drm/lcdif: Switch to
 drm_mode_config_create_initial_state
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-drm-no-more-config-reset-v1-29-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Marek Vasut <marex@denx.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, 
 imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389; i=mripard@kernel.org;
 h=from:subject:message-id; bh=x/39Ikdb61ljdtuhzx4E9VDxd2EX/mjoQLPOSxbG91M=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFrxi5IvaMSPpxb7rvpyBl3b8at959suu986rbk4s4
 C/9q8he3jGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmIruZsb70xp6f72ZUWu1q
 /59RcuKHmOrDG8us+5vsFIpFO7/597ttjbpinyYoLrVS5E7QdYMrjoz1Va4GHNyXpa53+tws0Hg
 eqmDrUHa4m0/numKIaHPdhe3ftsfukLdjiTp8M/3czvtHtl0AAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

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
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index e2173c4d6fc2..12d844b282dc 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -196,5 +196,7 @@ static int lcdif_load(struct drm_device *drm)
 	drm->mode_config.helper_private	= &lcdif_mode_config_helpers;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		return ret;
 
 	ret = platform_get_irq(pdev, 0);

-- 
2.55.0

