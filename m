Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678185;
	b=gKrXFx8ToWvSGKC26OS3Z5Fcg216ttCn1dCCK0g+pbEgfES9CnzKqBbNtHJFm3MRhOHX
	 el1Ouw0oQ8Y1L9rf7avOjWyyyA/mNXVST/hN1ryjkMetFBxY0j9Z4z6Y/QhwOaqyVbH/x
	 XpusWT2laspTJI8ucM/7GhznFjv6KQk4WLl7Jniasi6bpA6Cb9eLg065VKM3ld9s5/kSq
	 J5o8+zjiadyDkIO47nzPV+gT5a+AE0mnN4EqWCpcOxns+LPvVSl+gv+mKgAQ/rYNUyASH
	 gbryxFpWIwcNsp3SR7iri1c3FeS9yIQMMxd4i74WepKmKh4Kdf4CoNSE8liQtwuLHIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=;
	b=C+uDgJU4fs3DrPDhKjyvVH1RO1pqWq6vo0huvNPscJBb92MXa0KrRQVWktJAAK4vO/dS
	 BZIaNOU+Q3kOL60/ScTXE1U6BdOJMKcIYif40HqlZLsZfcWv2FcFrmILzSYLKu+u9Ny/Q
	 DVzthWmnhMd837NLlQqivTcYDUc2R5xNVqJH2cvVD8he3xr8W4qe/AAB9THH/Vgja1Xg+
	 MVyy/IEhsn3+xHSxqleIcqMKSPeKzN0rzZwUr7sYJrj5sOI7LeEkXjgFYbxYK8zhAnpAZ
	 rS5m4y0M4m3Y8EsCA7RA3g4PnhO718VbfM392X6YiwqBA/ATRQYef03ap87Z2pt6tRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L9V+uoPi;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D02360A261C
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D02360A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L9V+uoPi
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b060ec084so1449596f8f.0
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678184; x=1793282984; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=;
        b=L9V+uoPiN+ZGXIh3xttQmlRoO/97hsjdDHTfDERgwxkugO4K0JvMVpP5KsDtDo7VHd
         QhkU3RPTwLh5tgB6dmeZrY03M25u1iAtaMQpQyqS+2OoHaGEuAZdKuUD2yVm0afgYu5T
         IY4Cr0YR7heISnX1jUJ7VlB3YvVXfTVoq++p2INP0otH4PB0jiK1wOHNmhE/IHz7N4dk
         pAXXTztNE7Adn03nourcP9sc/senZ1PYOv4/Cjg+htKzGFvGv+SJ/vqGu2m7sbrZCYCA
         lx4vqhKCHuD6KHJ1xfWSmfPVHdJMEYfYENYhr0l9YHnA1QTksrT1xBvECrqsw9ax5CId
         jSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678184; x=1793282984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZHUSThoPU0ne8Qirrakt2mvv8fxh4b57S/T0d1mLFU=;
        b=2x4nfTlozLpHrY/VwWjqPejGCV1S9ZP/z7bfG7M3JrwjIbx7ED4tcTTvrBL/yKVHWf
         NoFhKhMBNkgKrivFX0BKvX3WqYzvs6g2s2C5N6/lUbGJOIxopALO47Qus7KVkmGgsShs
         xjHaYzpPfoOSP/Wku6V7tgD2qKCl2UVe3N3HpQRdRiiYz9vJhDHPF2FuNDiLVQxiUASQ
         /4q/C5QEtFvwXCbjXMKvgJtLeg4CvYMvewwZosyDmAzkSDFRIXFbAqTNco5vlTXfWbHi
         hB98e+Z8lXX+Sj+rtmabIJuvyAPwqFfdkgdHdmJqJkZm2TKtnbd5tCj9AXfrNbuqgUoQ
         r3WA==
X-Gm-Message-State: AFq9FYLFogJT4bZhIGyW+HCfmjs3Jf//ZLA1ly+qT2qOHqmTOM+WrsMf
	NcxKLJ9NyNV5kyXrVk4CA8LR3ZjNehGd7VAZB+Iev+8JvRHgtnd6v8mR
X-Gm-Gg: AYBFou2SfkwPTRXsBLpF7mONvax4hr+VsJt03Yk90wfVA3Y1jPcR8uwOsKEHwUlSdnr
	Kasco0Z9PGkzNFNIahiK1Acz8U10IdY9gSxh0X1s0aEHBtCXrW5z1s+zQWIpbgFWwNnuBNUjz5j
	r9qyh+kGYekAWBrZCEkvWW8/XfolWEOZWYJjuKJpcEV8n9TArCR2GvDGXLygX4+W4+HZsbvMlIo
	6xJmsGDlCMkEMXN9uYMIV/VrvBhP81b5ROo1Hp/wGeStyClmcJmuWxlqsGBvL48fd+QuvtC9Wkv
	3r9XaRjHwktYr5LgEPEViZ1QIFQza+ZGeAHLg6dc1lU/cRSv0csHTPKI9lv9hbh2qEQyT9FSi1e
	T3R3Ee5/eDKLLefgQteuNswQs8wXXsruzLN+jw81ZoMVYLB1Pc4qP/0N6Renq8CzxpMcsCDxyFP
	bbRNuV7s/YN0dQvVGjQfCxvprK4dxT33E/bh3G5S1/cZuQUXEDKtOUltocr6AIn94mG2oe2kpUa
	BfcxFgXnOSCj5UduR/I7Ke96lNVNutmv8Y5SfpcLisTjJOpQg+Dz+9jcohPcYpy+SR/97VRDbjl
	D7MvJG3bcKtsQVKAuNoROMjM0JgQOMIrhl4E/zoCsalDHDrQV9QashDdKOMCpRUzCNiMdx8p3wl
	o
X-Received: by 2002:a05:6000:60e:b0:48e:2b82:e833 with SMTP id ffacd0b85a97d-48e2b82e8b5mr7621910f8f.21.1792678184030;
        Thu, 22 Oct 2026 07:09:44 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:43 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:36 +0200
Subject: [PATCH v2 4/5] arm64: dts: freescale: imx95-aquila: Add Cortex-M7
 UART_4 overlay
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
Message-Id: <20261022-v1-imx95-overlays-v2-4-c769d6eb54fd@toradex.com>
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

Aquila UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Aquila iMX95 Development Board device tree to provide
a ready-to-use DTB. Firmware must configure the UART and its pads for
the intended MCU application.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile          | 2 ++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f957797d90a6..12786932858a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -968,6 +968,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-osm-dev.dtb
@@ -989,6 +990,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx-tdx-uart-mcu.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx-tdx-uart-mcu.dtbo
 
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index c5f4cf0541f2..d4e8768f382c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -553,7 +553,7 @@ &lpuart1 {
 };
 
 /* Aquila UART_4 */
-&lpuart2 {
+uart_mcu: &lpuart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
 };

-- 
2.43.0

