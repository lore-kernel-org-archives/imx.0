Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4E615E20A
	for <imx@lists.linux.dev>; Thu, 11 Apr 2024 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712852106; cv=none; b=mwWLDQhBMU9hDGE8NHE9KM0E/e/BBsC/1grdEPBJTA3WFHFYObNPIu917FZrtv5m1XIWI/1mZ+ZprQ765l3yFYs9CLcRwDvIrv/BfxgpQxeJWAj63el5DMVbRbUYRfWsWc1zBcespSyYPYVCdP4MSqJUrnzM/EtPDHL/REfYFjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712852106; c=relaxed/simple;
	bh=zFthHjjh9Aso3EVZFd6I/EjfK4r2+rzfemyi6bGp4hI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bv4MsA2amkJbw/0k50zZjWcsvZYloE+b5TUtnGkKsWQTc6zjiWONNwZnABUK+XERDHCD+XWAtrkY7z100hS4p7Btu6sPZrpb1vEI5GK9zggszHouTLFMd4x5fterOOndi8h6I7nMgKFn6Hr0tajBiu1NRL2r+7aAhUiOG6eMiPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8EcojOm; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8EcojOm"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ecf406551aso34016b3a.2
        for <imx@lists.linux.dev>; Thu, 11 Apr 2024 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712852104; x=1713456904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bHKLXIL7AGZ7PCEor3/6k+rOZmYsF608r3G1HPhZ/Ds=;
        b=e8EcojOm7eub6RBQ6VvMeo/hbT426A8QEmdkWrkG1c85/CknexWeX+AY+7htVLVoMX
         cVtkWKHH3MQi5fYuqXBCpgbg4TNEyZPWhLdvn3p6IFTxmPHTBrjrgwpjtUExSzBzZ1+c
         4/4ndtrYTCr3G61Lk9ITgPLxKxYpMyufcJyRuW4oXd2ecXEO24F2o8zcHsudfY22N6sH
         5y4779K3owvM6S4NOrqsd6i3eXfVAen1O4p5Dws7ydSRRCEYFgt7MScXcXdJcDSO6XhL
         86fBQRqxnkGOUcBD1rM83T7zar81lv+nYWxhHpu0tUH6akskvQ8aNHeRDIuSMtUQmoCI
         wixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712852104; x=1713456904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHKLXIL7AGZ7PCEor3/6k+rOZmYsF608r3G1HPhZ/Ds=;
        b=GoBTMsh9ySUKgj6rhHPbPx+R6FXe47z8kJN7xIYjumjFHQVB61RcpAAkZpJm8Axdlk
         Wju3/lzrLkFyGI1Djl7N6IKzVaSlHi4NT3aIOI5ME9UfGluTlfPxtWaVfGzqCUNlfZh8
         DYBgG0KGEbTCDRu3fcpVjT3E6LWhdFzi5bt099zBg70X17igogfp4CN20c60SvAKmiM0
         0vhXKZm0tFy50SUDC9zF7mqVhZdXfucuB7Vy8IqpzgYcjWSyTyOOBtY3/+yfBRuzryB0
         lXAow9uyFxN+L0D41v8c4sprrqf0zz6kvzekwO4F+mIEMEfMs560FlQuWcBggw5Gc+hO
         L4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu/YfsJ06cHCspTkCImTP1El4wRRHxrgjhl6WxEPj21XcqkU0DUL1td+zknliE7qnSjmsm7aAqoZhp/Q++YAvotGkJ
X-Gm-Message-State: AOJu0YwKlOHG4voE6Lg2iNvEyAvQrgsCko4VMkhoae1f820vxK9GGCMq
	i84Sm5JEpkqA3j56wxCT+d+uef2wsDO4qh6RrPFmTHNweGtS5sl6
X-Google-Smtp-Source: AGHT+IGFtEPQKiuEQiynF7E0e+oZQ/02XP6gKtgqvqBPUSFKvM58AzS0FM2xcxRBqwpZ7OTrkf1t5g==
X-Received: by 2002:a05:6a20:f3b0:b0:1a7:52f7:8a38 with SMTP id qr48-20020a056a20f3b000b001a752f78a38mr307671pzb.15.1712852104412;
        Thu, 11 Apr 2024 09:15:04 -0700 (PDT)
Received: from frhdebian.corp.toradex.com ([201.82.41.210])
        by smtp.gmail.com with ESMTPSA id t184-20020a632dc1000000b005f410b67e60sm1254185pgt.22.2024.04.11.09.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 09:15:04 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] arm64: dts: freescale: imx8m[mp]-verdin: Update audio card name
Date: Thu, 11 Apr 2024 13:14:41 -0300
Message-Id: <20240411161441.70262-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

On the Dahlia and Development carrier boards for the Verdin family
(iMX8MM and iMX8MP), WM8904 and NAU8822 codecs are used. Instead of
module-specific names, switch to more generic names based on the codec
employed on the carrier board itself.

This modification facilitates access to ALSA card names, ensuring
consistency across iMX8MP and iMX8MM, as they share the same carrier
board.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
index 1cff0b829357..45f7b8d87517 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
@@ -10,7 +10,7 @@ sound_card: sound-card {
 		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&dailink_master>;
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "imx8mm-wm8904";
+		simple-audio-card,name = "verdin-wm8904";
 		simple-audio-card,routing =
 			"Headphone Jack", "HPOUTL",
 			"Headphone Jack", "HPOUTR",
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
index 3c4b8ca125e3..1f6a37f232da 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
@@ -10,7 +10,7 @@ sound_card: sound-card {
 		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&dailink_master>;
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "imx8mm-nau8822";
+		simple-audio-card,name = "verdin-nau8822";
 		simple-audio-card,routing =
 			"Headphones", "LHP",
 			"Headphones", "RHP",
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
index 7e9e4b13b5c5..e9ef9c553a47 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
@@ -10,7 +10,7 @@ sound {
 		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&codec_dai>;
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "imx8mp-wm8904";
+		simple-audio-card,name = "verdin-wm8904";
 		simple-audio-card,routing =
 			"Headphone Jack", "HPOUTL",
 			"Headphone Jack", "HPOUTR",
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index a509b2b7fa85..65cbf905a1d9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -22,7 +22,7 @@ sound {
 		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&codec_dai>;
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "imx8mp-nau8822";
+		simple-audio-card,name = "verdin-nau8822";
 		simple-audio-card,routing =
 			"Headphones", "LHP",
 			"Headphones", "RHP",
-- 
2.39.2

