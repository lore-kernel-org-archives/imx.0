Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645724;
	b=4/aELEQWKwfeD9IpoXMGFglpNscjgy5wxnbsnvd9SRe+RNuwQjXXdulTdlPjv4WeEv1b
	 ZXeRb0GaXoOx6VUXHAVIp3FUcy93Eebi/jda8EOXlZ8Q5/u0sxEFWmJ+gVWL65Z5miICH
	 jrlmIiY8sdKEm5DmzGCH4qHjSUgzXfUFu2ub+ZVO46/GoI8NMnZ0Xm7+ZrzupWcCm6T5D
	 FxvUSaLn6KclScj/IiV0BEdpndpT3XNvMGCnrwlSyJQt7UGVnrpj0P9nOL0mo0taMttP8
	 P694J9SXozpkKj9wr31vfPtZWy9UWpctq0I6iQ64jsUvS6U3tHoRFVHUWvvi5v/GIag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=;
	b=HVZ0ok2Zc5cUV6dxT9tCYKXWVAK5OelYikpm3vz0vYZR+lzyte/2yWYccWHWzFfTBNt/
	 P5/IF8Vza3Ppt858w/taQFoP1po22BY4tWGOTJSmOfc/vzBBiYNeKWUXu/FhGAXFjSbUx
	 w2cEGZkKndSoV7KNphEXdJaVLQjA29WK8lv5dea58/o5ncakccETaIzxjjWzR5u0lLGT0
	 dR3S0B5RX2JoCku1JVW5+DyJG5O+1LylsGWO7w7f4fCUty+xQGEhukawDb1E42WBg53yd
	 H1NLcq517d12X5rZjnNig/BPvt0qdfkBijriAFgnmXWJFyMv+1xFuERSBjjqMINr7yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EYmkPnTF;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C3606D80E
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 18:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE2C3606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EYmkPnTF
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so38294445e9.2
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 10:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645722; x=1794250522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=;
        b=EYmkPnTF3gnJ8cewGcfLRIWwgSI2DlmZXxNHAp95bnDntXfY3p662tPDvc4lO0dQ5i
         AiD1lgR1LGRNKacxy97tWYzcGxGim2pTRnQvx1c1CDF1ua2Gy/8xdQARBDOFBRhY1GDf
         Zdezj1+7jhCgzrIlVdV9/cN1Vg+i9WCjOX4E4XDnuV8Mz+yWLlzmthmrFuC13GUD91hd
         4Yh4owGDdx8knVY4N2QBfBvDL4hreChkFfRAsfJNIhrYfnTkC/wUEL/xdMGwXTYDmpzK
         Bm+NO3VRbjKM51PuKN/v1386xvSatcJ8JTBsftgzeTehuzYVqsia10MS7/O3Mae0h79i
         /Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645722; x=1794250522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcBT7ZPA2W86pDvxdZgmP1F0AEFBUNIV5Xup6eF+HXE=;
        b=zSK8roNE5JVWiA1W4Jcoew+4dYiKdlKlJXxW+hRjHPdP31kpC43WGGx8oVaiCDHBfF
         jwYDyYOD6vLPCw8uKtoF7VCwLbQur+myEthNiwr5eqws0/ItSq3jlwELeNQIye4LDVRB
         58DWmqnFoH0TknV2ZSCQXvW8rlwjN39VuBPfpw/6ERoV4URCLE9ty8Q/4rFhnDHQc6/g
         pWWlVx4QriAGEAeaq73J4Pz8XbXoZHo9o00oCg2+WVDQR7xSY/0CrU6iJRbANcyKhzut
         +0R8yIkCkB9vYhJq0YL+rk7JJZwlOvNBdpxmIkyoV72FSGmErHOKFa/zyhEpeaF7qKoH
         uyUg==
X-Forwarded-Encrypted: i=1; AKwUvBxPqdSP8/lphXrX6htYQCm3IspXeYZNvSyespmAzlbkhjdh3hAxQBA+zSo+IhJHj24C+Jw=@lists.linux.dev
X-Gm-Message-State: AFq9FYLWuPMrh6Rdpsuot42EUcfKdPG94kL+FGj8n1YFV1aNTZkSKlyh
	d6FmR/el+9Fd1tPJtZU1NFG27VNw5N4aF4h6xz5unV/0av0ojNaOtyVh
X-Gm-Gg: AYBFou2kuc2yh/B+C3iwDaMNzI6+imRLl8t3Udbm/s0kJSJ44GFhiaIND9iXHrERn1a
	Tm5rL26rsVaaSa2VnUSdPSm8tmO4l7cjaRQJkaBy9+3zvq26qaEb4avWHMzyuVXUQlelrARuxwB
	DtBpd1H+RjNLjSP4GeyLP2fTSJcY2ea1jMS55LXY0OpnPYMLOpGIjxjIdjjS9AvlIvvl5aMnYn/
	PSawVebzAzRHfomtwJbMqRFKfG0V1e/67/BUUWQA//Rf9FLrUg5f7HX0Z5ySQSo7tT+jERD7UWF
	rXbIHHFdgtyAUDpA9/k6gncKI4KUBlsWtDQQQXqpOJ3FZ6Mf6CT3OudiotTz0j3gNz42lJFkKab
	7cdMumMgyH8RhJHFqYku534ip9e/DFR7E+kbfNVlkhyKKHK5IZHXYalbzaAOJaYHP8VJdaOldZI
	5Ku/qEK+XjOrPN4fPRyUKui8zvuEhS0T6YtlVi+Y6HeifGF4U5pJOU9lxpv/PpRuuXxAEULNA66
	en7GDOTrRYkc5yfrNDwbANqsJfPSd/AgmQW1LkdI6aXVBYKYsI6mIVGVy5plp04dW5fxTBgzv20
	lpXUUxLxSv6UzkvM1ombUebv7eL5UHF3hTImL0fCgiIlWdeJNJTz7fOCX52jHrPotNDP7sEjCJj
	cTnEXP2gTlFwMHLTiJWDFnekuRlf5KEcqmJQgSnC6tmGx8MiPX4xJ8g==
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id 5b1f17b1804b1-4ac1793fb0fmr251061815e9.17.1793645721864;
        Mon, 02 Nov 2026 10:55:21 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:21 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alifer Moraes <alifer.m@variscite.com>
Subject: [PATCH v1 2/2] arm64: dts: imx93-var-som-symphony: enable UART wakeup
Date: Mon,  2 Nov 2026 19:55:04 +0100
Message-ID: <5e9ae0cbf0b98898a8020bf3d8889fe87405a3d3.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793645417.git.stefano.r@variscite.com>
References: <cover.1793645417.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the LPUART1 serial console as a wakeup source to allow it to wake
the system from suspend.

Co-developed-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..47203811abe9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -302,6 +302,7 @@ typec1_dr_sw: endpoint {
 &lpuart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	wakeup-source;
 	status = "okay";
 };
 
-- 
2.47.3

