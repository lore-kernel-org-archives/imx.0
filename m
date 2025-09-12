Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A801FBEAC
	for <imx@lists.linux.dev>; Fri, 12 Sep 2025 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689409; cv=none; b=IuiDnFb4t9525LY4fttQoQ9RrVO9MASU1uTgO5eabCpB1Ws6Qq0WZsmZ7fncZGEWih732oPal+0u5MeMen53WHJLCvDdcD+eBs7oIVtobZ+AlafTjufHYvmf0dDtScxr3LU2fBmozALjt4TD1QacQejgMEVO5f8VPWTAYzoqUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689409; c=relaxed/simple;
	bh=/Ylbt4Hgov7SuNxJ3P9gKkIyD2OkbW71YkYFjNuHbKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJHbtKtvtA70ohEkPDvQv77uBOYFokdi9Do3mcEX2FODeLPWUx4e4jmONFqEV6MJy5Bst7fnPOmjsFmN6cP4qCXrhKXt7lqdzuG7L344rNEuzKLMRf7UmZyEID5V+SqkhKYwyl5jWIkLh5PAMqSsOFJ5zppUSyty1gZez6AK89A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9WBt8pn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9WBt8pn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b9853e630so18090595e9.0
        for <imx@lists.linux.dev>; Fri, 12 Sep 2025 08:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689406; x=1758294206; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zq1J637xCjsK3a1jRXJ0Uurp60mNSuIOaSzaWarRAoI=;
        b=X9WBt8pneuMeagsBeTYvl87njAVpkLQ4PN8qIW4QbhrIUjgHUK3stxbTjdnFxeEXvK
         Vp4V9wFnQVwFzpKKbSNL4AkKv0JdioURExQGmLTkCm/7/Ol33+/Adei4igXLjNRCfiDV
         hkW2/bgPaAofIGLw+jxkkGMEwwmHTiH4cu08YD9xUSkUltXKxE3zLeoJCZe7cwDgnNJS
         sveWxxwJWDiRvuyXT5galOuP+db6OrrLLXseZhxjZVI2bMCJqNW4MCDO45Xo3X4CTj0G
         q5IjzfmHn553ka7DZfr3gP9q4GfaczyQAP4lOEIhkvDa0R+G1lWM0Y+ETl0FBLrHRQxf
         7yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689406; x=1758294206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zq1J637xCjsK3a1jRXJ0Uurp60mNSuIOaSzaWarRAoI=;
        b=mdR1uH69IFUa4tU4Jk9+qbTzk9HD9N5lGPZ9eOH4X/OL+OUM6N/R7ROn9BiUnPW2Ag
         dF8HcoIzPuJKZ2cxp9Le5G+lJjItCjIgOGZrieI59Oi04JmV9bq8eGt+xkEJDG8tv1LS
         L3Z2MioXjGs4S0AKGlyloh1Bq+z79yMlTYpUMJDkhOmPK2FO5cCHoig5IwvuRvHd3y6u
         KGOJnBF7NufwEl2rrbIk+muA8XbaMKcp9yroekphXc/8G+NE9JyQ+zuuGqBoz1OlRoKa
         RIKmrW2FBAP/+NFgFGOjPCyt1dyH4YHzKYB/QyERtse2F8cFr0NatSBmCcbrP9CCTDrG
         TL1g==
X-Forwarded-Encrypted: i=1; AJvYcCUQp3QknVMOnTxmghlhWVXjx/5lfMMm7FH+3cTOWrKy5nEj5nrJ+Ki/kqY+PW1AL6e2Y/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK34+KxfMDOvslgpNdKn/JocFPh8XdOCpfV1/YCyBM+5mcpNeJ
	Bl5urzktmTlnKedPcE0xC0jMlmn9PbgHTg75NiSdlIfD91aYkta5yaOHwxRnusbCTmQ=
X-Gm-Gg: ASbGncsYuUauOr8nYvf8QikGl4hT30zS+ycr0UgPJ4cFojfiewleIyg+/uhk5ORr9dd
	PV/XD/EMm9IZQHJoOnxhih+yhxxfv5tA0HyNdf88/i+a3pm7i5gnlWLC6d91wgMuLXa2NxO2Fnr
	gzvGG+20IyRFWNGDHaqJdaq6bSF2JulowSfIZHBg7jLUgb3pMvDtOQSKloMvsEXs2gEv2wwGTwp
	MHVohhKNlNqsx9Qc8zDgSLPVwSFh7WByWC0AiU6spz0fJnzRG/VoxILZMzHP1c9PXG3oA8kPy4K
	NgxdS3aqKW3DMVi1QGfBqgIoHXnGBkeOyfjpQFVk+y1aauCTLnNOr9sTGbQHk6yxhg1qgT+in+o
	WPTMognRmfVh12dKac1t/liUnnh8=
X-Google-Smtp-Source: AGHT+IGJXVmJrfU4VspkXVUL2QLcSNv5Pv+0FQFjRdVM0w+zljPzezrhfzIQOaENjXatzp2p/nhztQ==
X-Received: by 2002:a05:600c:3ba9:b0:45d:d9d1:80a3 with SMTP id 5b1f17b1804b1-45f21225cd7mr33416595e9.37.1757689406190;
        Fri, 12 Sep 2025 08:03:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e015784c3sm72663525e9.10.2025.09.12.08.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:03:25 -0700 (PDT)
Date: Fri, 12 Sep 2025 18:03:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] arm64: dts: s32g: Add device tree information for the
 OCOTP driver
Message-ID: <6ea7fede9642dad10a6270a07e052f7a726f9bd6.1757689031.git.dan.carpenter@linaro.org>
References: <cover.1757689031.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1757689031.git.dan.carpenter@linaro.org>

Add the device tree information for the S32G On Chip One-Time
Programmable Controller (OCOTP) chip.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
The other patches in this patch set were applied but this one needed to
be rebased.

v4: rebase on imx/dt64
v3: Add the device tree entry in the correct location based on
    the 0x400a4000 address.
v2: change "ocotp: ocotp@400a4000 {" to "ocotp: nvmem@400a4000 {"

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 7 +++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 3ff3b2ff09be..d167624d1f0c 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -325,6 +325,13 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		swt0: watchdog@40100000 {
 			compatible = "nxp,s32g2-swt";
 			reg = <0x40100000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 6292ae99883a..be3a582ebc1b 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -383,6 +383,13 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		ocotp: nvmem@400a4000 {
+			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
+			reg = <0x400a4000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		swt0: watchdog@40100000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
 			reg = <0x40100000 0x1000>;
-- 
2.51.0

