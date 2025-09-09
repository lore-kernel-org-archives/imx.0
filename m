Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4372D5C95
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417318; cv=none; b=gnI6W2cdnh99OXZIibN8L2libG5sS8vAoHBD4GmhNkETLxlLS2U179aITCBdLk0hYL/1AWPL1L/VS9gpmXprJMywpEHK2teFLU/+llXitRKWGTea2tZ2DpjSIjEI728lBPgQpTHPwmrstxbOjkud+/STEEBRuzIKWMj1I0PEg+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417318; c=relaxed/simple;
	bh=Xt9GN+/xZKOUgTMtYp5d8PS7tZ+kMJnz05B0hpJDY60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QoCouNV1bSqrKnlZvCIwzW0o3EmnfVSUCVgmTN7vERnVWQI0xlxR28ptwPJV5Lhan7Uw2LnJb2OUZE4iWzHNrJqecEVCqpFKnXgA0GlyKhENjs4cjORqFqfaaXupM1pyW8MiOHmb5gfFH/rlxPQImepbE3ec6IqeWPs+noaUIUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2/1HPXW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2/1HPXW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE04C4CEF5;
	Tue,  9 Sep 2025 11:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417318;
	bh=Xt9GN+/xZKOUgTMtYp5d8PS7tZ+kMJnz05B0hpJDY60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e2/1HPXWnQvVclWQCL2eZF/q8pXOnAwqwS6NlyDKxRjTBcJyh6gP0uBhJQ8RAqSew
	 v2YZVgc1Lw/hR2FGTz+UtSJdHtIomcRAPzVAjqCpdhmQxKZliuW8m3ofR/TZNQsMhh
	 bdvES6HGlRHDcYezxg220cY7D0sJ3vW4JBKIue5/bySqQhbUbjTcHx1X3H5L8RtoOJ
	 0LSBbU4yfSM5Sizg1fH4/0WwzR6LDYLZHCeGKF/K8qqr+wLTj44Cs4or2+LtyqqqN0
	 jsrN7u7R9a4wBK/430pPfk/zGoGt/uTWab6TwFe7KImfbUM3WLvARJMKgjgQyRZc65
	 0g4sUWulXDSsQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:36 +0200
Subject: [PATCH v3 17/39] drm/imx-dc: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-17-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Xt9GN+/xZKOUgTMtYp5d8PS7tZ+kMJnz05B0hpJDY60=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+DUPpa/LZVKzMTT5X5z39enilfeiOX/+ZlUP9LIxs
 c0Pfs/XMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZy1ZuxPrvObdNai5lb9Kyl
 3apry96Uua22r7o5KaPuywWZ2jTlZ9YqwvlsWt+1orVfWCd6zpnI2LDxi0aj6YbXH2YoVHwXPh7
 FOHPrp6xvn3hWvjDd39rBobDXvKYwOGniTFPv928dAjJyFgAA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The imx-dc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Liu Ying <victor.liu@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index d8b946fb90de638da2bf4667307f11b06f4e77f5..e40d5d66c5c1f0d579a7a1019c0f2e00489ce15e 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -104,11 +104,11 @@ dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
 		dc_plane_dbg(plane, "no CRTC in plane state\n");
 		return -EINVAL;
 	}
 
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state, plane_state->crtc);
+		drm_atomic_get_new_crtc_state(state, plane_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,

-- 
2.50.1

