Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8171B87E9
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 14:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814241; cv=none; b=P/U7OL6ZwKhRq+yMhP13G4QJGsv2eHEuDgoGjWgKpfbr6j7/UuQ+69AbrzkdOmsZ37sX4QnctMncjaA703l3HA8R9XLWa+ZXZpP2USXI9NYPHPvtQXVCvSaFSgiHJccLywhEA81XclaWw2a7YpOg2Xh9GhvEAoFAqr3ykKIL0JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814241; c=relaxed/simple;
	bh=KUEHY7ZRwTuC/5HTGE/zXecsPRtJxHha9LUkQvT/XN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eg8e5YL63ackHs4w2ha6Jg3a2KwGb5yKqA1uB4O73/KmG4wANiJs9nGglS4gL26qyMglMEFafnCq62Vzg34XSdMseahIjat0IHoroVq8B9TJ+oy/5O8nPel9l6yucGg5rGhmwOuSgpnayYdsMBhTjXpDklUVAwU7kOjhJW+qEXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=crrQzbY9; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="crrQzbY9"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7ADFC9699;
	Wed, 16 Apr 2025 16:27:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1744813669; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=HBqHrUhw97eHPrj9acjB4nBmmHDFArDGTlBCisgNOvc=;
	b=crrQzbY9TVfvcvN+4H3r8iiMKkgfILDsW19WI8gtf8+p+QieW4e/QkEEisQi3jA8/Kc/Pk
	3WVznrzGJodRTM0zi8xFxXN7I5rVMKjb2JgWD0/ApfsaeFmas82LjMAEiJvpEsVQWGkdS8
	+vTtuNd1x9Zqq3xAabobt5+P6KPgwK12wnyXBvk1ljy/85u44Std/GULiRY4UTUaBinKA9
	DW/7buLKYQhSgKnUrfzorCALiSyAhQ3sH0uKKOeWY3Pg8PU5enAt3NVWz3DrUNM/6LDHin
	mYHTny6pz+6rDFFAiojeUrfKMEFIKXgjNFPk1e/XtwWJhkoRTZv5Mpd8D/V72g==
From: Frieder Schrempf <frieder@fris.de>
To: Peng Fan <peng.fan@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC PATCH 0/5] Add NVMEM driver for i.MX93 OTP access through ELE
Date: Wed, 16 Apr 2025 16:26:19 +0200
Message-ID: <20250416142715.1042363-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This depends on [1] for the support of the Edgelock Secure Enclave firmware
driver.

There are at least two ways to access the OTP fuses on i.MX93:

(1) through the FSB (fuseblock) registers
(2) through the ELE S400 API

There currently is a NVMEM driver imx-ocotp-ele.c that (despite its name)
implements (1). As the FSB only provides limited access to the OTP registers
(read only) it's not sufficient for all use-cases.

It seems like imx-ocotp-ele.c was intended to be extended later to implement
(1) and (2) deciding on a per-fuse-register basis which of both access methods
should be used.

This has some downsides:

* the driver gets convoluted and complex
* the driver decides which OTP registers are accessed in which way and therefore
  mixes read-only and read/write access

Therefore I implemented a simple driver that uses the ELE S400 API only, as the
FSB access (1) doesn't provide any benefits except for that it doesn't depend
on the ELE firmware being available. This is used by us downstream.

For the upstream solution I would like to have some feedback on how to move
on:

1. switch imx-ocotp-ele.c to use ELE API exclusively
   -> this will create a hard dependency on the ELE firmware/driver being available
2. extend imx-ocotp-ele.c to use FSB and ELE API
   -> make the driver use ELE API for all registers if ELE firmware/driver is available
3. create separate drivers as done in this RFC

Thanks!

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com/

Frieder Schrempf (5):
  firmware: imx: ele: Add API functions for OCOTP fuse access
  nvmem: Add i.MX OCOTP fuse driver using ELE S400 API
  arm64: dts: imx93: Add node for EdgeLock Enclave (ELE) firmware driver
  arm64: dts: imx93: Add node for OCOTP S400 NVMEM driver
  arm64: dts: imx93-kontron: Add DMA memory region for ELE firmware

 .../dts/freescale/imx93-kontron-osm-s.dtsi    |  16 ++
 arch/arm64/boot/dts/freescale/imx93.dtsi      |  11 +
 drivers/firmware/imx/ele_base_msg.c           | 122 +++++++++++
 drivers/firmware/imx/ele_base_msg.h           |   8 +
 drivers/nvmem/Kconfig                         |  11 +
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/imx-ocotp-s400.c                | 195 ++++++++++++++++++
 include/linux/firmware/imx/se_api.h           |   3 +
 8 files changed, 368 insertions(+)
 create mode 100644 drivers/nvmem/imx-ocotp-s400.c

-- 
2.49.0
