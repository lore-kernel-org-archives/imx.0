Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7AB421223;
	Mon, 24 Aug 2026 13:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577138; cv=none; b=FcQw+gEqTIWhkhCT/l1ILLuByVRW3yAk+F7+17iNjt0VeE8JypvebJbb0ibFX2mj4Iy6VPOmgt6YMr52UtYujKI7M3moKodLuFdKplTted1ihh2FxLrpto+7Bxxgb/ssEmA2RKTfNVbkfobbZ1+wZx/BPLotpMEqEf/gqG7zlzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577138; c=relaxed/simple;
	bh=YfnNy7H+MKpmvOhS4SoksQSiXwR94LflioldK9T78Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h5iDcgAOwIWOhWMZ3KviHbgcNeiaFuSo3V460uf0KWXzcHJZuAQt5tAq6c22Bp5OZ0zRIkkFd6AeLUxAcqHR9BQlBdyFPJJP6blroe2CwCNmYik/u2rEzTqkZnIMyElhDdfsrncsl8zwsTL5MkLGeItp0akrnI1/JuKrj5KvR6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PX2O47pq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PX2O47pq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA918C2BCFF;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787577138;
	bh=YfnNy7H+MKpmvOhS4SoksQSiXwR94LflioldK9T78Ag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PX2O47pqhH/pbt/WC7X8/6B5zZNt44LL++6mowya9jleVdzkb61QM6ZO1UXW5BJZl
	 2/ICBumpdlSkSdY8ihrM8JDH5m5QwbGuER5FaEOsf5dmUd6qCYrRpsA6ReSOgn7T3q
	 IPqcUcw/cJwLJYHLFS8rrdb/ZeuhO1SLUkp+axzt5BS0lGYR1n1EZDZ6km6ylZh49w
	 cqhaJCpCprTYHlsfYafS3laeevPvyGeycyzn46Q9+JnrHGQiRAV0MZeNdMiMt3SsaF
	 9vNHHb7AQNL4EOJ/9i4rgplRB5VGWQnm3jpQBWZ2hhjV/lEjNFb/f9uzBJ14Fq28d7
	 625d8lJXuVqjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF95C61CE3;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 15:12:03 +0200
Subject: [PATCH v2 3/3] arm64: dts: lx2160a: fix the iic5 spi3 pinmux
 offset and value
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v2-3-0a525d5f4cd5@free.fr>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
In-Reply-To: <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787577136; l=1537;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=BZq9iBy9zMULsx08pGD1SDDVGE5pMTVNIR3ADNpa4zc=;
 b=CKuLq+J0V1nANBfd3Gi8NrIBf4GFu2kLUI5rd055oh1iFr2PI2LlUcEnf9TdY1zYJ+Kir0gch
 xK+EtHn0BzvA6Fa/QWghZyvOzPEphZGYwJwkVtej4BrEKqjdvA4wNTp
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
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index fae705dd07669..bf5d9b671d858 100644
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


