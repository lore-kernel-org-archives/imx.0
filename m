Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887754;
	b=Hep3zXYrENdDOyqgtdwDVu+P9tHDmQ5d/wp+rjiBQrsGVQWjAgaX1oF0eyEl8xrRVOvq
	 HwQ+lkt5DmeYWYIO4U++lcLf/VqOWVn4O01lA0ZbP5xuqVLDJdM57lphfcR68Ov4SLMYT
	 tfjCRcm5zs7gnFcgRMTWSzC/ICeimjksy8OFYrSWb8kENrbTBjpRvWh6wZfnxgFDlvxI+
	 5X8duc9Xc7LIcvLbaM7VQHDTsv4gA0K+eb11dfibY5+ywkwwxhvLFGTLaqH8McnmqR8tz
	 0LDT+Rzm7mYAlWkb+YFpRb6WAiaebxyGXkZHiGBJiFA8s8T46MXnLUpPG1SMG3fzN3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887754;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=k4rz680V7cIAb7iutGeH77t262DzHjpYVR2yTCZegGo=;
	b=O+jPMQNlbVLwSK7HLrxIrSDuw4qTtTNKo6m/C+slrkeci7auoo3+NI0ghhVPHEbmvczS
	 BDRYdigTBl10uCAuX+BqLhqyTHBp9vDTqwC2rJldDleRgYSnfkZGUFjmPRb8MX4anLHin
	 0TbtPd0ZoekNKHD2fz+EPw/hW8pYXBss8/3mK+UjYHF/hVi6v9lkSBGj0/Y7QJDb/3Qzm
	 OM4RTBeQeRX91stSI3fHgqjhVflE3m7WVv6be6S25ti00XuYykR3ZK0m5V1ul+R0PHtb9
	 Ov+8+XDus8IKuGuahhhWjjPuruve1F6j4kt1HueVYr7YV+WY4SooatcQIlP6Jk/O+9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nsfRItMq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9520606A336
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nsfRItMq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF391F00919;
	Thu,  5 Nov 2026 14:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887753;
	bh=k4rz680V7cIAb7iutGeH77t262DzHjpYVR2yTCZegGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nsfRItMqXvK55z+CEeQqyVT8++3/Az6l5lW4AUQi4b19ycd1deaOOA1ZxL+psg0sD
	 V2SZbyoEzxMSkij9gHOaX0BZ5it5O8m43tcqm3ROpBmhXe/V5Z9DHVo5tg2xFdL7f8
	 YW8GzHNeVeSiny0XjR8S+rLaQMqVC2UDtv6SN2COdSod1z84VwIr/347rICn5W/7CB
	 nYV94LkSeAkunrpEQdh7rTP1TbPVEwkdnX/VBd6YeIPYwEMyEVFLmzsNLbmqZz1TH4
	 4uuJdnG+XvV2Mqg81O0NW1btW3QjJXA/cqsXDzw0wJElRe7lRHFLGPzDICjQmcva5w
	 EkToq6qC8DC4w==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:36 +0100
Subject: [PATCH 19/83] drm/imx/ipuv3: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-19-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328; i=mripard@kernel.org;
 h=from:subject:message-id; bh=R1dioC/IosBGQUi4ZFDeC1cA3Y5gHU7STgC448dv8hY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvepcYHI3uFtq4+JnZn56ZSgWTpyy7vrN2Zvy3loWvg
 4O2vJiY0zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmErOasVa26Hbl9Fsn+1oK
 /lRVfL9p+95R+HP9Ub/Cpg1/VD7KP5OolHkr1Gl8MODvVYZ57d5xkowNk5niz7xP0U2fN5d16rZ
 7sbcyJjSUXKhIOHkh5Ipg76EXt5lnGh/XYFlhtcwwOJCB8zcrAA==
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

