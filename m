Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDC8298CA1
	for <imx@lists.linux.dev>; Sat, 16 Aug 2025 10:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755341239; cv=none; b=EZzFvkd0k/hyZwag/Jf7llNI+bTBYWAxNdneGAW63JlVaDjqfJNB6rGaHpHmtFdeiWnbWASxKJoDxf+ihCy0GgNKGS0aSf2mZsd6O1zRT1+DB740OmH53AZqpUKXpWiZhhvYtioIKgflxwOwJcl0WqWsJvyGV+DYBRfhKtepCeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755341239; c=relaxed/simple;
	bh=fyrnp2G3Ydck/VjXXAZySzmhvFr0osu+dU28HaR/Aig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZBISoGDBh3KDxlr8WZH+hqhxo3PsupG9GbSD6ooR4WM+Stsq5rYZJiBkg+IIU1DnzHP8gBYZcjVrLMdNrx+BKVyqIpX64kGF06HBu02BFwEedSuAhY3IVz7SUvqfpOMvwcFHvLnSjVEKs9eAVWhUbYXiAJeL/NFkap7pokIf3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xO16olT4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xO16olT4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b0d231eso14158855e9.3
        for <imx@lists.linux.dev>; Sat, 16 Aug 2025 03:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755341236; x=1755946036; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8KLQMXDCWuJhcgQgQnyLb1KMnCRmFUpDqVZgzOKpGBQ=;
        b=xO16olT45UjnfKfXQ2u7A1hZqZGRHetvTe6wgQFvhhJ4eomsGMkEFW1BTMZxXBUzSw
         vn/6lgUFkWJZIha/ZTbFiqdbwykB+WcEq3wSLK+HQOPhfIJhVkL9gRq30RCWgROvtxqC
         IpbJsdu+Z7YGgfR1icy8PNKY4ozjSmYlANgVUPVQhr0kDh+Tflt17gG+nkHs4xeOjece
         4vVN1tX/sBx+/MHJ8GZ7lMKhal79qmcxouaJU1ZrnUEtseGyBGXtpAfDjQS3iD7huMlr
         1doyIGNCauTrCKRq28bWLsbcHo70iIh6grfeXKVbPlPhWLG03e0p4v1Lm+d2+YRF4RBF
         E8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755341236; x=1755946036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KLQMXDCWuJhcgQgQnyLb1KMnCRmFUpDqVZgzOKpGBQ=;
        b=BP4LBiQznM7xE4CMJYiewn56jQxPizC34uFD7R7TftMuB7GnbT/pHe2Rb1I8ZNSlvl
         oU+yNPra7Ss2GYoJq3vkGl3UARc3aQcmUqQjrQoRV7fzmWI3HIS5ajzIJU2tSZfU0Ul5
         9pCnuTrTFGAmi8uoHm5S9ivzgFcHy2xT3eD5CnmqLyKxPeJb0uIakkHylb1e2TNKifXS
         q0xuRKs7EImp/YGpalr8fVo20XTGT1KL8kArK/p2dLVCfm9PnKxikfL4DIggxPcYbhwP
         QE1rOcH7azot3WshNGPYXz94+zwAWKMFxBeFWy5xcj7NZbO4GQIlFPAuFG/txK0fyDG9
         NoRA==
X-Forwarded-Encrypted: i=1; AJvYcCX2QmDIVo1np4iSHedZYgiwHBAaCnscP6tGOYGiZmjc8NncZExakXcoocvlnk+3yuq9ukc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4hvInS5I8monsnIdsi7JdkkrPQx9OazkRsD1+AWZT11IXSMrJ
	t8Xv+MSiMvfUUMJegAh3GtvWGgWEON2rSSGYsKx0MyxGEfeVF4U4CpXO+Y7tMftLKtg=
X-Gm-Gg: ASbGncvwr7J2jPJVWwWfMKOZYSB3Dn2xq63jWP5kO1+5SyIG1teh56lkYPxF3Ekon0M
	g4etqDRufJFi7RMyceIF3Bu+ZABSm942D/JAcKuRNt5UErQoov8lrtkc3L3hRxSJI7or9lUBYTb
	ynVQ/dgE0o2viWIlmsXwbgXIrhjUUOYAoHiYaT4N+udvKO1G6ruZW6gXuVOabC6HEKF0aYwk8z1
	P5K/NRJl4NfAc9hhPHwaLyu+824dO+JGibROBMJpzyI8T3QXvSBgNe12rEENKWv/Spc11rOOBCD
	8fHtY2IkxKXx8tr4E3usxJ2SLlkhf4OnG+8T7FGY0gUvN3SY2Vn+xGYfajWj4Eca6aMRtOdi+el
	EQlLYYNZD9k7aMnevXMGsIymM+Q4HcrCW9DEiymHlutc=
X-Google-Smtp-Source: AGHT+IGkyNX6lrch8bdW1/jFFLJz/On6HV5NRlOeDX6BHkVK6NSeDO7JwUZmN0V0NpAm5N6hxBYQhg==
X-Received: by 2002:a05:600c:4451:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45a21867837mr39821515e9.32.1755341236605;
        Sat, 16 Aug 2025 03:47:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6be10esm96169425e9.3.2025.08.16.03.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 03:47:16 -0700 (PDT)
Date: Sat, 16 Aug 2025 13:47:13 +0300
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
	linaro-s32@linaro.org, Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 3/3] arm64: dts: s32g: Add device tree information for the
 OCOTP driver
Message-ID: <9b3874c6aedf87f78cc6438fe840433162b06445.1755341000.git.dan.carpenter@linaro.org>
References: <cover.1755341000.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1755341000.git.dan.carpenter@linaro.org>

Add the device tree information for the S32G On Chip One-Time
Programmable Controller (OCOTP) chip.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 09d2fbbe1d8c..e58ea0d3b083 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -612,5 +612,12 @@ gic: interrupt-controller@50800000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 		};
+
+		ocotp: ocotp@400a4000 {
+			compatible = "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 39effbe8217c..184a29dea184 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -681,6 +681,13 @@ gic: interrupt-controller@50800000 {
 			      <0x50420000 0x2000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		ocotp: ocotp@400a4000 {
+			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 
 	timer {
-- 
2.47.2

