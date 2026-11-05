Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892679;
	b=UTMdtn7ETfYTGXc4YBEG3gkW7Uw03seY9ZzawKyFvcOemfhHYIePjxgMINePycSCJatd
	 hS1y4e5p3y/dEQTgCcE3FgVWlNIFzud7wZ3tgZd6K4eiBgvbUPx10KrgT6nCosxZUeTw4
	 EG8DnnGp2Hse4e60HQ5LKi01yK6Q1yGhlWB1qyvHpa9XlnQ22o1VHrAah5BbcG9zy8DHt
	 a5fH/w1dzcAaph2EBVwcDH3tmds0nN1L32wEAZeUZEfPqPL106aAInzWKhx7nBAsMBxBR
	 zme8WFuqYogJX8RlVy/KyIoqz1N9VWJXy6WAp23ae+xCwCkMV040XragkOQcq2K5e1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892679;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=knwrJcvL7clG1HfpArVpNGWtATX6g5pA/gVZFr5kzV0=;
	b=RoOSXw9T1s9pO+aMMLtibB1Be5wPZfj2XdN1OLz7baxMKvu9+qNrWYRXcr+NPshwxgh4
	 9WPbFKQiWmRWMio4h0SfeejMAUfyNBjXGFZCc52B3S9PLY3Vuw/uHKubHr1ELw7tT9Qo9
	 0fu7viXeLxjKc9CFPjp+EtZv+xby/NDmKJCrhhUx19AyPXVsv1ELmr7oKhbU/W1OfR+tF
	 1LukPoCC1BczskYfbI2jZVOvag5hdHtbqwrAFE5syBfpKn/trwDb8scACRkLCeHQcODCM
	 NPmeT37NRLbfhqK81tXumhwxDQIT0FTuumyecXirdt09l+snTvRi0Xjr8p6EmLLYuEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyQbWkj8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2304C606D806
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 15:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyQbWkj8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CF41F00A17;
	Thu,  5 Nov 2026 15:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892678;
	bh=knwrJcvL7clG1HfpArVpNGWtATX6g5pA/gVZFr5kzV0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CyQbWkj8ULAGkHywxZ7UqhJpS+/pxtvpjbeZqnh6/AT+0Ifj03IoKf0apH7espjDH
	 856TOU026loq5w6GiPRIPTxT/NTw4Wr/LOq5GUMdx3GLSnx7slLU0n6orpzx2Qim95
	 zDbG2iY+RojiH78yrAM+wppXSWF26pWfsDvHiH9lFL9HgBDMZiFo6st9jk770eNwYo
	 V3M5Q1MTFBszLryCK9cYjs45RSCzEdM9D4UQ0rYz9cJnia+GfN1maIxFWCs7QTKF04
	 NyqjhnQjOdvMYByguIrnSVXl5owOfvwwaXIYC1Qw7keU25stmBUGuaM9YwaTKTxJVo
	 GEZm/T83PmDIg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:27 +0100
Subject: [PATCH RESEND 18/83] drm/imx/dcss: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-18-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407; i=mripard@kernel.org;
 h=from:subject:message-id; bh=gk//ZtUuN08aJvV+if2UwQNlLwY4QXiavgS+/Rit8uk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFjz1qQya8HSbVrjRuRkiK/58PPaUI/tbwNmPpdrC3
 d1y2pOUOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEeDUZ63NXvvzoyZNcGSFq
 u2KmVmyp8gWHkKeT/no/P8W7jaFL90z2TLFZP+VdK93d1uQXeitZMzYcEPswZX7Uj6A2v0V5U3e
 eDOVN/av1PoBx8qStTLYzZ2k23Vu8aLbIPJeIi+8WvWNcIRoJAA==
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
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 7c5a6e2bc89a..92ac29960e48 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -142,5 +142,7 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
 		goto cleanup_mode_config;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		goto cleanup_crtc;
 
 	drm_kms_helper_poll_init(drm);

-- 
2.55.0

