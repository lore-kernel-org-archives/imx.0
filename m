Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EBC331EB9;
	Sun, 23 Aug 2026 22:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787523906; cv=none; b=V1FSebyRDfiF9Kb1SZFCSH+W+LdLNUQMMgIUj8Q2oFx3r8HsYpzglL9L0HYhqbuVa0lx35P+HotfbtrRHeebUMe7nxYw8ZnwiFPWrFJrRBOooDr2docYy3JKmYrGsNUEkqST7fEpHU2Rx00w2BDMEBL5s2Ok+u45OGhT+kEwo6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787523906; c=relaxed/simple;
	bh=cq1hYsxSF8q8kGHGEdS0KX9Ra636QhedZrafPgp9MF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TYWhmR6V1i7K8EQtkedRnTCmHqK4Kwz9ThnDzPt2N/4dcDJqkD4tir2YnPzdf4qV1VvHf1tiXFLONSC5XuhQuaEyOTPQ2mLXtSn8hM1r9DUZZiAZ4isBdb8t5Zpml89F9Z6faM1hVNJNvusD6YanvpNAfJ3R+0N8mqHLVH1YQbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1e+R70k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1e+R70k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 668A1C2BCB8;
	Sun, 23 Aug 2026 22:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787523905;
	bh=cq1hYsxSF8q8kGHGEdS0KX9Ra636QhedZrafPgp9MF4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=G1e+R70kZaq6JfUd4XQR/TVBzuSQmU8TWfyq9UiSZxswyqovfTUoT8A07B4+ZBRKj
	 P0LUxLvrOa+6eJ8CO2b+4EbiaL5eWXAi71gwbZu/f0Hw+GM7nLw1GJvwlxIFJcaBxZ
	 P+9cniXYPA54HeqKB0UvYbOXOfcQQh/XlhoG6C6CPUQ6AxHEh8j3oJiyTidyYOeTRP
	 TiUnXGvlHOcXRS6JMHoHJ9AwYDmvRzykxyPORZGYOpUzZdJsJKshZLS5yj8VJXauOK
	 H9CDqeB3C4buXwkqScazqn4yC3HLOUGwbdPBdL9qVW+IliMflzw5c0spJwAtMzxQM1
	 w0HdMBlVpZwzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E72EC5DF97;
	Sun, 23 Aug 2026 22:25:05 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 00:24:56 +0200
Subject: [PATCH] arm64: dts: lx2160a: fix incorrect pinmux
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v1-1-33a3c8d5ea8a@free.fr>
X-B4-Tracking: v=1; b=H4sIADdzi2oC/x2NQQqDMBAAvyJ7diEubdB+pXiIZm0XNIaNkYD49
 4YeZw4zFyRW4QSv5gLlU5LsoULXNjB/Xfgwiq8MZMianh647Io5pkPZbbgW6qxxGCVsueAiBa0
 3A/c0+ec8Qa1E5ar/h/d43z/EZGZkcQAAAA==
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Josua Mayer <josua@solid-run.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787523904; l=1744;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=v7b3i0icYOPqdG+BqtL6lYNtCLmPe90OESWp1UB4moI=;
 b=ezvxDYGXs6w7Ps/jMEObsLtPsg3EUttJ5frsgrfiS1kdS3jut+ZHF5FBxc6FpWlv0zBsho0Pc
 UYsr1nbTKn0DQLloefJC+hR9tYSMkslaNs5TIRd93+OqdiSsPlxadad
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
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 1d73abffa6b7..b9f079c49e19 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1803,7 +1803,7 @@ fspi_data74_pins: xspi1-data74-pins {
 			};
 
 			gpio1_31_28_pins: xspi1-data74-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 15)>;
+				pinctrl-single,bits = <0x0 (0x1 << 15) (0x7 << 15)>;
 			};
 
 			fspi_data30_pins: xspi1-data30-pins {
@@ -1811,7 +1811,7 @@ fspi_data30_pins: xspi1-data30-pins {
 			};
 
 			gpio1_27_24_pins: xspi1-data30-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 18)>;
+				pinctrl-single,bits = <0x0 (0x1 << 18) (0x7 << 18)>;
 			};
 
 			fspi_dqs_sck_cs10_pins: xspi1-base-pins {
@@ -1819,7 +1819,7 @@ fspi_dqs_sck_cs10_pins: xspi1-base-pins {
 			};
 
 			gpio1_23_20_pins: xspi1-base-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 21)>;
+				pinctrl-single,bits = <0x0 (0x1 << 21) (0x7 << 21)>;
 			};
 
 			esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {

---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260824-for-upstream-lx2160a-pinmux-fix-6d09e82bd5cb

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>


