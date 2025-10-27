Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515D71DF247
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571816; cv=none; b=b+Upmj0VhHuMVFHTtiu+kn95yI2cZ37Yap4SALVn+RpeIMECu/df8qi5JYPwG1T60ImjFN3MBpI7oQG++rgfsv4uoJa0aHqKpoz2HYzqF9Ub46873NoLTKa2VGPJsdgRM3CD7QLTENEtP90/TVi/h6GcdM895ymcm+S10Zh9zSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571816; c=relaxed/simple;
	bh=owwF/c1ZnVCPR3jIiSSB/1idNxMdC9jtjVdIBYaeNLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YZfNTC9tk3nWrtJVXEvegoNBrR0RC4ijzVmxuU900GjcHCnzWbgLphQ6tKelQqc2I6w+QkLWEIFYKeEuV0ZKJ9cJ/kbyVAk4B4dyvhvGCOdBwbpHQ3lhlqk/yUeUQ8Aois3UBiDiFKEYD3kGpBs7ZUvqPsbr1cCTyguBnaae4Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Y/PTCyLU; arc=none smtp.client-ip=209.85.166.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Y/PTCyLU"
Received: by mail-il1-f194.google.com with SMTP id e9e14a558f8ab-430c6eef4b9so19297875ab.0
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571813; x=1762176613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJjnQ8pdDtk39CSCRJz3s2YRDUVOeo1DO713ElfxvCI=;
        b=Y/PTCyLUA3UOs/kOOJLrJDPYB7JCYH24WGVn3WcFtMHtctTZU4hQLbBX6n7YITMwfR
         DAaTQjYRLhq/lFG4msmsHEdZQWOVNQvZ4p8oOz7cKD60v1ukKTYOE4jqRVhJNiKiJKzf
         w9KOdAswS/0vqpbkgEIv9aNmxJRqLvh1HrxvuJ6/Hsssb35iUSrX7+JuN55zErCQD3gb
         v4o7cqBFaHk07Kvwtpn+tfcjFwMyi6X7OqNn4Akfn1RQahE7uwFDksDUhkS2cK3y/q9C
         O9tRT0Ahnx7DIKTJ3twvfwiJQUgO84G1VMAAU/7xmvz9jJuR34Q9rGG8QJ+6+tH3MRkL
         0b4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571813; x=1762176613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJjnQ8pdDtk39CSCRJz3s2YRDUVOeo1DO713ElfxvCI=;
        b=ThNFu/HP4FkHE4h+rALfR36pElYKScA5Aua8lTjmO/TGXhPSwl5VQdXjJBn6/wxL9e
         5EsDai2w9y5UtXTE8eg6P68OePmR86B4lGnwQlqrkWjzMu45QN10WLJYbn/i3vAHL06x
         Dx148rIc6gVtC6l30q2T1z9Fkpq8KexoLSWHw+LpjgbpCON6eZKjY36lGc46ZPU4Ca9c
         NM7Isn6N1RbeLZZDfbnx67H826h4PgY+LXy0NCQtKaF2X4XrEQe9+Ll271ytEx9pl430
         HV3Lu2z4C35PfDeemubIZHePJH0dgKBHSZn01CCgO3umuSdXmLwXiwzyPMmoxgkevnZ9
         esqA==
X-Forwarded-Encrypted: i=1; AJvYcCXTzwD/W7BukxW6JmqktQzJQd07ohiPtzuLeTsAHv/vzimXZHdS9k+aXjBM3IRUCIJKJ40=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7gIhoC0u5P9OZ2M7CO3ZiNyF8QdB/HIiaJ8fJx81EphCuej4o
	MJKJmMBBHuEzRn3euhwDaUKjp3CQOf3ST3KAZAaHgtsJPLCFYZv/EnMnwYlwxg/QdPc=
X-Gm-Gg: ASbGncudqJS3zVPjEgY2YyKX5imSUMRApQcHJDRw60jsBqj4JomafCAtPYiCr2o5JC3
	Fh+yWjvIEt12QAIZoevWo8dYhjJnEwyrntgbUzFDdIbOTnV0UqjPwO4NUIhePkOOrswCkPznfVn
	Xhu/Rh81pn+bsA7Hmluvfcu/DkpBq6LQa3qQusTPhAazlW3m1+h3vwPuho/gpHjdHZE7Ko4LfN8
	2UfKe1F7A73DWQAMOwW+AoMA+j/Q3y83DdwmdhyVHaVV62VRPWKfSLTjxbRRrixyNLNowMlGJvf
	0vgtJ7C0unJbahwzHq71Q/zU1i3gbizDDkEPzNSRrrE3zTMOnktPmmNDaal5bgqRzqVEv24U/yg
	z44nh0itZnkNDHykVWpcfcmfdzVkkK6jZCLhkuiNb+4s9L9UDaXpWV+Ar4Ypz57wwYN4qrs4Enu
	DCiQur1XrFDcoHW1/tXa7d3r7dD2E2xebeamz0HvdboUc=
X-Google-Smtp-Source: AGHT+IFP3NJHkfNDLkwaf4zEjacSbOyB2CKC3rVjLUaScafS/uUg5QntItE3fUUUdGBa9LYYuVS1mQ==
X-Received: by 2002:a92:cd8c:0:b0:431:d951:ab97 with SMTP id e9e14a558f8ab-4320f77104dmr1324625ab.15.1761571813243;
        Mon, 27 Oct 2025 06:30:13 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:12 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org,
	dlan@gentoo.org,
	pjw@kernel.org
Cc: Frank.li@nxp.com,
	p.zabel@pengutronix.de,
	guodong@riscstar.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	geert+renesas@glider.be,
	cyy@cyyself.name,
	heylenay@4d2.org,
	conor.dooley@microchip.com,
	fustini@kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/9] spi: enable the SpacemiT K1 SoC QSPI
Date: Mon, 27 Oct 2025 08:29:58 -0500
Message-ID: <20251027133008.360237-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the SpacemiT K1 SoC QSPI.  This IP is
generally compatible with the Freescale QSPI driver, requiring three
minor changes to enable it to be supported.  The changes are:
  - Adding support for optional resets
  - Having the clock *not* be disabled when changing its rate
  - Allowing the size of storage blocks written to flash chips
    to be set to something different from the AHB buffer size

This version of the series mainly adds sign-offs provided for v3.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/qspi-v4
  
Version 4 incorporates comments recieved during review of v3:
  - Moved the allOf block below the required section in patch 2
  - Added Frank Li's Reviewed-by on patch 2, 4, and 5
  - Added Paul Walmsley's Acked-by on patch 9

Here is version 3:
  https://lore.kernel.org/lkml/20251024191550.194946-1-elder@riscstar.com/

Version 3 addresses comments recieved during review of v2:
  - This version fully tested and confirmed to work on BPI-F3
  - Added Acked-by from Conor on patches 1 and 2
  - Added Reviewed-by from Frank on patches 1 and 6
  - Moved the reset property conditional under allOf in the binding
  - In patch 5, needs_clk_disable() is no longer inline
  - Tweaked the description in patch 5
  - Renamed a local variable to be "sfa_size" in patch 6
  - Changed the subject line in patch 6
  - The sfa_size field was not being assigned in spacemit_k1_data;
    now it is set to SZ_1K

Here is version 2:
  https://lore.kernel.org/lkml/20251023175922.528868-1-elder@riscstar.com/

Version 2 addresses comments recieved during review of v1:
  - The "reset" property now only applies to spacemit,k1-qspi compatible.
  - Patch 1 (previously patch 2) now points out that this is the first
    non-Freescale device using the binding.
  - Added Frank Li's Reviewed-by on patch 3.
  - A quirk flag has been renamed to be QUADSPI_QUIRK_SKIP_CLK_DISABLE.
  - The predicate for that quirk now returns bool type.
  - All other similar predicates now return bool type; this is done in a
    new patch (patch 4).
  - If non-zero, new field fsl_qspi_devtype_data->sfa_size defines the
    size of the serial flash regions, rather than ahb_buf_size.
  - A continued line in the Kconfig is now aligned.
  - Patch descriptions are wrapped at 75 columns.

Here is version 1:
  https://lore.kernel.org/lkml/20251020165152.666221-1-elder@riscstar.com/

Alex Elder (9):
  dt-bindings: spi: fsl-qspi: support SpacemiT K1
  dt-bindings: spi: fsl-qspi: add optional resets
  spi: fsl-qspi: add optional reset support
  spi: fsl-qspi: switch predicates to bool
  spi: fsl-qspi: add a clock disable quirk
  spi: fsl-qspi: introduce sfa_size devtype data
  spi: fsl-qspi: support the SpacemiT K1 SoC
  riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
  riscv: defconfig: enable SPI_FSL_QUADSPI as a module

 .../bindings/spi/fsl,spi-fsl-qspi.yaml        | 21 ++++-
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++
 arch/riscv/configs/defconfig                  |  1 +
 drivers/spi/Kconfig                           |  3 +-
 drivers/spi/spi-fsl-qspi.c                    | 88 +++++++++++++------
 7 files changed, 127 insertions(+), 29 deletions(-)


base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
-- 
2.48.1

