Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678188;
	b=YMUYkB8wZVC82pWtGWiIXmU0o/jG8kD8eCaTLTjlyoxxjF05MyEzOfR1zS0Kw+qeShE2
	 b2uuh/LvrQdzxMDUOaW2cUClIGxwueAqn93xEBhsAvyVmMyR4AkRkjGc2m4KmE/J4lg6j
	 W2pNdwxzxmDxFHIOawHwBnywCmPJo9Jy9OXxcPdZno5RvJ6NlCRL6IBnMcQ0ztLD6wHir
	 OhKeCsvS61oQ/k9BlUU5UCfEXENvWdGzwtUppHQL1jHiT9eVwxxv2HT2HqLTsNI9Uyzbz
	 iwwdz+5C5G4Bb3fkIfzGNrX230cijlO42kSoNZgFxsN3/Y6bvlBDxEDwrCZD4AHvdYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=;
	b=f5V66BDC1M7K3DgAGZ7JJJM8P4v1gEQjb/I04niAhTAAeAyK+WS3jrtsdH1kg59ZeI6O
	 8PVH9TaZHh0uS/8T4TdquWVI5sz6wAqw18XGfOSHR4z94YR6VIipNe6YQn0lulqYMc8ys
	 4pmtNsCmvxyzJ21gL+6K2mN45kyvy3QMVFXzNqoKuZd55/z44MNaZJkdw+/OuKFu/lOEH
	 4RpwIfK6a2q8aGABGNH4I6Oo8YMJHPofBlbS9HFbal1rIZlrmo74IOjYpnQeAEVTRMtcK
	 2/hb1Zd1AXOxhN+pK7PbWoBepkhiGyEBccQcp8eIlbjgTIatbambYVOYNf/Y+avq1CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CWtJeSL3;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7153860A263B
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7153860A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CWtJeSL3
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1228384f8f.2
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678186; x=1793282986; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=;
        b=CWtJeSL3bi8KgAA2MGO0z9qiZvr1qsWADdGqPCD0YxcH18F/Qr1j2fHK3+5e/RCR8E
         LPpF6oC677atZalr0+jAWcJqBDy8QhiTWdFl6Opvj52mzhjwHrdvc5b93aV8ySz/ut2q
         ajXWCyGs6Iqr49OO70DrhFK0BEu+K2hwoCQyIbRBtRFjlmv3GCkPMksb73Bb6y1l5vAr
         Upw+DDRw1kn3HuHHuEUztQOZSvpZ0zThL54PD+3lt/VxNlJCH/bCWbpnqpzZcIjOE+xu
         7o8pTbj0HgsGTEUqlVPe9a0xoPEGFc2WyVAa73jVb2uaHeHKc/c+VUyZFHwYpoejBGi4
         t5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678186; x=1793282986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+j0RfWA0Q1IHyR7Tx9qo6ls3aMcfhBj57nHBiaWQZc=;
        b=dEM95SlrR1Vkj6df7uIPPSAH2CKccUnWlUKzronD7qLqgWOa/JYb6R5zglfID93TSv
         lwo0jquj2zFuSVkFzXfzcRkf5qxxHGg9ZwgVrN8ngDMaONDPppVGuSfkXyun8y56B+Mc
         rASkMgM8FBG+vnbqZc57rihprnNaJcZSefwem5f+WRUTvs2BRwRDH23Ald8o10wD2jWa
         kDsqdW4FUotX7E+UcS1YeK3Kh9wqvik9gNNfzd1LJ7cDIDw3I9k8AhRZ4I6rL0pS91IX
         0ckjFr7Qf9/Xk8b3aVlflCljIm1BOa7CfwKPHx90QUVyxxLmLv3LASRhAMpY0B2YZoYm
         znPA==
X-Gm-Message-State: AFq9FYIRqBsI4Gf6fRubf7JXN9MSsW0uu3DmBmvCUxHkkhHNv0UVEhI6
	6VL7yX9Wl4kRsLuUXMBkiU2slT0D9UK8h0AbLjIrY7CwwLjVska7TmaF
X-Gm-Gg: AYBFou3Rrz0XUt9HqgszC4lqKYlVomYORw6v8wu8899+mYMVLcyHcH/O9OqtV11RS/v
	7n91VXZEQWurT1kJoajTJcRnMpYSsnC2UfbnsrhGevsV+OrvV4Q8LPOzpvKquPxiVrM7csq/oN6
	y03aRuAtXdQMnCSHxxYf0yW+pMJy77ewOg1ZX5UETXCRVfxbKnl2SJDljt+4XmpWjwF4l0UknuP
	RWBSU0G3pXRXjQ3UWG8kym38eEpSt+GUMAGwcpc8TVBFCicOW57IcJl56DGOtnQapTe7gEglAQD
	ifRGRi2b/QhsvJrSeXxvD9AdJOuv57Gr7V6rjAugjQbkv0/8oMmRfDjW6joKXT/tJh1bWzAlAo3
	fj78eTZrkHDgkm5iCrMMPXJWDeMeubwf/EvC6tMuGasc3LkFmLyhxxBQ5G7S2ggC37B8S3zK3Kh
	8HaPZAUlVbFVdrHLmVMI+HsJeiWsj2dT3MoFou5b/4LS2wMkKROS2q05b4WwJSFGnCWpZSUpaV6
	t5h4xxyXsxT5lHhwxAvU+uZcBwf7AaKSyCaMbR7E18G7WjVbKpiIgtuC3LXN5iGAPeHXfHOjILB
	NUVwYb1MmkzClhdLR0Ho3CmxPuStplYy2Vjsc9cJ2ucjvuRuqqYaDSXWX6mKvXklaXvt6Tu5Lle
	o
X-Received: by 2002:a5d:5e88:0:b0:48e:f14:61bd with SMTP id ffacd0b85a97d-48e2649d869mr10539606f8f.14.1792678185088;
        Thu, 22 Oct 2026 07:09:45 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:37 +0200
Subject: [PATCH v2 5/5] arm64: dts: freescale: imx95-toradex-smarc: Add
 Cortex-M7 SER0 overlay
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
Message-Id: <20261022-v1-imx95-overlays-v2-5-c769d6eb54fd@toradex.com>
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

SMARC SER0 can be assigned to Cortex-M7 firmware. Label it uart_mcu so
the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Toradex SMARC iMX95 Development Board device tree to
provide a ready-to-use DTB. On the Development Board this removes the
Linux RS485 port on SER0, while the console on SER1 (LPUART1) remains
available. Firmware must configure the UART and its pads for the
intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 | 2 ++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 12786932858a..68db39369e45 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -972,6 +972,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev-ser0-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
@@ -991,6 +992,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx-tdx-uart-mcu.dtbo
+imx95-toradex-smarc-dev-ser0-mcu-dtbs := imx95-toradex-smarc-dev.dtb imx-tdx-uart-mcu.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 641573c9943e..f3504b40ebb2 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -619,7 +619,7 @@ &lpuart1 {
 };
 
 /* SMARC SER0 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 	uart-has-rtscts;

-- 
2.43.0

