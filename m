Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7EC21FF28
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 21:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455294; cv=none; b=Vny3WoDwqlRA0ACtXgXjlbLOPTn6uvh1gWmwkfZYXuJ5cL2RlopDEaUiHpSg3nJf+LlRB+XE7/RlzczRfiqJrgKAk4QxoEgmWMja9EH/QfhG2OcPbiQJUccxEERi25Jtyz3uOTyQYCB7fBAAgPBDCzj/vAn+pWf5agEEBntK9kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455294; c=relaxed/simple;
	bh=+2t//q5qq6lq45+xIz6SECaL4eslI6UA5sLtspIWoyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6JTbxml50AhPBexKOP3qVBqr5yq9gnLYj9f/UmaSjF18SDZ0hiCqZqWx0qaaB1YRomSvZWP8OwCVQv5vTntJploRzH4K+a+/qe36UsDLC21eKpnvbiNB0MNusFLxTEF5WawObgDFmst6zD4k+l06XTTtjCsMYlEZi60eFm2+yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRgR01F6; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRgR01F6"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-874a68f6516so211178539f.2
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 14:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750455291; x=1751060091; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+B3F6T5itIIw6Fea+hP0fYMEiq/rD2eFXwlu5ekNYU=;
        b=gRgR01F6ZL90s+0uxN7ZY9FiVLIT8IB/Et1cLPcOoXwa0SvpAwryI3S93UcA0f6KOW
         qlolYZSMkb82iYGCiSvE/xc5iriRWR72SXX5XiDs5fF0mD9PdxpD30iwOJOpDkDsq76Z
         giQST0CQGAakfhzwbXVH+U2TA+mIpOyUfyoDB0evxE/sn6uGoex4BpPenx3mm73AiXCm
         Q9L+pFm2znh7XtpU5R4ftwEyJ+261kJA8QZlOKqxXr+vL+OB4snFaD/eKAe9awPl2CW4
         VfToB3o4QE4+0b1xIdlGa1UkAmxdt4yW1xfPOzFM5/Wuigj+HMi3WfKmjaigCkwSUtkq
         Mw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455291; x=1751060091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+B3F6T5itIIw6Fea+hP0fYMEiq/rD2eFXwlu5ekNYU=;
        b=VrcWPY5HEhDwW7/OunnpEU0NZ9WL0EIfuctixdhz2BgeOG6Bcnm19aOFEUsdNAl00p
         zSJWPOp3ezLVmxnPaxIh12fO9f/tf/saTYbRxqyhhJ3mSsak+wL5iFSVXNzkzbymwSpo
         kUXLbhIEYoqWXhkYh2V8RBdPrGFX0YPEdNZtDHWciG/RcRwGOX6ASBym9/gbJAT5bM8o
         f5wszbypnL5fm1Ok55FLww81zWLhAKXKAMi3T7XjkvDuBWOBVzrhHAccJW9Pf+a1nlsZ
         bEpbViNvflCe5NjszsgWwSYQZiNDPg31kSIJ3Z5RWvMZP9e21VOVzAqqG/cP9WyjlsJr
         joLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVscZzHrTZfAhdekBOOCIeMEEbsJiW93PRcTAuzx04thF1xzHW1mBHctK4kQBnBY7cRi4o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoIsFqdJpzoyraRGpnu9n6VO6LnwxjZs5Rl0wbukIe94/r7z92
	aVvsyfYOiALWSE1pivRuY2QhTF3rd88AlnQ+0YcWtrDF4IqBy16jxv1L
X-Gm-Gg: ASbGnctiDypDZ0S7TWOCgdZ8jnWgXs15YuYfF+u++uDzRT7dzQcnE+6wcaLmcpzfiaN
	d+NblsVrskOnOC8Oug6ldnOFfR5x3dx5TImrek7zng8IwAGKWVpF1NGxEb2DmUx7odM0dT00AjY
	NUCTgWCvBuLMmqV+gx9HDuzf5O2VwWIKJnD80E28ChgRaI07XyMAShM5XxYfTHBN0BBBmBhYVkp
	jJ7S/hRSprVt7+YtLkuAJVaYm89WGfbCStgGHAYhd6fF1UX7MoXux30V9ptA7c6wOWRwARq4eEX
	YrblTWfPKkl95Nv5Nc0MGec2TFy0UKDP3dhNc3hTsxPviJ4im5Fz7WMtFJH2Xf0aodLUBpKYQ/z
	9ElHo7vKSdqYZ+93j3wEvHeusX9IaSNzZ9iAnfz/NzSoieII=
X-Google-Smtp-Source: AGHT+IEWnxZaEsUoXIyBXQdtG3ofERkIZgoD94IDVPmbvQCBnUrK9o6S+P5EUx9I2ltMG/Cyr6ePaw==
X-Received: by 2002:a05:6e02:174d:b0:3db:754c:63b with SMTP id e9e14a558f8ab-3de38ca55cbmr47468705ab.12.1750455291583;
        Fri, 20 Jun 2025 14:34:51 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5019e0d03e7sm546707173.139.2025.06.20.14.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:34:51 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8mn-beacon: Fix HS400 USDHC clock speed
Date: Fri, 20 Jun 2025 16:34:46 -0500
Message-ID: <20250620213447.56392-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
References: <20250620213447.56392-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reference manual for the i.MX8MN states the clock rate in
MMC mode is 1/2 of the input clock, therefore to properly run
at HS400 rates, the input clock must be 400MHz to operate at
200MHz.  Currently the clock is set to 200MHz which is half the
rate it should be, so the throughput is half of what it should be
for HS400 operation.

Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index 67a99383a632..917b7d0007a7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -305,6 +305,8 @@ &usdhc3 {
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	assigned-clocks = <&clk IMX8MN_CLK_USDHC3>;
+	assigned-clock-rates = <400000000>;
 	bus-width = <8>;
 	non-removable;
 	status = "okay";
-- 
2.48.1

