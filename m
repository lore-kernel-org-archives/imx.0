Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887746;
	b=k69hg9H5TPvMfTe8TSN4lyKlGv2ElMqxBS5lUM2U+qk0W+lGysmjYSQCTN7Dqw2Ahs2a
	 u5eCP+DWh7diAo3HOSEVCCrEf5fSrFCT065ejo9qJEJE1LeKL1Cc2rlFby8gatVVcOJO3
	 mHYq2zogdupjMgXQpcfYAaT4Bwi9BOgH3uw5w5jni0i1qIpgZVmN0BmEqYFuvUTlauU3B
	 VY9GhJLAYQ337QcrchvfWu2jaUoE0cVY3QgcLtE5dc2dS2BIlbBKTN0TeLjBZWdGO6FIE
	 3Tns4ZrTfHOsIBPaZ1SiP6M4r/nJJajSLveVoCvPeFPjpYQlzm5ABsRI2l3bz0LDheA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887746;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=v3R72Og6052wQsxjZC/mDC8A8e+FpeF+ChSo2fDBrFQ=;
	b=h5wuSn/WMaJQFyLGTBy9VH8NLFBeUZ0hP2NzREsfmUANGbx6JzWFgCVnb8Sb6HgTEy9U
	 8WkFkzJK6NWZasaCbmOsdhVooH3kTFHYYwvmVt6yfr9YsBVO6NQoaBHoyQ6OcP2syjeQ1
	 HN530dBsYxeGEkNZ8Ur8Oy1y5md+glBexnWfTiMjGlvpVSOaP2XoShDY4cPqDF3zPUjXq
	 wx4StU+LiVMNQIYjSP5tCIbUBDWSOQ17c//vbR+Eb4rtp1QHRGDi07x5ZGqWOMH9l89qV
	 ooctd2dceYWkIW/mLibY1gpbvlypz3b5iQJud+SOnkx3tKE3XkHg5j3UoMTG3/ys+3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vh5vcp44;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2667606A32C
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vh5vcp44
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5AF1F000C1;
	Thu,  5 Nov 2026 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887746;
	bh=v3R72Og6052wQsxjZC/mDC8A8e+FpeF+ChSo2fDBrFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Vh5vcp44VCi385k2dOx0rnjM9fB2+Z9HumFK9K++pRcW4dEalbSIi9Kdt16GBiuJ6
	 aMF26Zkby4SdGUDQO4nrycAft694MuoO0aTzcKtfy1C09fRrI+/2olo+67VDvUHKVt
	 Me6Ln5UV8tFgH+BmLdjB33IeKY0wkhGOQ394VOZbesZMstu322KFtEQ5rbWHjyl6oS
	 SAIGu/ywxjDj2KdJXa7RN7x878T/h6Dct1ZCRMExCSicFYKk+8QmeRj1yPfhArcBOo
	 1KQdP1+FqEOy6t4DMfkD28rEia7s8ekzApfiqPjjIVUkW5hX2CkmbQfN4uq+HCrhOB
	 V9f9d5JQO7Klg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:34 +0100
Subject: [PATCH 17/83] drm/imx/dc: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-17-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283; i=mripard@kernel.org;
 h=from:subject:message-id; bh=iQY8DKnYDr2y14HmImCUNV690p8KR4+MpimH2Sy+wuY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvehfnvOeMfTPN5Bd3+vUDPrK/c/c8FLr44+3Z16JJC
 fMKhbLsO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEErYzNnTZSB3WfGixXE1l
 rqvQ0ZpgU7e7ibpXIpq154dP3PHsyPaW8mbR9K2u1onbPF3WXt8VzViftC5yj1PCE9tX1ulnfL9
 8n6peZ+KRG6DdoMW5nJPnwLZ79i1L4+24uRv7Nj4vSZj4bSkA
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

