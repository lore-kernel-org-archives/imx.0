Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F5529346F
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 13:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769779183; cv=none; b=tVIdhQaDpmy/ee7c/nE8Scp7agJesVHUSkO0jcntd9PE32JkCwiRfnqHCTMkZP1GFvXw7KRQlELgHDe5RPA5K46bFYWo7o9oX4VXgRy/MiHQjrfwZJPrjYNh7//SU/ftEcP76JD6qDvNPVZatWOAunDqvja9UNoY3dUaLJufq7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769779183; c=relaxed/simple;
	bh=GPGinCQroahYT06bixhJuzGEVunNCmKgVO1Cw29JfFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QEYSuR32NIt0YnMb1sjuEOp7DX5YA6JtqN0c9tnrPoVf2c7FfpJ96Q7EfrQQxY56FK9QiUYfDky0dy/Er6PH2X8xcKIxPWi94tzcsysS1j7l1aViRPyCnFTPT8y9stSjU6siVc44r+2nXDqSj2KWEsiMUT4c5n/wpjpVnaPCLyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RfRPdYEd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RfRPdYEd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806f80cac9so12936875e9.1
        for <imx@lists.linux.dev>; Fri, 30 Jan 2026 05:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769779180; x=1770383980; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HM7frh05im77oZIDqVclBmpgKOAVmImS7J83MO9Bgs0=;
        b=RfRPdYEd/U1g5cLRplM1/KjstMnESiz5NFwVr/dc2oRPQA41vkQ2xLcW/cy1nGLOxe
         G0WG3s4UXKtNtdk1pEdZB8dhcn2AUwWsyuRegMNAm9wB2DbkYjLHe7XjmC/WZErulRZa
         oqn3CGlzMqIk6QLWfNioBIh7ZVl3MGci5tJcMXzbdq9DbLnHzpzmrTw93iogeB4IAWvX
         2GR3U8YgIUuMmiG3ls+A6zCih23qdwUahWC9j7U5v7ws6r312i/bXRo+INUV0s7LFWDF
         //S0YxyHnKtUlBaOGJx9BLnI30yMmJdjNmit1j0hU+HP+hHWkOIxnpsSdkZdj2TL1ZKN
         Tr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779180; x=1770383980;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HM7frh05im77oZIDqVclBmpgKOAVmImS7J83MO9Bgs0=;
        b=ug3OUVtMJUmrkFMEl5rDVOVoyPSiIt/ZOr+KrDt/Erx+Prcw5X7dASAKdBG2Ne1D8+
         GlYMR/ZCUpIX1BklhspulqRDyZl4oeyVPdyASR4jcY9SClXPB2KX9GfFernd6ck/9Q/E
         4XyjB8sS8KXoRYcXo2sqmxceJ03r52F9ScQ0+z04gkHOtJ1/gbocc1ghQ2V2bcEmIz8F
         J2+jbqnTRfOAtFwdEqlgLlWMbGzMw7cyHc6f9ml8qpnUTW6+FQlpe2kkyx5I4UxTEZza
         wiKnpUCv+l/Y02u0HOUg04pJZPcbmHeRt62bcvtFaKZ83GdQzOWplp5cK5OPc2UQy00+
         BYOA==
X-Forwarded-Encrypted: i=1; AJvYcCUZYPnKmvkRxpHIDZjxdSB3abFbjFIkCX7bSTQ2sKGZLGSQoVM66KRZ2i2IZ5u4xo/ichc=@lists.linux.dev
X-Gm-Message-State: AOJu0YycFkbI0KQi3kIu9KysONnaMQGRGcP0BIR0ppHfljl2JT407un+
	Y/Yej3bzJm+kUngRYQuuUeTUBWvszB9zFYM4XUnEzWgXROMzpTdnNVm8aUFOL4xZD/o=
X-Gm-Gg: AZuq6aKFfH+pb5ptQccQGakQi0WOp8wm0KIJi8L/uj3erAhYZzqPMZRjpZHZJRKa+kZ
	gT+EMPJJnQTi9y+8/LrG6MYA9G0ia9DsVtBcSzzsHqXKIDwFAjCxzXSlBhHRcXZ5uYtjMtuIgkR
	KyRbWVBZY7UTc/avgz51RmWBQvk6MzjK7Au878eoIavKqxBqDxr2sJD5efPZ/BSmvBCNExRyVeY
	Bf3EYIcQnva8Kwpi+93uE2FbIk8BanMB7at7wFw7oKhXmPGoq5gUJJwtPDMOIrziEDaUV9/9yQ5
	yg/eAsX7Vl0wMJ5hR+mEDxGw86orhV6o3e0KqpYnlxCSTygnaZ/l26p1uFjFUixaQIjSU0mBILI
	Y5j3FAVqjLIAg64E5z0jW42Qnq6zpurE5B0Q+EwKPhGr/pSkcikxFHMPFav+wexlN3qJlkIOKrN
	4hvtCC/b8569TCg1Yw
X-Received: by 2002:a05:600c:870c:b0:47f:1a8d:4f30 with SMTP id 5b1f17b1804b1-482db4e2501mr31706135e9.26.1769779179560;
        Fri, 30 Jan 2026 05:19:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd78d3sm203603435e9.1.2026.01.30.05.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:19:39 -0800 (PST)
Date: Fri, 30 Jan 2026 16:19:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
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
	Sascha Hauer <s.hauer@pengutronix.de>, linaro-s32@linaro.org
Subject: [PATCH v6 0/3] s32g: Use a syscon for GPR
Message-ID: <cover.1769764941.git.dan.carpenter@linaro.org>
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

Changes since v5:
* Fix O vs 0 typo in yaml file
* Add Jan Petrous's Reviewed-by tag

Changes since v4:
* Return an error if regmap_write() fails
* Add Rob's Reviewed-by tag to the yaml patch

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

 .../bindings/net/nxp,s32-dwmac.yaml           | 13 +++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  6 ++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  6 ++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 28 +++++++++++++++----
 4 files changed, 47 insertions(+), 6 deletions(-)

-- 
2.51.0

