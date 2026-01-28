Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1149A29A9E9
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594042; cv=none; b=PNCjtMW2o9zvQPIxYD4uYonliPfD+2zhhZr+V7zd/OfLXq/bBm4WH8QI6adRa9xQjRIX0GrrjecUr+PAVyJgw9lAo75u6qpE2V714D4Z9kqznTt/wflFjEcd8dSlYe665/KSPcl4h+7+xWVcNEC3vD6qxoYZUr4PIGH3JjUhGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594042; c=relaxed/simple;
	bh=F4IKa6rLYVWEFkv/IgXWcLrQfKoUBWLsvQ8TAjo1Q+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B6RGBo1OUhHZ/ptr1P3+xzp6tSG3lrC6dpH+D/xREzVxOz5se/aPs+7rpXQu6m0BfvTdPYAc73CuKxdMtTzF5CHsG52WkyT0qgQ5toluUjDHwz2kjkw31cAEEExg7f691fhpPijAdbtY7rkbKCHx5sqxJUaKQfMLP91rMru8dEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XQSa/UXC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQSa/UXC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee07570deso50892975e9.1
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594039; x=1770198839; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvsllvRxaSRJovqhkHtFHrVWBKQNv1To0hacwlFk6IM=;
        b=XQSa/UXCDfDysbQoM3mDk3y2kSC3cgWloJ4zAlsimQxx/6umlgZoTPxmOCjuu9w/qn
         MOy/aTGd2i0JjudMBxi1Jq7UHrjl+rovUlzH6CKTRRw0fP5jAwyXRxISX6dyL6zqGPYI
         exxi184S9oG14bp0fBBhQ6/ixDACk0xyDvXELfaOYWTW5AMgeatz/LeUPPMEVVXSzCV6
         kHq3XwpwxeEKprj1ycmZyaef5GbCUkHo2UZu/VRwDMVMAO1HQNgwflXOwDuTVotZ8R4p
         NHXx9AfGin+OlZMUazmzXcYz/gPlv4Aw/2eZJNcbZkwyVDAacD98oJg60C5OxpjGJqVn
         J8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594039; x=1770198839;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvsllvRxaSRJovqhkHtFHrVWBKQNv1To0hacwlFk6IM=;
        b=eVlSPEegpnZyaHGBFPnc1ad3FGOKcnvrtxSYeSxs5EJ3Io0XSFJQVqFQJH/7WzKP3W
         ITNbcvncMRm0+n9kjZzg5YRLdHZGSK3upL6NsUjX+jFS47aalIy0DaoxfpY+T5VC95Dx
         ub6zNQP2L+C01GeB+811G2LZ1+U5JbY94WVNgqzkBsDcFnWhzqJ6eqAaNVfE3nUFWEG7
         nQpUALwOdSCJIkM38vmo6guNK+4KhSOspnOMuY1WNfPgGSf0WiiRF3b9z2Ib7g0JcfwE
         g0F7YAk9C3ZRDjtHymqFAYWY91wTgg2qvefTwSZAGz2T48nU3QTTNWYB0hOfVJVdgiui
         B6Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUn2GyXkKWR9qfAdTHN+8ByfnL/nnqjsB5wI254+520v6jjwGMp0R4ctkJvNnI0i9hk0E8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkNRGDfJymgO3kRgzYsA1+mQYzTSeRcN8u2u5+b3HAtUCeleWL
	2580kHA5n3zJdz5N13+O3Qkoiezm/7bUZdX7ZZO0gvW7hTFIe5ObTglUlYU+NnGRviU=
X-Gm-Gg: AZuq6aLgng3qZxZg2HuSyLRq7eMhepb+Ijog+Op9S82ibMYEWF/WKx+J2BLL1x4/Jsg
	mokIX0K1p+fwY7ebu13ubLWa42t5YBrHutVUaRCVgDm7RPjc83HnMf7uCU/XJitGz86GTcSWo4i
	DWQLXD5vQw7DnF7dec/rMKFinwk3U0BOQnG72PZQ/2ZN3QbIsl4KT69d9UgJkmslwdsGvJCRFUe
	O17cHxRI8hCv4ifgq1xGtAiGp5wa2BjikQWonjdSA+k1dR8HAua/FDPk6l/ZTCQd0oWeZLR2llm
	tKTV9P2kpUDsWfT3BcWEgX8gP+a9VY2sJJNssHWYOP1juy0S/PmuutmG5iB0UxL8yb7Q24RfIi1
	JTBxUlM409mExAZX7ugOzh5VbnXBTKjt7RtD1D5w9vbCOB3kHYSj6+i+gmrJbrPohpPeNrBLsmC
	fEjPrsrkmbtHzZ+xBD
X-Received: by 2002:a05:600c:83c4:b0:47e:e946:3a57 with SMTP id 5b1f17b1804b1-48069ca552amr51714835e9.36.1769594039364;
        Wed, 28 Jan 2026 01:53:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm5836437f8f.41.2026.01.28.01.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:53:58 -0800 (PST)
Date: Wed, 28 Jan 2026 12:53:55 +0300
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
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v5 0/3] s32g: Use a syscon for GPR
Message-ID: <cover.1769592679.git.dan.carpenter@linaro.org>
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

Changes since v4:
* Return an error if regmap_write() fails
* Add Rob's Reviewed-by tag to the yaml patch.

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

