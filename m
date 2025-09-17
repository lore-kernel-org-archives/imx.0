Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A503B3090D1
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 08:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096348; cv=none; b=MJ2lvl3OrQAsuVwBScYLOC2IXvWZHS0OXswXnnRffEhsjEoUiVzLNcG5osvH/snS5H33HQyn8vVS+UNv3im0VibIox1133F5n6cYzsKk2efe/2YSCsO+YfCOFRWxCshpNEOwiil8QTLJgWWStfjLC1OZQPV0gGTgc6wZmugGuPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096348; c=relaxed/simple;
	bh=7R8rcOL3f1HwsUpPHaL0+BUAREAOiXb98Mm1tlgtyCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hlKOD6AsHNMaexoV4ZAO+Hk/GaBuMm3IXt/D8JG4ol/oNcPxYDnNLQ2jLCBxAEAivV3NMnSWD/haKyvAnSTFnwJ5eK2RodlkCCuJYW5c2RypfbWIqzw3AlQVFzWiAxOqi3qgG1/ggUVs4WcT1lewIEYPYg3g2NqJbXgsYoWmCzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=SSMaaPmE; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="SSMaaPmE"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62f1987d4b2so7497412a12.2
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 01:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096345; x=1758701145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=SSMaaPmEzFTNNojv/pb/YPqil6FQRsGjbkATrMqOfZu2oi+RZ0l+owhZKjOE1hBxZM
         1X6W9NKLxbDDsrvWOROuaTDnhoQmXEo0S4tO49NCWul63VVerpGqP844CiplqndXYCRk
         Y6lcMNL9dto7JYr81j9mTSsHlu0rcyPR5TI9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096345; x=1758701145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=H7AIINiHeWasfFqE78WX/OiiW6XVpFjDT35M/850ZHp3pC33+TbvZ7+MekuqracpoS
         Dto6xrVRiOwxq2vjXMlRvpFaaQu33rk9csCtcKeXFjcXSTuOGwAVmaPDgUQQj92Md6sK
         2Bq91Nz9TE3J2ryGPLgBO8uIlEYvUpqcTwdeYn30m2qkYZeSbA/5us44Zn0knm1pgrEg
         FGSzebAHLakmhv2p2bhPAXNSI5IP1Y/AEyrg2eWMs00tMkn4Po9sBMMB7Qzxc0ZBPvkA
         C0Yf3VG3H6yCkik74OzfNn+DRXaM0UjKrIKb5LdyO3k5baYsR1PcLCRk6mx2JTjoesxI
         kKBA==
X-Forwarded-Encrypted: i=1; AJvYcCVt640o2obXzZivzTqwosK4EEb0zlNwK/3s6L+Ibin1ZWD8YBkgs6F2WQv9LtMmg+wCvkQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZmYwcRdlgEPIOpCHRZ4sr2OPaAuDA5uWEuEgCp9ZfUfoEvtQz
	mec2PeK+LKR0HBD1zrGFGPqzilSgjzIl4HRjMjY8XbEQrCOA4b6vO8OQc70L8I5ddsA=
X-Gm-Gg: ASbGncvFKXW4Ew+2KPWh6IpFlEXBhAcJOozGXlS5S9K4DIkQLEASv3tBvQg+XOc3hHB
	LVAf75YVyncRyab5y/Qw/YCVpWLNRhYnIHwtvV7uqAJ/aHd+dJdCBsmCops2eG32MRA0nYe2d2Y
	ZvFoIgxEr3f1mwZlMIf0S9ZppYMDrdPIIwP3THvCQIeigk46NjOaikOOTkV/Kvv48ZT0Q79PfrF
	XrgT1UPeODIOErpFrxAvMWQirFH/0fxFko/BajjFs9ZGWROlnIVGJR8YUHHq2mhb0OhqBvZhvTP
	Huu0hp23ewtopb/BWjCTco5VgrScQHEfy6SMk4TOD9byoph+p4YSuaafIKDowZjxpWEL876I+hQ
	dS5uDA7IOu3cim/RLEJBjjS/kvn64cSIS35tei1EEyuDUv94ll2xRfIbSFII=
X-Google-Smtp-Source: AGHT+IFpWQS4pkyL9m52u+iXkDhG4zfzNZwzj6DCSRH4/FjXB7Y5wWH6XeMryYi9+6RpKzp0CFw1UA==
X-Received: by 2002:a17:907:3f1a:b0:b04:7107:9758 with SMTP id a640c23a62f3a-b1bc0e86595mr153107166b.43.1758096344821;
        Wed, 17 Sep 2025 01:05:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v4 5/6] ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold
Date: Wed, 17 Sep 2025 10:05:10 +0200
Message-ID: <20250917080534.1772202-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This way the detected signal is valid only if it lasts longer than
62 µs, otherwise it is not sampled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
index 279d46c22cd7..f12084d8f2a0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
@@ -154,6 +154,7 @@ &tsc {
 	pinctrl-0 = <&pinctrl_tsc>;
 	measure-delay-time = <0x9ffff>;
 	pre-charge-time = <0xfff>;
+	touchscreen-glitch-threshold-ns = <62000>;
 	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
2.43.0

