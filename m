Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678182;
	b=IS/021oh1okXxAOgB1MOq+rOX7kBiqSDhojZciXpHpWtr7di2nq+WUFW1umcl3hcTFz4
	 1rjKE6fQ5AMd0n6rOmlUUZ74LR+ABJgBFepOu/NeCypz0rXpX7A2bfSN/OCBRsBHAsXL6
	 9WdMIZd41+Zjz+d6QTzHEBcjb+nd9bFCpzeK4tl8I9ogeAka31bWvYULHER9WznPY0mkw
	 c9O4OCmIPxVbvmqjLaFLm/AgrK2TRNrdaxU0eAayX7+aKt1e/m0GJvVHMshfkcwxqzvYV
	 XH34CyJHae9HNW1SBqIO8XyfbrQzZX+QKfUbTgODY5spGMAtVudOflCw7kDDlmfT73Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=;
	b=s3rJe149nTfF1C1QAok508DCzsNLwAE868pskQxyzCgyEoBTvmYhfgqn+JfmFwtRshIS
	 BD+XJZxUhevjjXSoHny/tz0OaDXEiv+FJ2wxRs9/44xO1iq2hcw8xPRjaaG2//UbtooHI
	 lAPQvzieoe3MtAnWIC1DzyrBu2pMcvPQuMkAo9EhmXvzea+3qHdF0qxfbYs1l2kUFPKW1
	 JIv1YVXuryfC2WWQvb4eqUvFoWUUR5tjjItDwJqymOfoZsV+NyB9ZnMhWe8nUJ90nWQQy
	 T/5WLRXWqoJakR1XDqU+Xru6tXsajMbWAQuDTe/tytzGTKbD2wTF9LiPEfMurR1xv4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="OFu/PA7G";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C976D606A338
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C976D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OFu/PA7G
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e0d885929so1480262f8f.3
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678180; x=1793282980; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=;
        b=OFu/PA7GGNK52o+5mO/uc6qMBX8/zB6CZv8TirxfK+uK6CegUqRDuA9OJ4ZbrGD4q/
         4wt5BSdJXpPiUwIGmWeF0LIO5fM6GS5moxHKSjhCoE+19QaaxY0O5OlEIDb8MvnUfMWl
         cKF1O3zuELL2eD7nSS0gzYwt1JMsAPqxUwRNBgROG3WAIjkLveWoAg2L7JVF6228hx27
         fAlrrRQfd53HEc96W5J+Ru+GW0Zve+L7gnD20IVxrzZty69hFmOWgN2SUR5qdytCjJs1
         vEwKsJD/urZ8+eMmA2ulLJD3RULjxOpChFzLkmi0gMU/RqRw+3w11g+um8L2H7p4u0A1
         CZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678180; x=1793282980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxR1vV0a0gQBYDHK6NtA7PO5bZkmmtV5vXJv9zlPOvU=;
        b=tlMPB+gSOUbiNK20H9F38/mfMaqDPFJi8+lhGwrqcdSoveD/CnlgUmfXuPWaTejcKf
         /Si0NEEX2x73vum1hjphMaamcqogUZiSNBJaj6JS1IrkbqXsJDCtlOfj9tWYJwMoK6Ak
         i40B4MFK1FWG+VAnsUsF/h/aCBLUcbyCyCO0GLHpuPvRkGQqHRSdRqmcR3SsWRHzm/c+
         TKsvmUZQdnhnTewJCzOjG1NJJ55VzCDtUGW0nvSbk6kdkZ8YhDTKGT4iGJf/xE8CJKs2
         /P5DMq03O2mJRJ01eTPZy72+SxXD0CPbTWh1fi8e5Mtle34QdT5fR2OTzrlijMRsOhPD
         ky+A==
X-Gm-Message-State: AFq9FYImEPBRMAXzPRPMJoAQGjD91lG+mzu/2MnOPWTVmNDa36TgY7YQ
	cKIgtBYKFoZgI1byzHoUU3ssVKdTPYLc48EyKyojVOqCZP5l787kE4AL
X-Gm-Gg: AYBFou0FZxg0Qsq35RaJd+w6cwrViX40JfKst+Z4yz6ol2q/SGFVyDYbZlU8gYkbIQ0
	2Za8SNsxTuAnScbpEbu/ZEb5KZBqmxngJAOrgCL6PiVl/4F231cl/+Rx61fj9MPJ4ky9BFRvn/e
	6vyAAs35TmEOxguJV6gjPikxCiYRqLv/y6rzoR0G29Whs2h0FjYsVh/jztRL/OGIpgNMkFKMXuI
	NL+Zyp+FgqiuC/cug8Xjgi7j5SXZ1EoWI7eJ1UcNY83nR7nkr2KLhIYYv6/JumcjMmzs21cy7UD
	ruFy/jy8ONOAenttWhC3Obp2xLhMfjnU8x20RgytWVyY23td0J+/wseie0IwiDexUVh/BCP06Xf
	EOU6vUoSMP2GRSWXh8OoX0B9NHrh6rYyn8sRRYDfaKe6GBIb2GclmaqUlqKKRR6bpfGSwwgZy7o
	zL8ts8mmwprbFOjILNaLda/GYpc+D3qAaGoa+DZb07+6u5D5Gr47LKbPTXqyzBLjMsBoJxn/arP
	u5b9XJACd/34T7poavHmSjqwvyKu/zOit6Dm/n7ZPJIlZjw+usEeQU4wLCwhDvi5Icwdm87Q+LP
	NEGGEnrqx3s6O3jhvex4gASz41fRlHf/QgutmYyuERfyK+/ZnIhveiw=
X-Received: by 2002:a05:6000:26c9:b0:48e:1299:663f with SMTP id ffacd0b85a97d-48e264f1802mr11901050f8f.56.1792678180098;
        Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:39 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:33 +0200
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mm-verdin: Share the
 UART_4 MCU overlay
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
Message-Id: <20261022-v1-imx95-overlays-v2-1-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 is the UART the module assigns to the Cortex-M4F core.
Other Toradex modules also assign one UART to their Cortex-M core, such
as Verdin and Aquila UART_4 and SMARC SER0 on i.MX95, but on a different
UART instance, so an overlay naming the instance cannot be shared.

Label the UART uart_mcu in the module device tree and turn the Verdin
iMX8M Mini overlay into imx-tdx-uart-mcu.dtso, which reserves the
labelled UART. The combined Verdin iMX8M Mini DTB keeps its name.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  5 +++--
 arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso        | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso | 14 --------------
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi           |  2 +-
 4 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..a40bcbe4876d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -107,6 +107,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-11-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-8-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-7-x.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx-tdx-uart-mcu.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris-v2.dtb
@@ -268,7 +270,6 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
@@ -298,7 +299,7 @@ imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
-imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
+imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso
new file mode 100644
index 000000000000..001bc3286e8e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-tdx-uart-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Reserve the UART that the module assigns to its Cortex-M core, labelled
+ * uart_mcu in the module device tree, so that Linux does not claim it.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart_mcu {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
deleted file mode 100644
index 8dbecffe9e7b..000000000000
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
-/*
- * Copyright (c) Toradex
- *
- * Verdin iMX8M Mini UART_4 for Cortex-M4F
- */
-
-/dts-v1/;
-/plugin/;
-
-/* Verdin UART_4 */
-&uart4 {
-	status = "reserved";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 4f64c5da8d15..1ac9d000d415 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -776,7 +776,7 @@ &uart3 {
  * Verdin UART_4
  * Resource allocated to M4 by default, must not be accessed from Cortex-A35 or you get an OOPS
  */
-&uart4 {
+uart_mcu: &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
 };

-- 
2.43.0

