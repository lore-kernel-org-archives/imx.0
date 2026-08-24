Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED26A391835;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787606750; cv=none; b=Yfr5ycqMOb4Z9efIV84Vsw9gPrFZzh5ZSBi62h3N5c74Bw3TAP62gcN9lK2yCtZa71It32hwhxNpfMVP3jv4QzOuSv1+UkgaGhe2mw+f80cEV4lugZvmPn5swO9GAko43KpxSNE/D1wTgv6yLAG5iKNxe/HHJ36AFWppl/EFnig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787606750; c=relaxed/simple;
	bh=7/5axdhQNXuY4I+yRWh2TmDa+ZyuwP/SOiSz4/cxhM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sh0WrBcwIs5P3Q4oZ+6mJkTI+V8AxkteI/CLpQL8P/MD2WtbADw+jrG3+3nh3JSB4jU2ApKqGNLg4mXNA5FWnX/Tcc8Hp2K/Njsy14mZ3/LKdnou3o6DjchVFnU8KAONy6pPa96cZKlYoXiVD8XVntWBkEr4Yej091BdKq+cUec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZhy8Die; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZhy8Die"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9ABF8C2BCFB;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787606749;
	bh=7/5axdhQNXuY4I+yRWh2TmDa+ZyuwP/SOiSz4/cxhM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kZhy8DieTbw+ALnGykhI3m4qhio2noa/k4KS7zOU++MwKqhTBzE2cSqBpttHlJXPf
	 Xp2vm2YXyBV5wMYD2TBUjTyB83tzoBDsMZu1J/yqjT+6TpvLYwwHU/+EE38tHEb/0Q
	 vPsumbmv2/VB85EGWBhbwofwS/e35AY8xaP5XrDmoFn3f42mSRqGz64mHXvnZOP6+l
	 UqhRBl4uD+sLTyG5CG6GN21mjhXsYZkECfuRhBTR/TShx125je/E2gNKQp1JjSbk+V
	 XJccXhxA07Qe87wwD8rBVi1QyLWUqvWo9khsZl5xhbokc7R2fnzm4dOVo3FffdJgKZ
	 bUaCiY6XJ78FA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAD0C5DF81;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 23:25:31 +0200
Subject: [PATCH v3 3/3] arm64: dts: lx2160a: fix the iic5 spi3 pinmux
 offset and value
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v3-3-5556ff1e6be2@free.fr>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v3-0-5556ff1e6be2@free.fr>
In-Reply-To: <20260824-for-upstream-lx2160a-pinmux-fix-v3-0-5556ff1e6be2@free.fr>
To: Frank Li <Frank.Li@nxp.com>, Carlos Song <carlos.song@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Josua Mayer <josua@solid-run.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thibaut Collet <thbt.cllt@gmail.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787606747; l=1585;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=QDg/PMlX4cUoUaMiOfnzx35qrvv5wjRXmhdG/ya3lcg=;
 b=w/L0OfexC4Q+IyPr+msl2FmmJigxz+valXAqzNpFZL1/w+8IKFjamnyUEiKTnalyeYRtJY5Jg
 YiehfGbb1fQC5+jpWIw0wSCtOeSE7OA1OvUKoeIUiXWkROC8xu0EzTq
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

The iic5-spi3-pins node has both of its first two cells wrong.

The offset selects the register within the node's reg range, where:
  0x0 is RCWSR12,
  0x4 is RCWSR13,
  0x8 is RCWSR14.

An offset of 0x3 is not one of them and is not even aligned for the
declared 32 bit register width. It is the only node in this pinmux that
does not use 0x0, 0x4 neither 0x8.

The value is wrong too:
  IIC5_PMUX is RCWSR12[11:9] and it encodes 0b000 for IIC5,
  0b001 for GPIO_1[25:24],
  0b010 for SDHC1_CLK_SYNC_OUT/IN,
  0b011 for {IIC5_SCL,IIC5_SDA} = {SPI3_SOUT,SPI3_SIN}.

This node selects the last of those, so it needs 0x3, not the 0x2, which
is the value of the neighbouring sdhc1 clock sync node it was copied
from.

Fixes: 284ad7064aaa ("arm64: dts: lx2160a: complete pinmux for rcwsr12 configuration word")
Reviewed-by: Josua Mayer <josua@solid-run.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index d9d4500a40510..bccf2d6730230 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -1602,7 +1602,7 @@ esdhc0_clksync_pins: iic5-sdhc-clk-pins {
 			};
 
 			dspi2_miso_mosi_pins: iic5-spi3-pins {
-				pinctrl-single,bits = <0x3 (0x2 << 9) (0x7 << 9)>;
+				pinctrl-single,bits = <0x0 (0x3 << 9) (0x7 << 9)>;
 			};
 
 			i2c5_pins: iic6-i2c-pins {

-- 
2.43.0


