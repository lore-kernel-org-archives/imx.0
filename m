Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892144AA1FA
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 22:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683965; cv=none; b=fAg76wLmb9WdO7wSoaSdve+SynpdjDh1VY6p9Nb2N7QktzcYPLcgT5OYx4dAj4X/CancTSd6OAg+mfcj3yQDPpo8C+WUbn9rBLqK+8I5DitULAN8nAKm8KYNLhyDqAIRq3S0kVMit/+JLWT8BTs8qpU4/IE36Z7AZHP37kI4Gyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683965; c=relaxed/simple;
	bh=PPUQzK5TqVbrrNTNE0CnhEJ8m/zbeT/JzkU4m//5RaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxzefUaCi/nRun3J7/DrLVYOQuRU3d6c6ixYIX8HMBVsaUmQO5jNataWtPv/6mH5o4z1oB2vtYShGpuP4qIsePIMcXBr2AXwDjmNlcRm9SSLkWTX9plav49qW69Hy6GubWewFPwvLlsvEkoMoCY8950MB5eKq+rEDN8alOcmlMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjbEolJe; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjbEolJe"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso1080745e9.3
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683961; x=1790288761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZ47DVQmyZYVdJhDE2+Awlch6+GR0MpCzXRi8vv+3B0=;
        b=DjbEolJe8s9k3L48BGmWgXMRy2SJZh0On7rwxo4EckCmK+l9ttSGs8YqJBFLr61DtI
         EbrWadWGxpbboht9zixvJKK2dHZsDUr+f2cE21koS5X0LzAYlGXtG1brS8mjHVLkvJ5E
         dB7H+2Pf2Jsc/jaC7aDnsBIp/fTfUpKSPGcGyOhXz+Oguz22YGc5yczVZWTnquqzfjIO
         taUmcm1Cay/q9ikBFYanfoDG2tsFx2ls2C8iRDWNGxqiVA4mQ12nvmObLjbDysxvCt/U
         2P87O7uH2FGO7hMfH5PEQBs6iIuJPC9KURAmO+MYPTEMKxuw+MpD9HAC02mW8sXTGAKq
         Gz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683961; x=1790288761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZ47DVQmyZYVdJhDE2+Awlch6+GR0MpCzXRi8vv+3B0=;
        b=PRTb630va0K/gTeVcNYwKFJJ4tiXwEAq87oSEiZnzyk3JTJkuxrY4IxpIlT45XeL+L
         Z/Yitd7hIscDX4OidaBd7GCMdXwj0KZ1Aop+Aw/J6nGI9RCKlqflua5Ec7XI0O+n2OCy
         zbAowW/UgYy8j/4TTOE5xZkoIsG2qQMb/laBsEXt5sbwp/z97kNLIOIjy//92L/UQORL
         38FPFWdZqthm/z9p5OTvIfVgAo9mQlSqRo40KVBart8ntsvpNdLH86aCUMZS4T8lYOZa
         5nG+IoQsuA/zD0/3I2utlpGCfr6MSLlE/yu2XXXECBldn+m+2s4NRQcJzoH2OM30lH5l
         mSZw==
X-Forwarded-Encrypted: i=1; AKwUvBx/l2b5pIkINMGyKkRlhzzie+xv14QlxYGITHee/u6nMv1BBhaTeyM0pzzFWiYmCemeom4=@lists.linux.dev
X-Gm-Message-State: AFuF++moNoNguCl0IJKBMA307hURE+x0jl07uZmhsGVyfN5NAGPHqIRC
	+zPjpuXY0YFb5hsRRa1C35i2I7pWmsKBaTjxzJQoZ1woQAwab8Lp/C5O
X-Gm-Gg: AYBFou2ntnlElQ5/Gwjg3ilRh8WhLiy9rZ4l6St19s9f/UuyvMyqYYKjAAfQgg2jFkm
	oYQ0GXQAJW8TgBWyZH7VLeLYS136vbAT0oLM3eibBMjbLJSHin2NvlTiT/3YSYaPkrdDKybZ8Xw
	4UeOv3qUwpefxkoy1U/nWn4UhbTABmRUYhCo40YFZTJylrZQd7ZMha1YbEpZ2EhEaD/vejO8YI3
	u3XbVM9POi0sgGC3AMwHy0xbVGEAyVAu1Cw5MAx/3G+xqdg82Cl6v9FF9LhOztw8RR+ledvepKV
	Weve2j260+gTGWhlCtHWMyl2a+O6Gd7No/VrDptxuOXdFvDFITy2G893VTF6Y14f2BIaohKDDm9
	lNcBpXBtL9xQDmZFtfVRy171ZEtNvrXFCvuhZMUaye2I/WkaKMdzcFVYZXrYYevMLfXlpW3SAhL
	/hpCBC71KAst1dcBza8adRSH2XGRzSCpV17y6+3TGWfPxjhq0vR/iMDgb8tqgdIVhLlNBUWaGck
	R0QSUkSlD16UxdbOA7tjdEAQ/2CruFCUqXw9Ij4zniz3RX6sdtaTzKzYqwewVjZPW8OQjq7brS7
	TUm/ba7HUZmTCA5aqlNv9A==
X-Received: by 2002:a05:600c:4e53:b0:49e:715e:ec1f with SMTP id 5b1f17b1804b1-49fc5757378mr3630865e9.30.1789683961158;
        Thu, 17 Sep 2026 15:26:01 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:26:00 -0700 (PDT)
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
	Francesco Ferraro <francesco.f@variscite.com>
Subject: [PATCH v3 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Fri, 18 Sep 2026 00:25:43 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789683864.git.stefano.r@variscite.com>
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

Configure SAI3 to operate in synchronous RX mode, so that the trasmit
path uses the receive bit clock and frame sync signals.

Remove the TX_SYNC and TX_BCLK pinmux entries, as these signals are not
used in this configuration.

Co-developed-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 2324063f8fd9..c7a9eb23e5e8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -305,6 +305,7 @@ &sai3 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <1536000>;
 	fsl,sai-mclk-direction-output;
+	fsl,sai-synchronous-rx;
 	status = "okay";
 };
 
@@ -446,8 +447,6 @@ pinctrl_sai3: sai3grp {
 			MX8MM_IOMUXC_SAI3_RXFS_SAI3_RX_SYNC		0xd6
 			MX8MM_IOMUXC_SAI3_RXC_SAI3_RX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_RXD_SAI3_RX_DATA0		0xd6
-			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
-			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
 			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
-- 
2.47.3

