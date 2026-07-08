Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E150E2DF126
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783542091; cv=none; b=cZWkdGPaTbH8ZcTA/7BScOXkORvAqvZcmSjdhtv7oZIZfGdODdEfMT2kbYXMM5Fapy2uqP3Y+leyb4PcaGAUO8aRfz/KvuVvigjBkVqrx0HgHXLNCS0sgXYGU0ux0hfyjlfB8s2DXegQ+rkfddSZbgJp45O4MHA3bz5xOCXpwHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783542091; c=relaxed/simple;
	bh=Xa6BF4P0OpiaSuiLW+xRdnqpjJkGE7kzujlfd60Km5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1ht3eQriBgm59YQ3Sn2GGbDfC+GQ/xeSUmAqOElAeCjG+opXEvr9MLztIj4OmJ8L2THB4ue/99CJdBEsfLwAbcdKf7y6krpGlO/cDQwVl3WxjR504Im7wRfolAq9MkhBXeF8x8X/Tl1BF3BymXFZqCA7eem7aTHkZ4CCWvY2pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/4hL7xI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/4hL7xI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so5956855e9.0
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 13:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783542088; x=1784146888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPC/fPRplTXrPRJP9WPEDmAAHY+62t7UA57bz5CaOyI=;
        b=U/4hL7xI+77jmMhO6SzL6kzxGo4b6Keoj744GIU/A8AZGIL9b37kbrv+oig5QWKxd/
         4I7q6w3fkp+eXJiHBMcX1J+Ie/lXtylTfGByPvceZykcGUF6ke46CBu3YsZdEipD0JpC
         oYraCFSH7dQWJecMJKgF1BPAia0r7GogY77+M811hAaegLkzZRJJtUBR47iPoSMq1qh8
         ltX6fOxmJVTT/I0un8yGmVrWLv/HzJGUUfwPNirq5kPigWreRkdUrET/luvf08Vy2QGP
         nvh1dwjwxTh57gozMgpQLakR+52X5mNhUzoItIv20LX2Zc6zRbdtT2+5T754nKkh3d19
         lPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783542088; x=1784146888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPC/fPRplTXrPRJP9WPEDmAAHY+62t7UA57bz5CaOyI=;
        b=k/ZP3wjmHk9v8aKW3yCBltQQk5RuFng53n9tRaIV1SytCnWhyMhiE5G/11QlwjTCvk
         xBeb7UT97qNEGd3WuQxA25qgA8vjb2gR44OYtp+s0MPGm+GGpbgc5dj3P/HxyAwY+6yX
         6XkHzUH8a4r7JBoghMvf576Q6WiUhSzdQGRc8bNM0lUEbKdA4IYGhK4ffmiVhVzJMisg
         E+0ppmFeUxW2maaAolwmrbxQVaWjR/NP/k47kJatZoMVGcqoGSRVdTcwWRNoUvGkOUmR
         bH+qB6Hrx6+MlZ/mtpyb3WDHWy7s06UNXuYFG6OcV9WEBi0rq5KCP6rloRtB/80K7u+9
         Domg==
X-Forwarded-Encrypted: i=1; AHgh+Rrm+tZ7br5+Gm3/lH1PWNMYHvz70x8DM4ZnhjNFK2I+rZpqqplQ6hhh2pwSRWk7vDX5cWY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbjMCevW+JUteV0nyEQyrWjv3bmR9kgHpiUzU6R2Dpst46HBtN
	D3SFG+OBGhY0IDy/B/PkYjeVyz2IZTXUpvJZWxCnzLjxB6SuBDVjT5dP
X-Gm-Gg: AfdE7cmlURbmCTg6lJMdBCH3QW+DOSTfvEvkxRKNukrzJZSMQPpW7FpPWcCzy4MWBIQ
	OI8Wq3tU75IAafnToSgaasxUjPrurwzxPHKZX+HVgaJwiIGGoqdMsBi7ZQeP/Cs1G3m62X85qc+
	A2AO9/dp7CGiTdKu03HDL18W6qum6HckhIKnjIG2oWli+mWvJeLC+8X5qMp+lmmBFNF3zA09y2Y
	nezHea9c/0Sm9VexVxByHePjzvtO1PZcq4B6hh96vSNafJ2wvB8WPZbKHO88odMnsIbTHZ/klmh
	FR9YRAi/BvFvcLcz/y3qsWAOylXZDunRhBxXCtA4DdYIn+yR98TVnjOJ53+6eHLnpx0EmdvG5ex
	LtuP9Ps6Ge8kaDWtzUOURwQ35GY7Wt6x/qNjto35vsl/0Ws+7qckdvjBfqz6qYWQovozYm73uv2
	8tlp2xZh7A7ucvI5qSY4ZWB5zZOnLR1yVrRzO1UYg2wQo+Wq3uwQ==
X-Received: by 2002:a05:600c:3e07:b0:493:de89:61b with SMTP id 5b1f17b1804b1-493e6868766mr42351155e9.26.1783542088002;
        Wed, 08 Jul 2026 13:21:28 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:2b86:7192:b44e:9f03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e54a25cfsm97381485e9.0.2026.07.08.13.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 13:21:27 -0700 (PDT)
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
Subject: [PATCH v2] drm/imx: Fix ipu_plane_duplicate_state() OOM handling
Date: Wed,  8 Jul 2026 22:21:23 +0200
Message-ID: <20260708202124.12560-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706140246.41506-1-osama.abdelkader@gmail.com>
References: <20260706140246.41506-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu_plane_duplicate_state() could dereference NULL when kmalloc() fails
by returning &state->base unconditionally.

Return NULL on allocation failure, as the CRTC duplicate helper does.

Fixes: 00514e859335 ("drm/imx: use PRG/PRE when possible")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2:
- add Fixes and Cc tags
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index c7ec09e557c1..67f2da7f2b65 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -323,9 +323,10 @@ ipu_plane_duplicate_state(struct drm_plane *plane)
 		return NULL;
 
 	state = kmalloc_obj(*state);
-	if (state)
-		__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
+	if (!state)
+		return NULL;
 
+	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
 	return &state->base;
 }
 
-- 
2.43.0

