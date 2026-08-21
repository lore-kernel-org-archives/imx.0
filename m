Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89B34252A6
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324369; cv=none; b=XKmEzm8qQo3EOHsLEv5Iiyed8XHAvmACZRWl7rAtjCe82EF/gcgQ/c5JicuaFmaAbtFKdlo1v1b/+yB4BEcNyXO13fZnCqaVwMSBcjn3pQzfMsrKvuMtYR3FcgG7ZEsonayXCTh/wOEThrMqK40E1JjvH70RE3efSMBjfGySqL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324369; c=relaxed/simple;
	bh=MFMnu7MMa0CHJ6IkSia6DPQ5adij+E8bN/z5A2eXBLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V/jlMbAFvzqzYdIqZMoeM0ioH3IvE8p/inVQpj3aoRB0SxV18tCe0WG3Bim/FSyFk8SBSTCUFGP+SvZBOxnaxgQDl9rUK6paQUPPrqz6NfIb8yjF2PShAko5iOloCOMutR2fVNU4n9/L1eIo/w+HXIRdZplv5LncxkjUps47OvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eccXUQ6D; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eccXUQ6D"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so1508586a12.2
        for <imx@lists.linux.dev>; Fri, 21 Aug 2026 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787324365; x=1787929165; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmCssIUI07ufWPm/xfAJqm7bns7S+UOY74WOaOcLcEg=;
        b=eccXUQ6D1T7XV7ztpFw2Y3dXAjUs08tgLE6xQZ9r1UXfvjZmZ2bB1kXom8QfTYsXdY
         +R8qEb6FLWTMfgs5xKgKrBrQ/jSEYCJgV1Uz/AnB4uk/JEx1b1sywM9toFFAmYwwi88o
         A6YiiMvcvoKpcCaE0jT1FwZybgFvy7duABGsoNmlfPljLzbC3PO4z8OjBb8Y55PC2CZU
         x1DqMkm/7B7M6w6JbZTbXUNlNCewT6vPlGEhto0N2wVO0RcD1A1JAUp8vi8pCnBIzyZp
         qhcta0CPY4mE1E5fVxcY6WWQTYAE6/ghXdDZ1ymj55XUmUfuvm/BqBOW6NVDHZni51kW
         hKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787324365; x=1787929165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmCssIUI07ufWPm/xfAJqm7bns7S+UOY74WOaOcLcEg=;
        b=PqHo0L2N9TITulNziIEM/4ESZy6Y29qqiE12EQcp2DEmBLiG4M+ZnLnTZ7nC3sK+Vf
         0T6AoCyOMtKxbExbR6Ji1delyweWgRbVzcSL61QgrPe5jNEiG5dMZc5dOFCFSo58xZRI
         5KxKLaL2BvN6/1Ni1BTX1d99Be1s5qgxO7T8M/c/yCafalWe1g4L960MjXwrySWjaXMC
         o3XsSd4vazwTWyVuFoJo97mDJZITRJKHOA2GSbfJrlHwphLGdiFeZOckZKaqj8nTgfKh
         8aFhriOD64c5RQqc9tOt7GtczT/Cvc6XDxg/gL5yF9vcHclVuEfNee4XQOmnIDtr0ig3
         yFvg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Ur+3MhXyLiEYA1KjJ3m9Uo5A+UpG9vp0IEezRzYzR+Dh5PoclyDTMutkFUI8C1L3KB4=@lists.linux.dev
X-Gm-Message-State: AFuF++kKHRW2Yz4pHBPCtWMzw/zwVhTT9DlUmMOim/P0b0MCr51sbyFl
	cg+/+82K4SkjlIXwhuiAtPoyaMbcFJUmCepHNS8I4SHFsNZLj1A+LQAZ
X-Gm-Gg: AR+sD12CQfryuZFeD2QZRCUrP3VgWtf7aRZB2iwaHlmfyKcw7h+h/XjERzvGm//2nBP
	x3xJ9x39rg84Kh7tJppVupgwO7MJbrmgFicziOpYsfARwKTPllgFTuvmsug4+2pf4/vFCrtOkQx
	HWZGnjtckt4nhwxtvIcxAA35HStELemTaUISud/k8BbbkWysKDrQ99yLSHfSzBLxM3xIU27ZWhs
	Yama/CPY/FIXv0Fucv39EepeJDYNgTZXJk0Tj6PDpUxjbzjZVVBsbbJFlq1AN2vbKdjm8Bz9wG8
	ZkBhbJdjuVIRtYVuPU96LL5JlcRAM38ZgpcEBP701aDcicsUky0QayLTJ4sCIweCzHBOv4kyUAW
	H6JUOLUTrpPOBOF6B/p9u8CXloVBRae4yrpT4UrYc14QnCSBYa579YWMW4EoD3+ZF1jm0SV/Wnx
	Hpn4nL9S0eEpiFFY0EWYgxNY3lQULokikERFtGY8wrakxKUw/GKFW2Tp8jnSbueUFlknNvWV9Bn
	N5sjaC378os2FoORAXWg1Jx+CldsvtBlrebp9tQDCf7eUY0RhuBC7vleyiFW+AXU23T4TPBhjmR
	8l9M9zDfZlg4RxzhvdGd9x0OTp4yLEe6cw8c7A==
X-Received: by 2002:a05:6402:5406:b0:698:c13e:179a with SMTP id 4fb4d7f45d1cf-6a42f1bcdb3mr7491043a12.10.1787324364681;
        Fri, 21 Aug 2026 07:59:24 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a411971b19sm6577066a12.11.2026.08.21.07.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:59:24 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Fri, 21 Aug 2026 16:58:58 +0200
Subject: [PATCH 2/2] arm64: dts: apalis-imx8: Add USB HSIC support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-add-apalis-imx8-usbhsic-v1-2-fb93d73ead44@toradex.com>
References: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
In-Reply-To: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

Enable the USB HSIC host path on Apalis iMX8 modules.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi      |  6 +++++-
 .../arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |  6 +++++-
 .../arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |  6 +++++-
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi      | 16 +++++++++++++++-
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
index 6f5af37ba9af9..1d4e92f674f87 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
@@ -133,7 +133,11 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	vbus-supply = <&reg_usb_host_vbus>;
+	status = "okay";
+};
 
 /* Apalis USBO1 */
 &usbotg1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index 93f485140b20c..68fb2eb8c7e67 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -222,7 +222,11 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	vbus-supply = <&reg_usb_host_vbus>;
+	status = "okay";
+};
 
 /* Apalis USBO1 */
 &usbotg1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 5c86bcee55fb7..baf09624fb27c 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -271,7 +271,11 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	vbus-supply = <&reg_usb_host_vbus>;
+	status = "okay";
+};
 
 /* Apalis USBO1 */
 &usbotg1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 681f24810d52e..64604f91d5673 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -870,7 +870,21 @@ &spdif0 {
 	status = "okay";
 };
 
-/* TODO: Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+/* Apalis USBH2, Apalis USBH3 and on-module Wi-Fi via on-module HSIC Hub */
+&usbh1 {
+	pinctrl-names = "idle", "active";
+	pinctrl-0 = <&pinctrl_usb_hsic_idle>;
+	pinctrl-1 = <&pinctrl_usb_hsic_active>;
+	adp-disable;
+	disable-over-current;
+	hnp-disable;
+	srp-disable;
+	status = "disabled";
+};
+
+&usbphynop2 {
+	status = "okay";
+};
 
 /* Apalis USBH4 */
 &usb3_phy {

-- 
2.43.0

