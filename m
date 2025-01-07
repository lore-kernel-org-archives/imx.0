Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F1D1F236F
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258488; cv=none; b=q4Gfr8JLw7PpfxWO+0ydQ0fnLfCQkQQGNUE10phRYsQeQGVn/EwXXbloX6BXUrwl6pOEiOnk/Qef/F1VXkwXdGve0dvRbk24Jya95j6HijZRxN23fXCy5QhCIZp7Y0W+Y+86WsFK+wIwzRW/p2xgKi+2cTdWIo3rU0T3hHaO1x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258488; c=relaxed/simple;
	bh=mOv6IoOD6IS+Yf4DEqWJY/5DaJc84Guis08xKw4FqMA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XF1dQc33/jF93RcbSwQTR8N41fkZVKRnjZQCvcKS9NaeAr6TtdeGPHNTM7oLeWHlsL2zK/RKbRQ8l0ERjwSnJcM4YsGoIVKmfpl8pZz5rAg/GW1E3tWLdGQgypwA3eALS/0DxuI+CYo83xXLqx04NNri31SpQ2JXlo/JXq/D6jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=N2zWC/+K; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KO5rrJF5 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="N2zWC/+K";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KO5rrJF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736258483; x=1767794483;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5dWVUsjgYCfyghVbl/aVOvjNHhBfWKNBo9KEyUYVOsQ=;
  b=N2zWC/+Kc7MYIX34KMZDgjlC2iNN69+LMClE1gkQmobNwe+21oqGOysf
   x6MvXXyGfvAcyUwCXsInKjfer2ybogBHx0GBm0R0b0mKHu1n3Yl0tP+Ed
   gluLFKZtKMY2eV7p9f18AvlDY89UPTOchsc+IHPM/tMGm0S0gBibKHa7+
   E2UOwf0IpZwoFbScLsZVfLIeptRXRATtDTnuKCbsmqTwm409Re8CanGAr
   bZTODFfXNum2Hi5pxS5qRO+OS/C6Fy7yidDBCSu5valo0LRjmgqG32wor
   7RY9ZF6b1nuklFYHDOl+FFyzALNhWEt0lU2NXAU4sHMCQwbBWrTXSOZsy
   g==;
X-CSE-ConnectionGUID: K0rj5RPgSYezIE56GMO7qw==
X-CSE-MsgGUID: nS7yo3ndQ/eDyIYEfEslOQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896215"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:01:20 +0100
X-CheckPoint: {677D33B0-43-1D00F64B-E6C57517}
X-MAIL-CPID: 4747FB3F406B0D7ACCA7EA030A363758_3
X-Control-Analysis: str=0001.0A682F17.677D33B0.00C5,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A175160B22;
	Tue,  7 Jan 2025 15:01:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736258476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5dWVUsjgYCfyghVbl/aVOvjNHhBfWKNBo9KEyUYVOsQ=;
	b=KO5rrJF5ND2e3Vm/STvtn6q9zoYW4P/7BzrdeT/Qd+0L1Q7ZXHYujXmtek1qVz4PjQ7N2x
	/f+vlBucbloVM0GZAEuwtkTwjDsQv9qHUGt6JzCDbgFM9ucWDSlZkmogPX0UpduXDq+mzX
	8/iG9NMYTRYGIEG2H1qxnsTJln23WfBa7NSzAV+hmR4GhEtSeIkqY4owP3lBcMysCND+i6
	cqnLhGpoWha0UitJUOs5XR5omKAYClplKo3EOP0voavmW1YP35lurZG8zC3PPbaXVlxKtb
	NjFSu7zqDt8nnzc5PDLnMwyY26Ei/z7QqTgKLmpUaASNoByk/8L71O5icKhYLw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/5] TQMa8Xx update
Date: Tue,  7 Jan 2025 15:01:05 +0100
Message-Id: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

this small series updates the TQMa8Xx support:
* Add vcc-supply for spi-nor
* Enable JPEG decoder/encoder
* Remove obsolete TODO
* Add PCIe support on Mini-PCIe slot

The first patch is not necessary for PCIe support, but fixes the warning
> imx6q-pcie 5f010000.pcie: Invalid eDMA IRQs found

Best regards,
Alexander

Alexander Stein (5):
  arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
  arm64: dts: tqma8xx: Add vcc-supply for spi-nor
  arm64: dts: tqma8xx: enable jpeg encode and decode
  arm64: dts: tqma8xx: Remove GPU TODO
  arm64: dts: mba8xx: Add PCIe support

 .../boot/dts/freescale/imx8-ss-hsio.dtsi      |  5 +--
 arch/arm64/boot/dts/freescale/mba8xx.dtsi     | 32 ++++++++++++++++---
 arch/arm64/boot/dts/freescale/tqma8xx.dtsi    | 12 +++++--
 3 files changed, 40 insertions(+), 9 deletions(-)

-- 
2.34.1

