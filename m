Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0791F2D3A69
	for <imx@lists.linux.dev>; Mon, 13 Apr 2026 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776080854; cv=none; b=CuNmVUqJDJDsxcHW8DRiDg63zbpRwzIdYJ7Zso7JY82t5HLWZaAlg0uUjx6nfHCV0w9PzZ2hCRbAbXWX7dL4R1vtnV7BqqBU1FxP6AnD8JHAzwEdLIzxvy4jFHo3tYks6nI7Ng81l1wRoq0l261KH50D0q78j0XdsdKt1+hwHSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776080854; c=relaxed/simple;
	bh=zkUugOB5qjy54EN2XecQLygQMrIV/4QG57iX4wp2xjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q42jCukO1IdJn0T9Bxr0AwxcH9Z/BfIctJ5mafLbrazJq2SMrvEfwAUJr27/xII2SbBccbPJRIaS2mDFBEMNQli9o2LzRIFTiEN2ngbSuGP/RbhlvuwGog0i3XPpp/BwtsCdTMOvoE5fZBhclzIuWKtTwpc1vg7dxaArJHHMb4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mechasystems.com; spf=fail smtp.mailfrom=mechasystems.com; dkim=pass (2048-bit key) header.d=mechasystems-com.20251104.gappssmtp.com header.i=@mechasystems-com.20251104.gappssmtp.com header.b=xOhMnUT1; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mechasystems-com.20251104.gappssmtp.com header.i=@mechasystems-com.20251104.gappssmtp.com header.b="xOhMnUT1"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82a655cfab5so3659707b3a.1
        for <imx@lists.linux.dev>; Mon, 13 Apr 2026 04:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mechasystems-com.20251104.gappssmtp.com; s=20251104; t=1776080852; x=1776685652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b/LOXITNDN/uMhBAVQruWsPEexWMWJ2BqlDUKp8QBqI=;
        b=xOhMnUT1ERJRj9iSEE6vstseWwwXJcyMcEka+2OlFYjorWsiNCm/ZFhy337rPGZPXK
         4LPj2GzkeOTxHUvfNZOAeKRUEnXhvF7CshpwkpS+2002Ac77Foe4wt27qx2HTWghgCPT
         1fW17oJaSrzfeE9tYhmJyswBHxEHB/jaJr8xb6w44HGzmM2SN1LGrDcUplP2VSQ4I4dO
         5FMKiyaDDcSyoVEa9pqzN2FEO94CQQfAGJxWrhuNyQ5u7hGnN0Qf1HOjJrN3hyeU9QtQ
         Ct5JT0kwp+Em65SqRXLBGfnk5hbwZeUJvOxU0+dJo8yKbUIYGZEarGtOsMQXlWQJ8UQO
         26Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080852; x=1776685652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/LOXITNDN/uMhBAVQruWsPEexWMWJ2BqlDUKp8QBqI=;
        b=irPOlaNoOGRauMBLuZX8kgia6+o0ismHLRTLKNTCB71Tleh44Mrpin2P2Yz0TiC7TA
         OnmeDv03iJI0ZzlQayIgyEOnaIzbSo7x4C7fv4Lv3ddFEqNdw0ghnk3C25tr+/QKD3CH
         v9utsNqjc1jzY0pC5+CE9DXUxmy3UDNgsDQu061Gi5o9+20/W6s8XfzEKtz09Hapq7R0
         ykwsQhcebTSUgkIb6teuIYxJeFDU4WtKqcXOWJsIc1je6D6iMksUsS995diyHFkXmLSa
         mGXakM+urE1PGtiKzHTv+VXh0yWxu31Jw4vXqtvb2u1wkycm4UB552/OC6EEgJmYM67k
         ySJw==
X-Forwarded-Encrypted: i=1; AFNElJ91XEVdzBo58JYmfOCJkw+y/u5mGbTs2FK7FFfxPjisFXbrPaVnAbVz74kirZJlHLpQurs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPWo2sWKYEbdA8FY0HSDteAa7GhUJU2mIAFzX3Bw+qa8S/E74Z
	Y18A2kf0WxpYhR16Y4imYcisIU0wSO5BfsqEWEbSckQRHw8MkKqCdjiJRlHsVIDiBuM=
X-Gm-Gg: AeBDieuslzqDLfvJfpFEPHc8tTEHivB8+T3tsY4PmJ6xDz6wXoe1wto2UsHbeI7xiFg
	s8HKOGNqJ81oTu0RT1zMAY7e8wUoD7IOFHkNxp12Xj6TuQKDzbgIbZG9jkVGce5XgVnSQ3WC4C5
	43dryaQrS1IzPxL7lF4Kys2B+lHnyoeYgJmHgZViCc0uqddwWT+6EAJXVhwHz6KURUE5OrxnVPb
	k/hoit0w9zONYAi1fzDMa1KUgxK7jmp+XTQvzxWLrg34wPpc4EJ8P/ezryig7uv8inoft0wwVgN
	qDTBEipsHq7CU3P2EmuOsVEXDmbFQuFzRPhglkLi0IS9XA96pDogwery+tuK7eYyr3k/QyeNgAB
	sRU91mx55aHZA4oaTcGjaNXCu06G1PtUFP314So0PKcjGrpgRkqRc1UKTbIRce7LS5t3S2rXwVT
	pOk6VKyNlEEtNUD5NhxAg5yzK/9AueWgtbBVd8
X-Received: by 2002:a05:6a00:39a9:b0:82c:e3f4:f5e9 with SMTP id d2e1a72fcca58-82f0c219ccfmr14135131b3a.18.1776080852304;
        Mon, 13 Apr 2026 04:47:32 -0700 (PDT)
Received: from advait-work.lan ([2001:df0:e1c0:3414:7eaf:93c5:46f:fbe4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c330925sm12822137b3a.15.2026.04.13.04.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:47:31 -0700 (PDT)
From: Advait Dhamorikar <advaitd@mechasystems.com>
To: marex@denx.de
Cc: stefan@agner.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Advait Dhamorikar <advaitd@mechasystems.com>
Subject: [PATCH] drm: mxsfb: lcdif: enforce 64-byte pitch alignment for scanout
Date: Mon, 13 Apr 2026 17:14:56 +0530
Message-ID: <20260413114456.173485-1-advaitd@mechasystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LCDIF controller expects framebuffer pitch to be aligned to a
64 byte boundary for reliable scanout. While byte-granular pitches are
supported by the interface, the i.MX8MP reference manual
recommends 64-byte alignment for optimal operation.

Corrupted output was observed with XR24 framebuffers where a pitch of
4320 bytes caused visible corruption and choppy display, while an aligned
pitch of 4352 bytes worked correctly.

Ensure that only framebuffers with properly aligned pitch are accepted
by rejecting invalid configurations in lcdif_plane_atomic_check().
This allows userspace to fall back to a compatible allocation.

Signed-off-by: Advait Dhamorikar <advaitd@mechasystems.com>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 72eb0de46b54..8e574e9a591a 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -674,6 +674,18 @@ static int lcdif_plane_atomic_check(struct drm_plane *plane,
 	crtc_state = drm_atomic_get_new_crtc_state(state,
 						   &lcdif->crtc);
 
+	/*
+	 * While byte granularity is supported, LCDIF requires
+	 * that framebuffer pitch be aligned to 64 bytes.
+	 */
+	if (plane_state->fb &&
+	    !IS_ALIGNED(plane_state->fb->pitches[0], 64)) {
+		DRM_DEV_DEBUG_DRIVER(plane->dev->dev,
+							"Framebuffer pitch (%u bytes) must be aligned to 64 bytes\n",
+							plane_state->fb->pitches[0]);
+		return -EINVAL;
+	}
+
 	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
 						   DRM_PLANE_NO_SCALING,
 						   DRM_PLANE_NO_SCALING,
-- 
2.43.0

