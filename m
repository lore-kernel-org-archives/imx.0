Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1463421E0BD
	for <imx@lists.linux.dev>; Wed, 14 May 2025 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211120; cv=none; b=jz3J4+YRiTuaCNfROzlfvt6/Fge2bipyOTZIlbKt2WoBbNU3R5V14B4ksB3BIyV8OXyQOfbro/wNroH+gLnFbVoOUOW+tLy/rO6iO+0qQoNhPSh+7p7tXbZ3JVViRnWTLu2bMMXPcD8b4s/qU4ePV7UjAEb56o981eKbiRogx9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211120; c=relaxed/simple;
	bh=VuPsb9OXhGwndn/qTWajYUOCGIqhS428Kk9CJNyTJy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhRhtz9oFIZ7jgX5xHGXQ9Z7JTdNO5BmHJ0wfBQGLk83VC3l2OOxC5AUIC9NqJ3SduWrZaeJ8BRq+ji1P4IS3DLWVHXZZnnJB6VkzlcRal2x078sOns36eSR9rac7NQ48dSDNI0S5AZMTjYkE+XeGnsWVzCjbsvYgGq42z3uCDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=HAiqqytJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HAiqqytJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so69628735e9.3
        for <imx@lists.linux.dev>; Wed, 14 May 2025 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211114; x=1747815914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2agCRR6IRGaR3EtCVbw6MISEmkDLJru9ZVgwOeM9qk=;
        b=HAiqqytJPrkeECPiHIthvvBYsUd22WH62hKVnnzJckCxR0FXFBM1YLMwFSx7f88LLs
         b9Oq2l/AMuE1ZurvKaUQLYR1O+3dSaxRJqhLkvP/0WRwI9GrTIwMm5paw60mhoLusK/f
         7oQhcqmziU1K1chABHOnsTWwN17BIdbOln4Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211114; x=1747815914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2agCRR6IRGaR3EtCVbw6MISEmkDLJru9ZVgwOeM9qk=;
        b=d+H/2P+3Gsft8feprwU4GDE/WvJAlYDk9XGEcuJmAbH2jBX5yaApFqxjWOoSeG6FnM
         d0apLPH8v7eo328XU1iUz5yDZgnFNbibK1/TcMG/6/p6/bApSBhA+sxT4lU9ssBk7jfh
         xqLEBhpunRg3KTfBltzmK7g/DKdfOKsQOgUoCFY0+QJwDS6K1EwXdVUgJFqaJh90DyC2
         13VBRY0bgjP26GPNjUUutjkK0BXm8PykykY1fbiqpAQ/0SUqrHxkQl8sT1dAIEMP89i9
         TM4//cgg9YE+Jq8Rk6QN4avGK0f9hzLBrcUQHD/9tmNv/EkA44Dg2dmnviU9mPZPRxqV
         030g==
X-Forwarded-Encrypted: i=1; AJvYcCUrvhXdWe6ouEhZmY0Z3C5wCp0G0DxIh7JuQhQIYWOmJcYsIePmx+5okp1d6c2lAtHiTZs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwuPDUI1Wpta47FhuzRlhY0AvmPfDsmKbO19VAxUL8vEykMR2d
	uPIS7LoudApYEAulPguCeyY771xAmFBMbVX5EvAR30z2NdSfAU/Ttjpec/Q1yU8=
X-Gm-Gg: ASbGncvvxBHPoYpT+4zPjxanIQGDn48O18zUjcOlN/QcwErs998bWZ/EUZWKVImGNE2
	OSQR+yGyixOm/05cAUZePwph8jyuMVfr7Pw7Y6uMrhW+y0/JpM2NFmvkAxey/L/wDjhguELC4JC
	E3D5Mt6p9NUtvg2xVsWreavFT8CATbfsNG947onkxSG86wdriATzY4DBc3nSbd9KN79gXCSIkFI
	6ZbZtc4Y09X78jGISD5BV7U3DBrLeZQdH90EOI7LOc+5JEJEXRuT568y2sVKCFB5WqxOezqSXxy
	Ki6wPPAaSZK5dXaFoEiC0oyFWUtnCJo9m02/bBd/KvRYzcwV+24bwJR5wPIvr9bxsYWSQBUNdnu
	i1oTsqqy4tfh5qzEnw1U4WhUEJ+38uqjlYbnXhhDbyCo=
X-Google-Smtp-Source: AGHT+IHVtazkKOvjOJrOfm04DNRArnB952epM/1Ur7L3bzWPScmWVjAQPWu02+n0E7WC/TG7fAuzAQ==
X-Received: by 2002:a05:600c:34cf:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-442f21683cemr21843635e9.20.1747211114278;
        Wed, 14 May 2025 01:25:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/9] arm64: dts: imx8mn-bsh-smm-s2-common: Leave regulator under hw state machine
Date: Wed, 14 May 2025 10:24:56 +0200
Message-ID: <20250514082507.1983849-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Trimarchi <michael@amarulasolutions.com>

Let regulator to be controlled by hardware state machine.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 5a1ec2f6a552..0d343ffdb7f9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -144,6 +144,7 @@ buck4_reg: BUCK4 {
 				regulator-max-microvolt = <3300000>;
 				regulator-boot-on;
 				regulator-always-on;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck5_reg: BUCK5 {
@@ -153,6 +154,7 @@ buck5_reg: BUCK5 {
 				regulator-max-microvolt = <1995000>;
 				regulator-boot-on;
 				regulator-always-on;
+				rohm,no-regulator-enable-control;
 			};
 
 			buck6_reg: BUCK6 {
@@ -162,6 +164,7 @@ buck6_reg: BUCK6 {
 				regulator-max-microvolt = <1400000>;
 				regulator-boot-on;
 				regulator-always-on;
+				rohm,no-regulator-enable-control;
 			};
 
 			ldo1_reg: LDO1 {
-- 
2.43.0

