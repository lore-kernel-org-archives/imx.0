Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4107A4EBAF8
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858477; cv=none; b=Zxy8eRN84mMo8cqZZkZA85UZMc2fdkax2saXukXHyNyyyDVoUZBs0zJWHnC7a3k6J2UxtuQa+Us9+xTOzwaIFCX9atzFrO4yL36ElbIzp3DzXXzoXjeOv3WqyForPaHEklxU/aUnAVizgtwVv2S4FvTmFo9N9wuhIYT2DaE6khQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858477; c=relaxed/simple;
	bh=eI7mygHg5Pp/gueDQ8IVUiOrphdwqMR4YUjhIN93PJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnP61P8LW3MzFBKE95fBw3CHTgONTfoAz1H9p1gy8Fx7q5pCyZG3KaHgFkQNB24x6xB7d448V2djzrQXQqBzN/q4b+MCrUhPVhnrgdYypBjTEympZgftWboUXtcYNwxvcNFZfywnqiL7AgguvXSFAQnj8kl7OMn1Ehh7lMZyVg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G0KAhgIw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G0KAhgIw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5cad1a6baso37979775ad.3
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788858474; x=1789463274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMi1Y04Cowkyywav7yYVH94ClrmOV8qsvBcUcq9aXsA=;
        b=G0KAhgIwDl5uKePDGlLU39ea9JwopKpi4bVH7aANQ8LdNLrr6XjvYYlVNEsgRG3CFs
         JCL2e5LXS5HkVZ+fHXmVbdufEIT+GKovE7nKgvuI4PuYGjZwtZ+4DHWxXW03DL821LjC
         smEEKze0BLTF6y+x05uE2MrxR40TO34JYKU54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858474; x=1789463274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMi1Y04Cowkyywav7yYVH94ClrmOV8qsvBcUcq9aXsA=;
        b=TS3Cg50XNRRPMvM1T+SqeYwmYp7bvD+lwGH41opzz3m5/OIn7mrItvCc1KcsQHzGdj
         k86Kkecu9PWWPuXeoXsTCtC6POZgLnYSav/9wtB8Utxv4CT1dl0TYrie1kfC8ddqtgmp
         OuMKAs4u6dcf4H/3bd+WMpoVUfr6T5CpVSuTCpCbNpj0DElB1EmwTHz1QsAC1g8UcpIT
         GjqIrnuMPPqSCwcX1B1oOkPGNHoks6Gnr/8aDZBqV4+RGWnkoOwO6eRWgklHN2/aCQ1m
         PprXzEUHp+JwK37KgLfQLEAtKc7xj/oapidQ+nIOBm46aX1Odkpzpo/Q3XlMeHHiSzHd
         I56A==
X-Forwarded-Encrypted: i=1; AKwUvBwrBL1RviRRgF8LEhY2Qsf07wM9gVM5vBQGA0eacmyuvSsEOkxUoJ1cnTnt5RqJSBl6jtI=@lists.linux.dev
X-Gm-Message-State: AFuF++mxIF2iYIC/sc3+vXIXckrBfTz2QQIE2Uw5rJ79/uoO6EblUxgs
	BJcfFXFzWK+mY0l/RUNyWfAeq9eD0mN8NIo2HrCEQrqRXDXCJrLf53VkHYKo2m8J6g==
X-Gm-Gg: AYBFou0s9f+HA9JP9cwtRiGb0cVmWig/H/tkHy5nX5+lPIsMCV1yqfL+iy0myXbwplw
	3TtiM3WaZFAZZu1Q4XMH8IO6OK/6qYrRyXDVn1G+JgTVfskrdQjz6DyGMQjfhecRPLo+18dvQhP
	IHDISGSMz47jl1xDOU07HS8jcre86V8BMFze6HenmXiQC9xPv6Q/Af3llPGXPjjc5kxO2uPv30n
	zsy3CcwLY4OiDYYmhoqFWs7pn2Lb99EXgIBbVONqMvcsjKTPwAwKDdJjhT6lfmuiWGqKs5REMBf
	fDw0vpPmTDVJOH9bufomd6zVyDCI4hv01giLbcJDm0Yb6T5BAyF8QEVko0GvqVn2lh/UxuDylp3
	HZ1Xdks/pC3uSc0nsuf0LSsUOW9QIpYktVdiQGL7L4sba0+iPXiee0jO5P5hDdEcYjjZrWyynkY
	76DN5+WjBS40DvCjiFcobdpCQUMF9Pd6JGfrHAUlCQSTbIt09lcnGz9Pzs9AoaCj+n6z+66MNfw
	3w/5FrAeCjoH87eLV9gyYC2e95ObheokbcUAdkCNMAVy8E=
X-Received: by 2002:a17:90a:d010:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39b26272ef9mr45630109a91.12.1788858474627;
        Tue, 08 Sep 2026 02:07:54 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:e541:8c2f:4ce9:823a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm19718804a91.5.2026.09.08.02.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:07:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liu Ying <victor.liu@nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Tue,  8 Sep 2026 17:07:39 +0800
Message-ID: <20260908090745.1089143-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds a helper to retrieve the buffer starting address of a
"clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
which gives the address of the full buffer.

Some drivers program their hardware with clipped dimensions, so they
should be using the clipped buffer address as well, unless the hardware
can advance the scanout directly. (Side note: many drivers still use
the non-clipped dimensions.)

The sun4i driver was recently incorrectly converted to use the unclipped
drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
pixel groups, but also exposed the mismatch between the dimensions used
vs the buffer address.


Patch 1 adds the new helper to return the buffer address based on
clipped coordinates.

Patch 2 switches the sun4i driver to the new helper, and fixes the
luma plane buffer address offset for subsampled YUV formats.

Patch 3 converts the imx/dc driver to use the new helper. This fixes a
mismatch between the programmed coordinates and the buffer address.

Patch 4 replaces the open coded buffer address calculation in the
imx/dcss driver with the new helper.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (4):
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 63 +++++++++++++++++++-------
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 6 files changed, 83 insertions(+), 40 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

