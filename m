Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB32EDD44
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806485; cv=none; b=NHnIsApqYH0y+okWEeZhxF0j3SJo5Ld9Oev4Oa29szYj8tAYWGkAlOAuY54wRww8kIgjrQnKDirTBA4oBODo1+66pXJjW+oOJvYS8F8qV/Zx+dKHWeSTEfTOrVAT0CgO72iwe1o0oEZvMoSJWK2EKzglIab1xBXheJSO1kDcaLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806485; c=relaxed/simple;
	bh=yuhYbpTjEHtc2K9Yfd0cA0AiG7uR95InZUdVYtUB94A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEz5Ywbtn58ZlSiYkqlH/x1bJK5wfFoLzbl7RhXtS4hS5QvI0Q5m+HDo/MQ2dyghzKrVFm6FZ0KoUFYvGA2U/g3cglIsb6xI1N90CXpS3QC7gChECTslZP/Boz+A2dBav/CyzIuYQgTMOB5PB3Hl7FgIdPtcnRBRD/3yM1IobBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U1J7F0qy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U1J7F0qy"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b7c01a708so17305865e9.3
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756806481; x=1757411281; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+AE+C1WgV7UwNd3pLh9lQDj1/1l/Oj2ofxSGM6ePL1Q=;
        b=U1J7F0qylOJZlW9wTj0yqANAwi+j9Me6ldM36iczZig2NYYbTB3Qegi0knzZAqI8ly
         6JyBNqvA18nVdz+c8zwfzB6IG11dkY9S5IQ/h8ElqGn+pzov9d40+Uh0RMeV+X6K+DXL
         WsU7PW9Gvs3ha+2gy4oVmltVVb4robORlJPYY00bxVsjeO5wSIxfOAMHOrk58oYmKYgx
         SngXtjWxPCcLoMDVO0K/YcowOd9ncIOIu31Sa7F0So0z55YLpbEGGAJUR68P0acEEj1H
         UvOEZGCFpyRzCN7/AjZSyc8lthUVwkO2QDek6kAPYEsY5VoRepFr7qUXPNqWvzuX5gsH
         RaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806481; x=1757411281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AE+C1WgV7UwNd3pLh9lQDj1/1l/Oj2ofxSGM6ePL1Q=;
        b=cp9I/dsvBhhyswRA99BYh3JkueRPK1KqdZ64lGOKWv3ni1rUJvWI99RXqDJW0ILU5n
         8bQCL1QzqaA5+xMnRb5k/mwIf/XGcmrbzPjJq/S01fzszch1lory+HkbovBLTa+D0xWA
         k3bapQySzaazHKMywG96ZGsY1ANIG/Oj+70jpn0JEzX5E9N9vJNOods1nmvG3dWx8vpn
         62kkMQ4bBmJGEpHszHp4+dFWph6a02I0TLmOf2Xhfk+ZZ8u6oq2L3iSz9o0MYeicKV55
         nLVGduAXuTNVECTFmAc19Z9t1VdUe9O9W6XXIr62RRdtbNyC7udZY9qKkM0uLn68C6H2
         Kgug==
X-Forwarded-Encrypted: i=1; AJvYcCXBjG8pyL2ZVHcfa+VdQletMu9gOsXy/doT34MVm3KOvdl5qPp/SiRspNbqokYXu9ccfH0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq6tzsWZh9gzIGAVBPWJn4ZKwogU9pxBbe5XGyqApzGGKhJrAo
	UAYer4HWf3kSbHbPcLMwhSGaoGfsnWtRFg58xRWMH1mk28VBjHCtWVv41VnmGgh240c=
X-Gm-Gg: ASbGncseuUiNhPFT2BQQqKHQ04tT0wPnAd8g81pr2/tp7ctWKaT1/J5XoMMbOHDiRFg
	n3++TC0A7N4IIIc4kTWM7AoB7tnicpvihBi4N7Wur9O2xoiw88DTA5VQfvVYvGgoFfF7/BJs+on
	CHfzbt2cwwgljFF2cczHm1L4GeRqxkVJVEnIOD9makr359jxbsnxd7uBL7Pd/Sn4msgoCSmSY5f
	H3DMS4Zy2m07fgqz4A+OmDcUUyHww27gI6BTHnxyXjPMYHKxD6++XgaFqwbDyhuwhTj2q/5kMFo
	4MZiG/WmPR2xxKYdJoUe5yWNSSkv/+XD8Mll3UK/aPY6PLRQ3Itenv/TXPQtsnv+5nQOeIuk5qs
	OXPVNQ7EX/xTPrpwGMldgpZfA030=
X-Google-Smtp-Source: AGHT+IHkum6MUnPnlTSyYdYK5PmduwrE+Bc7PlnDr2fgc28ulaODsmsfkztByA9uDZd9M5QRVY6Ofw==
X-Received: by 2002:a05:600c:3153:b0:458:a559:a693 with SMTP id 5b1f17b1804b1-45b8557047amr89974305e9.18.1756806480844;
        Tue, 02 Sep 2025 02:48:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0d32a2sm294964805e9.9.2025.09.02.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:48:00 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:47:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: [PATCH v3 3/3] arm64: dts: s32g: Add device tree information for the
 OCOTP driver
Message-ID: <7877e1958fa92df92b2b5229365c86493c620c8c.1756800543.git.dan.carpenter@linaro.org>
References: <cover.1756800543.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756800543.git.dan.carpenter@linaro.org>

Add the device tree information for the S32G On Chip One-Time
Programmable Controller (OCOTP) chip.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: Add the device tree entry in the correct location based on
    the 0x400a4000 address.
v2: change "ocotp: ocotp@400a4000 {" to "ocotp: nvmem@400a4000 {"
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 6a7cc7b33754..d6a9f61394d3 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -355,6 +355,13 @@ serdes_presence: serdes-presence@100 {
 			};
 		};
 
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		edma0: dma-controller@40144000 {
 			compatible = "nxp,s32g2-edma";
 			reg = <0x40144000 0x24000>,
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 61ee08f0cfdc..f0e2a2907431 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -408,6 +408,13 @@ serdes_presence: serdes-presence@100 {
 			};
 		};
 
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		edma0: dma-controller@40144000 {
 			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
 			reg = <0x40144000 0x24000>,
-- 
2.47.2

