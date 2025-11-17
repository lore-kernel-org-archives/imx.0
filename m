Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D02B335577;
	Mon, 17 Nov 2025 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391720; cv=none; b=dZDE1IFZle0GlUbT2p6f9KCgUHhgUuRaEiOuOr+xr4DvwY3QCPEPB5JnJ2gotShYJWfCPriPnJ3e/apJXPVZzwV8raHaPuj1Vs9WhT3M4ENzgB2GqV2h2LnKfiLesQgjHK69z/ka/WnrEusx5g6zuQARewOqXBR91nm3KlTSXks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391720; c=relaxed/simple;
	bh=aM/lSwisInWQvysr7Qvhf9k1ARCkI4k1p4GckW26e7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eOkZL9M4+UK+DCDgcTUFp8oQkjncP6zdxedo8BRXFR+DNCAzXB1M0964oPr3bb0ZV+M4wwT5PFWLr1s1MyTas6te8SL7OUtAx8FO7TXxx4oi686IIyc/T3nP/QVUo/nxFBTYZnpg8I7Y4T16IlLdUS12QLRAyqs+h7w8bkw7UQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiyTIIoA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiyTIIoA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D578AC19424;
	Mon, 17 Nov 2025 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763391720;
	bh=aM/lSwisInWQvysr7Qvhf9k1ARCkI4k1p4GckW26e7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oiyTIIoA5VG7izBgMClCKyMfWa5vOoRFUDqAMH7101HwFMXNeL8sEtYMJtAlMq4cQ
	 /JJc6h5nFAyjD7CUlB4zXC9qHFJNVB36nFvWowvcK3ZHNP2Sy+Wl7kPGKCh055YMAS
	 73haOCYHqaFnzM9fpJM5oYZvISlt+JxKa2uE35mvSpfGW9o8KAEwAkY7B9hsEnXxTi
	 lwbgabr//JRXfqZu8O3Kp+uJC0u8iU3dQPpdEaFCZcKMi/2E3Z+0dkO5cLiSZFcW/3
	 UH1X5m7CVQwzLsD6S5W3ddkq/NyZEZZF8SO+OoSEbAhlfYvEBI0hhITF066J3ghgKa
	 3IJjDHuTakv4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF9ACEBF92;
	Mon, 17 Nov 2025 15:01:59 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 17 Nov 2025 16:01:27 +0100
Subject: [PATCH v4 2/5] arm64: dts: imx8mm: Add pinctrl config definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-mini_iv-v4-2-5aa63832f51a@gocontroll.com>
References: <20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com>
In-Reply-To: <20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763391718; l=1755;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=Fg0B/yHP09KrPWAsUsEAQzgECLJVlSTMSX0Op7Toyjc=;
 b=aD80BJXCf6zu+EkH/vu63RmZRiihxg6BOGFDiMUIpDgnFJONncXWIdE8htHN+nvCq5iFzqXIq
 KDlAx3f13JcBg3yxKJJSsp6PWeZ55+O8onh/ULJDGPpAB4QdqZSezen
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
register is written in the dts, these values are not obvious. Add defines
which describe the fields of this register which can be or-ed together to
produce readable settings.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
index b1f11098d248..31557b7b9ccc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
@@ -6,6 +6,39 @@
 #ifndef __DTS_IMX8MM_PINFUNC_H
 #define __DTS_IMX8MM_PINFUNC_H
 
+/* Drive Strength */
+#define MX8MM_DSE_X1		0x0
+#define MX8MM_DSE_X2		0x4
+#define MX8MM_DSE_X4		0x2
+#define MX8MM_DSE_X6		0x6
+
+/* Slew Rate */
+#define MX8MM_FSEL_FAST		0x10
+#define MX8MM_FSEL_SLOW		0x0
+
+/* Open Drain */
+#define MX8MM_ODE_ENABLE	0x20
+#define MX8MM_ODE_DISABLE	0x0
+
+#define MX8MM_PULL_DOWN		0x0
+#define MX8MM_PULL_UP		0x40
+
+/* Hysteresis */
+#define MX8MM_HYS_CMOS		0x0
+#define MX8MM_HYS_SCHMITT	0x80
+
+#define MX8MM_PULL_ENABLE	0x100
+#define MX8MM_PULL_DISABLE	0x0
+
+/* SION force input mode */
+#define MX8MM_SION		0x40000000
+
+/* long defaults */
+#define MX8MM_USDHC_DATA_DEFAULT (MX8MM_FSEL_FAST | MX8MM_PULL_UP | \
+				  MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
+#define MX8MM_I2C_DEFAULT (MX8MM_DSE_X6 | MX8MM_PULL_UP | MX8MM_HYS_SCHMITT | \
+			   MX8MM_PULL_ENABLE | MX8MM_SION)
+
 /*
  * The pin function ID is a tuple of
  * <mux_reg conf_reg input_reg mux_mode input_val>

-- 
2.51.2


