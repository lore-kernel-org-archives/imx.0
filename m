Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3146481244
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492386; cv=none; b=YvGGQSuVxfqSoRe3Ou8zxXOlIc7jXIrl844U3TtdA4h4fEB18sk301kS7Jq1e/2EF/IyvbWmEu0xj5C4h6q4+bWJvh19DfsYqpjgJekpdEK0r0bnruFmM+PjzLEFwdt1oQEXsipNkcG2MgFZUaPQMzo+3jcEWSh5PZ0N3Ilc6g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492386; c=relaxed/simple;
	bh=4h1Q7+2YaPhGhV6oc9CjfjSPT8Bgj3OdcJgRQq8MMEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZe47E2CttVABf2+MMASPtRmc2wtnHIK5j7D9ouONj+NOCn8Q/2EOKmRmcOl81bd7KebznKB3+vsBqx434fQMV2fHZwT/JHczKnhnaVnt/hE5ZQkh26DdhHH1k6oM1EKgxUs2Xbbuh7ew2PFSaHbmiLD/hMSdD9WdEwfQrDcZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXqutfsI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXqutfsI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49068493267so75672695e9.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492380; x=1781097180; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPCrPM7joQMUH1pWXZjT66gyl3muFxaL8zTs3UpJDxQ=;
        b=cXqutfsI4hcTBKhBBg8Uzz4bRdxNUhBdS+SxMWtY2vCzoVDUqO3BxITGChGg1ACHno
         nGv3yS1oY5Rv5j8GudarBW7qGAEAE64pUYnYG5D8Paf85ONNjv9Fx0bht1fuXvpSSxU8
         eHDjMBe+XNhVXSGpqmWdgCTVDFeXpw0PudUkHjuTbfIINN07HcwQgHBHNafQjd1RZMrq
         TnWUZVHaMv2XKVlaxCLCzENb5Ok2r41kLW8016LCrln+lMSXUy1bfpYqja2SLbzv7EQn
         CYy2kFkbVJuIa2Kdc+A54XsNnNuCoLSicDci+UCriDMOGn1OBQSOBVuYd40HFcuOXw1d
         VLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492380; x=1781097180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPCrPM7joQMUH1pWXZjT66gyl3muFxaL8zTs3UpJDxQ=;
        b=P2hOET9WFh17U1SjhqKLf+qR7MdfwwedBd6fWy1bJ+EuQvZdT9yyjYH3RMH6tI2Hfs
         Swq7QDaFIvr+zcYY0ctXaeiNV0dD0+HOM7d7a1bFKl7gHfolXG1r6tshjGcdus4JO2yU
         orjiffwt/P/CWFhlmInrco1SBoOYewoxduIUlxq5JaMAppRZOp7rb76nh8HNTfQ9FlR2
         g1rD8JhjFOj2bUcKwg6+TAdCMfYzYSmM2ACzQ7xAwcc9WCllKTI2vj7pH5+gw6xpuh8a
         GGbhP2UgGMqmdrgH26FNpzGuKVH0s05UCokwwoJ80NYMM134swcYWRThhKB/20CcH3xY
         gtFg==
X-Forwarded-Encrypted: i=1; AFNElJ/1PkEDLekgbtlHq6Vh3uVR0gDfh49jniqHaYORj07IjIyrOMsGbE6LmFhh+KIiO2+8Xzo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHRRlGIUTEIJDd0lxagTHsq5Ubb/HpxN72uc/qvehc/GHRQSzT
	FHp8J+ddtUeaDtpTDDDchiumqfR9ArMCSblK0eIFRTHlOMsmKBpgLdcT
X-Gm-Gg: Acq92OFQ5jRiQPR00eNCzL33l132JkwPvsbzFzo4ITIzlcpxYaR3uhpgdWQHlmWSm5g
	YMOKdsqtdVZG3IlibWSL4vfkjFkeFWiEWvZPMXWleiTqx2e49/7bleFosg2hiPsc+aQp2wtFfCm
	GyKpVylCpPevzgrUPIpokIxxkZVbAvCmdq+yCMtAPc6EF7TgAJoF6+vHLQRT0RRxzU+R9ITq5GI
	5cgakwW4FDIBSHtmFDn5tlac8oavZR3sQ61am2XZqwQOsK3Kcv01QRysh5JrCflGgQ3hfyYv3HX
	HCAbTnJ41xG70+J/Vs8Yi2WxOhRn8zEHoDhZQRUth0CZ9BGzEZvNkkVIOLd5Ps2/Bt9f3MpnRIi
	C+EYmw79yCK0dMmr/eb2ooMo+AUDifH6BZoSCYD73ivlMoKzLoZlO+B7IdrvYZf6cs/n4aocR8A
	LxygYzJj8gH19OvegYqTgltPKJwsTV9fzkwvMIm9SwTPjhPtBSIMOMnQeQe3Ef6I+3V4X/j49uv
	nylFLt5JQpANhebHA5EAm0oiMbAyBMMLuU7L4UUTPubjOscOVedSIV1tkw=
X-Received: by 2002:a05:600c:4fcc:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-490b5eaab2dmr58645675e9.11.1780492379682;
        Wed, 03 Jun 2026 06:12:59 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:59 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 06/12] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Wed,  3 Jun 2026 15:12:44 +0200
Message-ID: <9a937fa5f65dd23515d4e32f8a9cdbe5a674c9a7.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Configure the PHY to use an external reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 9500c9bf0f42..a928dc2d9adc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,17 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3

