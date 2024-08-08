Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5809B18C33B
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126281; cv=none; b=RV+RSOZ2SYUHK8n7YqAdSeK4rHUs6jjXRaYg/yxL6jHz30Qpb6DIAdDlHuaKxWTENDLtuGk3YftThiXkqjawsYQPWM8rVFSqDlhyj8ayZE9eZIJqOF6Sh/0mNRRiPw/GwsQ/ImlelDSxBX0oOdIMOIE/jfO9zv70DceSZ2WMKkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126281; c=relaxed/simple;
	bh=95AlyDaddNiZMDEmIhO07GExNxqtyCYVTGs9vpQrW4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=era1zSrk122VeprlzQUKskZuaUOfNT63gWbGmYVKqlQ5fvlB6wEhg3++bRxS2HryKp4pNxPRohhRg9LYBVkzET1INZE0MTZal6XE8aCaU/2fjqS7ENwE0JhA/IugMTzGfCYyOwrh5WnEpVxsBG0Izgg+OTBmavmVpLpKzUX0YDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ILXiufor; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ILXiufor"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ba482282d3so1264495a12.2
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126277; x=1723731077; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wieDPHjSPi1ZLsan7+O0Z+D8NjoHSP8ahDa0aetrxpk=;
        b=ILXiuforkAZYEuMpNDRDhoj3p7YSAQsgUF/UrsHozQ0HF9eFzurBfQFfMmkKSkU/9Y
         BOxF3BXN/GzBjdKE431i/9DBUb2WvRxai9VIVxJj8zNBKaQCnPxZsZxLC3+X8O7ecAOo
         GNFshM8CVJ3GUp2lf+L/Az12u9oFOF9dQSFvesL19yql5eL7mnnVi4mawzxnhwUf9QoL
         RxDRqCu2LFoPjCWFy54N3LTSDX1Hp+fIBUQCboPN6GC0U/vtesQ2HnylS5lRwxkFSXB5
         +99HtoATel/RlVsY5dOKurW3RFfYST0ikU8Q1MJmoDKtt1Ugkt+ps1dzr5i5nwGJDAl1
         crDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126277; x=1723731077;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wieDPHjSPi1ZLsan7+O0Z+D8NjoHSP8ahDa0aetrxpk=;
        b=TGqky/pAY5N/J+Ig5vmYkTAHQntVMp+Ks43486WjJEuV9tIxVdycLJqZA855tvz+4h
         wySMYPgMEVhuL7tuGn074Y1d1AdOunJcMXq3u5L/cx8G9NUQNxjcdDN5JEM5XrYzZOgr
         5kbbJLykOpvwnpfJP7R0KpbmPW5J2kvgMUJQRuj2av37u4lQ7xNI255m2gXqjSRmfj4p
         U5rNz3ybwvARUtCGzl2xIEJjsMPaxVoK4Cvr3Ss5pytBYaFdL9bSZQBwwR07ni2L0Y1A
         lYNagNq3MMG9zCtX9s3WUIKNRyaO+kmPPhwmIm6wO+7pahE21dxqdDEku3J0UIQ5TiNf
         Hv2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8xlAZ/PyDTyEYuT8gE1kHL7Axpec+2QYRpRUIVkyuLsplKb3jUCoUOKG1+qbaat0rOtA1qBW9bmisA7wcwDCpd4Oz
X-Gm-Message-State: AOJu0YwGjG7BJaqvPMkv2W4lKyMx6KLEWD/KNMp/PS7dcRTVayXUrASz
	8m8+0VxVBtVSV/dWWs7GxoNB11zGfypdXMareUfbO91imc+nckg07yt1itcAOtY=
X-Google-Smtp-Source: AGHT+IHdqxblFw4szqgN7ofHM/QU50Nzna/i6RgnPnDiQEz7rQf3FzXP5OyidprWJ44HWP8e2NZg+Q==
X-Received: by 2002:a05:6402:11c8:b0:5a0:f8a2:9cf4 with SMTP id 4fb4d7f45d1cf-5bbb2234eacmr1617101a12.25.1723126276628;
        Thu, 08 Aug 2024 07:11:16 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:16 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v5 00/20] clk: help OF platforms with their stdout
 (earlycon) clocks during early boot
Date: Thu, 08 Aug 2024 15:11:14 +0100
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAALStGYC/4XOsU7DMBCA4VepPHPRne2koRPvgRhc+5JYDTY6R
 xFQ5d1xykCZOv7Lp/+qCkvkok6HqxJeY4k51WifDspPLo0MMdRWGrVFaxDGQkiQcgIuhdMS3Qx
 +zv5SQEPnjO5xcHTmXlXiQ3iInzf+9a32IPkdlknY/aFkEJ9NT7qho+1a0kDgUhBugrjyHS8vc
 0xOcpNl3M0pliXL1+14Nbv86xzpwdxqAKEN/twHtBjI38P73WrvNf1As1UzhI4ZA9uO/2nbtv0
 AZwaD7VsBAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Hi,

On at least two plaforms, i.MX and the Exynos-derivative gs101,
earlycon depends on the bootloader setup stdout clocks being retained.
In some cases stdout UART clocks (or their parents) can get disabled
during loading of other drivers (e.g. i2c or UART driver init) causing
earlycon to stop to work sometime into the boot, halting the whole
system, see e.g. [3].

Code exists in the i.MX clock drivers to deal with that by temporarily
bumping the reference count of the relevant stdout clocks during early
boot.

While gs101 doesn't have such code, some UART clocks had been marked
'critical' for a different reason originally, and by accident
worked-around the same problem. v4 of this series proposed addition of
similar code to gs101 to be able to drop the 'critical' flag from its
clocks, but Stephen suggested to move all this into the clk core
instead.

This series now does that:
* instead of duplicating such code to gs101, teaches the clk core to
  deal with stdout clocks during early boot, similar to the existing
  support in i.MX
  This is hooked into of_clk_add_hw_provider() and
  of_clk_add_provider()
* updates gs101 to remove the 'critical' flag from affected clocks, as
  not necessary. This is essentially the last remaining patch [1] with
  all review comments addressed, from the series [2] that was sent
  earlier this year, see lore links below.
* updates i.MX to remove the now-unnecessary platform specific code in
  its clock drivers. I believe this also plugs a memory and extra clock
  reference leak at least on imx7ulp, see below.

Note 1: For the avoidance of doubt, any of the above is relevant only
        if earlycon and OF are enabled, behaviour is based on the
        'earlycon' kernel command line parameter.
        As this is meant to also replace i.MX specific code, the
        'earlyprintk' is also supported (since it was supported on
        i.MX)

Note 2: On i.MX, at least clk-imx7ulp.c calls
        imx_register_uart_clocks() twice (once for each compatible),
        but imx_register_uart_clocks() can not handle that and will
        leak memory and clock references in that case.
        The new clk core code handles multiple invocations without such
        issues.

Note 3: I am not in a position to test any of the i.MX changes and
        would appreciate feedback. In particular with these changes
        stdout clocks are enabled when of_clk_add_hw_provider() or
        of_clk_add_provider() return, but:
        * some i.MX platforms did some reparenting or frequency changes
          in the old approach before enabling stdout clocks. I believe
          they're all unrelated to stdout, though
        * some i.MX platforms enabled stdout clocks before the call to
          of_clk_add_hw_provider() or of_clk_add_provider(). Again, I
          don't think that difference is going to be relevant.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

[1] https://lore.kernel.org/all/20240130093812.1746512-6-andre.draszik@linaro.org/
[2] https://lore.kernel.org/all/20240130093812.1746512-1-andre.draszik@linaro.org/
[3] https://lore.kernel.org/all/d45de3b2bb6b48653842cf1f74e58889ed6783ae.camel@linaro.org/

Changes in v5:
- move stdout uart clock handling from gs101 into clk core (Stephen)
- update i.MX to drop now-unnecessary code
- update series' subject due to changed scope
- Link to v4: https://lore.kernel.org/r/20240712-gs101-non-essential-clocks-2-v4-0-310aee0de46e@linaro.org

Changes in v4:
- new patch "clk: samsung: gs101: allow earlycon to work unconditionally"
- update commit message for patch 2
- Link to v3: https://lore.kernel.org/r/20240710-gs101-non-essential-clocks-2-v3-0-5dcb8d040d1c@linaro.org

---
André Draszik (20):
      clk: bump stdout clock usage for earlycon
      clk: samsung: gs101: don't mark non-essential (UART) clocks critical
      clk: imx: imx25: drop call to imx_register_uart_clocks()
      clk: imx: imx27: drop call to imx_register_uart_clocks()
      clk: imx: imx35: drop call to imx_register_uart_clocks()
      clk: imx: imx5: drop call to imx_register_uart_clocks()
      clk: imx: imx6q: drop call to imx_register_uart_clocks()
      clk: imx: imx6sl: drop call to imx_register_uart_clocks()
      clk: imx: imx6sll: drop call to imx_register_uart_clocks()
      clk: imx: imx6sx: drop call to imx_register_uart_clocks()
      clk: imx: imx6ul: drop call to imx_register_uart_clocks()
      clk: imx: imx7d: drop call to imx_register_uart_clocks()
      clk: imx: imx7ulp: drop calls to imx_register_uart_clocks()
      clk: imx: imx8mm: drop call to imx_register_uart_clocks()
      clk: imx: imx8mn: drop call to imx_register_uart_clocks()
      clk: imx: imx8mp: drop call to imx_register_uart_clocks()
      clk: imx: imx8mq: drop call to imx_register_uart_clocks()
      clk: imx: imx8ulp: drop call to imx_register_uart_clocks()
      clk: imx: imx93: drop call to imx_register_uart_clocks()
      clk: imx: drop imx_register_uart_clocks()

 drivers/clk/clk.c               | 129 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx25.c     |   2 -
 drivers/clk/imx/clk-imx27.c     |   2 -
 drivers/clk/imx/clk-imx35.c     |   2 -
 drivers/clk/imx/clk-imx5.c      |   6 --
 drivers/clk/imx/clk-imx6q.c     |   2 -
 drivers/clk/imx/clk-imx6sl.c    |   2 -
 drivers/clk/imx/clk-imx6sll.c   |   2 -
 drivers/clk/imx/clk-imx6sx.c    |   2 -
 drivers/clk/imx/clk-imx6ul.c    |   2 -
 drivers/clk/imx/clk-imx7d.c     |   2 -
 drivers/clk/imx/clk-imx7ulp.c   |   4 --
 drivers/clk/imx/clk-imx8mm.c    |   2 -
 drivers/clk/imx/clk-imx8mn.c    |   2 -
 drivers/clk/imx/clk-imx8mp.c    |   2 -
 drivers/clk/imx/clk-imx8mq.c    |   2 -
 drivers/clk/imx/clk-imx8ulp.c   |   2 -
 drivers/clk/imx/clk-imx93.c     |   2 -
 drivers/clk/imx/clk.c           |  72 ----------------------
 drivers/clk/imx/clk.h           |   7 ---
 drivers/clk/samsung/clk-gs101.c |   7 +--
 21 files changed, 132 insertions(+), 123 deletions(-)
---
base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
change-id: 20240430-gs101-non-essential-clocks-2-6a3280fa1be8

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

