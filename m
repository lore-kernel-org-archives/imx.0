Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B97332EBC
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770117546; cv=none; b=d9a1LZz41mG6g7qWOdI4ihQM6ZrEkSuuzK3dyCshUGQuVG9a1QS04NPyNfpMgHkcYOUMy86hjfcYMwPCRgAwOO26oqpG03lPgRTWoiCluMmqjyFmDv+BfNBjj/lMs7+E4a9mU3/EZKa0Or/gvEhhaIMMBYsrA8U20jcsct1Rx7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770117546; c=relaxed/simple;
	bh=O8KJekQh9FS/0oopKwm+g0QsiWOT6WSJ2NbPIfVUrDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnXb+rRGE+zL/3zx5pfyUyednFvZRh23vU7xht+ZOxAoKC2wfhQaqSeqVbglP1KYBUGw9FLpQTVuO787DyacVjPOZfSGhweuOydAXNc/CJO8uwFsiEOhRnJTjoTqG/IKOIJ0kuDxWYeMGWc9aEGeGI13Cll7IgLTnrP85SFzpPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SPK7J5bo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SPK7J5bo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770117543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2WnKseKgzuDEwEZ2TxAar2LzO8o7OZlfDBwq/L+OXzI=;
	b=SPK7J5boZRP8L6xLuwUZBZHzncrT0hBtqcErHjGeqw/ZpYpmsfsNcLrPBuN7jBiSgAVsky
	UAEhQk6aN1aC0ymO284r0EUwV6HgiI4qxSqB4yL9MenJfvLXtqkphWu24H/iQSe3U7ypHo
	MZGFLZoTIrWEpmU7HR231djFaNDlbH4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-cdKQewayPUmz3EkeXkvZpQ-1; Tue, 03 Feb 2026 06:19:02 -0500
X-MC-Unique: cdKQewayPUmz3EkeXkvZpQ-1
X-Mimecast-MFC-AGG-ID: cdKQewayPUmz3EkeXkvZpQ_1770117541
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4806fc58fa5so49614905e9.2
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 03:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770117541; x=1770722341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WnKseKgzuDEwEZ2TxAar2LzO8o7OZlfDBwq/L+OXzI=;
        b=WvpRYbwFuZYxAyZP66cMgM4SytOjotokoOafpcWfDwX+mOPhqS/ebR7PSGrCqWL0y3
         YLa/ik+uFDbIeoQw5/VG2ji3ROXxEMm4Sz4tRo/T3BKM3iy1DhvdbO25j6U5MJIbFNRu
         4fMWmPZc4+ydqVjAIpbnXcfXCm5AoozohwxIcNALUztNtJ0Dmj4pG2WKz8WioXPdQLEB
         gwpYOI5/Nl8o+xeJiGCyWg0UOXu9jG1Ay7NHxRP08TSkkYQJcwpYUstVNIQ9AcusEC0d
         HoLHjF+bZKT9rjivrrbB+VUQ0D15YF0NHV8Nzt4TACfu+C4/WiQSsVlXpMAoIcWXw38w
         U7pw==
X-Forwarded-Encrypted: i=1; AJvYcCWDz5YaRYycaw5tNcNrTEl4QbyEp9vSyCSvQOEe6YTprdzRUj7A38YmCowcAEQjQR6YfgI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHn4O9RED6zSUgzpREdw8qMUiIjJJeRmnU4zIIRUAsRxJjsEHn
	Ey5S5aGMjgTAmdG/WK0njkIXqaxpA1f8XPrDrjeFBZ/GzXErdLlH1SKRzqharv0raRdx4EjeyvU
	dxT+MqmJVBvD69+5VhkLOC+0qVzVDYypomjJU61eCpVVTMdKlOC0IdA==
X-Gm-Gg: AZuq6aLnIjBjo5GmKumEFI7NaSBied1Sdfvlzr8RTpvnkEXyO82aHLoByYLnySPRbdl
	A7ntEZSuQollmqo84681BylLodsW1w+m25to/gvEoLogJ72q0KAVp9on4ClLOD25umjfVUpCN3u
	Gy9NPM0Lhx+NryH9JIng3fbM2TGzFC29l6P6aXsu/NjZmBIaMXHrlFvXSQfHdGOSdKOr/bhuADR
	8LiimFkpov264Ma1hll+Q73qWT+iaF4l/f2YB+eY/jOXQjAU0/On5PL+HQFmN6F/Sgp7HyVYfrv
	pdAObf6JLr5p9qlaxCUzvwxqfGuqm06zxGwMZhtoCKae75ujeUYzoaYkgjCetkgWWir6M3+zWza
	zgU1oKUMdmzk=
X-Received: by 2002:a05:600c:a087:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-482db48f2ccmr209555405e9.30.1770117541306;
        Tue, 03 Feb 2026 03:19:01 -0800 (PST)
X-Received: by 2002:a05:600c:a087:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-482db48f2ccmr209554895e9.30.1770117540850;
        Tue, 03 Feb 2026 03:19:00 -0800 (PST)
Received: from [192.168.88.32] ([150.228.93.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbc7f580sm149384895e9.2.2026.02.03.03.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 03:19:00 -0800 (PST)
Message-ID: <bdb7cd69-7dcd-4e8a-b04a-14a2eb902311@redhat.com>
Date: Tue, 3 Feb 2026 12:18:54 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] s32g: Use a syscon for GPR
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Chester Lin <chester62515@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <mbrugger@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 NXP S32 Linux Team <s32@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linaro-s32@linaro.org
References: <cover.1769764941.git.dan.carpenter@linaro.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <cover.1769764941.git.dan.carpenter@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Has3wJo3S7B0pqJeCVrbzWs7cKfN5yK177R6-ELqRvQ_1770117541
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/30/26 2:19 PM, Dan Carpenter wrote:
> The s32g devices have a GPR register region which holds a number of
> miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> anything from there and we just add a line to the device tree to
> access that GMAC_0_CTRL_STS register:
> 
>                         reg = <0x4033c000 0x2000>, /* gmac IP */
>                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> 
> I have included the whole list of registers below.
> 
> We still have to maintain backwards compatibility to this format,
> of course, but it would be better to access these registers through a
> syscon.  Putting all the registers together is more organized and shows
> how the hardware actually is implemented.
> 
> Secondly, in some versions of this chipset those registers can only be
> accessed via SCMI.  It's relatively straight forward to handle this
> by writing a syscon driver and registering it with of_syscon_register_regmap()
> but it's complicated to deal with if the registers aren't grouped
> together.
> 
> Changes since v5:
> * Fix O vs 0 typo in yaml file
> * Add Jan Petrous's Reviewed-by tag
> 
> Changes since v4:
> * Return an error if regmap_write() fails
> * Add Rob's Reviewed-by tag to the yaml patch
> 
> Changes since v3:
> * Fix the yaml file format
> * Add netdev to the CC list on all emails so the CI triggers
> 
> Changes since v2:
> * Improve the documentation in .../bindings/net/nxp,s32-dwmac.yaml
> * "[PATCH v2 2/4] dt-bindings: mfd: syscon: Document the GPR syscon
>   for the NXP S32 SoCs" was applied so drop it.
> 
> Changes since v1:
> * Add imx@lists.linux.dev to the CC list.
> * Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/
> * Use the correct SoC names nxp,s32g2-gpr and nxp,s32g3-gpr instead of
>   nxp,s32g-gpr which is the SoC family.
> * Fix the phandle name by adding the vendor prefix
> * Fix the documentation for the phandle
> * Remove #address-cells and #size-cells from the syscon block
> 
> Here is the whole list of registers in the GPR region
> 
> Starting from 0x4007C000
> 
> 0  Software-Triggered Faults (SW_NCF)
> 4  GMAC Control (GMAC_0_CTRL_STS)
> 28 CMU Status 1 (CMU_STATUS_REG1)
> 2C CMUs Status 2 (CMU_STATUS_REG2)
> 30 FCCU EOUT Override Clear (FCCU_EOUT_OVERRIDE_CLEAR_REG)
> 38 SRC POR Control (SRC_POR_CTRL_REG)
> 54 GPR21 (GPR21)
> 5C GPR23 (GPR23)
> 60 GPR24 Register (GPR24)
> CC Debug Control (DEBUG_CONTROL)
> F0 Timestamp Control (TIMESTAMP_CONTROL_REGISTER)
> F4 FlexRay OS Tick Input Select (FLEXRAY_OS_TICK_INPUT_SELECT_REG)
> FC GPR63 Register (GPR63)
> 
> Starting from 0x4007CA00
> 
> 0  Coherency Enable for PFE Ports (PFE_COH_EN)
> 4  PFE EMAC Interface Mode (PFE_EMACX_INTF_SEL)
> 20 PFE EMACX Power Control (PFE_PWR_CTRL)
> 28 Error Injection on Cortex-M7 AHB and AXI Pipe (CM7_TCM_AHB_SLICE)
> 2C Error Injection AHBP Gasket Cortex-M7 (ERROR_INJECTION_AHBP_GASKET_CM7)
> 40 LLCE Subsystem Status (LLCE_STAT)
> 44 LLCE Power Control (LLCE_CTRL)
> 48 DDR Urgent Control (DDR_URGENT_CTRL)
> 4C FTM Global Load Control (FLXTIM_CTRL)
> 50 FTM LDOK Status (FLXTIM_STAT)
> 54 Top CMU Status (CMU_STAT)
> 58 Accelerator NoC No Pending Trans Status (NOC_NOPEND_TRANS)
> 90 SerDes RD/WD Toggle Control (PCIE_TOGGLE)
> 94 SerDes Toggle Done Status (PCIE_TOGGLEDONE_STAT)
> E0 Generic Control 0 (GENCTRL0)
> E4 Generic Control 1 (GENCTRL1)
> F0 Generic Status 0 (GENSTAT0)
> FC Cortex-M7 AXI Parity Error and AHBP Gasket Error Alarm (CM7_AXI_AHBP_GASKET_ERROR_ALARM)
> 
> Starting from 4007C800
> 
> 4  GPR01 Register (GPR01)
> 30 GPR12 Register (GPR12)
> 58 GPR22 Register (GPR22)
> 70 GPR28 Register (GPR28)
> 74 GPR29 Register (GPR29)
> 
> Starting from 4007CB00
> 
> 4 WKUP Pad Pullup/Pulldown Select (WKUP_PUS)
> 
> Dan Carpenter (3):
>   net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
>   dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
>   dts: s32g: Add GPR syscon region

It looks like patch 3/3 depends on 1/3 but it should land in a different
tree, as patches 1 && 2 looks suitable for 'net-next' and 3/3 should
probably go via the arm/freescale tree.

We either need explicit ack from freescale maintainers or this should be
split across subtrees, right?

Thanks,

Paolo

