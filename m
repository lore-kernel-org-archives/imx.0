Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A61B2D5940
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 15:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921218; cv=none; b=d6RKCN59w16EV4OIjgop+mRin/4Xc9nm+6WdEX5t9M10yX2CbsQlep6d4A54RentWn31V4yiDTVgfXkvo+gWULVn0TG1zGGbKZxNz4BjEBjISrWHjqfrDAgy3kVibhCzX2JKSz7eSU+Iz/0kutFgnIaohwblPcXHfu7Uk5UPqh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921218; c=relaxed/simple;
	bh=gHoW9k3dTGKJFXX0o0/bJ6XuuZ6pUUQjAI5TE+D+E2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gRDKKae18XrPI4l+mno7DL/Bi5ifBHI9SGOEOqOkr398LxFqYF/Gd0/Vw2aqkWhg+gltsteFIHYzAHRmNLfG81DTPeiNUdcczqB5/tNK9XmF9PSykQ+2Je0pBQRVqq/GCRMFYs/gOq/RYyxZtkL1ZPofaYQcgKM04UDaU/4sjPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6kZaCCB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6kZaCCB"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4758bd3731bso686627f8f.0
        for <imx@lists.linux.dev>; Wed, 01 Jul 2026 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782921216; x=1783526016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ci+x4l7rGyX9PL16Opy1ybmCZaX0NHOsnDWtrHzkaw=;
        b=C6kZaCCB2jPJmKkKaO7cIyqMjb900FqF5Nfmqfo/Np2QlnGmDo4kHzB3OhkU9vsQmY
         5+bMoT2OcpDwnOTI7OFLwydoVXeZ1NdjTlE+txvGPPZHCWDHLE6V6EV57s9FSKWLCw0c
         iyQUmUdZpwMSOylSItGmYmVWjP7D4akaIPhSqdhNtJRCxzmX79ZUq593xS5aRwzO4OaL
         5lKi8Yi4WWKKEe2jvtZU373DJ8rdFPML9LDiB+gm+Dtqy7dGz+9dL2VDpAIHq4T+PLoy
         +yok+ado2zezn3ZiuvzKF+/qk21zSY51ahvpbGF6+J6nAiIQ7+zvcHdoCzyNMsPRy/dC
         WoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921216; x=1783526016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ci+x4l7rGyX9PL16Opy1ybmCZaX0NHOsnDWtrHzkaw=;
        b=n1s3ai9pJmOXnhy3dPZR28Sz9EfwlMPrkwaHr/2foLIJS6FjKRP+n/LJKgwXM2e9Bv
         nU8pEMk3niqXhn89Q54kMf3MxNEl2e6Wa9QNv5W/4Bh5CnQOmQs2qmobD7h3LbN2nkMC
         ZHzh7kPmjYRmzQH7BIIMLK+e0ogw6lcMf2xhjPErAKT2Q4q5O0eCFlH4MzV/CsWK86EG
         87rE1uEwlh23/bHY4wppqOhyyflhoFI+qzJT1lyjkth/R7k/4JiAT7Ho8ogFwy9Ga3JB
         vdBOP7XhWr42F5QzH0f30exvLZc6Y7LsdOv9RKI395fa+/ubEMDzBFt3KRNdyoLgWxU8
         GesA==
X-Forwarded-Encrypted: i=1; AHgh+Rru3Y1WNre4k6BaFTTNMvS7ix1PFcWMYNJ3Gst3EiFHlk5jR3EGrKVYZ+MBLKr7WnTr3ZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YySviHLFaKhUNZ2EAhUyvAgUN/L0DjGZTPI9Mgma1IuRHVYxlA4
	t67wTqbVg3FJi0TljqTv1bRo/Dsn7WcIVc05ASUs8Ew/rRDgL2yE0688
X-Gm-Gg: AfdE7cmRCNcKNw+yAJYneyV/fvqOnlBeJnWvIL42eO/UDFlQe6yldpxvfmnCWXp7KNo
	qDE31ATPh+TJp4jjQJD88pQw8XggiEElN1twQMx8eznXyx+dd+vacG/o0mlnlRnqboT/kaOIcEk
	HkkPm6wZG+vidWGx7IeR1r4BEOA9+TZrWE5ljmp2/7t+k8nKvbSyDzgGCB9NKaBZSxswhtACiUS
	5YZ9drgxccUntA2/UnZFK1dV4V4t+YyBRrAxzM2G5bJFpZE1/3b/24jH/Aojgbpsp9Po3ld9E9o
	NGPOQ2c9SZg7BPfPmhpb/ldjjOz29wAd873Wexc0i5OBvSZ0KXZjwE0B8hdAp23xFt2GyD8lIoy
	Bv7osnKew23Qs5H2bZ4ImrDNqk+vwXEpcY5jGHhRvGOLaDfbWj7Oln06qnGs0Fj++S7iHglU+yc
	jECxqUMWcq8i/0tsMqaYf+JPMRHJ4ocWnafsn1l18T6AJk+Hhql7kBHPRyYIx9/VdrQw7/pAddJ
	dL02GY70AHLVlwFHiQzHvrj7w==
X-Received: by 2002:a05:6000:61e:b0:473:1e79:87e6 with SMTP id ffacd0b85a97d-477437a9a5fmr3750786f8f.3.1782921215516;
        Wed, 01 Jul 2026 08:53:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3db964sm803715f8f.8.2026.07.01.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 08:53:35 -0700 (PDT)
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
	Alexander Herfurtner <alexander.h@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart: wm8904: Add INL1 as DMICDAT1
Date: Wed,  1 Jul 2026 17:53:08 +0200
Message-ID: <20260701155308.40612-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

On the DART-MX95 platform, INL1/DMICDAT1 is used as the DMIC data line.

Add the wlf,in1l-as-dmicdat1 property to reflect this configuration.
This enables the internal MUX to switch between the ADC and DMIC as the
capture input.

Co-developed-by: Alexander Herfurtner <alexander.h@variscite.com>
Signed-off-by: Alexander Herfurtner <alexander.h@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index a20fadacaa6d..d43270a1d907 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -158,6 +158,8 @@ wm8904: audio-codec@1a {
 				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
 		/* GPIO1 = DMIC_CLK, don't touch others */
 		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3

