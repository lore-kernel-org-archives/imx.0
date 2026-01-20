Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3903B52F1
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 20:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768941553; cv=none; b=fC8eBzVEkVRX0NEM2tTop7uHn4Pcgzp4gYS1VK3c1meN4+BQtkcARBidQSRd9IOxX6s0zzqYACkrITexW/jCxkyw5HoH2Gp6lcyl9MT9h3yMCOjZM+iU4Vplbvi4PwBvZRjLnXIA+sXWFGD8MHW2MaGuYZl/Kgsh+QNmlM1kXsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768941553; c=relaxed/simple;
	bh=mMtTD74lHWGhMPk0VhK0pFoRiy76ELQ90jr0VFXLeVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUUtDE/hOSaj/kxeJmsogBQFsJglyIl/hh98Vt/UAKIfCWOcWOUGvNqKZN9TQciAfqd4ALTm3sHhUOrJJX81FcOuE9dNNay0Mwa42sOdseBCjNmBrqEHNTrp/U49OmvU0LvbZ8DRjwG+Ul8ZgdYqlANZGLf1pLmxUBG+IkpuRNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAAYcAoz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAAYcAoz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801d1daf53so42139275e9.2
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 12:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768941547; x=1769546347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qrKCUKKckHcjjuwU+EHrOyUAQd4woAILl74Bd1qw4Gk=;
        b=HAAYcAoz5BqfEToB6s/fJN73oxF47jnz0MAwD9GPgYgBDMPoy25o7Ym12SZmIgSmYS
         5YiNAB3rjC9o7fLEGjTkjUe05T3d2MJ4AWBH5HCmkeUvqTKCX7qr8KGXm7iZoaKSiNQm
         mZRgVxy3z6AmQWi5tYXlN9EFJpgaBmVdOHP++lg26njscSufe4EkV2WghJx/FwKdksJ9
         9zUfxTJO2k3UzkTEZ8ex3agLVANzpv+Xd4xVzvs/AMGUQEb1v1qmn9G/i0qWY/kYgLc0
         uOUdMkmGwLmrG0rYCvf0teXAnBwPotJNm8O/4y/cQtXSk1zw/LLIcLZ0I6/aPPEYqffb
         qTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768941547; x=1769546347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrKCUKKckHcjjuwU+EHrOyUAQd4woAILl74Bd1qw4Gk=;
        b=H3hg9qqrGEpoX+cRgtPy4TfYjv3mSqS/T0RSTvxPcvFJQASFZTkdhu/WWsvJIbkuAj
         htcVyzvF2I97VaxFW/dK6cbqacNj4Z7UXECJoMZ1bZNsmsM8UDRt9zJYcDEOYgFcvW5Z
         ZS2WybH4TjbyhqdxCD1Pztk0J5YPACorbhzmNemq/TBA6ZT0l80OpLU5FDPeSx6/N0A5
         IzYVNFTI0VeRPgUmXkcroXm8OFZzruRlY7ZhVeO0hPOaRaU8Gdb8VItRIgKujTnv5eq3
         l/xFebCFVOT2fB/73Skee5UMj4E8U3Ru5stElUbpEF+HlhVu3KZr6RjDRKtVnzg/3kLb
         w8Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUuLCnwty4Um8pHsUHf5NCNIO2vm/rgMXK+Cwn4Yi1Rj7oVewt3DMls7UI7qZwmpd6uuIc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRleGfJbxVX5Wy1yohyOssoEr1ZXsJMaiBbknwWn9K47X8dAse
	S1+8Oxq1hKyx3/zps4KR8Hg/OZqgenQwa/DFeLLFPNUd5radkPcghqqB
X-Gm-Gg: AY/fxX6MwwCn38Xz5o1yPqI5vXvk7L3nTLeWiF7c6pCVpVFa5tqtvmCQ1kLChv4efWF
	QswAFiVvVk7K7Frv5mpkNLrOO3xkLGMU4L+8hcIYvDC2HIUXy2DwRGftuYDQoJ7JMW1QziMUljJ
	zSCmdbU2U02cyjhBUPQ0UfXTJR/5+i/gH2CqKl/AaNA74qt9hGyVGQ4PKk7DuC9m15XJRzpD+pI
	hHbWod7vxTJidjIQ2fTHpaz2Poelx5VnZkjqm/PEM+3bKJgOfghKZ5pqE5W5hd4Rw62i8JApJvd
	HLvsAcv5pN2nv9AVCunJ1gqkhZ2dRTQZmLa0/Bpbp+mB3nfYawIEEvRm5Vykzsbxv4vmsAuB24Z
	Jvsk04gMvl4HkYS6d4tPFOE+4cyz46vqAVzo3UMYt3UUOTM4KBCZ2OYz3C/TyAmBAkVJvpOZRgm
	2y1OwmCnUNT4Rdzr3D
X-Received: by 2002:a05:600c:414f:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-48020f17c12mr160684545e9.31.1768941546639;
        Tue, 20 Jan 2026 12:39:06 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:39:06 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	francesco.dolcini@toradex.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/3] net: stmmac: dwmac: enforce preamble before SFD for i.MX8MP
Date: Tue, 20 Jan 2026 21:30:01 +0100
Message-ID: <20260120203905.23805-1-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new phy_device flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD
that allows a MAC driver to request to keep the preamble bytes before
the start frame delimiter (SFD) when receiving frames from the PHY.

This flag is set in the stmmac driver for the i.MX8MP SoC due to errata
(ERR050694), which causes it to drop frames without a preamble.

The Micrel KSZ9131 PHY supports keeping the preamble before SFD by
setting an undocumented flag, that was confirmed by NXP and Micrel. This
new feature has been added to the Micrel PHY driver for the KSZ9131 PHY.

Changes since v2:
- Instead of using phy_register_fixup add a new phy_device::dev_flags
  flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD so that a MAC can request to keep
  the preamble before SFD if needed (Russell)
- Link to v2: https://lore.kernel.org/all/20260105100245.19317-1-eichest@gmail.com/

Changes since v1:
- Use phy_register_fixup_for_uid() instead of adding a new device tree
  property
- I will send the conversion of the micrel.txt binding as a separate
  patch series
- Link to v1: https://lore.kernel.org/all/20251212084657.29239-1-eichest@gmail.com/

Stefan Eichenberger (3):
  net: phy: add a new phy_device flag to keep preamble before sfd
  net: phy: micrel: add option to keep the preamble before sfd for
    KSZ9131
  net: stmmac: dwmac-imx: keep preamble before sfd on i.MX8MP

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  8 +++++++-
 drivers/net/phy/micrel.c                          | 14 +++++++++++++-
 include/linux/phy.h                               |  5 +++--
 include/linux/stmmac.h                            |  1 +
 5 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.51.0

