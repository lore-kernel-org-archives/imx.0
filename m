Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E950421F05;
	Mon, 24 Aug 2026 13:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577138; cv=none; b=GK2tis+NYav8Va00yM3BXzITcBgbTQFnQDMBhAvReE6us0THCJYoW9UHWUpKtmFNR7I6WDXZwtGvn/Pz+oLN/+dN1OuY38Suu/8UjILO3hvbCIpLikqe4fP10Th4Gjv6/ce50T/kDPzOwAlGK53+0wCCtJM6FL4J0DWYXN4tTl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577138; c=relaxed/simple;
	bh=QyXzZnJwkyxBDSEwT4XALNAbFVFz7Ox37OrO3JqwCZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=URk1OdGuXjJ8xjAYRKPmg0m81v66rTXKeV5bn0jGDmlVqGvrAWVKz0/B3ymn9T77y7kKoWqE8L0uRQ3JjfhkocoADxq+2DVM6Ass8jBljOs3/R3OncqlxLAq0Eqk9cEDcXOaUUy/M5RLUpPALSDe7OgEnnpCCJN2hka9edNm1Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7NjkJO7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7NjkJO7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDF6CC19425;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787577137;
	bh=QyXzZnJwkyxBDSEwT4XALNAbFVFz7Ox37OrO3JqwCZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p7NjkJO7FloiQgAuqKk6zV+0yL9ZWDaWqO36zQDjya1zg0eZekTpPYjkSfqavibgf
	 SON5OBnuQBIxhDJE7W+fZz7ByT4ZeIWYionNeSZM4potvBl01yx9/crETHJKapm0eR
	 0JJ6n+sflqxxVePsYb2ZlNWQ8GLkDWIF0X5vWXp1I6WlnhvBFXefJcl4Xpzg2wuWDr
	 NAucYBQNra5pa+N7qKNzIQd4SgayKQ9B5XPMD+OdUvuKNJx1/vLtNQHVtS1XBjL3Fm
	 BMACGGbYK3qrXtP0ILMc97IoRMgCKhbE4Wrnd4w0V/8OpvVPikuAqT6xyh7/wr5zjk
	 OQGuOaHJweDuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB06FC5DF94;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 15:12:01 +0200
Subject: [PATCH v2 1/3] arm64: dts: lx2160a: fix incorrect pinmux
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v2-1-0a525d5f4cd5@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787577136; l=1626;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=cZfDHWxtn03VL7NNB13yIdWVRIXNDxo1MTtXhAgv4U8=;
 b=dHSEpwxeF9dhLwKyueWq+wokOc4uqkX0QwvIMBU7Ty2dsMST7A7Rn24MKI+ZUqoIEeVH/goLx
 WKgk3gOCBUzBv9OBRjRsCCsjhAfCQGBgKygWVieLawOiMoatUKi+UHR
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


