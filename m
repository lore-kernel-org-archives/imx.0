Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E0C218328
	for <imx@lists.linux.dev>; Wed, 30 Oct 2024 23:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730330906; cv=none; b=gjwfYKneecgT0xgrq90sLeayh9Z/iodxUt6EreuKgM2HW41sBoE9Q6KofYa2zrzzqZLhQ4bEXEv8jd6sUrDBYI4Q+fmVajFOQ9Xz/M0klGZJVcSPviELLylBu6kvCugTdZwuDHlKb3dij/8lpmMK0adc9Uj2pavTwgSDTMyuWGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730330906; c=relaxed/simple;
	bh=+VgptE/dVgJZFkkXR3/0i+wD/OC7M623YZFzl2pdBL4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gOxaUw8lTPUEfqsTVrOp7ClgSJJgpgAxTDia3escb074+7fI9QSjwDw12J54aHWXpIpV/8sC/T7pW2sRff4v0HUDXxeoCv7x4aHAcrQypnpp5rwMbJn25mtRonbbEbhDt1apPsUZKGdWRZUsvSCsggBZli5xX3K6gIUNKTwNxWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=KVOmoll6; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="KVOmoll6"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t6I6q-00AML4-1C
	for imx@lists.linux.dev;
	Thu, 31 Oct 2024 00:28:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=SbWlkHet4fXP9lFl2lD6ycOmmj0PFUZzrw6kS0LFEug=; b=KVOmoll6AHbqhfSE/mpmM8HuHO
	+bLk3wedBks3wno9lzrogh/rOE3gStbXHDb6n+SkZYtD+j95xT/vXBydgOzCkoJUq04YqJSTGU1SV
	jDntm8wWs9URx4XZML4+FFxhovaePaLAQppdKPxzVObVpCcd6f359sB7J21xZHeM9jP817OsoBgEj
	l6XNHxDxRg4N945zf1yllwO4RiRKX5ixoJLS62kFFhG9WWA/Fasrta8ESAi9SAOHWdmu+PjhvtAfQ
	eFTAlGFgLKCo3Gri/9n5cGL5vzIuJDmRP1qp0ZfIodv6HYjmB0m9WTNK8xrj8QNGw8dQz3/1/1E0j
	a0DS8wAQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/3] ARM: dts: add Kobo Clara 2E
Date: Thu, 31 Oct 2024 00:27:43 +0100
Message-Id: <20241030232746.2644502-1-andreas@kemnade.info>
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
 .../nxp/imx/imx6sll-kobo-clara2e-common.dtsi  | 514 ++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig          |   2 +
 6 files changed, 572 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-common.dtsi

-- 
2.39.5

