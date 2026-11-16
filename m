Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825095;
	b=36vOl3eg7LXzCL1lsuU4/DL4H1X6zIlawWyTYHqBWesovKccY5d9MM7VpTb6RZstBkYO
	 gM11sgYbX8DTy4tdvWWJS0LLGOGMEh/7Dy90QLNk2KPCROpJexa9TQNXJTTkppKwAFhiG
	 Md89/AB04YabFpdZNb7uO5QSyuUZ+b0ohb8iTGz+fZOUoGt14OxU5pVlbYZRJm6wkZTpR
	 dXhjhwgp29ZGrg48Cvav+rnYEzZeFBy6ra8lrYeOrUsUksBwQgkiuAvv0UTBwQkhaFZRn
	 hmNiIvWMYGCoZiBy6flRGgtrzfMj69SNCGlYeUnyIxUw4Pf5wgXxgYFyymJsuTWPOVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825095;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ILfrq1LDk2fzz0e/u0mrwfqzMdZDeM6EdfD54PJHsB4=;
	b=rpLF9qSB6GF0fi7oHQmiVzABXTq9dPVm1tzx4zSo4e+K+vF4kVFLjKL3pzx/Z5lwLo03
	 JN7B+dviIu91js6mAwghUgw0sJs2H1hFa5mckBb3jkCBw56hJPtCYNr/iZt3Aiod4Vucm
	 ZdO6lmYA1Ke5nJO/A9fIKH2aUvGzVcelhuCyAHCLpvtsQqYziKc8zwouABkst5X3kRmvK
	 ZbfSHf0QZdOL8RHKimm0nlpt3k3ohr9lcSM9NTQiu0Enveui5DKGeKulY9Z3SvW5Sk+9M
	 46XesJOWAraeuURu7L46cP38sxG6CnqYNuPD2eKKKcGjgCQ1ByO3iIseSSBh+lGMF9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmmuCwlZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAE6606A336
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NmmuCwlZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD781F000C4;
	Mon, 16 Nov 2026 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825095;
	bh=ILfrq1LDk2fzz0e/u0mrwfqzMdZDeM6EdfD54PJHsB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NmmuCwlZx9np5KSGhVe6aetYseQkRk2UNZv50NiIhcrmnV3ukP+oYz3zTGb/XTUzL
	 5yn8+Ic98TFtLxP38wPVupxJKmHMZUO6gm/eD+Num8QT607JlMY44c7p9WnuychGk+
	 wvVNyqqvKmYctUfrmVax4Cn54r3Oeic83zdMPJiLh2nkNoaYfU1mUkAZ44UDhsxk6l
	 sUdfFeTkRTU97f4yAzJHBMygQ2ntsafOmf1xUnORERT/m529vSOym1tFwFL0yZ60VO
	 Fw1kPljiruuZnsEKvx/pmxWgs4N0mjn1k4DHM1lMs5vaykfh21IGEpP41rxZ7kIgM4
	 3/uB+zQIxSF5g==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:30:28 +0100
Subject: [PATCH v2 12/64] drm/imx/ipuv3: Switch to
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
Message-Id: <20261116-drm-no-more-config-reset-v2-12-0bb471f4d1e0@kernel.org>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
In-Reply-To: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mIjkOaPh9MqU2vMA6VEeSiaggDiEEKD/wPxqjrn980U=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/brvyu+XMPP5wx7/jN8yuuqztFNhqteRZ8Ol4IQbP8
 t3+oi+udExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ6Mow1mkUr5wllPQ2y5GZ
 Sf3d6v8VlX5b57dOmnNln0KpQHjZIY2TRxb6+itw8C4sPcJtqOhrytjw482RSsmGeK+NhpuaQ3T
 kFq+ZXXPgVK/cPeVFp7+un/yt1bfCKCPSmUPB1jBaKmqexHwA
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
@@ -242,11 +242,13 @@ static int imx_drm_bind(struct device *dev)
 	/* Now try and bind all our sub-components */
 	ret = component_bind_all(dev, drm);
 	if (ret)
 		goto err_kms;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		goto err_poll_fini;
 
 	/*
 	 * All components are now initialised, so setup the fb helper.
 	 * The fb helper takes copies of key hardware information, so the
 	 * crtcs/connectors/encoders must not change after this point.

-- 
2.56.1

