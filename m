Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED31A391838;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787606750; cv=none; b=iUUoy9Uw+cLXo1Yt1pJWU1vYsL4yY6uTJg5ERaRoaL+RB3oTSTu80Uu60Ytjx3B/OAbpW1Ws+5yfwoUGZwkTSQQYret3ik4sNEeS22om+SgxZiN/fvCjHBByjl/o0V0TB1wwNeuUaL5eBfKjUEROz9misbbJ5pjiD/XAQfqiciE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787606750; c=relaxed/simple;
	bh=G5hRhMw/rTJeP+uVQ+/IDnLHBALxPj/b8JPGt9DC1A8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L38LkBpZlhQxHza5nfomE+u7cp2K9HlZEWgeXIVe+j2pUJdpGzCoQz5eklluny2PxRALDtJb+FrGQLCWtaMeGUXLJVX4Z7mDCgKi1gKt/LUcbFxm89jfi4URsMxOSbfX62GbBOS+M+852P/oxjQMn+CgwcXcoKJI6bxVo0ode80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hv4JTlTM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hv4JTlTM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E8BBC2BCF6;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787606749;
	bh=G5hRhMw/rTJeP+uVQ+/IDnLHBALxPj/b8JPGt9DC1A8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hv4JTlTMqyypWurdRVveg7buJvBnPVBxCqLMdFBUmNd5uIGkvG7EsMRfR0K34coBX
	 he0IgTdpQY0aF+dqn0qXd61U1i39A+Svsq7a0XRoIZVnqyphSrGJ1HiNuz9h3C+WqJ
	 Sby310uB1wFdItA647iGyr2XQ/mx/mem6h9bUO/Bqx8Rc3aCTcMq8Wz1+FahQwBkb3
	 vO1yFmb9asaXRrA3EaC8cxFx3TazL5umzboWrkZrK989WLyf61gMNA/GNEnEcyEE5G
	 cqrvA6mVb6OpGlWAy1gzngbT2b6SKa2LBecbLwRWzbRrVf3WMz1XsuHWnctvlckQKN
	 r1ol0I3RpCobw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C744C5DF9D;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 23:25:30 +0200
Subject: [PATCH v3 2/3] arm64: dts: lx2160a: fix IIC1 pinmux submask
 rejected by pinctrl-single
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v3-2-5556ff1e6be2@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787606747; l=2317;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=RQSuv7sNb6qL2mxWfOmjTQhD0J0pZv301ma7dFDHaYg=;
 b=XH70Jv+EGNq2fIoIIIFRPNR518p0v4eNgaPII/lj8Wzxu7EH6ZmAKsUt3+o/d4lrI2zd6Jon0
 fuknEF48DZZBbMsiQgWozBQ3ZVJd75e12SBy2VIMDjW8CPqw8f64Z6v
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

IIC1_PMUX is a single bit field at RCWSR14 bit 10, so the mask for the
two iic1 pinmux nodes was narrowed from 0x7 to 0x1 to avoid writing the
two reserved bits next to it.

With pinctrl-single,bit-per-mux the driver does not take the supplied
mask as the bits to modify. It derives the field from the node's
pinctrl-single,function-mask, which is 0x7 here, and then requires the
supplied mask to match it exactly:

	bit_pos = __ffs(mask);			/* 10 */
	mask_pos = ((pcs->fmask) << bit_pos);	/* 0x7 << 10 = 0x1c00 */
	submask = mask & mask_pos;		/* 0x400 */
	...
	if (submask != mask_pos) {
		dev_warn(pcs->dev,
			 "Invalid submask 0x%x for %pOFn at 0x%x\n",
			 submask, np, offset);
		continue;
	}

A one bit mask gives submask 0x400 against mask_pos 0x1c00, so both
nodes are rejected and the pins are never muxed with this message:

  pinctrl-single 70010012c.pinmux: Invalid submask 0x400 for iic1-i2c-pins
  pinctrl-single 70010012c.pinmux: Invalid submask 0x400 for iic1-gpio-pins

The values are not changed:
  - 0x0 selects IIC1
  - 0x1 << 10 selects GPIO_1[3:2].

Fixes: 7a3cc49ad1fc ("arm64: dts: lx2160a: change i2c0 (iic1) pinmux mask to one bit")
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index d4522a19405a9..d9d4500a40510 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -1687,12 +1687,19 @@ i2c6_i2c7_pins: iic8-iic7-i2c-pins {
 			};
 
 			/* RCWSR14 */
+			/*
+			 * IIC1_PMUX is a single bit at RCWSR14[10], but bit-per-mux
+			 * uses the mask for the field to clear before applying the
+			 * value.
+			 * So bits 11 and 12, which are reserved, are written as 0
+			 * on every mux switch, it is harmless.
+			 */
 			i2c0_pins: iic1-i2c-pins {
-				pinctrl-single,bits = <0x8 0x0 (0x1 << 10)>;
+				pinctrl-single,bits = <0x8 0x0 (0x7 << 10)>;
 			};
 
 			gpio0_3_2_pins: iic1-gpio-pins {
-				pinctrl-single,bits = <0x8 (0x1 << 10) (0x1 << 10)>;
+				pinctrl-single,bits = <0x8 (0x1 << 10) (0x7 << 10)>;
 			};
 		};
 

-- 
2.43.0


