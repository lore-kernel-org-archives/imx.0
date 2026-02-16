Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91BD2FFDF7;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771247239; cv=none; b=XxEcjZnD/cqJ2CmpSXgVT1dMt87loLxrjevNspYknRzCRgE5W/kqdmji/SMqClq1VY+Vdqd/1zmK5DYacd4bqCRUzEPEO8O1S4sX9Dz8tgW/6ySEM7fG+9e7b75tn8Lbk1MbnM/jW5lwb98xJgwMQmL3k5rKnmMUS8eyJ5fdROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771247239; c=relaxed/simple;
	bh=1zZ1klI7jMvE3JPFqQl4jJCixbOTTkTPgmXR4bKk+Io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h5XVTqHrlaGqNQiDCRGekJo6pMPDcpPtNWkq3sJmtzXV+C8J0CSTG0ZhBj6xZq3EEG04uv65NklLENoUQkDGUJ3Tl9QsbIYflvhsWJ0QLTkz87K/V57oupcvr6sPjD+tLm3qZViYZ9HsnTLU1UZPNT/z0WY0kjqvp6D3lCzCZkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KN/Kre5v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KN/Kre5v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C76FC2BC87;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771247238;
	bh=1zZ1klI7jMvE3JPFqQl4jJCixbOTTkTPgmXR4bKk+Io=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KN/Kre5vKr7qSvOuW5+as6/aHiejL8MFHox0QV8xBTukLbY1zEPeayKSJcQuVarxi
	 w0kDCqQj/vOSmbQvl9uk1BLcBKanExeMbJWZkepxKo9T0zitCsGYTUs4P/geqaT3es
	 VHN17rtEfmA9i7yUv80nL2Sl+vBNFb3GhioQd+Hf/e1lftC6bdOkrPkUtZu8kp/0/6
	 Wj7rkOK4gORpY2Yh7CFG3lHLZa+sdYbqS7HSns5aB7/6kMCrayve6wpkICGb8BEt1d
	 LI/PKm812PYbBKufHX03bvUq2UzRsRDZYVjrVFfCbOpsmzGwTrryeGhEc19KhvJ57d
	 pbIVt8BOZwdMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E56FE7BDBA;
	Mon, 16 Feb 2026 13:07:18 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 16 Feb 2026 14:07:09 +0100
Subject: [PATCH v8 2/5] arm64: dts: imx8mm: Add pinctrl config definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-mini_iv-v8-2-8d528e7cb454@gocontroll.com>
References: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
In-Reply-To: <20260216-mini_iv-v8-0-8d528e7cb454@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771247236; l=1799;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=voUp2HcofZ4LhrAmfrJxKuvsnXx9lInFvA6CTcTKypE=;
 b=sTqPEjPnG/pbGy5wdk0zZHGb0QNQ6KuOL+Au7urmAXZqWxsITgDiqX5fGmJICuIEI8/6BxGZX
 i65MpDniC9pBOfqUIbDtzQD4gmm9m14t8YIb+DuEpd5+Z16+5hTZIX0
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
index b1f11098d248e..31557b7b9ccc1 100644
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
2.53.0


