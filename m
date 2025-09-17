Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD5A2C235A
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120419; cv=none; b=hlzjhNCRG8HxW0bz5Lr6Ec9R94FTxeAxMpZPKLvZfDeQOTD2tOPepPbvsMEJ0t46mVmDHGRTuMJthZ36p7pWFiqOe5YlXXrkTiAeK7pXbVgEgq48TwqZ8odaPkWD3C56VnpW3ABj8DKJkJvSE4kG3VKdJmXNJ331/i3Hsz1LBdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120419; c=relaxed/simple;
	bh=Xt9GN+/xZKOUgTMtYp5d8PS7tZ+kMJnz05B0hpJDY60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nt2fGFmnvfzZFoorOK3i7aoR7HLMGDpTNiO9OJP7o0Tfa9HvzCRPVWPr6lKrMWDCozoTWfpcLsLtYhDm08Yd5SP54hSh8IX8IJwy4dPpigJKfF07gCn1Gk3mL/jyPhrXzaOhfoSOdGVk7En0U5admqIOrfxEQnZGOSgQwuFQvOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTaDt96z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTaDt96z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC28C4CEF5;
	Wed, 17 Sep 2025 14:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120418;
	bh=Xt9GN+/xZKOUgTMtYp5d8PS7tZ+kMJnz05B0hpJDY60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NTaDt96zT6jVMMu8JxgiUpd1OYhKbGUs5/K1yCpo605Hy5FeHceQQDRs5m7W8O4H6
	 2tPTdqBU6NiKl2F0EwdA8iPzdCIGhFBCPRsMvDRlqhydW/8U0LnXr5kTc94PpsH8kM
	 G6cv6zvwuMQUcHkTeIjAa8XQxDBRpiOQqvZYxEcX/UMuthFw5snlOItV8IQWLjXgKK
	 Fx3KCqxREStxc5dvZW2T4rDYhPhiaU/k5RlQ5hf3c5i3YtjSbKCxKTdYoxci2M1se4
	 ec2QTLqQ1nt7IOePLUNTp0JkhrDkTNxYfuYIPhsqQEwcy6f1NNnUizxU1sJZdoCLXU
	 tSBoB2OAIKCgQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:58 +0200
Subject: [PATCH v4 17/39] drm/imx-dc: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-17-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi6bdZ172j+zPWKhT58JLvWdplf98526ROiXp7wHT
 599dvyDWcdUFgZhTgZZMUWWJzJhp5e3L65ysF/5A2YOKxPIEAYuTgGYyJTbjA3vS7ozZwVXTz+f
 ml7p/eu0WUNN+KUF564aHrA85HCzuSFSyGpBWpu8x6kll9nYj048e52xTpuH9/zO51PU1xYoz0r
 ZuCxAc/aJ76dFvd88jlSOPuZo96BE+uTdCysPHdyRryWaVi9uCQA=
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

