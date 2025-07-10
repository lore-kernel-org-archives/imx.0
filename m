Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2904B2F0C6F
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169406; cv=none; b=JUpPaMegXsQxM2tr4tyUQkZimZMrlrX7TG2rXfpJ1bZLg9QFKOJrDozLgH1TPlsyo8MZA0wFmYgv7h45Tg50Fq4VxkVGB84GS4Mgv3bx0yvUUgQYlUaPzZ+2LbHiRx14z2JTXY9jjmn1aIO04EiExmvb9M0EYxlrJgqSZh0nlWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169406; c=relaxed/simple;
	bh=vneJkQuL/Z9KZYxCdcdDpCorNOqE4VZX51RmlX/8Hik=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=pixzIBTx8mwidNfq7KF3+NVVHsbFgvXrzYVp5uPIpZ99XqktT8pKgy8ULE9gzC/mqYCZIMkJaBVYEsQUKzUwsfxQSLDXBZBoFAk2GvBjk+Rzynn2FrWo0d0IGZ4FAf5B0YPTv6CA/x/e4sV2oGZN1IZK6/ZH0ifV3tHqM7m4eGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HHdFyBH2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HHdFyBH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DyfQeplimHxaigWHPTIL8Brwr48uc1PFyqGCkna6oLc=;
	b=HHdFyBH2PDTgcqUd3PpO3+4gFAK8tBPpyF5Jdh3d9S8BlAMwAvsTaGQVVV7kYosO8e/sVs
	7hHSJJSR217AFaMGzo+lNqYIZVU42USo4u+hCCggdlTeZ3sJDD1nMb3baRvrnCECku3aHK
	OLfgAYIt9rXdbqXJjpvyWNDFVdQj6Gs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-cOw8HB8KMvS7nfwBqS9M3A-1; Thu, 10 Jul 2025 13:43:20 -0400
X-MC-Unique: cOw8HB8KMvS7nfwBqS9M3A-1
X-Mimecast-MFC-AGG-ID: cOw8HB8KMvS7nfwBqS9M3A_1752169400
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a581009dc5so23327531cf.0
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169400; x=1752774200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyfQeplimHxaigWHPTIL8Brwr48uc1PFyqGCkna6oLc=;
        b=Hb4T50PAzjXuQ1XEs0/w+OOC/tyLuYawqc/Vi5R9olNzYClhyhgXnwpt/15Yt0iNoZ
         YXSa01E3CIwLT0/KFnJ24h4g7FoOK5WK8QnmgnLejG9IUcsbivBZK5D0Mn7Co6f3KnJ8
         b/n18COK03YyPfUhmrveRxyXQPhhpg5azRV68Bc/U48oRGPhsQJWIDRifse7/omt9BW0
         H9GhQyQQv3s0itboV4E2BcxmwQv4VTHvEtpydu32YmlkwEZaXGN+YbBEObEpvNMexU3F
         0T81n9e8vvHcXgzBGtggPWlBPN87nMICMulfvQ7jLRS+YBBZTOr5nOiNf2AjiKuxpu+D
         hflw==
X-Forwarded-Encrypted: i=1; AJvYcCU0S5Ne1R3UxHtWZFWEo4YksRTwUNbMQrspS96b0DGNrxHf1VlbLbeMO35dxepMsV8Q3yw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVheCHVAAAJ5PAlL8rr+HcMFvC1Zb/Zzg1XiiQfjSfmHI9Vj8u
	2n2/i9/x+d0H5bbAKR02yJyJOKvnfOI2By7RadMAtJUD2Lrm1/DEhPYU5zRF4XLXF729uh/l9Vi
	vv9yqHi8v3oaUH0gINrxe+Wj2TEaTxu4oDC757GtprjqvzY1P/3fAvA==
X-Gm-Gg: ASbGncs7x/rQOh645jySoV25yJnpA8Pa0vF4sJgg3wdhuIdgF1D511DVaxyokfCS1zi
	up/glOQmjERG70R02/3p0Ix8xfiXELYjyP/PtBjkhMV9/KjhPDXkPyz814429Fi2t6eK4t9C6qn
	kwdr6BmgRFBt0PCpAC9SwU1SYCSE8lvl1lj/y+w2rVQ6UoD0B+V/I/aqkTlTaqOVUlMQdQRhUpT
	1SxDJGidB9R5PmBxeby4IXF1/uZVm4uLe4I1DnThL6TLf6IkMiEOPo8ozETR7P2WQ2dH3eeL346
	NWFV96if4Tj7LA5WAUlGoOjiCvCrVwP3kUoNYYMXnd51tv4xDKcnon9z0AJ8
X-Received: by 2002:a05:622a:2587:b0:4a7:944:9af6 with SMTP id d75a77b69052e-4a9e9bb2cb6mr64648471cf.3.1752169400097;
        Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzZd5sCbip5ZJYV/QhNlPWrkBJ+B+0jLvPSQhYSok5Gwj5HHCpjaKv310CLkZIEGxcJf2Gkg==
X-Received: by 2002:a05:622a:2587:b0:4a7:944:9af6 with SMTP id d75a77b69052e-4a9e9bb2cb6mr64645231cf.3.1752169397063;
        Thu, 10 Jul 2025 10:43:17 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/9] drm: convert from clk round_rate() to determine_rate()
Date: Thu, 10 Jul 2025 13:43:01 -0400
Message-Id: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKX7b2gC/x2M0QpAQBAAf0X7bOuQdH5FHs7dYsPRHlKXf3d5n
 KaZCIGEKUCbRRC6OfDuExR5BnY2fiJklxhKVdaqKRQ62dCuC8p+eYdiTsIhKa2tspVpIIWH0Mj
 PP+369/0AcAOnAmQAAAA=
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
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=5611;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=vneJkQuL/Z9KZYxCdcdDpCorNOqE4VZX51RmlX/8Hik=;
 b=SpSyr0e3I/aRNxEswleY3osHpqJj9B58Sz5Gtf7aIsUZ1Ktyc0g084VrIsjKHpCXHyL9qqOiF
 ZRnFirWq0YVBiYQPmMMBH7RCwJ87s3PvceRTEkBR4y7+BkHAKJo5Jbj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EpQvBnqc_zlyb2TFBs10miETLgLEB-bv2_P_q3tVm_c_1752169400
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the drm subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

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
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-drm-clk-round-rate-b25099c0c3a7

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

