Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887793;
	b=oc4SvTFSf2aYTpVnTTB6Ld+yBaPIBb4d4EehkQFb6x7DQ6ynFqnm/yObev5RoeQxhOm5
	 u+xT0FKi0C2ClpxRP1EiggRTo11xtALiSzBzHhN3+gfktOiqNLhWTt6rp3rfkzO6T2GE3
	 fdwHUthtqiFhYQ4/CbaKI0EdtxQqBtph65k1VPgFfoGgbeAZ9kV0dPsi9kDrwUVaK2O8W
	 6dBoBGuUR41/oQ/ccYRZTKDTAuiXtNkeOcCOFrlD4K2+M/oFNuJ0sEAKmxmjS9bOTyT5C
	 Li2iNI6Swk9BNy+3QtksCi/qTPewTcZQP5xn56VSCIWb0SruCnyAgXm/oLMwcdOSOtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887793;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FjXjIN+CBYyI+JYtTID5+LH5eyxhgdXC1OmWwVopoi4=;
	b=pBH/Wnj8+7SIGskx2rXdNXPRcHf2WPWnziIF4vrooj/+cpMn5jfj8GfRb7fr60tAhDZy
	 Uv1PfK0FhAsupa1jhIpwqbMw+VjwAGBg9C1R1uA3LlE+jzIN5im+IJLPg8X8N8diSrMkO
	 3GigVum18QzGUjmvGAdlMBWAGdmu2C2OXHoKxQUazdHVSpxA4sKDEw7XOpFbZ9utXK+KM
	 sNqrAVqpUHw5fIhse+ZUBDERCGWucEOTjESSwe/mIaG7xL8+a6XqCJE6YHdAMiVI5IrpA
	 KMsB3ZSiC8S+b8OBBRG/07NgSQLlUZ2L3rIGpVkWK2yC76kEQ7rlsclfXeByleQwZUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="OoVhhwu/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A865606A31B
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OoVhhwu/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE841F000C1;
	Thu,  5 Nov 2026 14:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887793;
	bh=FjXjIN+CBYyI+JYtTID5+LH5eyxhgdXC1OmWwVopoi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OoVhhwu/pKMBX/H6nj9ZTyv3Gx/g7ZHnQZEGxYmVcKj5lKml2v0XbTRVdJCCjmHMq
	 IjV9ysoMVIw60Usd53RdI2ENA7EURaNnmMkO6AXxY0gr3OXYJL3G1hJtRF6lY/mUtk
	 +ucgmMugk7LtbRvmWyL3zP9jKwbcdaHgHmIVBMcH/FvZeXp8ljMQUBfhJISt5mNMKT
	 naSF+CISouoD8M/9DZq+D7gq+5oLk044gVQIdlRTw1VXWiNO1gsOr/3/07iUjM0cBi
	 z9mncVKU96ec2PD3FiQOdkPfxOYoGUfDmqWP7k3ly6NXb4Lmon3uNZ+AChylnYZCwo
	 Lklh5uWhj41iw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:47 +0100
Subject: [PATCH 30/83] drm/mxsfb: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-30-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Marek Vasut <marex@denx.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, 
 imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zKNcy+U5lolJH7X+spEawzCpdBtBuTjQcaw2ZBlxBys=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvelcKF6eENLCoFywJdsuP86hXbP9qaamtJj5xmuOFt
 YJl5q0dU1kYhDkZZMUUWZ7IhJ1e3r64ysF+5Q+YOaxMIEMYuDgFYCIVtox12stqJvHGRG5L4N+2
 uTdnt4Ddoeo/IQ8lStWX2N9xm1Yq2q833eWR+8JDJyP6Pz+uD3ZmrI9dFzpJSZZJr3lZ1LVDJ62
 Yb19cIlv4Jb9h2u0HN76+qVq0/9aPifYT51bfyjcuOb2AfwoA
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
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 641691fc92c8..04ac1c06f435 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -323,5 +323,7 @@ static int mxsfb_load(struct drm_device *drm,
 	drm->mode_config.helper_private	= &mxsfb_mode_config_helpers;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		goto err_vblank;
 
 	ret = platform_get_irq(pdev, 0);

-- 
2.55.0

