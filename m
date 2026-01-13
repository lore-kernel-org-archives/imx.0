Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77B5392B64
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313617; cv=none; b=cN9WCil7JGLMnYYuw7/XSAyB073+dc9OLB+7YPaRhLIflHs8gKHg+/85GbuHoa5CTk8p0m6F5b+c87xveIqfwKGo0TLjsiPTUpP4WIPD/5JDX44jK595MJDwmTgu/brHccqUtfdjh9OCp5wlZATWmS2AKS05i1f7d20911JCLgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313617; c=relaxed/simple;
	bh=ixwvhtBEkBoDvp5N4KEkKF182ppMydq9tQFQtSsQMTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3elSWLXtm7if70srhxYBSVJaKXhvLu/L2ch7ENp+loijd5WkrR4iQlHR6BozTFc8FDR3NttvBrpZ7fIIGHzhnP60P2678w7vtrCVUXfICUJIwTyxOsWgZ65lpCsDLhqCcoLdAQ2njZJSp2yGMsBV/ZoOugjc+WpLdW9O/xlivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jvFPoEwO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jvFPoEwO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ed987d51aso7226845e9.2
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 06:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768313610; x=1768918410; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EpPYFuBpeHzrlOUi6OsVjYU9ydxR9fDDFonQuw5LFlU=;
        b=jvFPoEwOlzs7xGysfDYC2iKHEI4z3Za9qeKixLx3wktjG5YeIn+6Ave7H6Ldq0/NqY
         /64O99aGBWLSzIEXocjJrT/rtaYeEshpxO2+gUExCRUzqBSZ9pfjIcwTy59kJgOGola7
         FEU5uJwRJmtyzgy97lEqY74UDbqrbjTA0RRaPsJsynFZUeNfVknCd53hI4T13gbp7FXC
         h6daDpWBl797RUYiDwlyIuqHNQqN5LXItQTwsGFGgAhSiDqvyZ1q+CWPLL1Et57Z0Nzw
         z37npegs9rt0mlunIvXJwzYnzITNhZrCgb6OJlNaY/2Bj2XW2oGmvBu15VW8kohS0SH4
         xwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313610; x=1768918410;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpPYFuBpeHzrlOUi6OsVjYU9ydxR9fDDFonQuw5LFlU=;
        b=nCc+gzxQBd4nepeL+LF2eakoFjyxyhSOkYbeo3292MTeKOsL9gYeALLrU3U7OOMzNy
         adL47xSCrxjuXttzVJhbOoGV1rcEhMGQMJwQtQEE412xa49V78wD3QDrUL+CIofC+vsk
         SO2TYIaZPicG9hGlAQ1DHrkZLu07pgMggTF5tgkW0m1SQfS7VQNeKgRX9aYZd2Gs0IL1
         wAd3ynVjZ+iDGJd3vzjKd4ug2huP1EsA8M85mp0qmrFqHVPPfq5cxh8Wd63WZTOsGOhr
         45kaSWm9/u1GObYDyrxKeOOWqVlqJZhYFhEl0fnD3sTDfWfIWcLqTmMQbMSc5ELyxPAH
         Ta5w==
X-Forwarded-Encrypted: i=1; AJvYcCXgq4H6VB3RgzaBA90eICYOrifcNrg5MKwAJV7LkTIDvChP1f4kmbpNl0uGD8Ytgv4Kaxk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIWvg1SLBD1dKeu3TZdnk31rISFKUblEb+fLfDnGzd+komL16b
	ijbx9QRjWDB0yBc+xUF1y7+VdwyoZwJ97T87qLCj5ERgFr6SlOjTPqCvTumK0Gftrz8=
X-Gm-Gg: AY/fxX4E0hRoFSG+dLeZA+O1EjWYyxOa219hw4ohrX3NsKTymHlmePdUJqdBpkU4Ci/
	AxVjZpzrSo+eUtWHln+Ctr8/ElmvjzxvqNdc9PDzE5IgGv2osANDmDy4cTxcLcLDcLJhavBOvZz
	toxCUgeGbGWLhKeL3LiaGK9qTOwpg1nc4S496HBOfeTJE4bDu5GDcMFzYblq7dg+uikd9Sx/5hb
	mUedxTyS4HAWH+GMxoR7VLmynchfCCBbx8tHm12YTC3540rxzNXB1mngqMGzfgDxEYjBadMaE9O
	/4NcIEdF3C2ZXum2ujCCAbA6zKlA+IARJI1lYzbPB3muq2CkTq7Yyv+XjDshL3jp8iQto2xVffF
	XC0Ibe4Rg+5or8Dw6gV93FRN2vkdFKcYjFhIk3c1rSEqcD0RX/NMC/mydYWwgtt6gpw9N1UHl0G
	WTZYIo+8hbo0lAQHUsJBYq56/mHAk=
X-Google-Smtp-Source: AGHT+IESteNDhCsp9djoyMeUvPvQ33cMYgxEEj70wmWesi8MDh/SKjav/Vxq6pmgAEpoaSXmrBuSJw==
X-Received: by 2002:a05:600c:1392:b0:46e:37fe:f0e6 with SMTP id 5b1f17b1804b1-47d84b3b724mr277918305e9.30.1768313610033;
        Tue, 13 Jan 2026 06:13:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee0b45b8fsm1590895e9.4.2026.01.13.06.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:13:29 -0800 (PST)
Date: Tue, 13 Jan 2026 17:13:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>, Frank Li <Frank.li@nxp.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: [PATCH v3 0/3] s32g: Use a syscon for GPR
Message-ID: <cover.1768311583.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Frank has pushed back on this a bit.  I think he objects to how
stmmac/dwmac-s32.c controlls the PHY by writing to a register instead
of through a driver.  Creating a syscon driver will make writing to
other drivers even easier.  In the end, we're going to need to write
to register eventually whether it's directly or through an abstraction
layer.  I feel like this is a good change and when we start dealing
with SCMI then it's an essential change.  I have fixed Krzysztof's
complaint about the poor documentation in the nxp,s32-dwmac.yaml
file.

The s32g devices have a GPR register region which holds a number of
miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
anything from there and we just add a line to the device tree to
access that GMAC_0_CTRL_STS register:

                        reg = <0x4033c000 0x2000>, /* gmac IP */
                              <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */

I have included the whole list of registers below.

We still have to maintain backwards compatibility to this format,
of course, but it would be better to access these registers through a
syscon.  Putting all the registers together is more organized and shows
how the hardware actually is implemented.

Secondly, in some versions of this chipset those registers can only be
accessed via SCMI.  It's relatively straight forward to handle this
by writing a syscon driver and registering it with of_syscon_register_regmap()
but it's complicated to deal with if the registers aren't grouped
together.

Changed since v2:
* Improve the documentation in .../bindings/net/nxp,s32-dwmac.yaml
* "[PATCH v2 2/4] dt-bindings: mfd: syscon: Document the GPR syscon
  for the NXP S32 SoCs" was applied so drop it.

Changed since v1:
* Add imx@lists.linux.dev to the CC list.
* Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/
* Use the correct SoC names nxp,s32g2-gpr and nxp,s32g3-gpr instead of
  nxp,s32g-gpr which is the SoC family.
* Fix the phandle name by adding the vendor prefix
* Fix the documentation for the phandle
* Remove #address-cells and #size-cells from the syscon block

Here is the whole list of registers in the GPR region

Starting from 0x4007C000

0  Software-Triggered Faults (SW_NCF)
4  GMAC Control (GMAC_0_CTRL_STS)
28 CMU Status 1 (CMU_STATUS_REG1)
2C CMUs Status 2 (CMU_STATUS_REG2)
30 FCCU EOUT Override Clear (FCCU_EOUT_OVERRIDE_CLEAR_REG)
38 SRC POR Control (SRC_POR_CTRL_REG)
54 GPR21 (GPR21)
5C GPR23 (GPR23)
60 GPR24 Register (GPR24)
CC Debug Control (DEBUG_CONTROL)
F0 Timestamp Control (TIMESTAMP_CONTROL_REGISTER)
F4 FlexRay OS Tick Input Select (FLEXRAY_OS_TICK_INPUT_SELECT_REG)
FC GPR63 Register (GPR63)

Starting from 0x4007CA00

0  Coherency Enable for PFE Ports (PFE_COH_EN)
4  PFE EMAC Interface Mode (PFE_EMACX_INTF_SEL)
20 PFE EMACX Power Control (PFE_PWR_CTRL)
28 Error Injection on Cortex-M7 AHB and AXI Pipe (CM7_TCM_AHB_SLICE)
2C Error Injection AHBP Gasket Cortex-M7 (ERROR_INJECTION_AHBP_GASKET_CM7)
40 LLCE Subsystem Status (LLCE_STAT)
44 LLCE Power Control (LLCE_CTRL)
48 DDR Urgent Control (DDR_URGENT_CTRL)
4C FTM Global Load Control (FLXTIM_CTRL)
50 FTM LDOK Status (FLXTIM_STAT)
54 Top CMU Status (CMU_STAT)
58 Accelerator NoC No Pending Trans Status (NOC_NOPEND_TRANS)
90 SerDes RD/WD Toggle Control (PCIE_TOGGLE)
94 SerDes Toggle Done Status (PCIE_TOGGLEDONE_STAT)
E0 Generic Control 0 (GENCTRL0)
E4 Generic Control 1 (GENCTRL1)
F0 Generic Status 0 (GENSTAT0)
FC Cortex-M7 AXI Parity Error and AHBP Gasket Error Alarm (CM7_AXI_AHBP_GASKET_ERROR_ALARM)

Starting from 4007C800

4  GPR01 Register (GPR01)
30 GPR12 Register (GPR12)
58 GPR22 Register (GPR22)
70 GPR28 Register (GPR28)
74 GPR29 Register (GPR29)

Starting from 4007CB00

4 WKUP Pad Pullup/Pulldown Select (WKUP_PUS)

Dan Carpenter (3):
  net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
  dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
  dts: s32g: Add GPR syscon region

 .../bindings/net/nxp,s32-dwmac.yaml           | 12 ++++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  6 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  6 +++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 4 files changed, 42 insertions(+), 5 deletions(-)

-- 
2.51.0

