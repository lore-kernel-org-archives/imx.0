Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506077;
	b=KSlq+x69YFG40KuPcw6tqrxQ1PCUnevsj5N1HBR1HFta3WJDDo3RShbjoOnsVa/BmMNI
	 vFzHVmqQdVUeHxp0afSr562iisZu/J24yii8uH+QMO4TC25XX15eMyqgodQG4J0BNICFC
	 fOYcS2hj2VyjiMutGIvP1ecde2793X+q7ijEwbQtt1rKX7srsEj0ebZ1fyLTQEzE1kOl0
	 WkVgOERX0WNIx1FWP8jahrfJrtypzL2gjMyak2GYfEwPKSsFiSSFMaJXcZ8npMZH1qg+o
	 pSLnhXauMwsdHCM9pmPc2a8MVm+uOIEHGP5d+gdW+81DhAr1AaodzBNVKx374EOeiyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=;
	b=VXFgFR/DICzDSeZrvyg+R6OEy48wcC+//YsDDIWrFlI0RpvPvTEZK9hIAwpjNsNBRJjx
	 mk9bl0ZSPq7QYRD2evJ3OB67WaoHDkExY312MVTo39LF1oNpKOMPqVIgVEq0nABd7xeWH
	 e0/QwE0cyc0Bana6CyLt5ZUCAj6lHGhlldVz+rGMa/bD9iRxBgnT7Xci18fSnCqLpFbk4
	 8plNlA+ez/FCtzn8ivS3njPPXOh+H0To1hJApNOVx69HVCttKMnzDwJMDEiSHrZupxroM
	 rcdoG7OPdvvZ9qdY3qn5ZNWkL47xduejrjjhy7pMo3uYP99phUgIUOM3hE8r+V9N5rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gB4VboDy;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFD6606A32A
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 07:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFD6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gB4VboDy
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so3548514a12.0
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 23:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795506077; x=1796110877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=;
        b=gB4VboDykbp7/xNrB+IFqXw8SKkyewE/AyeYiz0kyLCAqoFGXaOBfn2kfPYmX36T7E
         9lD0Mc8p+cvXccLfD3/efWSdihw/HGtUT8B/Dnz7+fRNU7hYO8TKE1oQOqCrXpoFF/1D
         kbVBA9GzE9nBuyX+VGo6+Uvm3MBfl+uQKyFZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506077; x=1796110877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74TXVSiLNJEh4EdaGe7nzkm4UiqpR2QLi5goWWiHysE=;
        b=HOWOfUqWpEB1BSBFyHdR1/O7pJddQXhUD7hSWfdqhMj2D3yNfutwZE80pUfzZqaEbh
         U7KjLmgYy3aEj9iYgFze7ZGqSwRUzp457GYfxxyQwrfsT9q+aMruTxnON604bj3rSsKt
         BDxSpIvXH+RR3TP5gTiIilvP8M8HWb50rFhWyGfuBQ2nEO7mfYMksRIE2oGSNwUyiR1d
         epE55GnOEBQIzityJfzd8XuMT10GaBJ9LYzO9riwIAC+hOR9MEySOs30J/Q/P+ijagiG
         n5KfuNujmGIVNAj0sOnFXk2+boMJy/zIvxEgrWDbWne9nRqFlsMutlI5jWnmUi7k2Trp
         MP6A==
X-Forwarded-Encrypted: i=1; AL+hErHdvNZ79dEvA8hgCB3V2J8ThXXOl1fU62Ghm2pJ/3/5zlzMgwQ8Mi1SxdM97e8HbZFXJpg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ulGgmsWIn9DENZcS996KGUwOPr1q8dhfFJlCFfPLbckuABA4a
	vAlkS5w1elHvN7vrYlAlIn1zmGMtG8N3m9haxRy09PTcK1WiKtgr9SIF1GgJFck6eA==
X-Gm-Gg: AZFdTZcmBsZw8VFNQYiCLZY+n9FLJ8Jx00kHEoDgJRMOs4v3kAtQw7osXm17DjnknLZ
	rz+5/59uEvjVA9SbVcA41i+DgggxjsbDhp5UApJrH0itp1E2OiKAzXaHglbRB1961Ca0JWuHphz
	S65n5PmYkN6+TNY6jzMFfiCoo7p2+f1+GAkhN6h0Q8Tkcs6/OPRHX1YlWQzEuL4sl6tSuGxwhma
	i5JCcld13FTF/Xbx+U4zK39t6v2e9vmJOd/+P5di2KJU/+VapJte4AcK/wooUqrz2wB3c/HYBG2
	8xngu+FR8jLoOAh/DtPaZUiv7kNbeJYsnbBtyplv4tXxEYf3oQCH6Be5QQUz5inCavKZw+YXz8+
	3aYrWB2O/Y7Vc7qPzqHZWfDvU6UYYhLBGWfsZLzGag2hH/CCBXXqlM7bTslRIMtdrFmvdskoXvv
	cCdQ92lr+Ba8ynz7+55ovBnN3rRtpdyq3HoxgTmLKCOISseb3eRjkRCUcrmov+4CnxJRniI5ATO
	U+tdSVh1czRuYpKJx65lPAxu6CxJFs91AEV6vTVWhQkK1B+ICCr8+zTthWnZpUVkfLZxF5wxmg5
	sKD9XCuIxKFOjt5+TTM81F+uF4wIDBVatHn7wctwYv7BBeENLEH79NocHHfg
X-Received: by 2002:a17:90b:3d90:b0:3b3:ff70:4d0d with SMTP id 98e67ed59e1d1-3b41c8d49b7mr11902997a91.14.1795506076825;
        Mon, 23 Nov 2026 23:41:16 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:8f32:8910:4727:ea03])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b44b7a8c64sm9100767a91.3.2026.11.23.23.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 23:41:16 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH RFT v3 4/5] drm/imx/dc: plane: Switch to drm_fb_dma_get_gem_clipped_addr()
Date: Tue, 24 Nov 2026 15:39:32 +0800
Message-ID: <20261124074041.115251-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
In-Reply-To: <20261124074041.115251-1-wenst@chromium.org>
References: <20261124074041.115251-1-wenst@chromium.org>
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

The hardware is programmed with clipped source and destination dimensions,
but the framebuffer address is calculated using drm_fb_dma_get_gem_addr(),
which uses the full source dimensions. This will not match the source
offset if the top and/or left sides are clipped.

Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
buffer address starting at the clipped boundary.

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Cc: <stable@vger.kernel.org> # Needs drm_fb_dma_get_gem_clipped_addr()
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imx/dc/dc-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index 62dd0576fadc..35eb5039f5ac 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -65,7 +65,7 @@ static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
 static int dc_plane_check_fb(struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
-	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	dma_addr_t baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
 
 	/* base address alignment */
 	if (baseaddr & 0x3) {
@@ -146,7 +146,7 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_commit *state)
 	src_w = drm_rect_width(&new_state->src) >> 16;
 	src_h = drm_rect_height(&new_state->src) >> 16;
 
-	baseaddr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
+	baseaddr = drm_fb_dma_get_gem_clipped_addr(fb, new_state, 0);
 
 	fu_ops = dc_fu_get_ops(dplane->fu);
 
-- 
2.56.1.809.ga0b61035b5-goog

