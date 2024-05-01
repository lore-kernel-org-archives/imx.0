Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E59610958
	for <imx@lists.linux.dev>; Wed,  1 May 2024 14:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714574707; cv=none; b=ql5omzqgrqgGfr2s/eX3DZwSarRsvBQ7cEBq0H/Z1r5NMNUIQmQmZINYDjm4PO3MFXzaWC9o7nxoueRd8vKr+U47uHFIe7NseLjALmslX92flwMbmUXwPIe4o7pBFyAtUSvtEaG5iXU/ljYT9qiLn9RFhq+Aa6XMWV9CnmdYWGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714574707; c=relaxed/simple;
	bh=OVCEA+sMHIn5t+AmYPlgxoh+k+aWKCTPEhOiftVsSw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=hyitFG5Pq/3J5xliq15LCr13mU5/meb4MKmN+AiB9MKirwJFyCxscjXrVeUAuy1oH5O0D3oYhzR3Q3/4PlBmtAtHGzMZUuOicSSq/JbyfQIJ7CBx62UBBYngfaSvo17kATe/jTNksTyHMStecGwlbZox7cdDOjF/QuUwvug2Ko8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RHW1ZnrK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RHW1ZnrK"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5883518135so769497066b.3
        for <imx@lists.linux.dev>; Wed, 01 May 2024 07:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714574703; x=1715179503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19fONahm4CwkvcFuKCjkaG9ywwBvaJs3VMjRkYN1PAE=;
        b=RHW1ZnrK0k7K9aUuPkcwWu29w5aPa1Dik5B1DSb/ScT1EIRV/P1cF0HIwW5NgGDxFz
         e53aaVDEmr+/I7TXePwW3Fz1afTAhGUCfF6fxfVzZOk/1kxQsXfMXwZ6aBBJLgoaxbQ1
         uDA/cmEUFHfC0qQyX7/a5/L6FCB/2z324Vsp0ppOrxhc8aYidv7/BMjdubGJQLv5Sz43
         nGwaNqvxKNyDqD1a3J1Ojly86/twH42ZMJFRrHxYlrYLvnvbaMOXQdegyMknTTPrS1WX
         FV3KWO6gNKVdpQbBXSKt9P3sdysFeQ+u0tlIVZgba8gsFRNPfYeMXbUBHk8ZAgwwPiS1
         25AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714574703; x=1715179503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19fONahm4CwkvcFuKCjkaG9ywwBvaJs3VMjRkYN1PAE=;
        b=sBG2b4hAH6AdtuRhiNBn5I3jJJCJZ9Uc5aQ/7It2PRsHWCoTEw4bc4Ze7/j41uyVmq
         n1RjoJid07R6gJDuOmruh6kHUHRbFKK9YuogASi3Eb3PbSoMR8N4mhbMGfNOV+5wFa4P
         DtlpvrcBDFiQfZmJFyz6lBIkEB4YjCUMm2hepZK3owzAP6WN3Tot/N53Sah9u4B9rKJz
         +dKGlALV86pygKXpAP7AldK1+/YFwNwSx5WieHAfAs+BP7zMbd+l4wb7cyQZpEevqG3q
         vVZDiIus2W8fkv2J6LQ1fnkqQAKLkd6LpWQ+rh/7pB4+NWFCd+hkWnZf3RamWjpLYVWz
         zAVQ==
X-Gm-Message-State: AOJu0YxEbvTucAqZFRSa74JoWHnsg/pNGx/xMfbJkY3Vdj8tayKA7qh0
	P8EI3E2pT+bipHUqlWsuQgJVizsdm7LEi/dELbztV5JYrnhgc/cm3MN3HNViWo4=
X-Google-Smtp-Source: AGHT+IFWw4+HYpsJ1jIgKWLbzvy0AN2twDF2ubXy00OLPY7mv44CBJ1BKi+rmI9iBBALYYUDnnI0BA==
X-Received: by 2002:a17:906:a0d4:b0:a51:fec0:23ec with SMTP id bh20-20020a170906a0d400b00a51fec023ecmr1764739ejb.25.1714574702588;
        Wed, 01 May 2024 07:45:02 -0700 (PDT)
Received: from hackbox.lan ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906c00700b00a51bf97e63esm16343266ejz.190.2024.05.01.07.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 07:45:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.10
Date: Wed,  1 May 2024 17:44:45 +0300
Message-Id: <20240501144445.892045-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.10

for you to fetch changes up to f5072cffb35c122ec85d91ef327fa8814f04297b:

  clk: imx: imx8mp: Convert to platform remove callback returning void (2024-05-01 14:40:49 +0300)

----------------------------------------------------------------
i.MX clocks changes for 6.10

- Add PM runtime support to i.MX8MP Audiomix
- Add i.MX95 BLK CTL clock driver
- Add DT schema for i.MX95 Display Master Block Control
- Convert to platform remove callback returning void for i.MX8MP
  Audiomix

----------------------------------------------------------------
Fabio Estevam (1):
      clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()

Peng Fan (4):
      dt-bindings: clock: add i.MX95 clock header
      dt-bindings: clock: support i.MX95 BLK CTL module
      dt-bindings: clock: support i.MX95 Display Master CSR module
      clk: imx: add i.MX95 BLK CTL clk driver

Shengjiu Wang (1):
      clk: imx: imx8mp: Add pm_runtime support for power saving

Uwe Kleine-König (1):
      clk: imx: imx8mp: Convert to platform remove callback returning void

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  56 +++
 .../clock/nxp,imx95-display-master-csr.yaml        |  64 +++
 drivers/clk/imx/Kconfig                            |   7 +
 drivers/clk/imx/Makefile                           |   1 +
 drivers/clk/imx/clk-imx8mp-audiomix.c              | 155 +++++++-
 drivers/clk/imx/clk-imx95-blk-ctl.c                | 438 +++++++++++++++++++++
 include/dt-bindings/clock/nxp,imx95-clock.h        |  28 ++
 7 files changed, 728 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,imx95-display-master-csr.yaml
 create mode 100644 drivers/clk/imx/clk-imx95-blk-ctl.c
 create mode 100644 include/dt-bindings/clock/nxp,imx95-clock.h
