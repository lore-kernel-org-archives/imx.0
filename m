Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE4A1CDFDA
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525992; cv=none; b=rqNlG4HjNnzR57PVNwR7bZwGl4aHoAH2Sy9lFePMfYbPEjiY4qMnu4vR1T3LzhXhJBfr589ycsPLiOkyNADJRo2Pvp7OGOwmaOGZbg8MUgx0lOfw9F55mJUnRlxbyvG38wW44ycrz8yU6lVWDdcTHZ4YdFIYB8OeqAYSq3iRKiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525992; c=relaxed/simple;
	bh=Epo2f8CClFWOU7OZcabjsgsgMJkLE6WS88mqKAYz3SA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KU9DO5Qqt5d6Nb+AD46t670KPyjsp/Kh/dCbNutO71jxaTqfb/Ww4lqpb5dbnreH9BjF8oYca0oh/vgn8atMh8YMAMYdyU66wVJhba5PLHk0tBfw+qXIHP9auoMSE/R/khicn3Ah4oG2tEHk1mGlF1SPbQWqCLtA0h5YjGDsOG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qgkg2DTA; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qgkg2DTA"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso561961566b.1
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 08:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729525989; x=1730130789; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2chh1gFajejKZHrarLEBUexr/8trAcrKkIwoVI3Z4qg=;
        b=Qgkg2DTAJjdHdTQfztdaix9I9SDkF2sM5Q0FfW6r+k/cyYqP4Fjlz/0eUIsKrVXlZn
         JPNbPM7v0IqWWyKdeIYmYW/iWOBRP2BxHq8WJ+T3/EO7Pi56t2TRM36uM1ZOD2+/fo9E
         uc1G/9UjKPDVXCFGnfVX7P0Au3xxplbcEBIO+BItggr9ix7fbvXvVefYzBEYks3YK8wP
         Qp2gsn68pLDgpCUfL8aECR+7gIBwjwEhYVRFOv/ELM/c7HD3G+ZsKMLAvlHNTD52QtSe
         81rvAfxBkGnHvkMl/ev14wSliDxlYPOzK38Y1TtVL7OAPXl9y4z7d3t21ltY7ek8UThQ
         DItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525989; x=1730130789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2chh1gFajejKZHrarLEBUexr/8trAcrKkIwoVI3Z4qg=;
        b=DS5lVabJYps0hDbWOGTdf7JISRQpZ9IxXvaHf75ewcwID+6uEzouPSsGtFMd+qaH13
         +DFocx0klY7b7xZpghQg39AD3cSbtupUbfPmKaevWGqJvIvzHQxahu+aTxtQsO0D5HMb
         3oUK5xdovhntYGKJI1YJatOJ7T4aucV0NdgL4Hp2F/QNfcEc2YiVvxV2jVx1uSWauo82
         +7BlCabJg963UJPw54jXD5mvM2qwj+eagmGll9L27Z83fLXayZxBfX2IDpDmPqu5NZTZ
         anxZwhIhf8eHukLwrAPrbqmiFkoFMDpYXcxNISg+xkEEoigb2sJjwYdOCkLBpKElF0L6
         tCUA==
X-Forwarded-Encrypted: i=1; AJvYcCWAdCsExeLQUWRGa5r3L+VjcrSeXdT949cW4C7iYbtQKOcw+sPAh7A9Y1JqRMt0O8EDTQg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBRaPhYltlOCnnE5ViWQLvzWjyD8fd0hgHoNOWDEfLxd9bGZ4b
	DLbQuIfxjEWRreHJ06FMqFiq2F7Ov+rH8aEOzWn94M9BcwSWQLfy
X-Google-Smtp-Source: AGHT+IGakfEy8rOuT2uN5Y5ML3kJAkTNrahvSRBkdLnfVpcFg+EpcKzRgNgLvMofjovBFMrKtZNDzA==
X-Received: by 2002:a17:907:9628:b0:a9a:e9c:1d8d with SMTP id a640c23a62f3a-a9a69a75087mr1048668566b.17.1729525989094;
        Mon, 21 Oct 2024 08:53:09 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912edfd0sm218614366b.67.2024.10.21.08.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 08:53:08 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/6] arm64: dts: imx8qm: add node for VPU dsp
Date: Mon, 21 Oct 2024 11:52:20 -0400
Message-Id: <20241021155221.112073-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
References: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for i.MX8QM's DSP, which is found in the VPU subsystem.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index f8b577ebdbef..abd7cfd9a6c2 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -581,6 +581,32 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
 		clock-output-names = "mipi_pll_div2_clk";
 	};
 
+	vpu_subsys_dsp: bus@55000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x55000000 0x0 0x55000000 0x1000000>;
+
+		vpu_dsp: dsp@556e8000 {
+			compatible = "fsl,imx8qm-hifi4";
+			reg = <0x556e8000 0x88000>;
+			clocks = <&clk_dummy>,
+				 <&clk_dummy>,
+				 <&clk_dummy>;
+			clock-names = "ipg", "ocram", "core";
+			power-domains = <&pd IMX_SC_R_MU_13B>,
+					<&pd IMX_SC_R_DSP>,
+					<&pd IMX_SC_R_DSP_RAM>,
+					<&pd IMX_SC_R_MU_2A>;
+			mboxes = <&lsio_mu13 0 0>,
+				 <&lsio_mu13 1 0>,
+				 <&lsio_mu13 3 0>;
+			mbox-names = "tx", "rx", "rxdb";
+			firmware-name = "imx/dsp/hifi4.bin";
+			status = "disabled";
+		};
+	};
+
 	/* sorted in register address */
 	#include "imx8-ss-cm41.dtsi"
 	#include "imx8-ss-audio.dtsi"
-- 
2.34.1

