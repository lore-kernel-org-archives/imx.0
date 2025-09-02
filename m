Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3606C275106
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805769; cv=none; b=KZlWe7rUF1qTambe6yg2bRbLXD4DUIU7/8r4EykNo3SiD4dAmrJFxti00AMNGlaFg/s1K+wCQzDq3/cnASeE2HbA9LkNhsTsCGF2507z/D4qsZVnHCvydL+IF0rY6yfvS+nYAteM3TdQiwZn+ZxFvwJ7dKZFzf+BcXupUZhG/2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805769; c=relaxed/simple;
	bh=3w3z8lC19xg6OG2x/DLWQZURfAZl1jOshuOlqNWDqoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MtNhROEjeUVS/vn8ft3Yi1j4TrljO4eHMT/f/ZvCI0y5GV+M2TMLH64cYynONM91O754Z5Fjc7g0etRGP9EWiho4bputn10eOXCkqHx/nSatLSw1XR6Qo+kj38I4qvrzLZFlJr76UCYxf68/xO/NEyHF4VOtqyjDGKjLgsxQAZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZjUkoPB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZjUkoPB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACE7C4CEED;
	Tue,  2 Sep 2025 09:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805768;
	bh=3w3z8lC19xg6OG2x/DLWQZURfAZl1jOshuOlqNWDqoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tZjUkoPBsHQfTkIq6eRI5rqvSx6N9+NklFWRlayt7ieMtOoCtqA/EqOMfBmvMrL8F
	 sLEURqQXNb2PzUe1v8WDtJpbIWDx4y3+P+94rc+5bSENYOUdvoRP8DcALMI2qTgIe4
	 3aea/jKisb9vUXxXaWd+Je7Yk6BNsoOWnn0/QM+v3+5tyKz0IaMxhFEfFW36m/kOv+
	 xoGLU4CbXKAoQZl0vy7zCr4oQ136dTaEkNOz9B5RD2U15dljNaAdInsecMwhWgLSTS
	 I50FeP3AOkxeHzzE6Hx51p7xx5HzrrG85jUGvymhZMQBEobiMzl7nsl+UffiE1m63D
	 P+vfTIOHf1Mcg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:15 +0200
Subject: [PATCH v2 16/37] drm/imx-dc: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-16-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3w3z8lC19xg6OG2x/DLWQZURfAZl1jOshuOlqNWDqoE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgVdtyneVRi669cH9l4T113P7vS6/74YXzVjyoEOy
 S+Py7ef7pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATydrG2LBUpTW+yvH/ivjQ
 V9v7mZRXft+pceHKVO3loobru/kmR3w8u8TiruXGIKfvYvPnf5mzl5Wx3nVJYaZ3eeXLwH/sWxe
 tXZsftnhj+6/PO5WSsxpX24ebsVdlMKtMeMdw68nE5qiJOSySAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The imx-dc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

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

