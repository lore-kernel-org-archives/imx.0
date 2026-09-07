Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A541D7E5C
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763652; cv=none; b=aBj0cih8BLUP7Avnqz0L3zlPaLFHiQp8zf1wwc9IDgvgyS0z2q07Hct0PHnNbhW6Jp048qc33fgTU+X0XMy6oJm4jpGF7hjlAGN5sEGttuz8TfqB8OBaPETVs/kWgD9+I5HZF9KX8iSR0vdGF3N2VaHq0MKhrtPV+kx7uJ2t/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763652; c=relaxed/simple;
	bh=CBpkefT6kA0aU/ombsftRXwKkJ0HPgG1+oGWWpNYeDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+K5njQ9qAYFhHwHWxdVJX5ItUUlYzIk/npJ1qXSoHg/GtJ7haVWjFq5wUu63mUz3eSYxPwmb5f67ixsItJCEX+GT63gXl4eSUexVfCLDhpOeK+eZ/9DI+zI6A5GAuCsMGP6Gw4S9CzUshplS0pFxNx1feqvOvC5uQHTs1EP6Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJdHonou; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJdHonou"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so31431955e9.2
        for <imx@lists.linux.dev>; Sun, 06 Sep 2026 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763649; x=1789368449; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzP0LsnGrws9thQnaQ+phibnlayThrz2CWlymXMJV4Y=;
        b=KJdHonou8Bkb88cVKBK4YRI79M3t0ujWI5/TU3TSpgZPe6B4ENigSkTp6c3E8tmgMe
         L1ZGDlPwDcTpLhcS82LiZZsKh7JSyG0CA2KZ/snQtbo5R+egrRMQrmihnVGTzPtMafgX
         BHD3Bo38GP5JUSmzLanXyu5SJs/JdeLYkBsnWpp+VxDGReGVR9sbgzl692aOkAbpIiXf
         y0NMD8XWk4DtMRBZm1Yn4pWNU9gZ9Ul0A2TovSWxkZpE5oxRdmsyvwrcSZvA/8eii34Y
         fRjTRMQv2icqNUjmDDckYdwzLCH8efHY2GHB3HABUI7ofKW+qOAAzIr4ikODtroEa/SN
         K7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763649; x=1789368449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzP0LsnGrws9thQnaQ+phibnlayThrz2CWlymXMJV4Y=;
        b=pm7R0x8TcXOkkhDWd8Dkvm2ycVumff8WlA+AGiklYOnINiR/xLmX/qbpncAJ2sOkWA
         r13oOtt1MzL9LX2Alq0Jw38GKAo6rbogOiz0IWb1nE6N0hJVS3Z6txFS1/+pczMXqJ46
         EhcxXT1aUkmlKuDVZ1+8cxziZOCMecDrsW5JiFRHcGqU5eFwKUZUAjOHopoGtnliT57H
         RpDFUcn5Xxq0dosj4pzVr2gr+r0zTqSUrjOoaJYMGioQL2lD9dyxuDU8/XGcR69hUoa7
         SfXqP5n8i70TLXXHp83qEgbXh/vm0WA/EhJ8Ajh1LElX8B+UFL3G3W0Tp8Cw1W4HISPU
         8lGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkeXGnrqj3FpkNp3pdt4+s1C5JaHv1BTqdtjPsm5qz9AcavJ+PNkJIXRoufFtdvfPs9hk=@lists.linux.dev
X-Gm-Message-State: AFuF++kbOvHyJVbeEeiH+QbCqDgADymQ6qbqAebNuou8OCeMmVn4XF4H
	eecqbnYErX3qPSrWNaOawPkIE66wIbgY+yOjsLwPfGN0ZNT8nR1hOdrW
X-Gm-Gg: AYBFou2RvS+wDArdXV7EDEsrFMOKsVBR4RE005bWSrEWJW+eB9C3wWdRoB320HipFj3
	2ag0NLPmJXXxg2tpi+iEKk5sxP/nvqWX8JTA8oAQ0YEb2nRxt5hNEpWl9iql9g7MGN3fGqIa/JM
	m8XU3n+II8pGO0joauFLEc28lWIYiWVCBR06h2S6VFopK517Fb99txxWnm1cLBn8Ca839fHFUo0
	rQB0dKULBE63zg7Y96fxw+dgHoQsd6MVAmGHXIsi53sHzYAZ036NtsM0Gan9JZCUgea4nmmokqM
	tFyp1OJjfS3Zz21jHg1wkidyVd15jdv/6ibmysXj9Yb4VElD6wPOsJJwsgDDa4ZXdz5QsG8bLYa
	0Cl4hktQGIzC/yuwIR6uEWPP+3n6v7eNAoGh50CaM3i4TUD3mjuToIDRTZ52QaXETYe1sVXBlZB
	tPaQmHi62OczJeWcIixPGpi6Il9vtgsGUMXuQ3a04INlkglsftf0i/1hV2/dR7xdhs/gLh7cxFN
	lr98ejpUkwgSxfJ+X0X74BTCAP7klNE9OJhtSOKW7DDqmd8wLr+xwGmW9Bc7GtDmqtZQEwFnA6C
	Sgz9/9ZkV2CTCwyCniGd+PpNYpLZn406KTWhjQ==
X-Received: by 2002:a05:600c:34d5:b0:49c:fc6c:bdfe with SMTP id 5b1f17b1804b1-49cfc6cc085mr168152725e9.21.1788763649151;
        Sun, 06 Sep 2026 23:47:29 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:28 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 07 Sep 2026 08:47:21 +0200
Subject: [PATCH v2 2/2] arm64: dts: freescale: imx95-aquila: Add ENETC port
 2 in SGMII mode
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-add-enetc-port2-v2-2-e8f1f8b000c0@toradex.com>
References: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
In-Reply-To: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

The Aquila ETH_2 uses the ENETC port 2 as a SGMII Ethernet interface
on the Development and Clover carrier board.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: fix node order
v1: https://lore.kernel.org/all/20260903-add-enetc-port2-v1-2-2a21139d7a7c@toradex.com/
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts    | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi       |  7 +++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index fd93043314466..365bce73eddd3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -67,6 +67,15 @@ &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
@@ -227,6 +236,15 @@ &lpuart7 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila PCIE_1 */
 &pcie0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
index 3df17700b632f..7698ef44095cf 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
@@ -104,6 +104,15 @@ &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
@@ -326,6 +335,15 @@ &lpuart7 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila PCIE_1 */
 &pcie0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index 69dc962a24a1d..f930965cb341f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -16,6 +16,7 @@ aliases {
 		can3 = &flexcan4;
 		eeprom0 = &som_eeprom;
 		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port2;
 		i2c0 = &lpi2c3;
 		i2c1 = &lpi2c2;
 		i2c2 = &i3c2;
@@ -209,6 +210,12 @@ &enetc_port0 {
 	phy-mode = "rgmii-id";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0

