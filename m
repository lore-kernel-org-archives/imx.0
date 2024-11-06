Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519861DFE38
	for <imx@lists.linux.dev>; Wed,  6 Nov 2024 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730902928; cv=none; b=Z8mXeselQggZe+FcKNEtQeGXlIKxbBhAFBiBqARFC/ywVkG+71qY27FrbI8Yk9YybE119OYTL9TRUaTMwlcEw7dlkfXqzT8fTv9vqvrtreWF+fh72AzgIYUvkkaTp4dVpDVBmHNwGj9mf6sWsLdSO8/EQMt0lHn/GkbVHPcjHlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730902928; c=relaxed/simple;
	bh=Jai6l51tfQXx2f20hBESY7dASlBrE5N2eyk6W7quo9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GLWxNthZXQup8b4yhlr6MhD2wa4D9EsS+48YfLOJKd2IwZxoKDMMxWRHTUfgwrCPm38pNgRw1cYUmoZY/JlLuJS+UGzLpLH+eacc04nhZZuNPzzhpM25KpVAqGVqn/sUxdsPZ5iznzVDzeGFN1e1+4529wuZtYTuIunlQ6G8gZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zhJslzUW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zhJslzUW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so57549045e9.1
        for <imx@lists.linux.dev>; Wed, 06 Nov 2024 06:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730902924; x=1731507724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAlPwdfUhMPwlTJAbroDL64kzgDUSQREYrAUHpV4lWk=;
        b=zhJslzUWlxMnDUGlwXSHMvb+zE4bTO+NPBkuk8BabdqgM63CwIXrz6U8RWSe0BtKor
         /Wjoa7fk1t5tAHB4PCPIkJ6MHURluGuo7hUTaGcBBipZPMDq4kplLUYXPhhVb8w3+5B+
         XtxHO9pRJTBGnKx7VjGDb0CfxKOKuxQ0IcP1NYlMqkCw+EGawAR8ifDvxrBqWrtIGzW2
         VuKQkTAjP0FAiv43zs8nnfgmdjUug7k0fp7md3S01sWFhqynIeJ4w/TA3kgC3AkD62gV
         iNikTHv8X3GBR30TZnsFAU3wbM++i3VZ+Z9OERH0BbHXIcm/w7lP+zyrWcJn/c8YP/ux
         rbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730902924; x=1731507724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAlPwdfUhMPwlTJAbroDL64kzgDUSQREYrAUHpV4lWk=;
        b=YyoCznWxTvxXDvxGz968XC+qK49MT41+3kcRxiAFmCBNgXRXMgo1gaR2P9FIfwVUTr
         DCQwzySSaM16/3UAKMDMRZ07uP0OXUyA8WLqsuccpXBAicx+U/w3QOaj2ih23Ce00QIv
         wqOzzRFNbKC0hSlDbkUcZxJG2zwyG/mR9moQGb9k6718UjeQjXCYh1sCxNaocwboPpfv
         QVkWuFCxzMCRBbH7oa6SByelwBcVGP5juAfeAxzYp/+8wHuT3p4jh+ykC3i87iM4EzY2
         OHCqS2ZRl+g8YMVcvKOMfV131cW43OD+lQXYTdn7SkNlS39/WKzoguwcvV2/8DpCVpOa
         E2GA==
X-Gm-Message-State: AOJu0YyJoE+DmbFbgggYeg8T2vwkqEpwLAvrJxwcroZGL1vRSXLdIACQ
	0H+ShjZKql4Qt7Jt9fbknGBWmGyo6BZynl2Cvhf/5vZgBtQqeYqKcsReezaGVPk=
X-Google-Smtp-Source: AGHT+IHIfw5QJbKJej7wCYRgrtaZek0f7PoBsxUGko/YPocysw1rxvIGEWPP3OMvd9OmYtIElvTfWA==
X-Received: by 2002:a05:600c:a085:b0:431:5187:28ef with SMTP id 5b1f17b1804b1-4319ad2f3b4mr328657115e9.33.1730902923745;
        Wed, 06 Nov 2024 06:22:03 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e6aasm19289952f8f.67.2024.11.06.06.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 06:22:03 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.13
Date: Wed,  6 Nov 2024 16:21:54 +0200
Message-Id: <20241106142154.622141-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.13

for you to fetch changes up to 81a206d736c19139d3863b79e7174f9e98b45499:

  clk: imx: imx8-acm: Fix return value check in clk_imx_acm_attach_pm_domains() (2024-11-05 12:07:59 +0200)

----------------------------------------------------------------
i.MX clocks changes for 6.13

- Document the compatible for i.MX95 HSIO BLK CTRL
- Add the HSIO BLK CTRL provider to the i.MX95 driver
- Moved the CLK_END macro from bindings to driver for i.MX93
- Add support for i.MX91 CCM to the i.MX93 driver
- Add workaround as a fix for errata e10858 to the lpcg-scu driver
- Fix PLL initialization and power up for i.MX93 in fracn-gppll clock type
- Fix clock enable state save/restore in clk-scu clock implementation
- Skip HDMI LPCG clocks save/restore in lpcg-scu clock implementation
- Fix return value check on PM domains attach in imx8-acm driver

----------------------------------------------------------------
Dong Aisheng (1):
      clk: imx: clk-scu: fix clk enable state save and restore

Peng Fan (4):
      clk: imx: lpcg-scu: SW workaround for errata (e10858)
      clk: imx: fracn-gppll: correct PLL initialization flow
      clk: imx: fracn-gppll: fix pll power up
      clk: imx: lpcg-scu: Skip HDMI LPCG clock save/restore

Pengfei Li (4):
      clk: imx93: Move IMX93_CLK_END macro to clk driver
      dt-bindings: clock: imx93: Drop IMX93_CLK_END macro definition
      dt-bindings: clock: Add i.MX91 clock support
      clk: imx: add i.MX91 clk

Richard Zhu (2):
      dt-bindings: clock: nxp,imx95-blk-ctl: Add compatible string for i.MX95 HSIO BLK CTRL
      clk: imx95-blk-ctl: Add one clock gate for HSIO block

Yang Yingliang (1):
      clk: imx: imx8-acm: Fix return value check in clk_imx_acm_attach_pm_domains()

 .../devicetree/bindings/clock/imx93-clock.yaml     |  1 +
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  5 +-
 drivers/clk/imx/clk-fracn-gppll.c                  | 10 ++--
 drivers/clk/imx/clk-imx8-acm.c                     |  4 +-
 drivers/clk/imx/clk-imx93.c                        | 63 ++++++++++++++--------
 drivers/clk/imx/clk-imx95-blk-ctl.c                | 20 +++++++
 drivers/clk/imx/clk-lpcg-scu.c                     | 41 +++++++++++---
 drivers/clk/imx/clk-scu.c                          |  2 +-
 include/dt-bindings/clock/imx93-clock.h            |  6 ++-
 9 files changed, 113 insertions(+), 39 deletions(-)
