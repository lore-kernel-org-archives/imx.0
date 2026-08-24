Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3A9391842;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787606750; cv=none; b=iI0PPl3pcccptpb4ql+x2vdNLzkIHlLiW/OtSSTqlwjBGHea0b0s5Fsxfob+wbRFx0l9wbjtxWlELAIDY0LU7QLrWbMQfCSx31Q9nDs7FX64jqTvS9Ud6QZDV3GTeUVOTj//p6nw7R8Go83nOW8K0IGlbyOjutbiHgWdkLZw3ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787606750; c=relaxed/simple;
	bh=MtrNk79y9UlhhIe4pbAdt5QRKJ67Z3i4LU97ujPXueM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2R88cn4o3Be8q95kVULvNpZ5uUI5OrBmaZP0GKIytfg8lIDyqHYquD4lHR8ED7by+4HTGoB6QvFRm7Zp/zg0u3BxzCyeCRoQ4pkyH/ZWg3ZNWuIUQUgAtmRkFlAsEw6/HJPjGxxtDsubz0n32/Y/yNZ00b/lpVzfe0MB0ckdTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LV1VGOuK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LV1VGOuK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D331C2BCF4;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787606749;
	bh=MtrNk79y9UlhhIe4pbAdt5QRKJ67Z3i4LU97ujPXueM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LV1VGOuKH6vtbfL6sKT2y++7zjUIto9i952tLgrMaBj3pdijOa9gc7Dq8YJ4+d0h6
	 QQc2YP1OyOMJpDiZZGqUY8O3kUY0SB4n1ZHf+YG/I1ROurlJm/88Jj9xRhe3YG87vy
	 EaqxNR5w7TUuaJAxFtLRjm7VGBPD6KEug7IhD0XtdminlLj3R/mOwNTxXxOfErwjWD
	 0Y/eNq7wi8qXZWub+0f+kbM3rphMeGhSS3YFkbe5CP8f9uz65k7fVRwmYnE2xih68v
	 31YEa5j9J6Y3Y2lFMNbCJMNThtU93YHZEuDrm3Gyfr2aCSneZbXT/yC9mONnuhzIX7
	 QiXEm7wc/rliw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C956C5DF9C;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 23:25:29 +0200
Subject: [PATCH v3 1/3] arm64: dts: lx2160a: fix incorrect pinmux
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v3-1-5556ff1e6be2@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787606747; l=1674;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=tk7MyEzbkFZ9falPdlkYVsr2TClhONYWQaNZkpaH8F4=;
 b=sGMzLO+RIZh/oxKRvZgGXdsZ95+HjPTv+ykAhYxa76E4oapS1VBZ/VzyRGoiUEqngmIjPT6+f
 99nZ4asHgAFB3p79gFJdvAGg6a1GsHqf76xMANmZqfx2eipXYrOoN7d
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

From: Vincent Jardin <vjardin@free.fr>

For gpio1 value set for pinctrl is outside the mask and so will do
nothing.

Add the missing offset for value field to be the same as the mask as
expected.

Fixes: 284ad7064aaa ("arm64: dts: lx2160a: complete pinmux for rcwsr12 configuration word")
Suggested-by: Thibaut Collet <thbt.cllt@gmail.com>
Reviewed-by: Josua Mayer <josua@solid-run.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index ae6e37870c5e5..d4522a19405a9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -1622,7 +1622,7 @@ fspi_data74_pins: xspi1-data74-pins {
 			};
 
 			gpio1_31_28_pins: xspi1-data74-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 15)>;
+				pinctrl-single,bits = <0x0 (0x1 << 15) (0x7 << 15)>;
 			};
 
 			fspi_data30_pins: xspi1-data30-pins {
@@ -1630,7 +1630,7 @@ fspi_data30_pins: xspi1-data30-pins {
 			};
 
 			gpio1_27_24_pins: xspi1-data30-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 18)>;
+				pinctrl-single,bits = <0x0 (0x1 << 18) (0x7 << 18)>;
 			};
 
 			fspi_dqs_sck_cs10_pins: xspi1-base-pins {
@@ -1638,7 +1638,7 @@ fspi_dqs_sck_cs10_pins: xspi1-base-pins {
 			};
 
 			gpio1_23_20_pins: xspi1-base-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 21)>;
+				pinctrl-single,bits = <0x0 (0x1 << 21) (0x7 << 21)>;
 			};
 
 			esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {

-- 
2.43.0


