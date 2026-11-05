Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892675;
	b=VApyyl6c3z84h2S8EZfnFDvTh1yGEVK/xnPLol+gPWRVOrCRtIFGgzYpBu8xHPobqz3B
	 pUEGPIHz8YWhVa8QOzjk0/Je5IunxvDx5m0HLWGahBPIHSpdr+eBwXawjm3XKyx9ZWQzc
	 iJJ35jmo/rgWGAiiURkbVMG7evJ2SOBmWHAnr0NDv8vQEPpGFuU35LfUSsM3mrwKl97C7
	 j+U7bncadT07ps6ZWFHxuuy6LwuEp3I1UQg6M2eg0kBOJb/SNeLf4YRqI7rozWmvzaFEj
	 vroa584PKBra8e1qxbHDOPREW71JGhST5DjY11h1/OU0MwuIGldefTk2hUQ2A1WbXFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892675;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=v3R72Og6052wQsxjZC/mDC8A8e+FpeF+ChSo2fDBrFQ=;
	b=oZTKDA8fxXUnpwdi9y8H29AkKgWQ3ss9fY2rfbwZZNLXuoHkEz0VYRnIG9pgJzJPvBVK
	 nyjIJ0UI81VLZu14yzdrfqlom2CA9IKPtFgn3tcdSY04cTNI+Y7Ezi0v0i/H9OyO09hst
	 JdhajDRCXb0IUafg+VQMBWFdOMJLkEGoSLSkfHPWk5HejZmJGynwv1ayGvR85SShNF/RX
	 i+12vDFDklV518kQ+QTig+W2F5RgDIUdLsGRMmPZQxCtRa7x1k+YfJit0qFPZX2EaJp7x
	 MSmsShydZLF/111jYxacAeg2m4D4FcL4xctxUDbJsjznervTFnLZ+JO3m1oYAQ+EzJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fLeiuSfs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567CF6082BD8
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fLeiuSfs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7A41F00A16;
	Thu,  5 Nov 2026 15:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892675;
	bh=v3R72Og6052wQsxjZC/mDC8A8e+FpeF+ChSo2fDBrFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fLeiuSfsBVN3mWM3bocH9qCFCzJkHA0g6a1Vhk3t51EusPePSK7xnIysIhQTqY3xh
	 s9eqHWdxGbiCHwnk5eMdw+mPgLMALXoYlBxNIi74jX1ygQuz3bNCokh/xq+Gb3wr2X
	 93ct2T9fqdt1fz/Tci4Mm13Lqv9OIJopLZvQqZXLXb+N8L1KTvl0V1dbrCO8HXiAuW
	 0rBnd600vCfxpCI9WNVuIO9qQ5FGeXkxACADRZqIgrPdkPTU1794gpvVWsFrdpvXB0
	 r18fm6HBILnJxG6i3XW6+FsIJ6kiA1LajUeZc/hbpTrFGOIaLjJB8en0rW0dw8hV7p
	 HGzCoKft9rbyw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:26 +0100
Subject: [PATCH RESEND 17/83] drm/imx/dc: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-17-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283; i=mripard@kernel.org;
 h=from:subject:message-id; bh=iQY8DKnYDr2y14HmImCUNV690p8KR4+MpimH2Sy+wuY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFjw5M9sxfPYZl4Y94SzdL767J0w9PKWY5+uSEMbfD
 UFPfUVud0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJuK9lrBWt92A+YmPGU8m2
 z0LDg7dyDasSQ1e0wzGmuQE+Zn+7Iy1f3G8oElRy0/v0+8q9F0anGRturMk7cP1CQI5eIIdr5Z8
 lvlx8j1VzXyRafbH7vj9hyuJfNzgytpV8yFn5kyffoGZn9iwA
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
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev
---
 drivers/gpu/drm/imx/dc/dc-kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-kms.c b/drivers/gpu/drm/imx/dc/dc-kms.c
index 0e2ce6a42548..7e29b51e58fc 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.c
+++ b/drivers/gpu/drm/imx/dc/dc-kms.c
@@ -130,5 +130,7 @@ int dc_kms_init(struct dc_drm_device *dc_drm)
 	}
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		return ret;
 
 	drm_kms_helper_poll_init(drm);

-- 
2.55.0

