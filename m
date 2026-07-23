Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F9E3E8357
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 07:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791749; cv=none; b=q66VbLx5nfp6NVNg5VIAPUloPsi+Fu66QuY7YLnCBLBqFMuH7U0xJ1O26RO8lie0JEw5VOCSTA/duXK9NAJPuVY24thaJThUTuQ03JqUKGVwM1OeEOrAW5FSkdMAXoBtFExWQxHdg8jKLSUCG3CqKB+riZSspV20eWWZUpV77w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791749; c=relaxed/simple;
	bh=SvlBzssYEQXjoX3pFp3ulUdGkZriJCdrKFdjFL4zeGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PzqkEecM9aeO2ti0Ug5mIU8UUD0UZbeg170GA3T5zTErx4mTjAivx8t0pONkkb0zhRZpSMvH7Zu3r0qr3uicEwZSAH4oFjry/Qdih+dXw3iHvraEkiiQspb6sQA0aAXKElrGWsOXGxKTO9DqUF44WoQtaeWwImdtcch4AQbBXDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=D21llxJw; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="D21llxJw"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyM8MlyD+NPze9KzqJFx0sc15raowUeSYwkhCExYjsw=;
	b=D21llxJwhytH302JkyH+8bz/6BmPAzDf7rzow8TTmgllpFV2nifwuOzifAZCjX67FqBTF0
	S0xSl3hiSXO6MQXjK562Br2yUXxuYYy1oVcF75yv72JaODd6sxDRyjFO5RoQ73iIn2QzCI
	Sg4KF7D6rikzjDExHOwUvaYdcZW2/3wKPyrL9ViLCNMyKuCxDfU6rCCWcxgcthWPjR81Ns
	WcvwIxuRHFsLu3/NAGv33vAl1N9JFIwwM0iaGi4uFc7ti3JEF2GwGyxZnJf63PzOiLJMBo
	ua/3GqXzuoq5ueE9N6fo44b2uKQSSf0dR1Z8flDPgNUXfjqlgc5O0BbCXncc1Q==
Date: Thu, 23 Jul 2026 09:27:32 +0200
Subject: [PATCH v3 10/11] arm64: dts: Add common include for i.MX93 ELE
 firmware
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-10-e26930345b4c@kontron.de>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=M0hVY+f81C54spjSt4uzwzn1ZOcQMZubpkUYUZsOXPE=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0Da1vnhxTx732637Hs1/7Oy98/KjWYu1F/T5502Ke
 632puhyRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwETaTjMyXJ8XukfVc7Nhy2ev
 qo9eLkcD3u/8xp4ue/rSgni+S7tUoxgZmncbZc9b1CEh+eT3gQXz7zOuk/1XsU18n+AJraIEfXV
 VZgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

To make it easier for boards to configure the EdgeLock Secure Enclave
on i.MX93, add a common include file that contains sane defaults. It
specifies the memory node, enables the ELE firmware node and adds a
reference to NVMEM OCOTP driver.

The 1MB memory area required for the firmware is placed in the first
256MB of the DDR. Boards that require a more specific alignment can
override this accordingly.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93-firmware.dtsi | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi
new file mode 100644
index 000000000000..58614158ef90
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Kontron Electronics GmbH
+ */
+
+/{
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_memory: ele-memory {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x10000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	status = "okay";
+	memory-region = <&ele_memory>;
+};
+
+&ocotp {
+	secure-enclave = <&hsm0>;
+};

-- 
2.55.0

