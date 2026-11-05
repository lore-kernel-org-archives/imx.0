Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892722;
	b=WPjtt+nrwz5stWXJRY/t0/fFhnCq9wy0Qo8BAXA06Mc6exUzukGei22rrzNrX4YD/4Gm
	 KpAIEUyoA3MQTrTVux6LYilRBCa4z9oizoi18H4sqJsv+dDx+UoKjm1rdf1JEXhnece6n
	 tchfTvz6N9iYTxfWyCRPqIdM9yFhCTbMNQF0rLijvgw1Gq3wEueB6kpoo33XlCVqssPCW
	 b5q9YdZe4HLL70s+6XRRsSE6t03fw0blgBYcWzREgnLedcYS6hj+ywenmZznXf7ieznZV
	 hNYuCVkMSsbPpvLdz5mDK6Cb4XLJhXKq0p/3haRnGphnuLlu9dG90l1oQtvY69bqhGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892722;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FjXjIN+CBYyI+JYtTID5+LH5eyxhgdXC1OmWwVopoi4=;
	b=R8+tul0xa1hr/yriiTa2jFDE7iJWMEhpvSzdLoVWrFnlL4HGNwEZJqXHHIsy1vXvBtE+
	 CMeBGXeXAa9jKHmNjSM+A+/WWkizcgztzJFL6Y6R7AjGz/g3dckCiEt2zZUcL2AKWo+HC
	 +23BM3WC87SKweiJBkuks0E2vvOS6SNxFnNkQZ9/O5jeqJBXHhMCtIso6Vl+oyxD9U1yt
	 A2/qHZ7N/WFJAPg8fq5M3l+KvlIuWKqvSaEu9k8Al8tF8A5qgUoJMAPTD786GcZ3dCjOs
	 a61L7KkuUy9tE3wOCRzYGmISqFACDWuNTSnwzrbwAtO1KVQmb7FbNOwBfAYagjKVI5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ok2xSvZN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94913606D835
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ok2xSvZN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18741F0093A;
	Thu,  5 Nov 2026 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892722;
	bh=FjXjIN+CBYyI+JYtTID5+LH5eyxhgdXC1OmWwVopoi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ok2xSvZNuL73EMbNf/9IvmbypZehbtrFnFH4JGy0jpZ5HnB62IU7pndDXbbBn3eKp
	 4LHws0C5FzI5zgt0Vv2862iGpPtWM64EOs0eVqifSO/xlvnTl2q2e1WqbwPO4nQIFP
	 V0m7H4NedSXvwl/eRctb7g9wnyj6iE4Pz4t+m3gRkKa69ePWaEpQEFgDJXX/VoXeWL
	 uWTz7SPmZHfofZS48hgJwFq5dOGRqz8Vj/jWn3iWxqwMza1ucP2CrRmFH1chhx07Lk
	 /vglOlP4B6Hlauoh/FZdyWQL4tN0NKiSEuxzz2PAuAP0GX8lXi+dK3fAZZDCU/AzPw
	 Wj/MbZP/IzkYg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:39 +0100
Subject: [PATCH RESEND 30/83] drm/mxsfb: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-30-1f58d1e33380@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zKNcy+U5lolJH7X+spEawzCpdBtBuTjQcaw2ZBlxBys=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFrxKnbmzJn1t8oyvm27H7bsl1VrYc+D1zcqpXxp3X
 M9/nHptXsdUFgZhTgZZMUWWJzJhp5e3L65ysF/5A2YOKxPIEAYuTgG4yAXGGp4X0lYXy5e5Bzp3
 Tjn4+MfUCRz/hflSdrzIX9RqVtRg12JRd9hgV5LHNFkG/vbad9yJjA3zLnNPqetVnvayTOhcg/3
 HCnlV83XX383y+bvVbkWIb4hX6rL2iw+MBc/c+7HzHsuXGm4A
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

