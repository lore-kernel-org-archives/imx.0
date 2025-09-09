Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9803203B2
	for <imx@lists.linux.dev>; Tue,  9 Sep 2025 11:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417321; cv=none; b=T0Tc5nhm15UlYSbeghPVxXiXomDm9xQRGlh95Kfel/wjjceVsPMP8J2R0A4E9j4kvv8kwN0lbAo9uNPpBrSOQv74i9b8Cw0zuAyyqHEgab2x3HJiJV0YuLjXi3kbkwRSvtSg16HvqmoZ5g6I5yDAfeiXo/C1CKsrje2vQB1uKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417321; c=relaxed/simple;
	bh=wIIA34sMjqdACOJSvYzTP2Jt6YsaPcn1jljZ4TFuAY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1HtmapbtqTZe2F3xlXnInI05A34WH88hVvFUjRLau83ErLteubPdI3oR4lmrlJBJptWwREwjG7xqOSXtB2WkSj2xvgNjzGtDncZghVLa2yzgvkQoko5HafNGOARnbQaWoSXqxXUGHTa5VLcDT1kUWJOkOjAFPPjEAakG55Qo/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ie45hwQE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ie45hwQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6CCC4CEF5;
	Tue,  9 Sep 2025 11:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417320;
	bh=wIIA34sMjqdACOJSvYzTP2Jt6YsaPcn1jljZ4TFuAY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ie45hwQEfH6KYJR1NvRIX9Q8Pi+zjzQNIGIbayd3cC+xXwscDWhgZMTbtfHJlYwST
	 nSgvZUS/2xWfUcXxc5dWVWim0td6pio66g4ZqB/w0/91YkK9RaSfDg7FUCSlL7P1yQ
	 GvYmtql3as65JM99hSlPFb2AXCYtVCzMfss8NmzO7e2HXuscKAxeCbIvm405RtPPHg
	 KT/rCKCUzOWzK78yeEfDZg4qDeM2kMvpWriOEf3UbSSHxgNBkUeZOlW2a69nGeVDMF
	 1KSOC2SHIgCJd6qUG5vEljkw0AWJkSn6S8yiZGDMW+BJ6hpWEELNYp7fEOcFLP/d/H
	 4x2UEgPkpPjKw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:37 +0200
Subject: [PATCH v3 18/39] drm/imx-dcss: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-18-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wIIA34sMjqdACOJSvYzTP2Jt6YsaPcn1jljZ4TFuAY0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+LUMtrwKebz60Vr91uzrO5LMOhjaX7XN37Xk/uIMn
 b9R6+ZmdUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ3GFgrJVnVtoVu/HwoZPb
 v8um/+z8q65RGFF6ppoj+9kV5kSec9ET/Y80brdP3C3aKVKtsfDodMaGu56eCz2FMpU/u+WleBx
 Y98m/uON32Wq5hih5YRmua2J7N/6dk5XNtVPsw3Odp775AewA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The imx-dcss atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

