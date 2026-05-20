Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947133DBD74
	for <imx@lists.linux.dev>; Wed, 20 May 2026 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276649; cv=none; b=KNEQmv3EgCGy9OlY9sErr5k4Ufe6sLyDWhuuC9RKZPmKHPDXRlD/Kpna76PtN7hm2Iw7DFtJad3ZFJ03VzmsaMFkREcz7YmmXI7QfCRaJNZGM0CWpUD/2+DsNQgm87ceOX1gaN6ilq1Vs8RsvpnyPkDL/lxT0seGTYP72CAjezA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276649; c=relaxed/simple;
	bh=VcQBA1oRltE3qeDz0h4JQrgj/SUOKJVV9RlXPu1m1Ho=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e4ZL/9luDLfXgjTLXQv6XO8VVzQAaR1+8Zq4q0aTDKHwV1qsBl/5l3cc9IQ7tOn08WRxkE/FPSd8eKSwLxVKjdFPT+qfukhNYNw6F5ZZ82RmmRQOxs/Akn4jdsaoRpVmt2i3CcaDUiKouIHRivqMjSUNViQmFoo0tJxlnlHeZzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMmtNRW5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMmtNRW5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so36705655e9.2
        for <imx@lists.linux.dev>; Wed, 20 May 2026 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779276646; x=1779881446; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aVOu3BYA8D072I0qM7Lp3VGwdHFlopVTdr1RQuFawxs=;
        b=HMmtNRW5TDMpK8obxiI2lzk1Ydm6Tt5QErUFsfAdlE3vj27t82kIU3Qt0LrbNtZDdA
         ANUlzqK5imwCdxwDlE215hvEPzX40fU7jMCBA7XeWUuFj0+gUGU9BGYT0meORvSUexPr
         r7cwyAlNgukAkToJ+hddV91XmURClLIYpCq4uTPkQ04C+1lAoeTrDCAsXUEj4CgQnYMy
         11Ad4rr1pDNo8PChADrAT2072JxJ/jMMbQ3eL1fDiLEj9HVsj14KJccbOOqqTJLAyp7P
         Oyt74pFS4dt3Ffzp1ov0ic/75a/uqkcoL+rQoYsStuxhLNmI0IAZN+mp189UQ9xSwiDj
         zEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276646; x=1779881446;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVOu3BYA8D072I0qM7Lp3VGwdHFlopVTdr1RQuFawxs=;
        b=RBZNHrdOyfW6Sbg1rosSqX1oBGAnSrAR4nbsa8/9EGVdwwJ2NBBqUKL3UkZZfBEDS4
         0kELa/Gs/LvJj6In2iL7SoEZoyKhiDjuOK5iIbSmy9ws1UJokx54j0H1GmYJClqzZ77d
         MFjPlGoFzxiP3+N3t6nnkoWZvQQfrois3yUWTUbmL+r78sM6s2keHT1+usvJ2/wH0s7E
         iyMoXJiEZD0eZXVkdtjKnlBAXQd6w+fhLsz807+9QFE+r0v5qazbew3ceQ1lJsMikWZs
         cPed4HZ+C20oDUKGm9QKD8rDaIVwQjDw+Z23cF11OKGtx5evewSgp/YDA/3wHFfWSVgz
         lsng==
X-Forwarded-Encrypted: i=1; AFNElJ/CfTjWW+pHOH7IVAgPdDLs7ylWt0LrjmuM0KX1V9z6mdSNtRFuUusHSKOAJWNPyAVA0D0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjNe/4jblqtN4ISWLBp3IhQ0u0V9hA4B0VBUJkK32c/RItzQFi
	DjsZYZWbhw2RF0D4rdkud7yRSg/Yu486fVG9YLw1pMLXFKypnxvtEL67
X-Gm-Gg: Acq92OFgZezhENEQ2oTCaqDpgIRBRtqddnJizFxRk/FM2giUmfdeh3GyvOuv40toZ54
	mzopqm7Z8Kq+mchjnCyP/LIRhip7Pyl2AI1y28JW0TSJWZWfyE//hdujQ2d4EtjdntlamuJexIC
	pYBYbXWCszMMh3V2ZR4A2m+8cR3/QPBwxyEd3nZoECkHOS03QkdD5DNlkT0mh2QzgQ/jn2HSzF/
	r64nUU98l8M7RdBjP6s4S930EVjq44yiOm28HXXy09zLfDz7ExAz/5Hj4skOXbfTTO83kns/djB
	8FhWnmBVpZ7i0w+XhBpIExbNZsa0GWZGPpZOsbRl/nhSxJjCqX3m5GHfiOSD29Hk62xjOTwi4qJ
	cMrrReQ8yJps3sOGmn1gynBOZ7wfjSeGW2BazRxBvUy/IMEl89E48jaPvHBOtpnjqpy/B8Vze6p
	u3OYcfmV80ASjtYGQOzJWvPzeHF3WyVhUIGPo/Ps+eOfap55iYSEDe38T9N0Hc3TyKDn6b6VDjb
	NV3cFzjKv2wF59jx4aMUc8pSUEDr2lRiP94gn/Y483ak5bAd1SaX6Xtin9ZZuLzaHuxMB/7Coc1
	ug==
X-Received: by 2002:a05:600c:5296:b0:490:31e:d6f4 with SMTP id 5b1f17b1804b1-490031ed905mr245274475e9.18.1779276645662;
        Wed, 20 May 2026 04:30:45 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab3977sm430363315e9.9.2026.05.20.04.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:30:45 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Wed, 20 May 2026 13:30:31 +0200
Message-Id: <20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFebDWoC/2WNyw6CMBBFf4XM2jF90EZc+R+GRdMOMomAtEpqC
 P9uJXHl8tzknLtCosiU4FytEGnhxNNYQB0q8L0bb4QcCoMSygojJLoQ0M0vvjvkITcGa6WVsa7
 TQUko2iNSx3lPXtvCPafnFN/7wyK/6y9m/2OLRIG28Sci6U0t9aW4LlA++mmAdtu2D3ufFpKyA
 AAA
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
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  294 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  398 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 5 files changed, 1862 insertions(+)
---
base-commit: 596d0f9f4fefffbf783ab26cfa90cf50f5dd6bb0
change-id: 20260501-add-aquila-imx95-423256af3d21

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

