Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEFB37AA64
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547639; cv=none; b=S9RgREplBphm3FdJai3w/LUPRG0nuUp1Ba5hV1OViX+jvqs7ocwDQnADExvNe6cKTiI4RiR+7nD3venMB6qC1XAMz4uw3ie7j4YkbM7Hu978ceFGvTL4QzZ3Mc6uIbi4B/nMtE4l0uCUkfAOncHZTAiD37pRpJpqC7xS3XfbTM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547639; c=relaxed/simple;
	bh=6Ybfx0lFdICtzKlrOMUeIb8C42jMZMhMcXq2Ao+QSu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A3zzIbFok2WeICExWaQ6PCNDAbgZyUMGJCRmT1g5/gRePOC8NjcFWuQAHj5XwIl6YC2Ki6jppwNnMtIK5yBMdnehLEAfMdIboXiPnbvsDGt86pwfECSvH8ttJnIbQhQDMhTy+kVQhdOHd/HQ5p7fOJzfR4Yi37qGezMxXiceFao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfWZ4ILR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfWZ4ILR"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de008b020so149221f8f.1
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 14:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783547634; x=1784152434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IIMECz0v1f4LVIdLn0HTlLUSx/SJvMxrwrh19eAWfPY=;
        b=UfWZ4ILRL3h4zhUfeUqXoK6loLDyUUFDYrhNEk1EqS+JkwmZstSn29xFVZmPBqi/0g
         tNQhNtlEvMhpZ629Fg+mdEgUDHbQOfifVzlRpW2bzUJHU0pOBmn1lCWvBWJGn9d8rN+l
         6OnkVAo9a43xRlDau0CAFdbtqvY1t2DeVkA3PW+qBM9IkAaeBrXotZ/RwRWlV+NQaoLZ
         jI4j59jTLejLNIv6/mDQw1Wm23bHazYGmBNHP9mPiXov28SWa9SM8TZGRXhSPUnU9iKc
         V+2oOHn/g0sh6/4lu5DbfuFbvXuRH1fuG2wckbU0afXMe1xT1hMBORZbL5lqCGfbn0nL
         RS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783547634; x=1784152434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IIMECz0v1f4LVIdLn0HTlLUSx/SJvMxrwrh19eAWfPY=;
        b=QLXT9U/l6u7PTIsuaCoLnTlO7etD0L2WKDTJjZ5GZcyg3/hLZWmQQYZQ8JoHI7nAYF
         gP0ZhBMNxtocHbCluEAWVsX8v1i4ZiBmzgwVfzIZ5D285t+t9gPGN97DmloHjUBl1SjI
         nuxHNZ4tHfpl8WxD3dYZEHVgiACKi8LfbCeISQWFwKdBZ7H4/Cu9AyHdQJoTgB8BzvXN
         tDNQOHKSvmfsKoQEMZ7Xlr7UfBoDAWal1JOPx2dlh0s/sApbQNOL8aHSR5rid6/1086r
         fqnL4c5NS9yTnJmBZNjrDXg8xTiNS6P55ar4f5ut6rw6xsXvEyYOnpcyyqR5cbHRgZTs
         3Lrg==
X-Forwarded-Encrypted: i=1; AHgh+Rrf/RocGi6ZwXnzxdlLfSDWjL7UaiElb0oghGARfSQ40Tp1uP/HmgcLtpfoVI3CXQMNGnM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKbKSHTcG/9hMxTdq+TBpup9vcvplcVTVoX/aZ9vMdFKOHvC5J
	n0XcsUOyxFkiCbDSWVt1tTFl6T/NPvbtqmo3Ul6nhacyT6tNo1ceRzvj
X-Gm-Gg: AfdE7cmGm9akcc1RLoBlQ7jVRdESyxP7wCpxXnPSyR0+RqBOVrM1cFcVBUI2HfDnwch
	sVtYrnKzBREhK6WexGUJlRX+q+a/Ibgf1KPOBkQHeUmsmB5qrI9MRzH3cyM0Di6PB6hA4LFHS72
	X5exiz6S9lc+MH9reYXNVlq7g6vx7XSC/4K5vIzG3JEYvgLg1V/6JT/JqdbiqcGe9J2BWFMjpud
	rUXox3Kffy4pHVXjsXTAtalQ4RWLgLdOO1VlP1HcqUX/QPeIZuiadRWjuAC8lBw3MBHDSBHRnC/
	4aEik+UCGevAq6OZxPvj0F02ur0YhEilANgiR9o0mGSpCVyWURIeqdVmBp+bWFvqhiwQWaFOuRg
	voNZtpE2j+vqa8acVr97ZcGWIZP5nCQlyij9UWT302UotifQP1gc0YRVycpLqL/9Pnryvl2t5SM
	/nG117IBK0Ve84+iSS46QStfldxvE4HGncONnRNJHGD2xJm+cxyA==
X-Received: by 2002:a05:6000:4602:b0:47d:f6a5:1fd6 with SMTP id ffacd0b85a97d-47df7561c98mr84937f8f.26.1783547634411;
        Wed, 08 Jul 2026 14:53:54 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:7550:b182:7bdf:fbd0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm46622289f8f.15.2026.07.08.14.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:53:53 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] drm/imx: ipuv3: account for active PREs in atomic check
Date: Wed,  8 Jul 2026 23:53:38 +0200
Message-ID: <20260708215338.147145-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu_planes_assign_pre() starts each atomic check with the number of
registered PRE blocks, but that value does not account for PREs that are
already used by planes outside the current atomic state.

This can happen when CRTCs are updated independently: the current commit
only adds planes from the affected CRTCs, while PREs used by other active
CRTCs are ignored. As a result, atomic check can approve more PRE users
than the hardware can provide.

Subtract already-active PRE users that are not part of the current atomic
state before assigning PREs to the planes in the commit.

Fixes: 00514e859335 ("drm/imx: use PRG/PRE when possible")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index 67f2da7f2b65..d6806d1ae6e1 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -822,6 +822,19 @@ int ipu_planes_assign_pre(struct drm_device *dev,
 			return ret;
 	}
 
+	list_for_each_entry(plane, &dev->mode_config.plane_list, head) {
+		if (drm_atomic_get_new_plane_state(state, plane))
+			continue;
+
+		plane_state = plane->state;
+		if (!plane_state || !plane_state->crtc || !plane_state->fb)
+			continue;
+
+		ipu_state = to_ipu_plane_state(plane_state);
+		if (ipu_state->use_pre)
+			available_pres--;
+	}
+
 	/*
 	 * We are going over the planes in 2 passes: first we assign PREs to
 	 * planes with a tiling modifier, which need the PREs to resolve into
@@ -843,7 +856,7 @@ int ipu_planes_assign_pre(struct drm_device *dev,
 		    plane_state->fb->modifier == DRM_FORMAT_MOD_LINEAR)
 			continue;
 
-		if (!ipu_prg_present(ipu_plane->ipu) || !available_pres)
+		if (!ipu_prg_present(ipu_plane->ipu) || available_pres <= 0)
 			return -EINVAL;
 
 		if (!ipu_prg_format_supported(ipu_plane->ipu,
@@ -871,7 +884,7 @@ int ipu_planes_assign_pre(struct drm_device *dev,
 		/* make sure that modifier is initialized */
 		plane_state->fb->modifier = DRM_FORMAT_MOD_LINEAR;
 
-		if (ipu_prg_present(ipu_plane->ipu) && available_pres &&
+		if (ipu_prg_present(ipu_plane->ipu) && available_pres > 0 &&
 		    ipu_prg_format_supported(ipu_plane->ipu,
 					     plane_state->fb->format->format,
 					     plane_state->fb->modifier)) {
-- 
2.43.0

