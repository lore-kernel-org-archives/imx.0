Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188114;
	b=fM8vH2vptJhPGBShI6aqxcOG2KJ0O2jdo2NTqsj9Xr0JmCaVF1F7yaTK8Cgmc7qsxYgv
	 sVInNtSEMAAsIUb7Nd8Mjjm5s7R8BZ+mC9/0CpZxN6oqA589PcDGPn8lHNPjmtlXGS4Zx
	 OxICHAkHQSYBcHVKe8evtjZ3AvmGQOQB83krj1MYoS+5AK8h+fjF6SBvP/vf14/6ofrBv
	 a5pqlyWm9VGrMOc0Q5pG02uwso4PQjHPv+8qYoWAkIjIyLYsf3BahQd0ILahX+xcJjj6/
	 z65g2oRDGDS0/5NcBdWP8EqgIB1JUaxH9mm3vdvk48o24mC1Hsk8SkfNQtRD5x0efqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ab9Yfbpo3hn/cTagJWdL75RTonupVvPPfl6ZCeCMP0M=;
	b=B24dvYnAyFb1Q1OrxEWup+7FCE3+bwZYk3n9F89vS/rzAnxeH2UcKdbCE8AZhjQ4AlZ/
	 jG+NRSbkpxwMm7Kz4tPuiTKPUao3SaWqRmoV1H9JA8mlkoAbZXUEV5PZmslY0LGDGQOJ+
	 GNSelSJMIPYvUBHzIklz3XtuQ/CwZuc2Wx0N+K2/Xnjp0O4Kw5dj7095Dncvz5Qj9xg30
	 MkvtfuCFW2Oo7VRWtcnfcCUmtrH09EOnzJp+ez+ccLfdweszGSOSV6yAsfnbYfVrwZ3Cc
	 /e19CKrFlxn5JyYv7YEjdyW5QRLicWE6okaWwTGM57mxQm1o1NaOkI5j7EB9sFfOhPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Jm5DMN1a;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67094606A325
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 15:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67094606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Jm5DMN1a
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so9331545e9.2
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 07:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795188112; x=1795792912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ab9Yfbpo3hn/cTagJWdL75RTonupVvPPfl6ZCeCMP0M=;
        b=Jm5DMN1a8dDyb7AW2GkGrq/Ag7THLzLHPDwYQyEFx8UDeiMOOZHL9xT7jQZ87e1PEl
         ygFWXSBQ3D1uIVd1f/UFy6pCpjuRH3f3+ltH/4LghnIaAkxkBxB3NnWT0oSjNveEaOek
         pNAJo26dVhzFp/MsNG4cG4/P1i3g07cHQHlq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188112; x=1795792912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ab9Yfbpo3hn/cTagJWdL75RTonupVvPPfl6ZCeCMP0M=;
        b=ypCRUsjbTEFfvBZZo3KPShtqfxClaaYghk9Fot06bl5h/9plShQ/En0UiKfegdXm9j
         Fo8z7MJxfTEwGSGhpZ4P+HEge1xldboK0owD1WgYuPa0dbB8kAtmadpptV3DJ0fbtter
         O49brPwNfpI08xm5ys++Ed+5OuO6c92aX5pYok3v7ds1lE2gnht+hbvG8AlufkAx1l7K
         +IsgoyXGSmYBaRhLkpiLidQhZGSsBV1nFr8ZwI1iysd4L1Lyzjq5PNqHIo/Q0aGncnSp
         jC05WCjW08rEUUGqzTHD6vkpyNW7WHw94+sxd/ZT+IxfXfh+uzMnZhcqi7PFr8fFJazR
         kfSg==
X-Forwarded-Encrypted: i=1; AL+hErEcWd6LD5CwxPp1fXjbi5pnkruj6UlKRKgrmey1Q2+rTNLNgW9tl2UF35AIHtQZ7lSvJZc=@lists.linux.dev
X-Gm-Message-State: APuU4Z847VDJddvogvd9BB7gk5LkTQhkITfpSYWhCbCfQSZ9SlWWZURX
	Wkrtw4WHo2WSQOg4cFK810m42dwh+MPVT0Q1U8efXqlttjWD0yU+J8KCUuU9Di0bwk8=
X-Gm-Gg: AYBFou0guj6jlc/3os3HmwrWTA/3nF/3w/VSV4hm3tgTDbPCWIIgn9bGIZfbmrutX1z
	YNxofFiKW3r8LA47MXQhpp0XPc03qyySLign5IHGLjPOX6omUWl+5JgOg7x/hYwJTKoQTp1Uarz
	XqO02DpczTo5rEJzrilHnrSVz0+VXxjaHRdAdcE1LPgAFffR7dtcHxc6nHb+/uZHh1KhMsiC0l8
	B5eSL/BrOYXpUD1HPDEEivfLInw5a7FWMrsdIe4KgUqPmQ1kGqyc0+OaCifnebuvGJ2lCKsPPHJ
	CFUAfS6qnWMtkm7Wp/f1jIxYfH3OH6dJunTSTKvEESlRtuseu7kGmY7ZPaBfMEU01VAB0IGfSov
	edvIn4qDUW/EjMgGfrB+kPoI/Way3zNp7vav34inSHB4VA5yYfCQMGWkAuG4geB+sd18bel10xV
	sEYQRK5unM9eiQcVc4uP8DvHqx3SQpb14+/s1cHAx1XHIdmR/E7w6OHhOFzDbQndOR7Vi4dFK9D
	Q+EDWp3DYpGuQBWKtZxHYKloKXgkOa3tL3yxvdeX8El8u48CKFdO/u9aAYJws98OPPFrf5qqY14
	n9QSkf3bE9/YlrwGIrN+LHtdQ50F2Wlthe5d9KelT+p7FTZm1vZAulCVqZh43J1AGA53nUDyGy4
	1TnJ09AK25NPOyBneq3NkhUGHqsyUladjOKOHO6JjS5BCjizjvg==
X-Received: by 2002:a05:600c:5307:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb888283d8mr74634395e9.17.1795188111672;
        Fri, 20 Nov 2026 07:21:51 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm140812535e9.3.2026.11.20.07.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:21:50 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: imx6ulz-bsh-smm-m2: add boot phase properties
Date: Fri, 20 Nov 2026 16:21:36 +0100
Message-ID: <20261120152146.1774885-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add boot phase properties to the resources needed during the boot
process.

The BSH SMM M2 needs UART and NAND access.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 2d9f495660c9..c74003ee9efc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -26,6 +26,7 @@ &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-on-flash-bbt;
+	bootph-all;
 	status = "okay";
 };
 
@@ -55,6 +56,7 @@ bluetooth {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -135,6 +137,7 @@ pinctrl_uart4: uart4grp {
 			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
+		bootph-all;
 	};
 
 	pinctrl_wlan: wlangrp {
---
base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
branch: imx6ulz-bsh-smm-m2-bootph

-- 
2.43.0

