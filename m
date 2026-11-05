Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887750;
	b=NShA6y7L2kZhpjFeQ8t2alRp9B7DtFRqd94OKYuCF2TIJDtCWeuN8SPmwegv3XVWiFCa
	 ZH5Yt0uPnLTjgl0Vj6aeo1YLtXsyGJYh/Q0gDLF4BO2Y2heJeam0Lt+K5iLmfxFq8zL36
	 Efp77NV51Z0L7E1jp3eiq7QVwvTXtKz+zOgZfSEuI0thPDfX+yMQNacBr8KKC8bGv1JaA
	 /3VpH3UqA6YcdW/HBrvu8tImclQ7M3wCdEo9SZ5WHhg7jl5beV2EJAtpF9PQ/1VVXmWkq
	 TcRKdlVIXaxh3FhbasKwjEBoF5188ac6gR+Ov+FzyBHW4rYWPjVwbfb+xsI6fjmpXhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887750;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=knwrJcvL7clG1HfpArVpNGWtATX6g5pA/gVZFr5kzV0=;
	b=xZZCD4MH2D9CV7eXiiZh2usa30iYQLq3dB5GQ/hTUz7tOHquqMPQuqpXajZVk9rsTPTe
	 JagBdXDTP3Ms2dKqryJSVbw5zL4UzT/AL4MCtvkSh8UsUrp6r1qcD39IeRBaobsmse0t2
	 kbGSJcgcX0nHK58ocu/p66yu9gEewtV5ir866pIgf6NxVEhtSHxYLRVnJiM+zhT2BBAuW
	 HRq5ArlyaYctIFfe7hW6qHtWAY81OYA13R46SoXR9gXm2P4zSeM2mfCp7SH1eptvVvecR
	 DjLK7E0wpr/b3z5rAXN0/Vik0bcI44mtzEqh8m8OywlMnEq8xMh81xlQzhlftsPiRMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TnVM74WZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47367606A328
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TnVM74WZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506871F00A16;
	Thu,  5 Nov 2026 14:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887749;
	bh=knwrJcvL7clG1HfpArVpNGWtATX6g5pA/gVZFr5kzV0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TnVM74WZ5z0cRi9lqVWrwsBug1RZzfNMAieJVmytMx2vFL1m6L95aTNDvdlYLDs85
	 vu381RZaDCeoeaZih/mf/HyqZwb0QKEBNG8C623+b9XXm0NwIiB0UE6VbPhR0HP26A
	 opjk0IQr60vc0IAr0DopYJzxqeQTDVg4JiUyxT9b2VHs+82KpUTwn2+H8a8OJJNEbQ
	 xtM/lxEFsTgKUW1ZkYd0Kbja0ONarT3fK5+EKD4FH6u32QrGpFOJRoyCO5yU4E2hi1
	 OP8FqyBXGSX6AUfs5e6Di1OxeQ+pWt6fNK4TwaKFJqsvUQOmYIfXngPejK2mToxroS
	 fPq+ad7xuyTbQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:35 +0100
Subject: [PATCH 18/83] drm/imx/dcss: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-18-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407; i=mripard@kernel.org;
 h=from:subject:message-id; bh=gk//ZtUuN08aJvV+if2UwQNlLwY4QXiavgS+/Rit8uk=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGrsjaOh7unIjDmcoWNOEw1g+gRhgkZVbw5iFX2lpTC2K2Y7u
 YiVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmrsjaMACgkQJ1/OGaI9vnYg2wF/c3sc
 KHJqi4jhk4M+oGFsmA6nzFfwXTQ9OnETVKieruZMxWLDBBic43pV2NudAum9AYCbB+YMKLiatVF
 Y9V0U/ayZC9vuTcGsxp4M09KeFrb8VsTZyNcUw5zA8v26mk1+Z2w=
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

