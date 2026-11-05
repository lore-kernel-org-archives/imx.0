Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887790;
	b=LPdeuw1DpA6LnH4sjflbZg50nGFBRopN/klCNY4vFPO8XBesVVpNiVB3osLhnVoq8ssF
	 izGYh1KdnFz21LnX2Y/XkfcypoF+/DGgLazP7jG3XmMab9qSFD8IT+aEaSEBX9+mgCFIk
	 BKKQa2QYpKzjdknywJB1VYAzBxYBoBdvjB+nDhiqDmvkt/Uc1uioR1pvI1zqdOAK2Ak2F
	 krfr4WQ6vI6JqWHxw+fwIEEzggz6FI1AM7xzApLqp0vLbSiC4L+vHJMwrPnE9XiNnWtz7
	 LO6SKvedUYb3eaq7XLOXBvgs5R0EcMZrkIc/MwyxqgbyX/ZfhdG5IWDio49KiEGKcSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887790;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3LOFNckg5sV+t6d5ADNk4G1bEFmQfPz5mEWgPPfIzEU=;
	b=P82hkqQT3ualW3ExKlvuKoDi9PwJcein9g0FrszUxHX4O2Wri8wMvoCttHbrClwX9HjV
	 YkhWy7TIJe75uJVhYcXXP5szQvwLN7twzZia7zy9qCmXjN7D5qa/1mZX1H1FGVcxa7cZr
	 0E0TZyXd/RGD9lioRcEZKaBFG2hQ3c3xRad8oQko/x3YQidyeEVv7h6eKkeCs+VJo/hzP
	 j2PdX3tIMRCj32mS8WdyyA0L2iQ0kBqaITj3RD83ffpPXBfV6O8Wz+Yc/x4rWgklvG0dp
	 YCLBbxoMUIEpDceEAXtfxjfFdsvi1OTw+NNAJ75HXlbNQpNUUOFNId7rArJV2oc/YmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vreu8oPD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA874606A31B
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vreu8oPD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D271F00919;
	Thu,  5 Nov 2026 14:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887789;
	bh=3LOFNckg5sV+t6d5ADNk4G1bEFmQfPz5mEWgPPfIzEU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Vreu8oPDBijOf1lHYQOC/8lVBiJnYcUDX/hKdYl7EBGGFR7HFsULbCvipGiYbCZPU
	 5G4uHmsDdd7Gr389utC0AWco591SifU9AjBwSQXgUm8cvop6stEuCp4c/ivCyTWmQv
	 l7QO83HBDnEEJrqJKobmg4kmP3LKX7yy6d7aHxjMfGZutWITEkpmt2UCzd3HtUOasg
	 ZjBa/ntj1Zu5hWQn81B2v05VvpeXa5XNk6MUws2wYn74Xq1hjArgdzP0ifrcoVXIVV
	 MOY022QDp0ElHZNqvCRhDEjPoZDcOzNVYQl/URgdvn1myF0K4lfD/Ul9Mo2GWDKClJ
	 Isa6+IlYPKXdg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:46 +0100
Subject: [PATCH 29/83] drm/lcdif: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-29-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Marek Vasut <marex@denx.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, 
 imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389; i=mripard@kernel.org;
 h=from:subject:message-id; bh=x/39Ikdb61ljdtuhzx4E9VDxd2EX/mjoQLPOSxbG91M=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlveld81rE1XPFk/amZW6bkXsj5qLtKveeFckJTnm29c
 kas4gHdjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRtcWMDU1XTDM/nJlsuc58
 qhCDTGsdQ+3bKV1KLcLdPLtqvy75fmDljZo5n8Un3j5h7+DL+LxFlbFhWUfoiS5R5k8xcw9L3t/
 Iey416KPCppXdEZK8NXIeG3bFBmS33dUpk35z+pPTrsKdYhEA
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

