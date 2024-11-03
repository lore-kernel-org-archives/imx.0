Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65358189B9F
	for <imx@lists.linux.dev>; Sun,  3 Nov 2024 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730641947; cv=none; b=MeWaGyK5g+ZRZqlB5y9qDexaHLBrIs4ibjpO7iNSmh2FyfC0bE6aMtrxMYIl6nVSXWc2LrKqhXAgEd5gbJreGIy5a/BRNaagowyGqVZ6LDa9MUCwE3R6aQE1V/ILVN6K0kagpzBOF3dBLWcgru3tp4HPWBCwri3vRnVXQOKrDIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730641947; c=relaxed/simple;
	bh=czf7XeC+ghUUOND93LkL6BYMnysaoDQTP/DqE4tRs0U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NpRQdUeAZ/9zHBcSJJtjUsmjhdnW6AOpsLMGuCPDGjMbA33SPJ5/dblLUIQWfNJcNawAJ+w+O4oOTOUHtpU/+ue7Z70sCYCIbX2e5TDkXzr1Q8K7qkj/v8Y8l5F0gYThNy5JgB2zwAB1HydBtgq7TMX5MtzJM1Aj75fHG3ts+BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=12cTzl7Y; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="12cTzl7Y"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t7b1e-00ATEP-38
	for imx@lists.linux.dev;
	Sun, 03 Nov 2024 14:52:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=WmTUPeSBb+svkmezLqwSQpXBbexJ56aq+pF1uohHTgo=; b=12cTzl7YxUPUCCjgFAuYrUZgH/
	0hNLb5yLIguXpbk4sQHNTIlzdyCvF6MB+3Q6kgHfFn8CNqSjIW72mOYTMTl4+mWZ8v5pLP3TfqQwS
	VcWKv04VXpNuAk+4g3oHM6M61r3o/QnqINkuqGLhS67I1NyeR1nT66RQrW4nuqClbZc6AlYTyTYkc
	6xZbpGESqLdC55v23uQWZsBYuFA3Gc/bEJ1LXV2YKHAqRJjTMl/Si2q3qwjegR0DbYpMFquerEGq+
	EaAurzsSTT6pnvcQQZQmUAslsrMs6E4uA8nWS+X+Z/euC9FAaUDq61V/I7KU2nhzYoebq4nf4MHNj
	MwUTRyWQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v4 0/3] ARM: dts: add Kobo Clara 2E
Date: Sun,  3 Nov 2024 14:51:58 +0100
Message-Id: <20241103135201.25615-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a basic device tree for the Kobo Clara 2E Ebook reader.
It is equipped with an i.MX6SLL SoC. EPDC PMIC drivers
are not ready for mainline yet.

Changes in V4:
- fix order of pinmux nodes
- remove some blank lines

Changes in V3:
- removed 30MegaOhm current sense resistor nonsense

Changes in V2:
- improved commit message about devices without binding

Andreas Kemnade (3):
  dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
  ARM: dts: imx: Add devicetree for Kobo Clara 2E
  ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E

 .../devicetree/bindings/arm/fsl.yaml          |   8 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../dts/nxp/imx/imx6sll-kobo-clara2e-a.dts    |  23 +
 .../dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    |  23 +
 .../nxp/imx/imx6sll-kobo-clara2e-common.dtsi  | 511 ++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig          |   2 +
 6 files changed, 569 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-common.dtsi

-- 
2.39.5

