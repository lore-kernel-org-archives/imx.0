Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309C12BDC3E
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 19:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769197872; cv=none; b=Lw1gB4+VG1bnj9Heszt7HcFPmrvIK2eI+huQghi6hUFJc/hOQcIjqHgnbLA59A6OoQ2fQIfGDmVIUIbnAbYzFG4idGM0g9sUI0UK9CgHfQGq5OWqXbupp07z4zv7UsGxFGXsijcQeMgiQWZb+w2P1JjZA0B+6hOcOKVDE3Jsw/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769197872; c=relaxed/simple;
	bh=kx6N8Fat+v4rKXAq3jr9szVFIZj8vDQESPGqHR9vba4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hq0wEcIpBgL3miGUrLU2/u5/rHB0ki1HuZg5a0Oa7uWDXl/eYYx+/4J38Pj3X0iw5VVWCqLn3UF+XF3CbURgKwbi8jkjWuoJAdvrcs2RoqgCkXVKHS8F6MB1IWVH5TqhHx2DJNEW+KF1NGvkjvwbwylKsbpIHET9wmoVvb3m674=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qNdp5I4r; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qNdp5I4r"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801bc328easo29631955e9.3
        for <imx@lists.linux.dev>; Fri, 23 Jan 2026 11:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769197868; x=1769802668; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8jNsJjXS8M5t/mEUZRdZlxrFzfCZpFMkBqFJLBshMIk=;
        b=qNdp5I4rcVJ8w9J/0qPNzGmCQK4wZn2J7J2dTRpxhwOZ0+wBaVl8iWCYLRA4BAzxKc
         qPIU75CZRrIFYfDW/icdW73I5wwK4Y03y+By6OvrbWoWqImcAixbYGFXFNl4wAPCOb+x
         RvdFe1C9WrFXhAQ8SeWp9vJMEdeMwBEBmcQBbHi+NJAGVKXZjSvWjy3HsvCYF4SlEvt/
         VuBz8VhOPgzQSeb3zrqV/TFOSAfa7/LMXwWSX2cGOrdXDYE9jZ5ekFjp63s19M2nFPT8
         HKhFQQkMMwfeTqpX8Z/VRQyaR+1R2jTfQmd7i/l6DACqnGBS0rVu9rguVMM+D86VimI5
         qWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769197868; x=1769802668;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jNsJjXS8M5t/mEUZRdZlxrFzfCZpFMkBqFJLBshMIk=;
        b=ppttU4wUop2jhho45ChoUXd++RFru6dIZzxu2mr7POpO0Yqar+1RH6eE8FTeQUAKU2
         y7rBHcrdoJ1odsR7uO3ZO+HD0J9uaLhG3dKco1MC261/yzfN6KeY7avbd8Zv7Qgm7aU4
         2m2BvAEdn9XGBEIiGvhOsdc3T39aAOnUURMSw4lI9JDD4wR4+fZvWz0c406VbUDSGXfF
         pbPIZatoaC466fkqq7+F3LFl7fXpbxXsgsBsTjBAhBpAvX75KNTdPBKWdWIqo7+BOz+u
         xppwp0dgyF7noEmgR5Y8rQG+n3XP2W5z9WwF2OsSlho05n8wpHiVYAs9C5gq5Bk6Fp/m
         UZkA==
X-Forwarded-Encrypted: i=1; AJvYcCXoc6LK5bIYsH/5RRPo9oINYl2TP+Xp4XY9tDaES4kd1OcSI/9P8hWciz8OT/KX7HGYOqU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQR8aViK6f3MFLvjpHF04R7FCVWobWsLaM9UCkNZa8HtR7PnYr
	/siB1zSuZSrh8kAYGa7I6aQKBOevU8zPQ8tMzj8ZEL7ioxbOhKPGQM7R6Ij0U4cWwgw=
X-Gm-Gg: AZuq6aIyGbOsAVWfOnZmU9HnZ6e31Mz+JKBQ71ayQqNUYatmrGa+FVLQNB/HS5fLnve
	ciWCRkj8cavE1Sw0EXvZIqHcETwJj1ArB+He3n6lgycd1HKoLykyWUnSVfSA68lQ+zYXMLgERWT
	a2oOSgy+r7NpK0duiVy/hd4cM6TGlTHVgA6IfaeALcSlKnxEtHOKSpA1vJdestHJRvGfy2tNmAe
	IGfoF0T5Q9vuQyaqEa1OBLSD6zwURjVH9f5l/gLOEVoTRtvOPSvLu8Wt5H+q5UsNnkX7ymSPkgX
	56puXuQQzHOMK/cHtciH2MojMB8YQ2i6Oi6q2Jg2vsKhQgWox/xM9Rmk9x9PEfy7ddTavR0IC/l
	YfxvtxzH77pmYrXtHXI90ircV/Y2WSUMGTExotv0WnIdzJxk6G1e4KzaJCk/R/NvzZsM4EIdS/i
	33zuEMRRR1oX1j/1Wo
X-Received: by 2002:a05:600c:5494:b0:480:1e9e:f9d with SMTP id 5b1f17b1804b1-4804c94810fmr65373435e9.8.1769197868314;
        Fri, 23 Jan 2026 11:51:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5c32sm94300895e9.11.2026.01.23.11.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:51:07 -0800 (PST)
Date: Fri, 23 Jan 2026 22:51:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
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
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.li@nxp.com>,
	linaro-s32@linaro.org
Subject: [PATCH v4 0/3] s32g: Use a syscon for GPR
Message-ID: <cover.1769195864.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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

Changes since v3:
* Fix the yaml file format
* Add netdev to the CC list on all emails so the CI triggers

Changes since v2:
* Improve the documentation in .../bindings/net/nxp,s32-dwmac.yaml
* "[PATCH v2 2/4] dt-bindings: mfd: syscon: Document the GPR syscon
  for the NXP S32 SoCs" was applied so drop it.

Changes since v1:
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
*** BLURB HERE ***

Dan Carpenter (3):
  net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
  dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
  dts: s32g: Add GPR syscon region

 .../bindings/net/nxp,s32-dwmac.yaml           | 13 +++++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  6 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  6 +++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 4 files changed, 43 insertions(+), 5 deletions(-)

-- 
2.51.0

