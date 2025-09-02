Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C70E2EBB85
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805774; cv=none; b=mFJcRds/ARxNpmHT8tmHfBBuYXIVej1u0WwaV3CIEM2KwzikNCladEz3MEvX2RFOetpib9F9wYcTB45bBXxnefMOMWu/Mso3+aD2qZWxGJnZCGxagLZJTW3aNq18ncRH5tyxUxZlZXDJuvLCQrYvqexF91HEd3Uo1SJZZzHvgxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805774; c=relaxed/simple;
	bh=fYZnq5UDrHuM5t0Pta5bSVbcw6d9tlXpfEh/84xjz0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=snSxGtvp1V18Rt8zThyOcAvPuPlyWBpYWmhX0LBXimTMEQL6yDnyDNoK3PStyyibnkXg8pH3QdZM6gF8eYvBoa3WYEQbx98dGrru02I5tgU1oChRW1PcPui5NOaiNZN87bmnyt+HAYVDY7k/cc5uaXMfEf6EjeKRXSPG8zutA6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqKMvDBf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqKMvDBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C2AC4CEED;
	Tue,  2 Sep 2025 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805774;
	bh=fYZnq5UDrHuM5t0Pta5bSVbcw6d9tlXpfEh/84xjz0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AqKMvDBfa6efHN6CYxQCRZk6KNrxLp/pmSxnX511Hsn40u83q2v72Z0TY9JDdR/Wi
	 I0Yol2k9Pz0N4w9xqL7Kqiwu0ffcwdKyKJAgDZRkJ4HrFL/i/shztZLm69EtVR3nXP
	 PMbcJWo/zGUnVBSHWazT/fVyKKOR2//2kP+SRwkvnLes1qAWoZCqoXW3wBSDgsJ3qk
	 5qZm6YXaQkkvtq28qyn/MbVu5Ra6SJe/YEzejxN+bv1OZUxKMW9jclU1lnSGj32VBu
	 jXb+QT9vdd4ngBkY5tcQ4VDCH2Lb3ac0kCJA5r3bTzNDdinxFayka/LeoRntnB/5O7
	 aH41c0Da9xhRg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:17 +0200
Subject: [PATCH v2 18/37] drm/imx-ipuv3: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-18-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fYZnq5UDrHuM5t0Pta5bSVbcw6d9tlXpfEh/84xjz0w=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgXLyEnY5zuLCq/eUrrjvfb0IGt+TrGp1q6iUvJHT
 k28uWZnx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIlCBjncLu2eKXjJxm7j1x
 SuvydIE1FS+ST27rWRmowJXIor5e+Y3B4tVBx75WGG3f32z6li/pPGPDQ+HpV7/cYTZUMLPg87/
 E/+6Jr9QjpdKW6kMvGR8HrWXyKijfeHTvbn8dScklu5zKeTcCAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The imx-ipuv3 atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index 704c549750f950c3f0ce5d6c6f637d9d7b53fb69..df19560e41b4f5b0dce97ae03947abeaf99e0883 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -384,12 +384,11 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 
 	if (WARN_ON(!new_state->crtc))
 		return -EINVAL;
 
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state,
-						   new_state->crtc);
+		drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,

-- 
2.50.1

