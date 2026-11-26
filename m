Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677205;
	b=ChfXLVM6qrmu8EgSAIU6NF2HuUEZ/cDlFdpUTSDQ6GLGtgHggIHbE+hflvSvdrCrhp/2
	 YSqdr8VAPnN4/THKTCoTPhNKVJegq35QmH10nuxphP0fTsjfAojafJ5XZJjv9Bwpu7IRJ
	 aRj9hVQ3BHRuoUaiuXDFtRry3deNqXmHxsZfv5A5gA5rQ8ZxIvPxtRlfsyGhj8ffFQxdM
	 C18w9W9haPDWNhf0EgrJdzook/+MpVIPacbltojxrDuPc1omHSabNZgwInPN8IDIVbsr5
	 HY/OTmOKRgph+3G1oKQ4pSXsQkejinZs78B7E+LWk1tkhxXJhZfqZByWUquRZ4OER8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6jLMJNG2/VMi4KMGExC+bNwMaNVFu7tNu9htN+cJ+pg=;
	b=Gv6tA/n1nckWOVKeglkoinugsCN4lyN3zaaj9vKDSSWLrX9OTRg8uZgcRiOvYw18iOnj
	 9AFOwuWMEgzgAi9/WVDcTxC6AZSVK0EwprvrQLuu+9tv8SMMNQ3DElErU2+spK4UzuD8n
	 GKxpnk5yNH0o/ScM2OzySTr0ixyUmLxHf7juDACGNnift1/U3skc3Ik8T+osYlfYZAxX3
	 E7yWvHQi887iIIpQYDRnHx+a/7tayyKN5qiDb6wok7HLOgqvMoCfsLBjOHsIb6dL9XN6x
	 hgM8K3TeAnQSS/59ngoAHwLszV0VicmIQgRc1EY8lZA8dVTjMGvokfIedzegWwUDHXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m2SxYFrH;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EE606A31E
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 07:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m2SxYFrH
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04fab527eso51610695ad.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 23:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795677204; x=1796282004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jLMJNG2/VMi4KMGExC+bNwMaNVFu7tNu9htN+cJ+pg=;
        b=m2SxYFrHetIjNZvJYCrNpnCt+pKIV3s3iI0aSZBJcPk4EV0rL/lHP+wxw2u80Fu/c3
         BtDqX1Wmw5D91MzKI9Us3LvKESuD/yFuB8kTTesQU4ECXf6jppVxSQPWuXHNsBNO7d1S
         leY1PxgAhFHr1rR8b/LVUfHTWH7M2KbaM1GYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677204; x=1796282004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jLMJNG2/VMi4KMGExC+bNwMaNVFu7tNu9htN+cJ+pg=;
        b=m84cWQu9EUUolZNyq9BYmyqzZ6S/WyxzLXDJSsbAx76NG0z5S8aXzya6UEVJs2Uza9
         kN6mkr515y5mfNDdcFQW2KThI4tNQjyakStlZff22BPYt19a9QC11hYUsnxZKOah/Zv2
         SlM1tE1ICwqb6MEbLJWj/Lbe6Sj344zPzwniecqoqQxKWNLcJFyR/C/4rBM0mXWqodX9
         DZBQj0kGvH9Yiw9dr2xmc35nM4br4jgV/20gZuC+LdYE0PaxUqxinxCN2hmGmwjq66fO
         ed/Yh4nsUMGznjYQHJZzn0okedunWG0TQrLNYzcW9f9i4LN9VznKWBnHpDHFhIzGSi42
         k3+w==
X-Forwarded-Encrypted: i=1; AL+hErHtjwyVVAGvmH8pKAA/B2JZmeqRf8BB6j5GQ0xIfd75nNoEv99VkzpNXO+APX/6+LEUk3k=@lists.linux.dev
X-Gm-Message-State: APuU4Z9l6+xohH4BGclGQqgFU2WJxgbwjey2BAlf34cS9a65kSICnVi3
	Wms8a7SAjV0PmGrctKkmdhoxNgb32naSUccqOE7GqWtjjFM7K4Lo2YZveMCxG0VbjA==
X-Gm-Gg: AZFdTZeElvdEAeBK6qvuBBo37MZhW90Ct+CKUVuForr4/Tq7R5rfYN6LBAl7YiG3Egl
	lOgwY28TnJzDcO04Fu4nPDkuPSEQOyFKluskkuiNlkOyTuUCkO837oVHgHZ55RzmE5J6mqFN2Km
	JWF9OtWYelIskMWYpc41rehsGL0nFOMxjIkOrFV5qWoCkusJVC4J+GwwriM1CszwMZePQ3j4U/9
	ec8kgWOkb2kPMAEKmawKuScod6OMVxinC6SF2G6mtM/nIYAIFpkA6zYzML/iM4vdgU4t45O5WQ8
	PBplotgTbE20WHyLIfvKMDaTbpAfFLpLRs/Vcbc9wXEXO72jv/JSqdGAeTlkJDYpRqJ0lSMGykR
	jyTNvN3EOoShwwK/YN7NcklPTxUUwKij+vgPWKL9l2WjPEB3A1UCYtNeZJoGC1uhVPkE9h/5cAY
	okH0iP4z0/+bKyzJoiZKs6hfQAgG4/fj85l3dVt73rHAC+rycpxtgr6CqTWMyYqCEe6DO8dtwjG
	vSrQ82EonrHU3lICBTViP7xGb0spprFCzgHeC+fA0NnFS9LLrSkvhScCgjfynT/o+VQc+jogR0r
	2COXGvHzg0Y2XPr/FI+rByc/s/lZbXOyxI3Sr8PAIDZjq+s/ScSBF+PIBr1k
X-Received: by 2002:a17:902:ef45:b0:2ed:8bce:aa38 with SMTP id d9443c01a7336-2f03efb1064mr209959425ad.3.1795677204222;
        Wed, 25 Nov 2026 23:13:24 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:418f:e7d0:882d:ceec])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03f120016sm99270965ad.58.2026.11.25.23.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:13:23 -0800 (PST)
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
Subject: [PATCH RFT v4 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Thu, 26 Nov 2026 15:12:48 +0800
Message-ID: <20261126071314.253890-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v4 of my drm_fb_dma_get_gem_clipped_addr() series.

Changes since v3:
- Expanded drm_fb_dma_get_gem_clipped_addr() kernel-doc to explain clipping
  and added an inline comment highlighting the clipped source coordinates
  (Thomas)
- Collected Reviewed-by tags on patches 1-3 and Tested-by on patch 3
  (Thomas, Jernej)
- Link to v3: https://lore.kernel.org/all/20261124074041.115251-1-wenst@chromium.org/

Changes since v2:
- Changed drm_framebuffer_get_block_offset() offset variable and return
  type to u64, and used mul_u32_u32() to avoid 32-bit overflow (Thomas)
- Link to v2: https://lore.kernel.org/all/20260916033327.3054126-1-wenst@chromium.org/

Changes since v1:
- Added and used new drm_framebuffer_get_block_offset() helper (Thomas)
- Link to v1: https://lore.kernel.org/all/20260908090745.1089143-1-wenst@chromium.org/


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


Patches 1-3 are reviewed and the sun4i changes (patch 3) have been tested
by Jernej. Please help review and test the imx/dc and imx/dcss changes
(patches 4 and 5), which are only compile tested on my end. The imx/dcss
changes should not have any behavioral difference.

My plan is to merge patches 1-3 in a couple days. Patches 4 and 5 can be
merged after they have been tested.


Thanks
ChenYu

Chen-Yu Tsai (5):
  drm: Split framebuffer pixel offset calculation from
    drm_fb_dma_get_gem_addr()
  drm/fb-dma-helper: Add drm_fb_dma_get_gem_clipped_addr()
  drm/sun4i: layers: Fix VI buffer address for clipped offsets
  drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
  drm/imx/dcss: plane: Switch to drm_fb_dma_get_gem_clipped_addr()

 drivers/gpu/drm/drm_fb_dma_helper.c    | 74 ++++++++++++++++----------
 drivers/gpu/drm/drm_framebuffer.c      | 46 ++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 +++++-------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 include/drm/drm_framebuffer.h          |  3 ++
 8 files changed, 132 insertions(+), 51 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

