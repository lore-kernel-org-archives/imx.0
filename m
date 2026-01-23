Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31E22F6574;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769157031; cv=none; b=jq2p4vl5a9MK2BB1NhFNRetLjrKMfpxbad/HFc5GztLx17SIpqNf09sK6/Wl9KLPNpEgOoYhcizfOIlFoR5zf5n/hU5njMRp9GOQ5oS9b6/Zzs814Cw5kV9pUOlAWR5Y00wfiDk2NwxZSn9W7DXvED5iRfXJjSwHeQVE2bLgGtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769157031; c=relaxed/simple;
	bh=ZNhH2BSoAe0OR59mUnlMzgewCgrzFVxl1VaT42nwqyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KgmKZUgpHP2MZfK6gCvOlXZpt/7EXMnrClIJ0hr+qhfxhQL4VvcMvrzHvi0vZvNvKNXZooDRN01Fo/EmmiCrgKPMLtO30vyRAxuPY/CQPBu0JfwoB3hXYMqO7p7gWWofA9YmxU+Vs9SB8H7E9Pip3+Cus44sqxIZJ/as+SaUC8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OChNQb8t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OChNQb8t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5C22C2BC9E;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769157030;
	bh=ZNhH2BSoAe0OR59mUnlMzgewCgrzFVxl1VaT42nwqyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OChNQb8tiLQh1CKAiaJdBMpNzqE5svt2ESyMW1yFGA3c8fVAOwlyZJPuu+5MUOz9l
	 mOO/saGCkfkZ7q1sLdQP8DkjNiPFuld5uMnnQPze9e23XTJnXhIvcXDr4pDVVPy1b8
	 BPWF4MBVrG3dlwpgl8wAxCII2yn3NMFw5HyEK/HWhe6AcDN89obDS8U42jWj2obzJM
	 PPlmGZxPl6bcdkrSxB3lGTN/fp2w+OMqmUTD7lInJWxMdZY+ARRlT83bua7h43Ct3T
	 owLOTaq0Yu1Eo+AXtmPAWpbpTsGmRVTdKs7AXAl/CX8JVM5WT0A8GbvJuxW7y7i1fB
	 UKlWIfJfYiOng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC01D7234E;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 23 Jan 2026 09:30:29 +0100
Subject: [PATCH v5 2/5] arm64: dts: imx8mm: Add pinctrl config definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-mini_iv-v5-2-29bef040f236@gocontroll.com>
References: <20260123-mini_iv-v5-0-29bef040f236@gocontroll.com>
In-Reply-To: <20260123-mini_iv-v5-0-29bef040f236@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769157029; l=1755;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=Fzv30e+2nnz6h2EkITEHtWivtDHnArN59lCqISGcmeA=;
 b=HC8HWUHBifMwyzsKoqCJ4NeNocvX1YljvD8v0ZXP2NC643/s6lBgJCt0BwiFLFdLS369cUT1a
 w8IdFqSjjL6BKfKxWBz8V10J+MEyraGo2djwFDj/Pr5dJrm1LtCj3Lb
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
2.52.0


