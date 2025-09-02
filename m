Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D672EB871
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805773; cv=none; b=AMVcksWS4uKrJAGESYAdLGm+e2+TVEUPt2UnXCP95CzO1THqxeYdlpuJjdzR9DWsCDoEYqHanr/RygJ8DEpT1MW5GOl5DcrFsu2l8ca6hh7ata+8H0Ssqbt24r3czgEGJnfPzjMn4eznnB7Bn47dcCvpFtKgTrCPPeDh42/Hqww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805773; c=relaxed/simple;
	bh=hPhAjWEc+3mn3zIUCeAwRlMFSA1u2GmJtj3ldi3xpVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pitWJZETq37mJqP1c0FMFhp0rogy9IXKLI3vxDxK6E0RFHH6+pKj87yLDwk3JWtotBL+Zf3MEMxb5D1tWvzhsZ0uvcWkDTOom8LbS3QBjba7W9Czpj4nJNmudUjzWMatgQcWy1L9Aro7wCL4FvicsxpZvqVxspgb/uMt2XYV8RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mU7R7Foh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mU7R7Foh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0975AC4CEF9;
	Tue,  2 Sep 2025 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805771;
	bh=hPhAjWEc+3mn3zIUCeAwRlMFSA1u2GmJtj3ldi3xpVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mU7R7Foh1322i7dUQjowaFQHdNVeALdYQdWJMsjRa+g8Vzejt1J03iyeVb+r2HbLv
	 KcEkMNws3+JaIa+Azxj+zr7YHk35Ywq2wRxYvqVHcIKAzrdDGUHXNHrjSL12j4HLg1
	 2X61sSc1oSss4itOh21My8B4ZjS73BuwVViR6TjXRSg4HndwDVd/exzbeFx5vC1Ucr
	 rBxskWW6HRzOdKtEZ2DO+IFnd7DiZ62+PWmV06W+bOM3pLFzbYUFMNry7/0eFsdi33
	 LEGvObMensGKEjvafStWIqgjIeDWsknMSGyqOYtON1TJmvuPXkGFaaKnCkR8eySXMq
	 7bhahbre75Vzg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:16 +0200
Subject: [PATCH v2 17/37] drm/imx-dcss: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-17-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hPhAjWEc+3mn3zIUCeAwRlMFSA1u2GmJtj3ldi3xpVc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgXf4PKPL9h8LCEo7a4804e1IY5qS558+P6zL9/t0
 ekzf/YwdExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJzDVnbDhyYF6WEtsiFjb+
 f9WrY4RtTjrdyJ//e1OHyhHdBxOThOTW9acl/7GZ5d4f56+1+X62EWPDTPcSdbOYr9bcUwM8b35
 6ayQ+aWpDxM0i7gollv1Cr63sEio+7FiuHhcsVOyTtfT/1igA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The imx-dcss atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index ab6d32bad756d080e1c56d7574403febceff94f4..3a063a53c8dfa6bc5bbbf9afc7ff6519199c2f19 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -157,12 +157,12 @@ static int dcss_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	WARN_ON(!dma_obj);
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							new_plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
 
 	hdisplay = crtc_state->adjusted_mode.hdisplay;
 	vdisplay = crtc_state->adjusted_mode.vdisplay;
 
 	if (!dcss_plane_is_source_size_allowed(new_plane_state->src_w >> 16,

-- 
2.50.1

