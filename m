Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3426A4AA3F0
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367415; cv=none; b=myLZqXfzvjwBP3WAsUjbP2w7srd7dSSjTvXNIn5s6w2qUALU8wRcCEerMg/98gxhNFwBq3sxS3iwdn+fgq7U9CoilDb1julM1rMUFPvjyBkv/tzMMaRgUoFZ9FFsBkugA2+sjpSQtLZw9p/lKnA6nILrkgznWA2/AFaAdmx+VT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367415; c=relaxed/simple;
	bh=cpj++n5yEucYh17JiW67YDU5AHfejmNI3LdbjDaqbos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CIrYLrHh7xBmLfyaq2kgaOzriIQl8hTn5D7qRiMvfRnZitvtDmheyIqJ4HIIh+y5i8m8BX3TG9OJIyfoMnySFJrel+Jnsj3UEE0+lAf8P6MyucSGXwYP6l+IfXAJ5gOSbQ61JNyj4YZJuZECOkb3V5qSzyVsiTwn5VJ5TbY0UkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSVKNyts; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSVKNyts"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso9875185e9.2
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788367411; x=1788972211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIzXwSsGWdM/2DswVIkQqllThw6W06XdbG4kX5z46ho=;
        b=YSVKNytsByDNAyJsTQyGn7xsx7boHlgx5lo37JQpsWyruz1ofp21iMPoTWADlO/P5P
         gj17iMXqRcf6xICAUvDMYG8+O8R81EUHnrF2+hHhkBx50MzPotKclYE88IJt/W0PkuXq
         H9nocEz3v/DNopXWm2YybFqkkMhn1UguQ4enu3UL9uW7i3AbNnNzAC3NDyYevn6Dj3kb
         M1uwvet0e8HR306Kw4uN2usKK/C9zizmlOeFwBqKK/z0mNqheabO+xnj9CWAh8NM+TCF
         KnOE/eph09j5VZ8FmGBo0RuMAgDnomlTDrskphpI3XnyUDmVjgRn3zlPBv6vhjfJ503n
         ye5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367411; x=1788972211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIzXwSsGWdM/2DswVIkQqllThw6W06XdbG4kX5z46ho=;
        b=CEKvL2RM6781PJSldl3UPEtpUldZhleKTdUArKz8S/xUlOZ9UEYRI+B6/gJGaOipVX
         q6B+MvOEip9VoNApWpZ2GaOPDb0UjpoXMN9k7BP2KN3DKhprbI5FcSEZ3ggUQfx+5j9f
         3GlHnJxiW+/EVD2ylxE7U4zOeVEaz9heSmq4rKexyUL00SRT+sgSnAWX2CgwassUDWml
         sEReh6SPUT3Wieua87nDD0OyS8m7qg4LR2SSbZibSRKanUYMxIwOv1zR45fs1XVa8y8r
         m+rWJPUf2KIJ4ojO9xZNxo6jV6Kn44Vb9wfk0O6zFVrz+W9bgAp0BjQK4rjMrde/Wt7n
         pnNw==
X-Forwarded-Encrypted: i=1; AHgh+RqW/G/DQVW5R/a+oZSaHtcI+0h+OxRxZPctGvukYIdLeA8q8deAZDx8SjVTuSNuaopIsME=@lists.linux.dev
X-Gm-Message-State: AFuF++lYqe2vN5rnjoDGw6IDB9DHRRG4UIRUZDIuKzOUvIr84PuZbGsK
	ngziwaPazgTIFi9vTcb8afh9f7KNO0X3MqkOadkq0P7cs4XRP7egljow
X-Gm-Gg: AR+sD12ACAfibrTioInlau7KfrKBAwYjm9r+h8SSZJoLBaA0ssbIjf6sybZA8gwqh1K
	qhIdBf41SsypRqV00EchevlaaCL/ldG4VOYLEg8iKPIfRHcff0XfdxiJll+2ftnoY7wmh6AYDU2
	mVomPc+oXKjQfmjYxH1jNxlPvyHQ0GAHdz6lB0QB8sxIS6/HESsGb7wmcC+DqofK59vCbMSmE28
	pe1WPkDW8UjW8h/tX95VPxs4rwyP8aJK9gjBrG70x5oK0lkbLL619srsHg98EJSNalf9i3CxGHT
	ZMO/btOZZskGQg6Kpe9UEe6QvoVoU3fKyIgNmIlOaYC5re5+ZenXVykQb59JGTOmf1YzJbSWp6J
	la6JFfAI5rucNQ3khn0QYXhnqTkLzet7gQxYTo2JU1kx3cfVZZtFY0g3x8f35B4b/KMdQ8PufPR
	AhkTgE94+z8jHk+hAwTSi9uexbtkmVAtoHMvNJbhpcVdKRgWxIYy9yvaG5LXLVf/EHe1IV4aUFu
	CX6i7ip9Ow26nnqAC7M1oAWaUV2MDNzg6D9OQ==
X-Received: by 2002:a05:600c:c16d:b0:499:db6d:bc97 with SMTP id 5b1f17b1804b1-49ce55cb47cmr139584865e9.0.1788367410945;
        Wed, 02 Sep 2026 09:43:30 -0700 (PDT)
Received: from GLaDOS.station ([187.13.216.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dead1sm3844745e9.11.2026.09.02.09.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:43:30 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply
Date: Wed,  2 Sep 2026 18:43:17 +0200
Message-ID: <20260902164317.45925-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

LDO5 powers the USDHC2 I/O rail on DART-MX8M-PLUS.
Without a regulator consumer, the kernel disables LDO5 during late init,
which removes the SD card and causes filesystem I/O errors.

Reference LDO5 as the Sonata USDHC2 VQMMC supply, so the regulator
remains enabled while the SD interface is active.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
index 983d67a0c1de..7f78026e70ff 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
@@ -511,6 +511,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&ldo5>;
 	bus-width = <4>;
 	status = "okay";
 };
-- 
2.47.3

