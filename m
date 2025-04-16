Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D595420DD75
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 01:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765320; cv=none; b=u9p4nq9FKP7xzDC9nYlcV1hQdw5iL1vazshpy0+ewDGf/OtX6pW83MAU5vXBPVkzAv224hl6txG9JPOfs8H5SmuyipUHVUZ3pe2rgF0RwPdeDqoFhmsct5hHwmuAINfED1OmK8hpVPrW/NUVxC9vLlk81yBK8H+xLpY9Tx5WHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765320; c=relaxed/simple;
	bh=FPvd4mqFKus4PL6m7SnM6RmFtUcggaxSYz3gm9nlBi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBlmdYAcMlqdxr5b5ZQPY4HFDjHJGZelkGq114FNk20P4yKhXgws3wxRS7edX8/tLCwD6JYgXrFhUJZ3kUy0gAj0SlKRM8cNmZ8S1+jGBWl6BXU1wpbk/W4MIwpClmeY2L7udAZec8LVA6T2gcfTaLEJSiJecFlYDJ2MPcR9K/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sl0APmV3; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sl0APmV3"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4769b16d4fbso34641001cf.2
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 18:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765318; x=1745370118; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFICO/f3GRYnQyGnM8JAgOAEAAxAb7Le1DtrMpG+6/M=;
        b=Sl0APmV3ZcpZnJtpXbUVJSWGswVTjILhgFil28V+pJxLL8kvTdFOu0F1KYl3aAXRzk
         6nsZP9MkPaRylNlgmwDVYD01JGcSOc74XcZGVGVbEtLQUkkR0NMoTDftVqGaf/CoMbPI
         uv0J7dbetWIQDa+pmCeXI9CffgbIKq0e54y7ZevvvkRI+5cRI3KSwMP/pYm8slqFK1fx
         Pu+DIrqB+Ctsk+dAS2eMfuEr8jvxb+FL5xrNIjqv02AsgNdcH1PTryr8O/d8Yv5vG/HB
         94m88Drkbyw6mnP3PMqwWhg/qymeM1ikwbowB+CeCWFGqup+6aQOjpFGA4hcPth7XBgh
         pp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765318; x=1745370118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFICO/f3GRYnQyGnM8JAgOAEAAxAb7Le1DtrMpG+6/M=;
        b=ad3xvMzLeUaYayr+SsuXZqoIGcBoDr0dGQpW0tCIaBliUvVZ3uB8ZlRODWClv1meaB
         TBDpf3Yv13F1l4nhJXq7FKZkxm1p476cX/eZDpeN+34sZ1b5a3aWeq9qostTvOPPQbS/
         /JgPcjicHEXrX/LOacUHnZptHAPiOgJ3qYbX5FlXsN/R2+keZDTJaJi6KVaAEWhaOBo8
         JHgcg2pi5k2QIfSBm4BmEohiYpfD2UZLywf06z707NOe9264n5FNkh9Ksg2lzEko6YTF
         +pvDxuL2vf2fbJLtKjaD11OSUDsXludqsk+ePMOI8MXU0xEqZPnhvcSCY0rWBdQBHsn6
         FWXg==
X-Forwarded-Encrypted: i=1; AJvYcCWuwELqL8b4zEIjexJxdsTRVi2rwcu5Qzy5EtRz+SS7FxVSJoPamF6i1PFGm8ApmZGi9Fg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBPTmguVIIpA17iM1bStA8klU66qNBz/gGshyZS/s8rnLO4yW7
	VViTZT9VH3iHlz+Lnnzbow6YouCMYSUZOR19KaScke2tz7az7mCt
X-Gm-Gg: ASbGncsTW177BINB+PLvz1JGkpxDGukz6CVFyci3RExdZu7j8XhU6VjQS8GdwNtLvGt
	dslr0TW7v+UwpPlr29b52d8ByGhjTaX69p5+Z6Hmmo6Gz1f3qrEh2B+raS4e2zMeYSxPCY8KKBY
	gDtubvdnPHlmsa1pNy4hOnW1Qs6DJX01qHNwI7SoSxw8fbyXHp7sVT31YLDrUq4nmOad8F7ySxc
	2XenyAjq9KUrwW5KFO3cHngNnjkPHPrdNPAHXNFF2Wn79N2Wdi7u3RuXg7l+K9yiPEPEeVjerRM
	E5pEsqHFzih77JFzaoXzkEFww/KuI3MuFzyXH9cbqfxXI8J2a+vtVXVFP78NF9oPnMtw3Qf+U0e
	go7K9YilYYkR96lE=
X-Google-Smtp-Source: AGHT+IE5vymre3jMvOIqMTFZOIcLz3gAqcPHBCaqYI7xneF2ijTBn4EouQOs7gqt1Ik+3CpFQFHmTw==
X-Received: by 2002:a05:622a:114:b0:476:8cef:4f0e with SMTP id d75a77b69052e-47ad3a3b807mr19517671cf.29.1744765317693;
        Tue, 15 Apr 2025 18:01:57 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:57 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 06/10] arm64: dts: imx8mm-beacon: Configure Ethernet PHY reset and GPIO IRQ
Date: Tue, 15 Apr 2025 20:01:32 -0500
Message-ID: <20250416010141.1785841-6-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ethernet PHY setup currently assumes that the bootloader will take the
PHY out of reset, but this behavior is not guaranteed across all
bootloaders. Add the reset GPIO to ensure the kernel can properly control
the PHY reset line.

Also configure the PHY IRQ GPIO to enable interrupt-driven link status
reporting, instead of relying on polling.

This ensures more reliable Ethernet initialization and improves PHY event
handling.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Update commit message. No active changes.

 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 9ba0cb89fa24..ed7a1be4a1a6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -78,6 +78,9 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -315,6 +318,7 @@ MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
 			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
 			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10             0x146
 			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
 		>;
 	};
-- 
2.48.1

