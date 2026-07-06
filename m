Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40868430313
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330511; cv=none; b=YqvcMlzX8NFPtNIcqh3GcqPeco8p2mf6qX9AXh3BQSW+bTgxIVLpNCWWIhcfF/p/LQLGebn7drjUhpVbg7XDh7ABY1PgYAbddBk/+CtngieoPV8yw8KWKgGLGNMGIs4muDHrryxHrRRLodu1vTlokCzSg/mxj5f6FnxBXTWi38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330511; c=relaxed/simple;
	bh=YxfzF4NLpxTdbwnrEpFDJDgVz9m0arHwW0oHfP/qPtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jKpukPrcKSstcoFffbY6iKqu/BDJGHryIM3tj30IMtafmGQQ8GqK6i9LDi7a5anaikzKj54RRMWvdFQwGRmIoyFkjK3XcaN6hX6cehSVa2zrBAJTq24VRpxsxzfEJkcZMccEjYrXjF8SG9H2l/AqjE/OSNCvMe9bt4udnL2TbGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7v0J4Qu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7v0J4Qu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b27c7451so34208775e9.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330504; x=1783935304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gChBujE50o+E2TRUNjFqwotu6HuQ7YJSYME1WfOxq9A=;
        b=Z7v0J4QuVtX3+YhB2UII+IkUpCdenuXxREgtRukylmMbQK6Bo6FwIZN+OMYy4CjCkc
         GiMLEoZIAAYUdNKJYKcitKCElZaLYzvX+d5XbEohDoRB4x9MbVBZuUy5OB9zKR60Y2tq
         +NLJbJrS2W5RuVFfUsV9oprfrmc3Qh4ZFGBwm6eDEEM+fKR2XXpH2tzkP/eImcCmODOb
         BqUwzUcWTn78PLtSB7O2AhehuWW71ib+Em7uJJgXIkWYdLxnLVM/cLJtbNLaC3cUcepR
         86EAxxGw0PUDQ2enbrmnI9dz2viR9cKbJwjlGK4tQuBtuh0igfL3THXDBq9LZFobal1p
         hRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330504; x=1783935304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gChBujE50o+E2TRUNjFqwotu6HuQ7YJSYME1WfOxq9A=;
        b=gEeLp28UnRcXw2tR1daUpNEkpsuvhUXMaRXFE7muJrVsBo7/Vm5XnG2LHj1IY7PnDY
         JootYVPWMJhHyrM13p2aMm5EYTuWgzetv/5zWrttKMOE3/E3o5Z/1du2XwTQuIbPh5ND
         sRmxSSVnFeZ5KIGdGGua4bIZHJLbJ1ZAwYDhj1Lheyy0902ubJKWAb6HdeVQS1cZ7Er6
         4mRppBXO+S4+B5M5Z//pJ1bUe+IiDg8xFXepigAP1nYkvEE2VCx+dSHsf+kAW5sKujzB
         3tlSgHc2B5AqQ4w/fYicsThinEYHoMoN36xOiPtyr85WXIz+VWxyHrNv8pKnh8i+l8iM
         vf4g==
X-Forwarded-Encrypted: i=1; AHgh+RrxTOBZpf2MmgG4GmsDok/HqYKihuXFke//hBdBkiOnUU0KT8FC7lPcy1IY5hE70sH753I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+pPsfsGzRSSlXTicKEzoI+WTE4ONsKa0S55KDKfvELjec0nLK
	cirxpJaTVDPDt6XoCuk0cg3wYbTXF/D72d0HCNwkslCeQ7tKgaQXscTs
X-Gm-Gg: AfdE7cnzF52oEMJ435oLIvl0DhJT13WJajVfmiyz0hG8vn3fVjasaFaGXe0bCSpJSEz
	W453Xek9g6TWsZzMrxwxyBPF6RT6FPn/HGVfoWfFGlnmuGmuYSwdihAe8/ZpQfoqsDfLPZdTi6K
	KZvyzzSGSqnvbI69gtlpuH7eiF1hxDLtclnIPcQlVIx3KQU/ZhCahOSEwJo+8pRKVjaH9YCagYn
	aHZ5nW/TDoliHshQ6o4hX/nHGiwQLGUCuahceq4ZgRlrSmoj+FFbOpopkvhW4ruEv+1PnbSaSoT
	/AQ1gfcu38nwjFcHa36Lx+ZtwWGV+nM8yyZ9buZ5RyptvIcrYhNsT64xYbNV6Bepgh4pg6nDw9S
	aFD83KlkRunn2tKemb1/jEBnGD3UAVCX/KTWa7/7CpqG67Fj8t29DpQ7WIoRjKYiCHXNPr5U8Pu
	mdWgB4uWoVSZJoQ9J6lGYh9qcF6U8FqvLyzwqGy4UrUccAf6/d3SNhbDCXrG4hbW2wQJO1IV4O4
	gbz3GhevRCM1G6tsHWnU0OMfA==
X-Received: by 2002:a05:600c:1d0d:b0:490:5000:917 with SMTP id 5b1f17b1804b1-493d127f020mr90286025e9.1.1783330501114;
        Mon, 06 Jul 2026 02:35:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 09/15] arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
Date: Mon,  6 Jul 2026 11:34:39 +0200
Message-ID: <4cb1d292b7899c72cbdaea212dcefc04e6705dda.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the FlexSPI controller on the VAR-SOM-MX8MN and add the
corresponding pin multiplexing configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som.dtsi      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 7a4c7455a162..0bc9fb44069e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -176,6 +176,12 @@ ethphy: ethernet-phy@4 {
 	};
 };
 
+&flexspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexspi0>;
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -454,6 +460,17 @@ MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x120
 		>;
 	};
 
+	pinctrl_flexspi0: flexspi0grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_ALE_QSPI_A_SCLK		0x1c4
+			MX8MN_IOMUXC_NAND_CE0_B_QSPI_A_SS0_B		0x84
+			MX8MN_IOMUXC_NAND_DATA00_QSPI_A_DATA0		0x84
+			MX8MN_IOMUXC_NAND_DATA01_QSPI_A_DATA1		0x84
+			MX8MN_IOMUXC_NAND_DATA02_QSPI_A_DATA2		0x84
+			MX8MN_IOMUXC_NAND_DATA03_QSPI_A_DATA3		0x84
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
-- 
2.47.3

