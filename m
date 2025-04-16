Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DF220F066
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 01:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765322; cv=none; b=ZlOaFKAW6DYmDrMJQEsuey9sAh0ZMJwK9VrGYtdYYTPla9bUxbPDFkIHpt3/sSLZvI09LCaQ4HraetLB5hhxJMeBNUfiHlFv/mnKKJiwk4CaD85pvPRjurUBPnkIceDhm4cx0PD4/9h30wzoVx1Z2HEdR1FVjPka353gYoySJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765322; c=relaxed/simple;
	bh=22MEmFz5mc3jlZMDV3CcSBulqEhIbycuA2+KNYtCSe4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMi89wVFlUdlMQt8AAeLDSdxeA2MMU8VsyDO3dAztxQ0h4bxekYKeDXN7MczfNEddRsjS9p7bg7wcx/aQAZgNx8GUhA+5ya23YnNq+YCUoXHPuvEARdMyNPTgDdqvclUm3Yn2iQMOW9mhzcOtBsWdL0Pvw6Bhcu0kBlL9Ayu8OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPNCSWgZ; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPNCSWgZ"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47690a4ec97so60348241cf.2
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 18:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765319; x=1745370119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjo4xki33zyLm0/Rt5Gsx8yphQcMjzMQ28GgPBYaW9s=;
        b=cPNCSWgZQzrEW63dTaN5u8XkYQASu+NT73RmlW17pxXBiE71QOZp3jFMaNoYzUW8Ps
         c0aP8YZ9M16d1uS3FSv7QIgrHCvlPTxRt/aCWooyM3Xi5QjjR8mC8dbJcUq1DAXBF6xC
         KeTgc/P65/p4Uedrow1DodKjRx84fkn8eBjhNfkg+QN3kS+puzeh6viTrQPeqFD3bE6/
         wwnJ/kstg/rU8DSFJl7hl9a51WN0IN5YVZ+7hyb5WAo3coig6LgD4lF22kjtvWKagn0U
         yEDlLRo60wjob1N0AK4dbItuBNt840KLH7Ei+u/G8ndwibpzm85ouo9FzDfjFc1sFhkT
         +iTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765319; x=1745370119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjo4xki33zyLm0/Rt5Gsx8yphQcMjzMQ28GgPBYaW9s=;
        b=kJdTditir01Zurrq+CUovaNLJNKI01nchPezLr775metYMWWAHIg5hO+e2F5wH17Fz
         eXOcOFJsFtU/vp1nABlA9+mUOFd1mR9dF0V7zeUo0+Eymc/jLcF6vmCmOs6YY4fmRVaw
         KvIWbOHLK68ySSGXQCxOdtDybR7+wRQVh0HfC2CK9jlwSLiedhxvdlp7LR+7lHBqeuCX
         xhBO6xqqIlIFQN57tlGIMb8V4WfCPSkF981MsVW24me7VwtuuGmzb7pqDXjtdpFkKCJ7
         7NSHGrIV+xrk8Hze8fKXAVJhf0HDzLgGIoUL7kd17LHfUmnDRhyNmIhhrPc+hCtsF/t7
         KcoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUABAfOmJYqsG+2H3kIMHVvME1KuRuVasEmCdLoZ2BlpSC3QAGhy3dvlZZNKKVfburXNVM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws3LQT9LkEsgYBw7q7ks9jscN3ixMXVv7Tcxb167VkSyzh1LWV
	91icKl0yTYMzJ7MnBzmMbc4dJtYOjmtBTurBDVJgaoSti98UqL1Z
X-Gm-Gg: ASbGncvoUg2ogRZnv64NFkdSRMFsYFq/t+SUk+d7m/5Eq5nD+PcCblMt6++J73ocfa0
	UGoOnMYlVA5OnyMz11NxezOjhGepTEjTR4VUT9nirYSZaw03JM6Hj3+FhuhPx0LAuDAsxIrKIw3
	KyIBWi86zFl/FbzsU2ABfszHb3fBtK2zNO3m+WgIjMLJKmzsz65BTA9Oxw/Cd6FG/43OPjJcOA2
	sHTTM5FFBqTk2jzJ2eM2FRkDiEUPOk0jOBaHYgzh/Gtb/PvKLMsTWH5wDerwKYBP0gjnSixsMvN
	9JLESwFWRHWjF91BTYLbIHDYOAyecHOeYRX3JWca055n4ehHY4hfqz9EBS675xGs6dP8Z9gk80H
	X7+RJ+4ghv/RWmSU=
X-Google-Smtp-Source: AGHT+IGSMllLvdBmoO21PrxCrBybdmOg5B+CK/K/ej/O/jMGk3bZh3tsbpTy6til3V66e2jkSmJD/Q==
X-Received: by 2002:a05:622a:1e0c:b0:477:64b0:6a2a with SMTP id d75a77b69052e-47ad3a404aamr25266811cf.26.1744765319578;
        Tue, 15 Apr 2025 18:01:59 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:59 -0700 (PDT)
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
Subject: [PATCH V2 07/10] arm64: dts: imx8mn-beacon: Configure Ethernet PHY reset and GPIO IRQ
Date: Tue, 15 Apr 2025 20:01:33 -0500
Message-ID: <20250416010141.1785841-7-aford173@gmail.com>
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

 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index bb11590473a4..b3692b367a42 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -88,6 +88,9 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -326,6 +329,7 @@ MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
 			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
 			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10             0x146
 			MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
 		>;
 	};
-- 
2.48.1

