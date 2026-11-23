Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795433147;
	b=vbyXpVyndUqkmOcr+GS4omQ8yGuCBk23xDjPbG/X+1rg1B+4YgoG25GH2Rb0iOSwqkPF
	 ZyXDh5k+O4NHnIkwy34fUFlaQvIXuMHhm39bkM594PK7mZ4kZx4kjrv78K71TJVXxfusc
	 bcYKDzTdbW1oJfd9wzXHeXcJxbvsF7+qlOeUzSCQYXPxQrnQLW+/eoKRM/KxerQDs7ppf
	 rYapnlcGh/D4+aIp0eTsCaqeyRK43ZY6d3lwhXDwP1mU047M07frCooH1qU9jQhqiqbk+
	 VlFIb0CFjsTKIO2nz8BOcVJ/3c0KtiCScfutcuIb1Kt59zi5UAi5vdA0lBVuDgmd/Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433147;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=iFZ0PWQVKiQkqOudwBnU9+K/nhj0AUrbePeCCn9dkhg=;
	b=VKv6JRQmnUeKfoS2LSgiHXbM8OZbgg4q/eASBaI4HwbHTk+fL6XIG0/hnVyC1XL9JPQR
	 9K8oDTS+wI+hAKDn0N2F4dRjJS53WkthKoQWaEEYzUJZnRHDxtsCPcKyLRLQd2mcWyPb6
	 syZyVmIo9Zvl50cNlG0OCFjGyAopfx9l+xmdJEih6rdmLwQC5xx0D7UusyodX2bGdnPdv
	 VFb7HF9cIi+gHAmhupTHd+sWYz2hYtb5il1zPeA0SenIFHR+xJ0HEvp3sshsai3fgblEa
	 y0Q8zVEB2yh5YcKuRNkj4jbV0WNzECR0//kILp84CG2NbZsjO9WB6sF6h0QDn+UXLEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JXuixt2q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97AF606A69E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 11:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D97AF606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=JXuixt2q
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id DA4782020E7;
	Mon, 23 Nov 2026 12:25:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFZ0PWQVKiQkqOudwBnU9+K/nhj0AUrbePeCCn9dkhg=;
	b=JXuixt2qSHm3stvhhzSTUJksk4b7CwsSdmp45JRp5USpu0bHDqaIJgLLX3oghBWvzFrpo+
	62nl88uFxI6e4/GgEE9A2KDaOHgsUltQr/sCDxMg/iMbTbfO1zG6FmSbwWqfYJtghkOsar
	FOyYDLJVYEyGEP+V9E55q7ggdU1U543vJuWc0x9JjBDzh+Y4tBIhEimmaPjfHjhaSj+QUM
	+l7SFB71p6V57J7nIz60uuRurdCPkMHxjkagnXiBBr9Mg6f91JHDxaIkdl4AcZ61/J3TDv
	b79f9N6iSHHbiQqQBofxA0yzA40gxEvHHNj7nuJLpKizlLvjzt7FDrHHoevSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795433142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFZ0PWQVKiQkqOudwBnU9+K/nhj0AUrbePeCCn9dkhg=;
	b=GZoL0LI6NpALD2b2fuMGKxgaC/yY65lx/ZgErUcGNHIbQIn9M8UvDnzNvl2Ir97mM9+Ztp
	TKqtxa1D04uWxT0v3gBXsve52WYZXO3mnWpYonQofKkAZQzaTMhAC9RTeHvmzyDRvOF8FN
	jXcWwShYCJ1vvKvphP+9zaUx4CyFxB7PJUObeQeisLmtxMH+DbBJEjIiULl/trL5TJ+8/V
	YRXY/Cur9zamPM5ydqXOewi69cVkx1qAUG5uX10Ggd3BdlgXnvyFLvqhBCuXyxs+VYiie6
	r8F3Amlrd1Vtwd9fNq5z6kImN+jVe2r2U57Wc1XOELkScq7/NoT1iB5losQEIw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=f.diener@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795433142; a=rsa-sha256;
	cv=none;
	b=DkbzSujDve+LbqaxGyAq6D6NqmI47r1bhQLys5tYYXzwzPPcQdIcweQijsxTHt8/E3UArv
	xpUxdEKoUuSIWCB2sDPiCfmZ55Jttg4NsnytQD6YodoOF8LAbCT9gsbSBODb2qyGUofuL9
	SjwwQFbvGOEJSHbpb1HmlWYlLjtVNXXoWuc4ciZ51Zxt43VmoefxBaP2A6yeKvq2n6WETh
	8yJsdG1fWb3m7OVIR9pFnrpRCNKE+zf+ObHTr4aamt/dT2ewyF0oPA0UqwjH+V6VP/bN7q
	i105NZcDFkwzC8NhsKe1m48HUx4wvR++qd1WG/CT3xvTAF05S4n+6JvvRhmBvA==
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.2])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <f.diener@pengutronix.de>)
	id 1xVSB4-0016XI-0y;
	Mon, 23 Nov 2026 12:25:42 +0100
From: Freimut Diener <f.diener@pengutronix.de>
Date: Mon, 23 Nov 2026 12:25:19 +0100
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Describe USB2 VBUS supply
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-imx93-frdm-fixes-v2-5-dd97c7fca4b1@pengutronix.de>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
In-Reply-To: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Freimut Diener <f.diener@pengutronix.de>
X-Mailer: b4 0.15.2

The FRDM-i.MX93 USB2 Type-A host port receives its 5 V VBUS supply
through an SGM2526 load switch. The switch's enable input is tied to
the always-on VDD_3V3 rail, keeping VBUS enabled whenever the board
is powered.

Describe the switch output as an always-on fixed regulator and
reference it from the USB2 PHY's vbus-supply property.

This provides the PHY with its actual VBUS supply instead of
falling back to a dummy regulator, which else triggers a warning:

        usb_phy_generic usbphynop2: dummy supplies not allowed for exclusive requests (id=vbus)

Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index e81b2342c50dc..bde2cab5b0c0c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -62,6 +62,14 @@ reg_pcal6524_vcc: regulator-pcal6524-vcc {
 		regulator-always-on;
 	};
 
+	reg_usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -399,6 +407,10 @@ &usbotg2 {
 	status = "okay";
 };
 
+&usbphynop2 {
+	vbus-supply = <&reg_usb2_vbus>;
+};
+
 &usdhc1 {
 	bus-width = <8>;
 	non-removable;

-- 
2.56.0

