Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892683;
	b=nswAS/U7UuFkZKnPXhIyyk/hMIKV0eFTx5Dk0oGwKBmb8s5ydrt5nrGqGqPCQ7NpRya2
	 ajvBW9k0gGbfaFY4EFgJiPXMF3xx0F7eDUNb3YED8bnhBeLWFMrW+rsKlL1/qvIjIQ2Vh
	 HIxw2OrznTv6InFUD0UQuXSI8SXfg3Dn1nf6iv5RVaFKXmYX9nyjHuBTkWtoocENqNTEf
	 LQwj3RfPrSFa+Ohu7yrirR7DSNdSp+Frc7a+PLBGIrXmzB9Pjq6C235wMGmBGNcNF+X1V
	 A3T8NVOkugDUMK/nX42/F53NlejJ2n3JxFLZDS2vQ6Fi6LaG7w+E1FHCpTAm3QD3x1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892683;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=k4rz680V7cIAb7iutGeH77t262DzHjpYVR2yTCZegGo=;
	b=qx7Zcf80XssHVs03orIUNbm8bbWiAaZVvC8iWuQeNFG0wV1X513Rye6/Ft2nFO3Bz01m
	 tCaUGDQMS092483fXhtZvXK8k/6BaHRaZyERYYBg8CVUmX8id5aWcDhIV7V34xB3H89Yw
	 AVYw1sCK6osaXqcgnc03sIeuKCTLgb1FvQpPPy8C7av1qYxu5XS4nkicWAHTjnRaI71ML
	 xrW0DUdhKvx1qISeM9UMJrkuNM4ZFGi+i6jO3KhgnAFoZ9+DX8BdW/1R8zvlIUMlCkwHc
	 ONaYjcGLrAZT9xgaOwdX7hdf30GCyWlozJ1W26QRoGuWJbapUK4FbUFPWGydFsX8o9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BB5Ic7JH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0783606D806
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 15:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BB5Ic7JH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4031F000C1;
	Thu,  5 Nov 2026 15:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892682;
	bh=k4rz680V7cIAb7iutGeH77t262DzHjpYVR2yTCZegGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BB5Ic7JHgdYxxa7vuMlU5JnZYwORREKVBE2MT134haR7UF3zBhU6h8PbsR9M5TfXN
	 cO9kBzT8+IztfWtDx2jOcHTGgf24yPDMKVYKvPSOMOSaNVvUSHRHZVOC1GYPwJYN5N
	 R3TNbTdkfqf/A5zrXBdgN7M3G423IHfADSCMNK0fW9s0DE8zU7YU+iaVFehLQJ/R1v
	 5lv73xrwqhzYk2zuvTOrVF+Ny9eYAsuSoz8aJ+THmAZ0mS5hZ/91YWAzHIF0v9fB0L
	 M3TllWw6HqE5odMvbqDg+um+0VI96Gc+3aAIlqOICF4ZuoQT3AuLjRMQHJ21jX7i46
	 lRWVrPmJLO0vQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:28 +0100
Subject: [PATCH RESEND 19/83] drm/imx/ipuv3: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-19-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328; i=mripard@kernel.org;
 h=from:subject:message-id; bh=R1dioC/IosBGQUi4ZFDeC1cA3Y5gHU7STgC448dv8hY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFjzte7NHXXrOct7GrVJMVqy3ndZsn/FfcOqztRpX1
 haI7Vq5qGMqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBM5FsJY33hs7DDsWH2x7bd
 afmzUtvI80JbnKLhWY7J769xzFVo0eadIjh1RrtC0KJvXH0hdxwa/jM2/HrcnuGXsPp87FmG7sD
 A1G3/eh8KTM1cGNyb//dnxkyJoiNrPxdeYLoq4bKw8knd0+veAA==
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 51a0ec043248..b7b6ae8f9578 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -245,5 +245,7 @@ static int imx_drm_bind(struct device *dev)
 		goto err_kms;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		goto err_poll_fini;
 
 	/*

-- 
2.55.0

