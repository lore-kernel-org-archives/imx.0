Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D704AA579
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 22:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683966; cv=none; b=siOlh+LEtfs4mPAjp9Bf/5YEjmCM9p9lXwV1BonLRq12QbGnJlNIko4WL8PoNV5LoG+L9DMHdB3Qs+ZvRYraiBmv2xzT0aAKoIo4sADhRggDsjwUYEaRmdFkzEHNVO68WYqewmB9UoT+ayW7BNIVYfMkJlDDqfMe2nd8F+O+BZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683966; c=relaxed/simple;
	bh=YNadVpadLjDA0na2fK4MaKW0QAVOEpeP6sOsWElTD9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lo3L781SCfR0SJRUjBL99WqYV8a23+8HdZFNdpSPqZHVEZg8/yJg7eTa7kGk43RUHLXwchPLuJpRSUq10u3GWuKgSR0RgP022PyhoBhEVFK8F3UWMTwvVjCESz2s1Y4JeB0xq27E81H8JKvJYLuaIIMjDdd9M/BAhVyor84Y5HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ida4RX0g; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ida4RX0g"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso1467045e9.2
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683963; x=1790288763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p44TxhNKudxJKjuTHjYChz9yjXZoZjxwqz/JOTq8TSg=;
        b=Ida4RX0g68AbLGAtJkjT3uTk8BIYoy7pMt00cATVh7INtxd7BXHcBf+K9BodK3S+Cw
         IaKsimMUIcqD2AZ0ZJO2OiTBgzUU2HsrRVlS0VjZ4aSojf+lNxHo0f/Fmh/Q8OMmVbHX
         qoROhZS1YS876T7GSbBTHxZB4OCmM/8UTomeNVG0G+HDfsnOiMvPad2G4YDfK/CxlRYm
         hnftLg6MAgWB13X8NfP/yypHoEHZ/1CTVO9eLsIPNx2M4ECU9+/9RqC0arMMpnEJ4a8i
         jbQ7fBexU5ftyaAXnNzPr74oFiZnie8EXY2ah3eI9rgcQGUba2FMLWfO4ZjJALBpZkHI
         yxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683963; x=1790288763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p44TxhNKudxJKjuTHjYChz9yjXZoZjxwqz/JOTq8TSg=;
        b=QPz9GSCgyJCQd/8kIrr+bjXbmqPjF8ouJS85K9WijRMfe/gTS+/xRwrRZ5PTPu3Cy/
         JmBjXubB54LQsBBJGT4NzR2t386fvzaZLvhDD7ZZY986nSv1DCgqSvQQ+rx09MSBN4+Q
         sxjZ8UufVLaOwrya4w6D05YdqsPCP2Hsf6JutPkEhixvxMM9IMvuEfAA4gDZXLeVGidz
         /ddz9EXMLvIXz6L3SIGvLuH8Z6WVQNycLK/3SCqdjnR48KqZLpf32NvO3FiXSx7VVeSL
         JiUKN2DcIfypQXW+rluvPjYAJH1NWDbAIb/PVmslGrCFCGkHT9aUBD4mOGYMgRNdfUmb
         gi2A==
X-Forwarded-Encrypted: i=1; AKwUvBwjHI+93y+v1P+VA0zK0KrWgghDzZmFhTZHOohPstM/X+cNxT9Pxe8QVn+cptFqOCaDAg8=@lists.linux.dev
X-Gm-Message-State: AFuF++mx3pDeQyZJUgt/OnD3ZTOGOjJGtKL9x2nc1uOXbcLLnEoU0dUc
	UAXhsg9mbe+tepy1nlHu/3x9cG5go64cbIOKT2feUfmfv2vhW9dfKu8z
X-Gm-Gg: AYBFou1oemdSIzZyI7nLAas8WvCm8qfz2gtwhZZWf5MKvk7/EP2udJLMMzlh6htoR7M
	p4h/EY+ndyfq+zqcI5eJGGQ77HzVFYg7XXUHTGV/Qu4tGgcQqBNcLkE1RePaODILSZhxd6M6DIY
	hSD/1UkSJJJUbOosJCQHcrtEARBEiIigjMKceB8MEatThA3qkqd+R/vdM1mSxCl1rnn8El3NSQ7
	DdQHpKjpZBnU2MJDyneoDwTGi5rrXEgstB3RH3hutID2kdzCOC0ZWlQrxZwlnLEsqVjfu9DBY0d
	Ey8TbhFBlDr1bJNUSMNiKgXG9/rKFMlab8leRPZhBMPa77dLDBbuV5ljNcK764J9TaNaeUjfBWz
	HrK5GYp/svZxEmVvl/Mbhw1CUkCsrwUzI85idWToQs0oDAUHMAo4YDpa/nyEJV+bXVUWiHgmB2j
	59dMk/7eSvl7/eLYXQPZulAb3wz9zUTsCySAgT9fqqstAlTE+Ad2LGjbnH/+PPa/+CzP91t3Suf
	9CyM4/iKs366ER4sKTXjCjYGbU5Mt6rBtRHY4cEqcrhXtr4EKvWaVipDUa/ifi7JiL/m0jrwC/o
	PanUabJc7KQrnTFDn5iYjw==
X-Received: by 2002:a05:600c:3b0a:b0:49f:bd3c:bc20 with SMTP id 5b1f17b1804b1-49fc573b7a2mr2953515e9.27.1789683962520;
        Thu, 17 Sep 2026 15:26:02 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:26:02 -0700 (PDT)
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
Subject: [PATCH v3 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Date: Fri, 18 Sep 2026 00:25:44 +0200
Message-ID: <4f550d729c32725e96884b4ee3d10afa908bb15f.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789683864.git.stefano.r@variscite.com>
References: <cover.1789683864.git.stefano.r@variscite.com>
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
v2->v3:
 - Fixed reset-gpio polarity

v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

 .../boot/dts/freescale/imx8mm-var-dart.dtsi      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c7a9eb23e5e8..cb7998616a87 100644
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
+		reset-gpios = <&gpio4 31 GPIO_ACTIVE_LOW>;
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

