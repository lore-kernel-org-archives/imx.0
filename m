Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA7716B38D
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473287; cv=none; b=bNo0NTFhJQgd9b5iMtUUkdM3LwRBkrUVKPWtBDsprB/50oZy4+3kt/DH167QEOYF8JfA9bTQmVHvOHaWQdjJS9fodE27EK4rfaY9GxW0OtbSDzuRkP9cEc2wUfTGl7mXnaGkvTGSgYsZ/o5x5bAZnfS6Whr0xfmB7pkdPMEWzZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473287; c=relaxed/simple;
	bh=X41pD/sr5idZfOBgmEt3sbpwwyMLxRp5ojn49knMr10=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z9yv/T+JG9IYkiw/y9ZGNTfPbL8qwx28I/ZSPrQCiXVg+4LjdhBi+fIboRx4Ta7FXc9INLnAid6eRkjQQ3Bc4ER6Mk3Zo38FDCFftMLObwBgExvWi57KoyXk90oBUJsothFa0lzepK61EBqSfsuJO07Sm2Uk4a+Jxuf6ieku0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=pym37qIU; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oRktAyCc reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="pym37qIU";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oRktAyCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723473284; x=1755009284;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6CJ3bGbiH0qd11OmXomO8QBtSCRXDXg7Hh1mfPM2sF8=;
  b=pym37qIUOok8bofPwI1Ictu0xnXBadrIlPD4xtmmJek8+fQ0fv3c0ngQ
   1u0v8fqSAeYIpYopZnoMeHntHzHznG6bWGWCxez0540NCxodUpo4hJa3y
   9bY4pWlsDhQiliFImZR0HfMXw0FzxiJcA06TshcwffR7rlE67rd41LPEk
   YuZlm3SAMYNgbYNc0vk2jySwzzR5QEiYFC/1rZDMVn8oh3NOF0vC3cVIS
   ZZ7I/zrLjXNZqQhn4D9mEFMumUdy9ZX2EvpoM39C+41VxngmK92hIWoKA
   ebc8VoEIHsf+7dkibi7KYbS7BVCkjS17BNu8tf6/5cDfpy0rOo8eVhH8m
   A==;
X-CSE-ConnectionGUID: osMyVJH3QwmIzI/G4WJrxg==
X-CSE-MsgGUID: UlZtHx2mRQ6444B/RoySIQ==
X-IronPort-AV: E=Sophos;i="6.09,283,1716242400"; 
   d="scan'208";a="38365797"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Aug 2024 16:34:42 +0200
X-CheckPoint: {66BA1D81-12-FF00FE11-F2A862FD}
X-MAIL-CPID: 842FF475C196C16CB945CE95EB464E94_5
X-Control-Analysis: str=0001.0A782F1F.66BA1D82.0048,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3372160D69;
	Mon, 12 Aug 2024 16:34:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723473277; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=6CJ3bGbiH0qd11OmXomO8QBtSCRXDXg7Hh1mfPM2sF8=;
	b=oRktAyCc552hlBTC9vzuGsWcfbptymEo0fpneVOtnrNJ8ZFiDtl0kXU+6eCdaEW0J83/NJ
	6xtBqz1PFV+sflePbdUoVHLZSiWsKtjpTCdLy4ccbVKHBq3h6SAYP6ihg/lZVSBq+patHf
	4Xt3a1QYo57TS3+lDvpZhJPji3qd7D60SoByJu+NXngO9oPCjgZyMhUjAr3zP50M1kfMIC
	YeGENxejLvEKAmNjUAWHDcfgtOxYbn0FNkIrkaaoCUzDtFn2iz+yHEd53PulAVl4sY3KTM
	iHS2Guawh5apK/ijbPn4goQVDf3RhjN3jWvh044dMlBzS2DXy05UNKo1ZBSh6Q==
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH 0/5] TQMa6x / MBa6x DT improvements
Date: Mon, 12 Aug 2024 16:34:26 +0200
Message-Id: <20240812143431.98323-1-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This series brings following improvements:
* use a more specific compatible for the LM75 temperature sensors
  on SoM and mainboard
* move I2C pinmux entries to variants that use them and prevent
  doubled declaration
* rename node name for onboard USB hub

Alexander Stein (1):
  ARM: dts: imx6qdl: Rename USB hub node name

Markus Niebel (4):
  arm: dts: imx6qdl-tqma6: move i2c3 pinmux to imx6qdl-tqma6b
  arm: dts: imx6qdl-tqma6: improve compatible for LM75 temp sensor
  arm: dts: imx6qdl-mba6: improve compatible for LM75 temp sensor
  arm: dts: imx6qdl-mba6b: remove doubled entry for I2C1 pinmux

 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi  |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi  | 11 +---------
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 14 -------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi | 20 +++++++++++++++++--
 6 files changed, 23 insertions(+), 30 deletions(-)

-- 
2.34.1

