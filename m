Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F06270EBF
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909791; cv=none; b=SecBwqsmZGd2NJSkg6MhTel+dMaILgZTAOn5vbXC8thL+8hpR4dc5aHUc1CDKkfxGpcNNu8rZ6TFRzuEgY25A6QQyZzJnn/9QaaUn+65erKiNAmRrThTH6WIiMa6Vja66+xfwDZas2YRsVPHQiSdjzrqPFGP4dPNMfFr81BGqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909791; c=relaxed/simple;
	bh=PIea/i4Y2q/6salydRYDw/qDzf1o1hZNE4V2kDbPHLM=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=Rz6HHe8ameydrJUycUVwkWXbOxcoyFb8b7WRcsu4AcNYrFBQPe7bTta6inj9/GZT3d1THftBiZAmx6m6olMmRbrBF0V5YCW59o27e7POxlwlBJwQ9tBKLZ0MZCqBeUb8grxwgER9hGoOceDk29ANDVbNiC0CTBJShI9yMDoSX9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mu0MgDYK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mu0MgDYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cXP3JhYEHDsI5xw9s9ngejjJCnQI06FB4xWiEKgLmT8=;
	b=Mu0MgDYK06RXoLC6OnDnAEg2aN4pQaxSFpOlnB1L/TcvqCHiVK9kseL+UjtyVn1TN8xFsG
	jAA+Fqk1jWK+3u1rTuatATY1LWS3tz6agyDLeXjTK7H5ja6dM2LHl65mqUXDs1ZWr1ZoZh
	aaq5Y+RjxLXsXrJH7qi+ptxiwa21Qd4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-wOa8Hwk8NPm_m8gXJJy4NA-1; Mon, 11 Aug 2025 06:56:26 -0400
X-MC-Unique: wOa8Hwk8NPm_m8gXJJy4NA-1
X-Mimecast-MFC-AGG-ID: wOa8Hwk8NPm_m8gXJJy4NA_1754909786
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e8106a41e7so1030787985a.2
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 03:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909786; x=1755514586;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXP3JhYEHDsI5xw9s9ngejjJCnQI06FB4xWiEKgLmT8=;
        b=KSKHskQXfEQCUiutHEIl0hDul9cGQlWEEO7skAV/i3JPE+rKarbfsfamqNB91q/lG1
         15cUOhgxjAX9f0XGL566J4PFhNVBq8nFH9n6pPHfwM9pj+LZyty4O4DYQ7trnYbAhfHv
         3Xa3kqVDa9tGhQwviCDsKOtnUxrpLsHHw8ocBPdPhujLwG675iT/Yultpzmmh9Kay+TS
         diLeSREKFC6VRx0NR5icOOHHJ1jr3DTz87y7NQJx1TeL3i65/hxKL88V0hSNES7p+uc8
         0C+h+BJCJWVHB7TjwxWp7A21lajml+J5zdFJEawy2d+uxWAbvuSJn7SbaVhGpzC30sRh
         3R/w==
X-Forwarded-Encrypted: i=1; AJvYcCVeotFvipT2fgdoZHC05TrYHtgy6ulcB2dyHn2Vfw7K99FOUEWTS2+IkFoMiqGY/RGqPv8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBq94+V2HbXTAMmX2V7hKPvQzGJAl49mLUxkL1QbUgOBcaT7OJ
	b0YETqy3tleuvxn3n1NowK3wUhIYcBL3Ea1MYSbDHxqSdewEaW67bDRFW8G4H/HSZaU2NubeHpg
	3CTGK7qYvhmZjKF3BffpH+4A4aFKbBX8J+5ZysnK/7UlkySbR2Q85fQ==
X-Gm-Gg: ASbGncvj/xVtfnIJY9UQ1ZXc4fxJfCxX65dTYUL4oethEZnOl/3rxiLFlIxykLSFzwS
	BWjl4BXBkfDaCoZl+Nr9jkN1KKx/Fps4MalFLM0XjXU7uWPhaZpY94ie7Mv2Vx3WG7Y3krk3yN5
	ys7yD9HzIPYWka69UXPr0tmJUJwoO7SxmOAvVliP5gZFYMehUsYq8pZ2ddwDRNg7SGPozQ+FQEd
	1CF3MyKYuZIsHUDFRMak4NN+A1XFLu5xph5DyN1smw5U7Q0v0IL1n0jV8RlQKHE6ZJe3u/49GpB
	KZ3mm+K3/tN5WeScpfVFxfLDZ/j6yY6ivHuv6DRBnAKBwOis2BqJsI0udsum7kna28ViwLWajjC
	CrcI=
X-Received: by 2002:a05:620a:19a7:b0:7e6:8580:67f9 with SMTP id af79cd13be357-7e82c7268b7mr1766294385a.39.1754909786033;
        Mon, 11 Aug 2025 03:56:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR8+CCi/SOVhR+SKRFj6lKvJMHxUZZffNiDttlUcNIvFehaFMGmyLzcvBT31Mi5D8YTjxp6w==
X-Received: by 2002:a05:620a:19a7:b0:7e6:8580:67f9 with SMTP id af79cd13be357-7e82c7268b7mr1766283185a.39.1754909784503;
        Mon, 11 Aug 2025 03:56:24 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Date: Mon, 11 Aug 2025 06:56:04 -0400
Message-Id: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEXMmWgC/x2M0QpAQBAAf0X7bOucJH5FHs7dYsPRHlK6f3d5n
 KaZFwIJU4A2e0Ho5sC7T6DzDOxs/ETILjFopStVFwqdbGjXBWW/vEMxJ+GQVNNYZUtTQwoPoZG
 ff9r1MX5z1hFLZAAAAA==
X-Change-ID: 20250710-drm-clk-round-rate-b25099c0c3a7
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=5717;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=PIea/i4Y2q/6salydRYDw/qDzf1o1hZNE4V2kDbPHLM=;
 b=Fjs6oyZBop8brn89Wis9Wmv9d/YiKRi2CsQG8Y9p4VeZHPd25iPf4ZojTiOdduqVItv0hvHzz
 qP6WUnq2F02AwCFtKnsda9khMDCy+eoFbTEarTYyadGpvit3bjTpK8f
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9FBhPenobET_XjmaSRXRxPUcG1oafoVERZzc7OIk3fM_1754909786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the drm subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Changes since v1:
- Drop space after the cast (Maxime)
- Added various Acked-by and Reviewed-by tags

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (9):
      drm/imx/ipuv3/imx-tve: convert from round_rate() to determine_rate()
      drm/mcde/mcde_clk_div: convert from round_rate() to determine_rate()
      drm/msm/disp/mdp4/mdp4_lvds_pll: convert from round_rate() to determine_rate()
      drm/msm/hdmi_pll_8960: convert from round_rate() to determine_rate()
      drm/pl111: convert from round_rate() to determine_rate()
      drm/stm/dw_mipi_dsi-stm: convert from round_rate() to determine_rate()
      drm/stm/lvds: convert from round_rate() to determine_rate()
      drm/sun4i/sun4i_hdmi_ddc_clk: convert from round_rate() to determine_rate()
      drm/sun4i/sun4i_tcon_dclk: convert from round_rate() to determine_rate()

 drivers/gpu/drm/imx/ipuv3/imx-tve.c           | 17 ++++++++++-------
 drivers/gpu/drm/mcde/mcde_clk_div.c           | 13 ++++++++-----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c      | 12 +++++++-----
 drivers/gpu/drm/pl111/pl111_display.c         | 13 ++++++++-----
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         | 14 ++++++++------
 drivers/gpu/drm/stm/lvds.c                    | 12 +++++++-----
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c    | 12 +++++++-----
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c       | 18 ++++++++++--------
 9 files changed, 73 insertions(+), 51 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250710-drm-clk-round-rate-b25099c0c3a7

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

