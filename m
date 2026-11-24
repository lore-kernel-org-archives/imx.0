Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506055;
	b=rcDOQO/S/LJ4nkpvS3HunD+ZeCI+Pppt7iJMIznXH6YV1nmugyTDYpnKjZPqXUx3gMlD
	 MMxPNxQ032f4TYMrYLITj6X0ZAUsHwisCffEEInEeTUjj7EoPCuOazU9uF9H69kPPwHiu
	 eZPh9olPnKfWfEZLWjzxI9ImQjK2LnWiFNPKy0fkTyYs/uPpnxJJsoQgw1lHR5AW9zgnq
	 7vs/TvpGiFVKSprxQk2gC0mCJFLhDU+H4m7bkSaLb5oVJZA4KlEAhBZS2qf14jaEOhl+r
	 4ymQ9p4tG8jtsit57VYbDGNwTOtM7UMxSDAS1NzGSLFuFxSObXvN+RYpDd0BFl+ZnAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=;
	b=c+NvXGZ/8WrH4u6gQfY+Y255+9Et3PPAFwHJBAzXKb26n/7RFMFLycEtBV00okTjki5w
	 N/XAE/q1qnv0c/KN0vjADAptDbDnM179m/zbiz6UNLX6mJ+VM+SDUxlcwf1yS6H/HEbHN
	 YVXUdWoNpVaLh2ygET6eTrrgQNMPOSLKSd6G2rBGhcUsGNGF1uEWeKo2JNVHh3gsl6H5L
	 RefHlkJYPsH2qjyffm7U/ZvipZEimu+k4b4uOfxFLsc6WNa1WnZQxiXAcU9o+ueXiMPXm
	 7XJ51BFhqsZnSCwJv9+K0YGLJR2O8vvPXIkUpt9N4c6mQmzjRPLHLT07lbjyQ0infcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=irIQYn8I;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57273606A31E
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 07:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57273606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=irIQYn8I
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso2034884a91.3
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506054; x=1796110854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=;
        b=irIQYn8IHaHV3ZhOkzpXNyvE7Yf4yoUelb9AvSpWnCuCVa7B0o8wX6CTkkOvA9yguJ
         ywmHrCCrZe+QORLvOS1EU1gs5t3Z7aawcm4L0S7w/1uYvWJvipv7nA1p2dCrcMTs9Sou
         58y9dwtICmZ1WR2CjsV/aIXUVFIDR72WufNL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506054; x=1796110854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yq9KtC/Vr6jX4nQrqLEI9ETBwLEZhdEPTg6w69t4M3Q=;
        b=OTyLSrW2z5k41Sn7IzHgAw4plNrU2hswyW1vZjlGa/VK/Y/HbAJtumGVucjJhJaZMt
         cru+3YaNvg4KyI99Mpxnqm6rD4bo924jIrGbZjZ9zYGoeplbMq1GWCCGhtKWClzjplcF
         XcpZhr3MBrw0zE0rmuJ4UOiAwTrsUMPhXdLUnZkUn6Ej/j5B+HHQrY9Ae7BPmS+QMsAM
         VZq1VQ33zFybICZIevndCqUFm+MJ6zKar9yPb9OYf7BBhqNhtU71HJlmFxWYtEbHdTag
         avQvFUBYeVN8dAM/q8KwseIxW0/8PO3DtjV4SKUiGJEaCulDZEEBQgU0DlHCPbsP7XJb
         RB3A==
X-Forwarded-Encrypted: i=1; AL+hErFvQeVqEmQc+i7VVIGA4ZvxqzbhvcFsfBJtkfo5lvl7d/RtjQxUMfArTZggXfbi2F4cKUA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+uh93BJxTWnF39VwVxB0p6yQzND/KjN3Vz+fVv4Ea30NXD4LHm
	ueYR3SStIY7Zo1ErlK3Wp5CZ2ZnvoIeK4tQ6MWFh0rP/NYjFKhujlwCsctET924IDg==
X-Gm-Gg: AZFdTZctrTCb3T7PrYRnW6vYjpoXRuyL1I8MRLqhl2n3ncV8LIynmfkwFRPqYV35vaz
	dXJU7k0o/Nn9FgwylY+BnIgnUiaxObPP2K1+RE4gMqWnfeTkZl0mwCJ6Lb8xaSbuYQ370i9wEWf
	J86mOR8vnWjOlv9T/bcLEirVMcbcAj8sViQThbZ25viPM4gCinuf+c+uR5y9OlGEszbp1sdLPtL
	N5Uc38KwtiKsVVM8uF8gZytg+eHbnn0hdokbNM3j57mZTzxa6miKRtEM040ogxv4v0wwXyNGbWn
	JqZNR1JNV0qeT4jtAZryAGClWYwtYFEw+MuYtUV7w8zqND5J1JWzGN/57R4bWnZKM++apnyT3qh
	8d8AjkOcE7WnENltL53ACgIq4a6QXfKA1hZNhXfX0VED5YeKeVvRnQQIZt7afU2tAM3/lCecOh4
	6/RvczGiGUF7KecPCJy3+RFA87mQSlfGpu1/L7P/z3pgH946fshkamU71V+eOzaouTAXjZ0eyQh
	oldL00sfP3dBmj/1bic0UCJyOL4FJNdvyO7DEdiqWE3FaccKpcltsdlrc3j0NKaSloU/i7FhLIM
	reH43BFpj4NOHLYG/3nLaF4g9rK3LTl0oC3154ZGumKWhM0/ErCZdoDHqClc
X-Received: by 2002:a17:90b:5289:b0:3b3:8094:321d with SMTP id 98e67ed59e1d1-3b41c9080bamr13617140a91.32.1795506053661;
        Mon, 23 Nov 2026 23:40:53 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde84cd5ed8sm3771777a12.10.2026.11.23.23.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:40:53 -0800 (PST)
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
Subject: [PATCH RFT v3 0/5] drm: Add and use drm_fb_dma_get_gem_clipped_addr() helper
Date: Tue, 24 Nov 2026 15:39:28 +0800
Message-ID: <20261124074041.115251-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
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

This is v3 of my drm_fb_dma_get_gem_clipped_addr() series.

Changes since v2:
- Change drm_framebuffer_get_block_offset() offset variable and return
  type to u64, and use mul_u32_u32() to avoid 32-bit overflow (Thomas)

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
helper was adopted. The imx/dcss changes should not have any behavioral
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
 drivers/gpu/drm/drm_framebuffer.c      | 46 +++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-plane.c      |  4 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c  | 34 ++++++--------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++-
 include/drm/drm_fb_dma_helper.h        |  4 ++
 include/drm/drm_framebuffer.h          |  3 ++
 8 files changed, 119 insertions(+), 51 deletions(-)

-- 
2.56.1.809.ga0b61035b5-goog

