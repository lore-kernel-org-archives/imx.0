Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEA72F28E6
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557551; cv=none; b=LLufEaphm8Q1J7WP4FHOiZ/g8bGABfROohWD+J3tIVwUv4WbIpU6GCSDooQlRugm1g87lQMicb208CZkomwPebD/NwPF0LFQwoXQPM5EEl2ayehc50RyjWACx+PPyl5t+LtSvzcB97JOqg4iZ17b5Kv/DV789u361qdMVDmFHyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557551; c=relaxed/simple;
	bh=tOevcamH4dU12q4fMfHEnmz2A1COeCliFA26VQizE1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBnUAw1d0p124B3TcWtorXlFaJHjK4FaWZ1wujO1sZCFPygQqJ6/TNWAaOziz9DURQebizR1HkrEWWUxWJAnGOSeZlUxv9Kx0rquhelsTb/Sij/wf4VpTf67YnEcTzRxdJUYC+mXtlKHx/1+S13jOMb/tWPKFGChpqGpeXWUhKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDenkZZw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDenkZZw"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so562350566b.2
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 02:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557548; x=1762162348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kb+oCJFy28PNmi6e8yrO96eaDIYbCEFfqpsOTMY4zgQ=;
        b=mDenkZZwQjtJ/B9VlVZc1jx/RB5vBnf4ZMGRyRDoeQ/XKw/0UsrZRwlsf/bDssBZn7
         QcLT5Vpf5IAdoWkkFdYFxIZg3WnJebF5X9HTN19Kc6kJ0g7McK1p31WtIBNuHw0Sy1a4
         ZxUIxlnyJb5dXnBb2oAzLD0438tjQXWC6/xUDG5jElg/6xyT4D9cE0/Xp72c+mudalq7
         9w8LFPxVahGfXy7e7tK4CTGGoC0f93HwTcgPjQs3mviYQHuH5VfVtZqDURU6n2nDGgRG
         3KrzNDj3xuZ7LzbDxsW2Ra2+yS4EhmyOm31s3O7CY0WQcij9fK61QnNze8o16Uly9A58
         Vb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557548; x=1762162348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kb+oCJFy28PNmi6e8yrO96eaDIYbCEFfqpsOTMY4zgQ=;
        b=BCYS36Fi+yKL2oovUWGLsOYmN23bYHVPKEQd98OZOjkOFMrhN9hHEMF7pSrXIpwGfx
         SiZFhOkt0gRICFipHCOi2QduLI0W7bqoZyuAoh4nRzYqFr5T+5cHn1os7kBgHYqDRQ4Z
         GC+LeQ7r3eevlAfQNdSy1juO7IgoqgmfQg9zff/SkP/2beRSpMq3RQH989fEg0aUqg0Z
         ewZS7M1dAqCOZxLBqdbLsHb1MpHtEJMiZlEfTSfOkvJFUzIRSkV4yGUvJoAnqsqdFzEE
         LpFjkrHQ/khgGXFuJFfPfEXKeq+PRCk1AbpOb+0c1OokclqQ6PIVvRPNYo2UhDP75Lcs
         xOhg==
X-Forwarded-Encrypted: i=1; AJvYcCVg0VMWnY6gcQpxmUT9/FLs78PVjVMyPXDWm4VjNZl0goykMbO9PF7j7AMd2T+TkDNbTRA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc6BSy+WsspAqolbpL62pTC4rsxbzlhGqJjo8u95gDN4pJhPrQ
	xDFxXlJeNkidGCdLfoWTnaIhz4SNfTKauYCnkPXYc4gjf6GCh8O8IivJ
X-Gm-Gg: ASbGncvoIbnLPPpvIcma8sRfKmCVhDPpzoW5gycKyvx1WeWijY/QVNrIiSq7BnStuRc
	MrIwFrZUq/B9Gz4CFSNumhXCcuAPusAKUggU3ALhZ1wwf0xQ6EhuXQb+dY5OF8ccFhWMvfglzbq
	pMtR36UaSeFlPTHyA+m1CL8Hc9zD+z8cZA1Q+7FCL6NqgNQMuRp100p+Q+F7PpoiFfnSc+IN8gE
	07I3cYS5qg+46oM4SG6UafHAN9BKGzTVJ2yoGpC2wSHFLpe2gKKguqGYky51oFkYvfQawk06lM/
	YG4Qc37fiwmS6qUqlxtjI5aA+xWRf4GQFAu5j0LyDVc0wa0tsq4bqAvbxELP65PkGzzvHR5dSjM
	P2+zeVjdHW84xufOYSlAQWnbMchvUP6Feqn7PlzEudfjVmzBAAmwDXWelrObWmsHetxwQQk2A2J
	wyOTSNV19Sv2cVceVYWUU9xwzKQOHowFVZlqxKsapTIHy4AAfd+85nhNJP9DCYx6I4/W4V1iSVG
	4p8UzX4GvThGV8K
X-Google-Smtp-Source: AGHT+IHTgGv4G/+wFJOtkWMD7ZAhCWVQTDxphKQmll9bPxy5C1Umq1JWKsBdZD1UJY74GedfpKzDzw==
X-Received: by 2002:a17:907:da1:b0:b6d:5e64:c36b with SMTP id a640c23a62f3a-b6d6fe9fac7mr988112866b.29.1761557547697;
        Mon, 27 Oct 2025 02:32:27 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:27 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] arm64: dts: imx8-apalis: rename wifi regulator
Date: Mon, 27 Oct 2025 10:30:10 +0100
Message-ID: <20251027093133.2344267-5-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Rename the wifi regulator to what is the net name in the schematic.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index abf6d543380c..4234289d4012 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -77,7 +77,7 @@ reg_module_wifi: regulator-module-wifi {
 		gpio = <&lsio_gpio1 28 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
-		regulator-name = "wifi_pwrdn_fake_regulator";
+		regulator-name = "Wi-Fi_POWER_DOWN"; /* Wi-Fi module PDn */
 		regulator-settling-time-us = <100>;
 	};
 
-- 
2.42.0

