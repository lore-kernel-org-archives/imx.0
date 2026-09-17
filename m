Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DB55AA689
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659720; cv=none; b=fxy0r3ZA76gz2+03mQBj9nWex7Vyjs8mtnChH2RJNLRDKA5S6Fk2JqvYlS4DHacwCHLZxaChZn3M7HauI5rtgUevEseUdxduZUrVnvHQiYD7ENmxlIdZ1IKahStQzjfNL1A1JDeRTdPq48OOnvoPkN5Pz1kEfSALWNAKqKto9v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659720; c=relaxed/simple;
	bh=Tuw8fjQ4Nitl5LlGiEpAxv/8p17A8gL6CzHwHUI51iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6zdvEgoKsLon1pyV6l7WGi8oip+hdxanvzmwOZ+08mHYi/JEcZEzoTnEHkyTnhbs6i/6yKcUNmCljnnhWehRkXi6xdjImJTCl7TzvMdwIBfy8bgEFrKrvocVgmelrti6Yqk1KMvkAWrKHCERB2Ik1c2dGGmiv7JxZSbPCq+4Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akOFl5LS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akOFl5LS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso5210555e9.0
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659704; x=1790264504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogUWVPuPz4Wv0AWXXjemfDDswNqsh12xy3+UrN+ebnA=;
        b=akOFl5LShnLAvMiCGHKWHpLUtOcwDOAQluk5lEtbhFydTT6x7Jn/ovzKnhx4gMAaBH
         ZwXj3wmE+T2iGJ3TuyPlDrTEiXwijt3ABgwmdc0cQlMyQQ09hQBx5STUvUNAPsg2+DKH
         jnu+ttH/+4giD8L6IrSYEmwFcjWwIIkRUt5JTFLbyba9Hvc5iesL3OG1ezzWmW5sy6Yr
         tn8F0dTTv23ZU97pd+tVCes/HhPO/jR3gCqqwy2kVczoi02eVdie2K7+1gdDeJGE2DkL
         ol/Qe5c23COs3neXhE1SYbt0Ayf4nfudo/HVABqGkeSAnlKeVSMwWlnSM4QO4zsW6ooK
         1lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659704; x=1790264504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogUWVPuPz4Wv0AWXXjemfDDswNqsh12xy3+UrN+ebnA=;
        b=T7di4KHms7SxcYJiiJIoNNw3YmmapbOj8x8fY27QCJs3eGkVt7Nq6EcQ61sSjm8zSx
         g85ETDmve/wD0Lr3cQOLlkCgo62LehlNmSa4EafaMb3FcrOeH8OCBx5+7znuJ36OFiXs
         dsyUnL8JroiSukACrrfVe2UXeJ+OGg3xO2fPnHq7iBTgKX17D/nOxXrUR0mi9jp0yfUY
         S1/Tws38aYoi486LpFFxjMSTx1ixC8hs5I3bbnN8NYeaOhbIBUfXgotWsRTah/7mPQ+3
         t+iBhgHtTQIxeH2S51pODvjxMfGEXyzZUh12qkcA3vP9V2BfISDEW+1bA5bOuwe5LsKo
         vK3A==
X-Forwarded-Encrypted: i=1; AKwUvByfXmE5dM+pK9MfpXGfbTQXlMx8/zxwpZyIDy13lpB55NOQFTY4H41s2aKaCz7yk4btPV8=@lists.linux.dev
X-Gm-Message-State: AFuF++mdtE0yVmvsD9x/+ImFjc9n38ybD8ztC8gZ+znfXKAoKdoEqHHL
	DDRh/KObpYF3CBUxwxPNYvuzKvDNX0xiEQh+QGPhKHCX7fJwGfooYjl0
X-Gm-Gg: AYBFou1EEqRXNSOzs0lkngu6o6Q6Hg2h6F7hpjhrZVnFlfR2YRe2TWURJ3bkWYJ0XUj
	uqIgb2EVnhPMGdXZNLNtO7Tp1Zkc+u+aJyfLvOU2d3pZGsydduC1hYDbWItOnV3+gDiNXMCCeWX
	L7FyPFrHjSbBFgQLFwB1u/yemICwAKGdzekNK0b+XjbvzL+ejVhAUaorNHl/jgheZ8pEc1UaHE+
	7G0PN4hVQVNk049a8RtF80fSKLLoRK3ExCtRNe5xCN0a2EZFkSfkWjETHGY27AJJCFd9XUkSGdM
	isgJKXFEbA6utkvs6FUSVAqtCksK2LqyFj91gaq1QZQ2+m9oKvr3O/l2A1Vj7c9CXdNJ4fK6/4a
	OaRYmS/oi2ILYubU5gXxE6+oGkFAAVmYYsrm3UmgYlTsrbUNmiGc8lkr8uDNUM0Z9Fz64wEpcZd
	WNQH7Ev6YDBEk2dqrqRsEQyy9DeKxalpRYl9ZYpFfu3Dwvcgo20VN+4w3RgDxBaUBbD4fGiXMpc
	sLC2SLhAUATsO+tfy4q/3LKouc/5yvPxIiQVCbQkwN56KJ7WZGWi9vuM8EOLnszgPNOKiUKkIOn
	2t4QBdvwWilnw2aDCQ83SA==
X-Received: by 2002:a05:600c:8b81:b0:49e:69e3:884d with SMTP id 5b1f17b1804b1-49eac45ba21mr81456555e9.4.1789659702746;
        Thu, 17 Sep 2026 08:41:42 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:42 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v2 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Date: Thu, 17 Sep 2026 17:41:29 +0200
Message-ID: <57aacae2f4f57e877ba32d8082915d6d6bcd3803.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM available on the Variscite DART-MX8M-MINI SOM.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

 .../boot/dts/freescale/imx8mm-var-dart.dtsi      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c7a9eb23e5e8..953950e55bf9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -138,6 +138,16 @@ &i2c1 {
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
+	st33ktpm2xi2c_som: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_tpm_reset>;
+		label = "tpm";
+		/* active-low TPM reset line. */
+		reset-gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+	};
+
 	pmic@4b {
 		compatible = "rohm,bd71847";
 		reg = <0x4b>;
@@ -452,6 +462,12 @@ MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
 	};
 
+	pinctrl_tpm_reset: tpm-resetgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31		0x19
+		>;
+	};
+
 	pinctrl_uart4: uart4grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_ECSPI2_SCLK_UART4_DCE_RX		0x140
-- 
2.47.3

