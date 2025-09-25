Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5950C31B827
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758832810; cv=none; b=nhB6B+DGQ8Ex39lH5AOJyA5fD5MKemmqtMByNPJ473N9ExESFPB0bV05jqHuzk095j6Vf22vIZKH8tefIXK+LVohSD7pHfe8v0VURN5w+XQ3Fn6JtIyXCSE/H2mVn3xicV44WWerD/aVK46rxRwwmA5rQJ8PA0/1OpCvWBQ6XGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758832810; c=relaxed/simple;
	bh=hP+/NvM9jHnJ2xCI+k45GtpeQrKIuoZB2aSOb1jDAzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZgy9tg5xTAsLNZ399+wusfTvHxZ41s2iifqjTpbl2f1rujC7uCHslGH0TGngGas3hJd048TNDhjVUhjcEn3mSSJQDxJ0WIuyCv5Gc1Zb3TUuaH7QbkvLeIXLj1pvCk1f4mIcDGamcT8FwQZvtZPUnc7wW1C5hi6McjvCyh78wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tw9oAd/0; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EhWJg2Q3; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tw9oAd/0";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EhWJg2Q3"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cXlvh5t9Yz9tlt;
	Thu, 25 Sep 2025 22:40:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758832800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8koV1fvjKiqOdvzKlp9HUEyXpsh/bOt/eJh59SuqN0=;
	b=tw9oAd/0nPVG+ZqrX5ftdXicdGXf6TONCAZDOTiXEQuj9NjjLTHnQJHOTkkJ2bkxPoR3ow
	0Xl6j4rQ6mEoXNjaZkabRoELfntTT5avosRpLDKA6CnFmxrJQjLu+L9XxNTFYfE+2jcqIY
	bRVSRhUGEvBAkDWzDIWv8H1NcIBdsYHqB5JMqqIXDk+wSvjAVCmXi4bbVnNO6RyluhgwQ/
	EkMvX7lnvsYGckdsPOXzuUZMmgZsBhA+QlGS7YJTqkjJEHsA8d6AFeuSNcVbdmkrT3m9G4
	MFr1Nkq65TWjFAg1YHrq4fz/5W2nfgQcZRH5ekFBWzZmVAGkTe93jVFVjKEF5w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=EhWJg2Q3;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758832799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8koV1fvjKiqOdvzKlp9HUEyXpsh/bOt/eJh59SuqN0=;
	b=EhWJg2Q34oGjQWLISNkHlAjeZKU8ZoZbnGKu831ie/uwq2BLWG0FiL6AqpqQhsBcDBTky9
	RKbULQY35QcMpFTFyQ8vQzLd1Tx5PeYkKub+sk5w4MTUDLUpcn7dgueKyNcmDWeO72h9Fa
	112GLO0OhbLaOZYC8fOY4f9MSLI9YNIzLZpR+h8iiTBnjdxFtfiZIzVeLiifIE4YvuBsjf
	nG9vyX8QcFikPDUKneE7Hzkrv8QcSo0mQ8mCXvDmosXZK7NPLkEVCwLV8FlK6fkIP1pLWL
	NeSc0mOg3Z27TzUCgPJB2mPYNcN9yhyhiSvSWQETPCxbo0ZJnSPcL037Tl9lqw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Xianzhong Li <xianzhong.li@nxp.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Date: Thu, 25 Sep 2025 22:38:31 +0200
Message-ID: <20250925203938.169880-2-marek.vasut@mailbox.org>
In-Reply-To: <20250925203938.169880-1-marek.vasut@mailbox.org>
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: eyft1zef34in9duhjg43mr6n19w4thpg
X-MBO-RS-ID: 383f404b87e193c4b86
X-Rspamd-Queue-Id: 4cXlvh5t9Yz9tlt

The instance of the GPU populated in i.MX95 is the G310, describe this
GPU in the DT. Include dummy GPU voltage regulator and OPP tables.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jiyu Yang (OSS) <jiyu.yang@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Xianzhong Li <xianzhong.li@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: - Drop regulator-{always,boot}-on from fixed-gpu-reg regulator
    - Keep the GPU and GPUMIX always enabled
    - Switch from fsl, to nxp, vendor prefix
    - Fix opp_table to opp-table
    - Describe IMX95_CLK_GPUAPB as coregroup clock
    - Sort interrupts by their names to match bindings
V3: - Drop perf power domain
    - Drop reset block controller
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 1292677cbe4eb..ad47b7f0d173a 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -250,6 +250,35 @@ dummy: clock-dummy {
 		clock-output-names = "dummy";
 	};
 
+	gpu_fixed_reg: fixed-gpu-reg {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <920000>;
+		regulator-max-microvolt = <920000>;
+		regulator-name = "vdd_gpu";
+	};
+
+	gpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-hz-real = /bits/ 64 <500000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-hz-real = /bits/ 64 <800000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			opp-hz-real = /bits/ 64 <1000000000>;
+			opp-microvolt = <920000>;
+		};
+	};
+
 	clk_ext1: clock-ext1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -2138,6 +2167,22 @@ netc_emdio: mdio@0,0 {
 			};
 		};
 
+		gpu: gpu@4d900000 {
+			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
+			reg = <0 0x4d900000 0 0x480000>;
+			clocks = <&scmi_clk IMX95_CLK_GPU>, <&scmi_clk IMX95_CLK_GPUAPB>;
+			clock-names = "core", "coregroup";
+			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			mali-supply = <&gpu_fixed_reg>;
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&scmi_devpd IMX95_PD_GPU>;
+			#cooling-cells = <2>;
+			dynamic-power-coefficient = <1013>;
+		};
+
 		ddr-pmu@4e090dc0 {
 			compatible = "fsl,imx95-ddr-pmu", "fsl,imx93-ddr-pmu";
 			reg = <0x0 0x4e090dc0 0x0 0x200>;
-- 
2.51.0

