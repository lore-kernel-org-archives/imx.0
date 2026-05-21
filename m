Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46705366541
	for <imx@lists.linux.dev>; Thu, 21 May 2026 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354233; cv=none; b=oeTqnsIglkSnld7RU2I1USg7sEEQKw+EaTRgSSpjZzuShz/EQArdMqGW5bG/koohBKWjeHv1NIQ0nEpXp1zrlgeHA9bgvFarm1GaTIVkkwD1+ji5BPCB4l5qlVUOGN/AzNvVKytI9oECUP1GMNQQg/PTNeCPaAT1rDKSKXZAyRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354233; c=relaxed/simple;
	bh=pQEhhq91fwbtVUqeW3eqa1lnF0aujhYjaxkeRr8WY/c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rZnUdDvNhX2Y9n3/uwzVmVw06wXsFCDSBlLrRH2fSwjQECoMRS9TaLiUSIZv22nQQ0/SxxjH9SqjyBABAFObK7LRF49oWsHGKemKlT8OPHYqkEZ2yDYNfCsi2Z92DHiEIuckYyS8fxr3+8chS2ItAOynMcPxDJKJjJ2Snf/KdE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz9X2iCr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz9X2iCr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso57303745e9.3
        for <imx@lists.linux.dev>; Thu, 21 May 2026 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779354230; x=1779959030; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAOsRM1+80/MwNu76Lnr/NEqUOkPH7Rb8BzB/sMmpYI=;
        b=Xz9X2iCrBDAhMIuueKcMxJ6nDByZvqneRl4I+DhzvWzAnv6z01o/A27/OfnG+2HiC+
         Zu/80iDxCvuZecaiD8/9eFaN3I+iJJB63KH3sfOFzaEKRZubma/L4MssJ56yxuU+Rlfi
         rBjEBdLKfwYUALpcelXqzn2s2DdKuQL5nnM++cOIBt018Zdyc5Pd2ZfpOl5skM/Wo5ha
         ukwNNBQATWuPmauhibeN/Vj72UoclyuHyE8JstK2Q9vHDqmRpMujS5SgDk8pGXbivFnX
         FVR10JxDwvuk6dEid0BvVkTWHkROKA2RGF4onMKVfy1mP2QuZTubewfvEyzRbhTRlYwS
         nvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354230; x=1779959030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAOsRM1+80/MwNu76Lnr/NEqUOkPH7Rb8BzB/sMmpYI=;
        b=WnrlbzHquP6GaGYkuxWXdxJz/jv+Unj4X5u7gG7EVQJMwF7IfQ1im5QlEazg1Ew1K3
         HO+nFENVaqvTqHnH0ru9o1/Wlu8xCBHkuvMbCTxQzF+uxzhHc91N58PmydXlF/+gvPfC
         wFyZxVFsi4QrcExOpiPSKRyi0sOzaUAHmHWlUJS67cHrHW61oWLQsLCvjA7vUyG6qD1T
         PHV2zWtCnuVXe9YynFRy/FylFpbAK30aHkkxepQ2FZPA8wZJmUxcH2qoBKm3HCDCZZ6T
         B+uz3qqTGNOWey/qYJX+lu7rVyEJKHYtFqP69uBJhIfY8Y02oPWmX66xHb2dogh3AfuM
         g4Bw==
X-Forwarded-Encrypted: i=1; AFNElJ8m0/5qG42hdsBVXkTHrfrpxgvLf6trB45aLKXJWcTZRYT6uaxUY3khEv9yfmL/mjYPcj4=@lists.linux.dev
X-Gm-Message-State: AOJu0YycHOgWeLms9Ea/F04+bSzK7LEJR8UzUhLO+IhXQ6rALRW9Ehob
	4u+LpCgPHD2yKFSCG1PkoDlUzw0+0Z0OMdq/+/aY4fY0hja8aROBYvTz
X-Gm-Gg: Acq92OHa5paB0IfM3AGXnyovjzVHbdNP4GQy4qK8CiScttJOsEq6O/e1tWasoXn0J+0
	p8UA7g7h0doh/ZGFUDabsyV/KRTJZSvOSdHWxaanOPvKhdimmacvChXEGpIaK67oJT6RDLdrENX
	dOWvS9tE56mK/TT88s0Fk8i6AA4HsNG/UWAq3XhIvR91dC7FCAafko+P/d0QZwsq7PgHX9rT+z3
	ZlGPqMz85Q15NAva3NCa5R5NOq116A9LSRjMoRLHqLHDp/GvvqYsGp4M4EI8S72gOGJXQFzGea/
	9n31abQ4yamkM0xH1uVPtsDoe4Z0v20fiOtg8oySj1MkLAQCuqRmrEHf40nOXNLIWvPnkVIlrO4
	T2EhdHvwRyMaLvITFDjfYbWOKJaqBNNEoRAEMS6HiPUZq02mYZ1ejPp1MAOn54NeZHS/Qm09DSd
	yPHfOyPVZ7DZ7rs8CqcIvTy2B2dHJFp5QYsPFDaf9PPMTT0vmy4ul4WZbjzwIiLg0IEimSHsmn9
	FMPt+alm0iJ7RGqmwV8MGaypjxj1rK1UAAFE3hI1MZbopYiuQgMWTZiyMFOxvzgjjnYsagANy7a
	LbElU62NMSDZ
X-Received: by 2002:a05:600c:45c6:b0:48d:46a:6e5b with SMTP id 5b1f17b1804b1-4903602dbf4mr24843875e9.7.1779354229452;
        Thu, 21 May 2026 02:03:49 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c72c78sm16151525e9.3.2026.05.21.02.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:03:49 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Thu, 21 May 2026 11:03:44 +0200
Message-Id: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHDKDmoC/23NTQrCMBCG4auUrI0kkx+sK+8hLkIytQO21URDp
 fTupgVB0eU78D0zsYSRMLF9NbGImRINfQm1qZhvXX9GTqE0AwFWGCG5C4G724MujlM31oZrUGC
 sa1QAycrsGrGhcSWPp9ItpfsQn+uHLJfrG7O/WJZccFv7HaL0Rkt1KFsXcNz6oWMLl+GDAPGHg
 EIIq0E7I1Ep903M8/wCdVXtpPUAAAA=
X-Change-ID: 20260501-add-aquila-imx95-423256af3d21
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.15.2

This patch series adds support for the Toradex Aquila i.MX95 SoM and its
currently available carrier boards: the Aquila Development Board and the
Clover carrier board.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and 
Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
lane DSI or CSI interface, one LVDS interface (one or two channels), and
some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0, 
and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Changes in v3:
- Changed QSPI_1 4bit iomux node name to 'flexspi14bitgrp'
- Deleted the cdns,* properties from flexspi1
- Link to v2: https://patch.msgid.link/20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com

Changes in v2:
- Add 'acked-by' tag from Conor to the bindings patch
- Reordering iomux by node name
- Changed Francesco's tags to have the Toradex mail address
- Link to v1: https://lore.kernel.org/r/20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com

---
Antoine Gouby (1):
      arm64: dts: freescale: imx95-aquila: Add Clover carrier board

Franz Schnyder (1):
      dt-bindings: arm: fsl: add Aquila iMX95

João Paulo Gonçalves (1):
      arm64: dts: freescale: add Aquila iMX95 support

 Documentation/devicetree/bindings/arm/fsl.yaml     |    8 +
 arch/arm64/boot/dts/freescale/Makefile             |    2 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  289 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  393 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 5 files changed, 1852 insertions(+)
---
base-commit: 596d0f9f4fefffbf783ab26cfa90cf50f5dd6bb0
change-id: 20260501-add-aquila-imx95-423256af3d21

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

