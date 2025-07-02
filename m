Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC1245032
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448138; cv=none; b=q36nQgL1JK2WwdHXV5LZYryq5eayYbcSHR/tyqop0tsThn1ClcS0bTqXeVdNulW4/CnrB2KGt68jCo6OPxcST7GjnlFGbBG+BasRynYCWdKb5TiJSNwCS6k6b5VX2ogpYDJBASMQqBiAevnk85kb+iwM9AFyRj34Mqr60q3X0xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448138; c=relaxed/simple;
	bh=IDsUBmMl4vmxwpChddfz/0o/3m8yos2rsQrr3srBtqw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PWjpAbVL5WuXsihKmaqdhAYs8Wgp0KGCqPlbKFkQ8lw8S1UsReg6ujQ8KLcW2ewlty1zLkqGOrrxaGQ+W0TVSfiRqcouFCl8DLFTaQWrkfJ8yLv0VU50KqUjOQOtApFWQA/65Km5hsv//IKgzx0cY+WBGU734osQIMCwZQEWKFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qHShhCeR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qHShhCeR"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a52874d593so3563382f8f.0
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 02:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751448135; x=1752052935; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dJOUAJfKVX2aPL9IEMk2+/CliU7l5+z7z5St/kFtJDA=;
        b=qHShhCeR6ERWYyiquBzh33D4VElbnPms9cSEIdpoCxCkWrPslmCS9l7wQYJ9HgAmF9
         6Rv9A1djqPCzX9rdQ35Ekjl7+LmHT/vUtXoBkHX45SnZ2fSCFHTxUWrvLX1tzFv8OKxo
         l58+qGcZTkhNte70TNlg0XJg2w8F98icG/IiMpI/c8AK6rzfeA0dqs1cLuWjyxqZREJO
         69xZg1uFDaRBx5UuHXpKVmHPFPZYNKwFntylsGZYlXFHzye7pJKkKJ9hRLgy7jhuwOJa
         +wC+uZhnrk4xH3C9wym5Zq90t9CH7zXLzw7xwuQXYOwInauN5nVKE7ej1+Ju4JAxHTjj
         hAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448135; x=1752052935;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJOUAJfKVX2aPL9IEMk2+/CliU7l5+z7z5St/kFtJDA=;
        b=DZpndchW0gzTHJelUIlYPnX/eG4geepjK/rBnxdV5gtNIumTAiq+VzYb9YOkG5D2GG
         dPwYms+dc2pW4+vK9sUWBReCOcel+8AxPGDtoT9/9YyIKDjeIpPBCObUEWcGlnHVvvJA
         5T2kiJdC87JdqnlMVQSHUJ7BTOXNcl4QamPPAybVyndf1smAb3aRjlYC8At7zLLVIpIk
         /eqdteUulTEWKBSlVA8sueSgq6sQv/pmuUcn2t+Ck6KRHugMlCHF0762iAUGs/ju76g/
         CRA7bEbGMwGWV4Vp/HUPIXIjwMzIM6FNFQx/5VTjTVyxIs93PSHwt1wawYCTS/7SekeF
         HQQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+2mAwlfTza6TOi6bE0HtEiY7ZjJ+CwaDkdopScffIdVaZZO8qWM2At0VXOsDemAY+BDw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/liIN/i2z8TaIVX65su/fmgk1otOOnAI1xpx7h7D6oQO/wS8n
	E3NPZmJINd91F0fFHvUC4gdIVrNKAZG9XK1TTl5DaEOuxaiV0y/PbGBR+V6lb8uusnE=
X-Gm-Gg: ASbGncuA/6ScV+2K5ta1n5+yRwfDpQNU6FXtfXNuNBeSX98UsDg1wOkWauc7Kr2r0we
	Ngj7cWJAe9mwvjFxpmAAwt9EkmYXnAwiQjJMX0FEvTSYZqfH3Ens4cPJBV3et5qxWbn4dYTrwX4
	9tIwSoQzAL+VcozSz5PgqMSXSsPPzvnOMqfBXNWJgu1pkNxOYLRZOBuZGD+ICFpdcddyT/3W5zj
	zEkQgh7t469kx1jMUNvbOo6gf3XSFJStkWX0WnLFZTKVxhHMjzx4oqI0DGyWRz+dzn8D7HbOo8Z
	Gpt8PU3LK3BeNFVt+RRY6kU9yKX78TepIvsCAeUFRkFLRaHMn8mBaXl4YxAgXUFo
X-Google-Smtp-Source: AGHT+IGRtI5EizlyYaagGIEM5B9cIXG2G3RtfcUDuM69KE2zVYdf1i0pFG68QB2VU8jMhrLhfO7HYA==
X-Received: by 2002:a05:6000:188c:b0:3a4:dfa9:ce28 with SMTP id ffacd0b85a97d-3b1fdf01fedmr1581155f8f.5.1751448134571;
        Wed, 02 Jul 2025 02:22:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406489sm195844165e9.27.2025.07.02.02.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:22:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/8] gpio: move generic GPIO chip fields out of the
 top-level gpio_chip struct
Date: Wed, 02 Jul 2025 11:22:07 +0200
Message-Id: <20250702-gpio-mmio-rework-v2-0-6b77aab684d8@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD/6ZGgC/2WNwQ6CMBBEf4Xs2ZqyAhFP/IfhsIGlbBRKtgY1p
 P9uJd68TPImmTcbBFbhAJdsA+VVgvg5AR4y6EaaHRvpEwNaLG1lK+MW8WaaUig/vd4M4VB0xak
 mqitIs0V5kNeuvLaJRwkPr+/9Yc2/7U+Gxb9szY01xJQj2rrH8tzcZSb1R68O2hjjB2ELMa+xA
 AAA
X-Change-ID: 20250606-gpio-mmio-rework-a2f4c439aa96
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2506;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=IDsUBmMl4vmxwpChddfz/0o/3m8yos2rsQrr3srBtqw=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhk+kPIvzlcY34zkh2Nj4PaZstktliKWBcYWZ3+v8XzOCbDD
 IkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoZPpDAAoJEBGnLqAUcddyvM8QALht
 p+0/5kj0hAd1GH7XCSJQj1xtclo+EbYwl+bIW4Ppol5rzy/Ww+YmiN7UfX/LQmQM81ByNclCOk8
 8yVuwOiCUfYJuB5mKWYrWLwiGZCFX18PXJaf2eDjbSuGXxBAaq6sv5p6gWUjzkmKXGd3R1j38FN
 2MP84vl/De+q+j+gS7qOICkoFnew3ASVw+Sehu5b9KiRNdNyC3RyESwRBvE+rSiB/SxJWGVmRZQ
 Vd9BDYTEglata0+NQUyij9ENWct0NzUdygyVwa6a+M5y/OfxRgVizsGIUuKPJh42tXK+7eENAaK
 lTDM+bpEsrkroP/o32TIo2RazbpVv+To7qR17XNdfdoWNiqonSruJF16yPfZ6l4mxaLX9vQB//G
 voAf3FRniA6ym8jCePwxqGGGX0mJL29lHxiMCItsnkBLbZKbQhTGq4+VaLcletzTe9Ydtw+1bE4
 skQO84IjV4PI71bOpfgrvkBRksQGm6k0+urSfW9uzq0q4FZG+yjdZinvNUniWeC6qByqdtnilQU
 LPZ4zjnM6y8hiw92JS8Y3Xfo26+SY+49p7fL2tBZgRwAIJGe9eH7aaKFgcJB1OSccqGFDWIibKV
 27KSY1CtQxooxZ/ZU8T2Lq+5lDJ+omh7OW8vD0sPCBItzUdDE/8lq9GMhFs/KZhZWVHmS9EapOa
 xcgFa
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The conversion of GPIO drivers to using the new line value setters is
moving nicely along and we're on track to have all the existing
providers converted upstream after the next merge window. There's
another piece of technical debt that bothers me - the fact that struct
gpio_chip contains a bunch of fields that are only relevant to the
generic GPIO chip implementation from gpio-mmio.c.

Let's work towards moving them out of struct gpio_chip and into their
own struct gpio_generic_chip. Doing this in a single series would
require some ~40 commits which is way too many to review at a time.
There are also users of gpio-mmio under drivers/pinctrl/ and
drivers/mfd/ which would require cross-subsystem merges. I think it's
better to do this in stages over 3 release cycles. This series adds a
new API for gpio-mmio users, hiding the implementation details and
converts the first set of GPIO drivers. Once upstream, we'll convert all
remaining users and once that's done, we'll move all the
gpio-mmio-specific fields to the new structure, convert the internals to
using them and remove bgpio_init(). The last step will be done in a
backward-compatible way, not affecting the users.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- rebase on top of recent driver changes
- pick up review tags
- Link to v1: https://lore.kernel.org/r/20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org

---
Bartosz Golaszewski (8):
      gpio: generic: add new generic GPIO chip API
      gpio: mxc: use lock guards for the generic GPIO chip lock
      gpio: mxc: use new generic GPIO chip API
      gpio: clps711x: use new generic GPIO chip API
      gpio: cadence: use lock guards
      gpio: cadence: use new generic GPIO chip API
      gpio: 74xx-mmio: use new generic GPIO chip API
      gpio: en7523: use new generic GPIO chip API

 drivers/gpio/gpio-74xx-mmio.c |  32 +++++------
 drivers/gpio/gpio-cadence.c   |  60 ++++++++++-----------
 drivers/gpio/gpio-clps711x.c  |  27 ++++++----
 drivers/gpio/gpio-en7523.c    |  36 ++++++-------
 drivers/gpio/gpio-mxc.c       |  87 +++++++++++++++---------------
 include/linux/gpio/generic.h  | 120 ++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 243 insertions(+), 119 deletions(-)
---
base-commit: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
change-id: 20250606-gpio-mmio-rework-a2f4c439aa96

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

