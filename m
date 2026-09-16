Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFB41BD9D0
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 03:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789529620; cv=none; b=M03RrJfoq70bs1AnnSlxycxM8pUL71iqsEs0u4p4uUPOvxDPNC/EhHs2npnhbxCV5aUUaO+U8zM1H0lu8yH2UUebuo3S5xGi7OQrJQjSvuMZgviOYbxy0sxHUxYdNTbafWQhfwPuUJ/16nq4gFkfSKKkWRlgICY6GlesPmdc3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789529620; c=relaxed/simple;
	bh=s5XVTbQ1oqig9WAX+D6K/Dw3nnCGDh9w9eKsg9hj0nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JVpndK6wk1QHE0sQLyWBIEYU87Oxz7vtClbHxnUBKmZ3h7QMe1WhXZLMiTwKJYkyUSexxdmNx3S8iR5R73sCen5hyB6ah9s6ZdhVqeVAGO5S4Zh9N0HfzLBqMcogLsp6jJo9juy3gOm1HPJwwr/bhs0as72NRyAtLTe5uvhPjFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NZ3t0Vze; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NZ3t0Vze"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so418658a91.0
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 20:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789529617; x=1790134417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WW23/p8j1VrlcRbF/FlA+rOMTRyOj5YVS3I8yZ6IEcE=;
        b=NZ3t0VzePR4iRhHhSgKLsR7n+ktUbFPmuubMjworhQ/TceDgBTOVq7gQ5vsmVjE4sR
         WqlwKAbj4R0xrHCfjHatfYFKWWDlQG/qq/Z31lwv8mBUP//B/g2t2z6jqUlm0xoEnpOU
         HODpVenEZKaBIfDrUX8Dg0r5U1jYGAuJzqAuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789529617; x=1790134417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW23/p8j1VrlcRbF/FlA+rOMTRyOj5YVS3I8yZ6IEcE=;
        b=2fsSenqsX8TnwVyLv4pRrP2ipqlE80CP8pm6xundL8CSCWVcS9yLxOnp9Fj60yCh1Y
         K17ctKc0b7LnOqeyyQAV8fEo0JXWlenCiaeGfac/uBaegJQh+wpK9pml/GONKyofMamR
         yMt0PlULtrpHMqegZcCezeItthHPOu4h2LmlPcnGJbtm7yadKlWXPPce2SAUYNkJOg/a
         W37+i0qf0nZ8mILwSq8DGtmo6kUndPvA3cEDGUOhTbj/tKJ/8GUX5ZFmmRmK4jK32Br4
         k8IqD3BoQXcpK8nDpSQ5k1cV4lOoGnWZt9tTOfz6JooFI9hMnObvwk6jVKcmhsqn9zS4
         NjVA==
X-Forwarded-Encrypted: i=1; AKwUvBy3AOLwcTGjunvTfXoVKLflyz1DsSt0EYiQ1yE8cXO+3aUKkTTQU+H2xe6SV97dVbMvewM=@lists.linux.dev
X-Gm-Message-State: AFuF++kHC1NY9/r+h6gmIYrcA9Lytfu+yTPoCdSYmHc5rS75DyhdAfh1
	R40IqY8WYjaZigyViUPA3O7Qsn76Wes8KdG7oeBKiYszMC7XedVeTEhY/W4dhXcgpw==
X-Gm-Gg: AYBFou0TEwEMVjxdBzCWQNK3IhiytSFXTEe++B7HjBkTJrbPcD4Qt/2K8kKGw/f8l/z
	WUKzD/QofxU2Aw/JK9nLtV6//MF4JZUY8jeE9nfig5gJjVfpqVbzw6QRzWzs0UBaeatlh9+GVoe
	Tl4CuJE8t0JP4gJ40/AT4pCykn0DpW9QmcwHx3360keWjdhPGSuNRKUWQScDGAeZnP/gDbL2J/3
	3IexIOR5MjhtzJsTcLn9Z6kVrBPo3v++nGitJffcZRGWC03jbeU6V+ndfOQERFh5SdjeypelrfD
	VRnwZLhV5zUNTo38gTpnIHekGFekZP4GwRtdR4aBiHS7mDmJ1p0mFUrfBzfuHng0M1qjEKygOdc
	luzfmreDh26VU8NBiZGbB0k5KuAhgI3stwO+PrLG0fvCIMheexop23lCOvBlC/NCyijGNiSj2Hj
	BhFCCzzCAtcGdwY6b6aMQ0Ez604+iigQ5zOsBOHsoFzVL57vLeJS8T4Wh4uiBWw/xu/pymunuDm
	dVqZqBjWA1j6oSmlh2peAXZPIa4YAmt+t/wWSgzeaSbEeUXIhwUIMBsJA==
X-Received: by 2002:a17:90b:224b:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39e1e4246f7mr2337951a91.13.1789529616959;
        Tue, 15 Sep 2026 20:33:36 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbe3e62sm1833477a91.10.2026.09.15.20.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 20:33:36 -0700 (PDT)
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
Subject: [PATCH RFT v2 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Wed, 16 Sep 2026 11:33:21 +0800
Message-ID: <20260916033327.3054126-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v2 of my drm_fb_dma_get_gem_clipped_addr() series.

Changes since v1:
- Add and use new drm_framebuffer_get_block_offset() helper (Thomas)


This series adds a helper to retrieve the buffer starting address of a
"clipped" framebuffer. This contrasts with drm_fb_dma_get_gem_addr(),
which gives the address of the full buffer.

Some drivers program their hardware with clipped dimensions, so they
should be using the clipped buffer address as well, unless the hardware
can advance the scanout directly. (Side note: many drivers still use
the non-clipped dimensions.)

While at it, also pull out the offset calculation of drm_fb_dma_get_gem_addr()
into a separate helper in drm_framebuffer.[ch], thereby separating
responsibilities.

The sun4i driver was recently incorrectly converted to use the unclipped
drm_fb_dma_get_gem_addr() helper. This broke offsets into subsampled
pixel groups, but also exposed the mismatch between the dimensions used
vs the buffer address. Two other drivers were also touched.


Patch 1 adds a new helper to return the byte offset into a framebuffer
for the start of the pixel block of the given pixel coordinates.

Patch 2 adds the new helper to return the buffer address based on
clipped coordinates.

Patch 3 switches the sun4i driver to the new helper, and fixes the
luma plane buffer address offset for subsampled YUV formats.

Patch 4 converts the imx/dc driver to use the new helper. This fixes a
mismatch between the programmed coordinates and the buffer address.

Patch 5 replaces the open coded buffer address calculation in the
imx/dcss driver with the new helper. Existing behavior, which might be
wrong, is preserved.


Please help test. The series is only compile tested on my end. The sun4i
changes should revert its behavior to before the drm_fb_dma_get_gem_addr()
was adopted. The imx/dcss changes should not have any behavioral
difference.


Thanks
ChenYu

Chen-Yu Tsai (5):
  drm: Split framebuffer pixel offset calculation from
    drm_fb_dma_get_gem_addr()
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 61 ++++++++++++++------------
 drivers/gpu/drm/drm_framebuffer.c      | 45 +++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 include/drm/drm_framebuffer.h          |  3 ++
 8 files changed, 118 insertions(+), 51 deletions(-)

-- 
2.55.0.1032.g73a4cd73de-goog

