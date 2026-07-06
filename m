Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE694302E8
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330516; cv=none; b=kP8kAT5aSdQd42fbM8UgJKpwTl4ElOjo6RDyCm+E5Y4O7b8bomM/RhyU4AtlDl4gAkP86VQbSFU9dowAQZCbwK9w7PKZA0AW8rZTFH661NPws7o2siXwRSGKEDX7pFXsjtsrr4PL+BFgayB69yjI3GvfmAZL0HW9DPXQB0zzydo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330516; c=relaxed/simple;
	bh=A140vhVhwLWFIpylbXh+C5wwcDhFTvGbJ9/nsUqSi7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=INzdJUSUwXceoemIlMbdHAypg20E7ISmzDtUhA5eq9W/2mICm+B8YMtrXon941GEEzx1kltdbCCgkOCrefl4SOI3sR+NkIE+jggTAimQpF+ePS1ixa4IpwzCRXzmPGI4GEaSh3Np9/Co2e9IPaHCbrRhqvUoaV5DCz9gTFXKLEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUa21yrJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUa21yrJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so17674635e9.1
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330508; x=1783935308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWOn87f8FIIe4C+aLOBOUWqe7yflMdB9mmXK3KEpF0Y=;
        b=cUa21yrJ2yN3a6WKtCNUuAkK3h25PXzoSTx/LKvMTVcbaIC0j43ZatbvzqBOyErMex
         7Cuy0n9PciCseQ9l89VsnopbyH6qaWJxjzZNw5URV+sKO/7YCHHeWgPNBByB4tl30fZk
         G7G6/5bsJZfx2B49Dup5s2PuMZiZsoUHUiCZSn3i6W76hM5EeGN4ILBQyqzBG+stF4zo
         IrIG94MbvwwyyF9jtQ3N6gf0shnIM+f9AhclvuREGkcw1wP1QwGh3xedRsw9FwTLIDkb
         gdW2jTdIND5jt05zcXNhyS2dcztjrZPaZuR8b9U5bGh5AZU26q1SzxKBzFfe1lOgrHeJ
         5/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330508; x=1783935308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWOn87f8FIIe4C+aLOBOUWqe7yflMdB9mmXK3KEpF0Y=;
        b=CkEl2bgMiQHq2xLbh9XHyeGX2PQ8HXBOwc1DXrlCb9nt2/8dyj5zS3M7R2+10s9+5m
         Z7/onl7uvvknsuQt7F5QRd95q+5T+JBy8zt+IiqCIM1gxASl3Qy8diDeOZ4/WZO1ShG+
         y9mkFW7XaWqc6qC1Yr8AFFoRHUrYyEIveAtl99orVZhD/b9lh9VfyaLsCtc2orAQx3wG
         9Zq2SO858gQA2+FraGaKyx/FbQAw50M8ZutQMLi/RS3duU5K0kbJBLqdcQbIWtcXsM4V
         UCa5j0hw0HE5OEE3F+a4U1kDir3WgdFqeao67MPgaI6rXn19ubogCQPLobi5gfneUFQD
         4vfw==
X-Forwarded-Encrypted: i=1; AHgh+RqbFVO/kVDRLPVhe+b8XkQCH4MaZEvh0L5J4qVYorPvF/AO3EKVMsKI8NMQeaJJ1mg1z2Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzTV2u9Bi3xe/a4aLYhlgWwbeu/QM77yIq8qzIBNTRmfk2i+mx
	RFPk4lc7VU+1iiGR6kxgVrJtMfTA1gOyln/cDxoYYPTrKKivjy2zdC7hLmdC3Q==
X-Gm-Gg: AfdE7ck96abGaqabGeSQ59Ba7Dg7J8c3Bm0h70i2DGDWaZ5zyTjxRq9Q85uBLFZI0Yg
	LkJ2WabNR48FLGBlxU2bXbiJUTuiI2RvEIWPk0h4KX1Tzq/d50l26hE1HajsfxjGde8Z66bzVH+
	Tqi4kCR3UWrQXAZJwe7Ti8yZGUx/NSd9Q9Sotf1sZaNQSD1oxJwC0JIF3inAK2u/0fauQfGnASx
	4o89xALAnfJ/I9W2G1u8vvkyIZcTUTchuZTX23W85mnde/crvr8XaJ5h3w3SU1yR374bgucgImy
	zpXYeKIKUNpCZckSXtH1Bjt75TBfpnCgs/WCzYOWDE9T8sDPpJtAFdl66Z18/tlJ7SrGRNoTtHY
	GaGsyI4tOieer+IqCglSE2A+WQYGkJflJIghKLpfL2DNqeoSQVRXOWjohr3JgP29oV7xazaj9a9
	oIRsyFVoE9yFxyDi6kmzl2XAZ1C4BiVKYXSDSjT/5Zp0ss06ID+B/fCkMUydxWupriCfvqC6Qcf
	Z8YpkfXGqIqyPrn9IIe870u9A==
X-Received: by 2002:a05:600c:8b33:b0:493:c2ac:58f with SMTP id 5b1f17b1804b1-493d128b68cmr99027495e9.8.1783330508009;
        Mon, 06 Jul 2026 02:35:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 15/15] arm64: dts: imx8mn-var-som-symphony: Disable internal RTC
Date: Mon,  6 Jul 2026 11:34:45 +0200
Message-ID: <7a31f7ecc4fbe9ea009dc7c5f611105daa989c7f.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Disable the internal SNVS RTC on the Symphony carrier board and use the
external DS1337 RTC instead.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 2afb5b438b68..364127257309 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -223,6 +223,10 @@ &pwm1 {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3

