Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7C31F0E50
	for <imx@lists.linux.dev>; Sat, 21 Jun 2025 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750504998; cv=none; b=JyD8TZy+E4oZa69X9NKfevTjM4Q3hIuwKn4pcmRLN/1HYuhbYlwQSBYUPkpkfJ2zZXueb5j7IlA0aZOMtclfA2s90OT5fokDZAD8FVC/C311w7HNiEF5TAS8/r3d7UTqp2TquUkzbDKQaukqUo77nxT+wwgMlcYaSwdloeKUzac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750504998; c=relaxed/simple;
	bh=7NM1yG5YzQ8JicsWuohUOCWC31cpq61zxWivMC3BXFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUECgc2ijLCvqekY8jfCi7bjb14uWLR5Uq6b9Y1uLm0VTrkVyQ2PHonxieHgjwwlH3YjlwkoXzNCB093FAR5Zz7ofvWDZys0quxPqzEZrA8XJQGwIU0pYyItKsp4Km+ursyRco18bFD8TUeAa0eFjNCNjQr6ltgwuJrEIrOZdz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5cPQD6X; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5cPQD6X"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3de2b02c69eso8771655ab.1
        for <imx@lists.linux.dev>; Sat, 21 Jun 2025 04:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750504996; x=1751109796; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyspq0V2HWwwS+VnZ1WgkjemW6T0dfdq87ixJii18ZY=;
        b=V5cPQD6XPgG1g9mNZT44ypGygSSTBzkeOYqyaqoRqqs9ZMw0v412TD2Rhu1CQMYWYu
         pQ5e9NKK6i5gF8LRXTusth/h9Gfy0SQyiJncGMtPMQ/nqJW4BUZcjP8G0BgAsQ5I0JVL
         vM+O8787vj81jUaH/ObQD8+ZbrXH0T7P58kpefVpyYlJnH/iaL3wRPz8XyGuTYAWoBOd
         +cCaqgqXr+s/N3kbpBqHlY5habmQmBzuKn5Huo/+5AvuPvDjvb9lvjwtuZFfCFK+m218
         nGkkvkTYTKFzvrQ2ks/DGHUFPYtjZdHKWWk5+X28/UawcV/uTGD87VkRuMQljMvUA8TG
         jnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750504996; x=1751109796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyspq0V2HWwwS+VnZ1WgkjemW6T0dfdq87ixJii18ZY=;
        b=BZEH/Jj0d++u6/3x2EiKnXDCk7lqdPuCWA9bLSIAiiDf4LC8uUlvtU0fcARp/SLNfR
         SLgxS22KjmkiLtLkz6P34pG9Io/6AnzM012k1DzQFvfclKyUj26/HKeVXyNin05VfoOV
         4sWn+/dXfzaRMrExXEGp9Cg9DvadfWyg28HlVuXsUcDKgr3fcm3669zJnXcoPMwy8GuY
         jB2gzGII5tDcBRPAtkoqk7Vh81ZEFlLivjnLULlislfBK45A0ZuRlrjc/zgT8w2mXiN3
         f8w/1CkaCnnLv5p5c+rKqXyUcKvWQI9h+jTelpVJXZOlWGDF3uRyxd7SbMWYeX57Qv8/
         viPA==
X-Forwarded-Encrypted: i=1; AJvYcCUbqhrDvJ3YzfIRMWII1hhxcRn0IpOiqqrRUqCnbw3nrg60Rmp68oLROVwquGfhI8iIfc8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6Q2osGmU8CqIONtnZilc7FZgegbcAXgV8pQms8xmdFMEM4jiU
	m373ldk/6wzTE880xbU0/kYhoUKGgTRFWnpB6REGA0dPhcV/FMhc0qbK
X-Gm-Gg: ASbGncsvSaCshtttU/iUVqYXqMfendCCXdrdbpjXPq52mtbWylQF5/ppwapAAqb1Utz
	CJAw750FmouGN6pxi4kBbXV35T5YLjyFj2YwCCxD1cDa+ijOMFdrFIaHS1dF1PBN0xkH9ib0fr0
	9XHPdVX3fU5Y54FQD5Pob9N1h4C1XicOZXWGlfU8C5Mp+eyCSqf71LrL9NaiLYTYQsejpcGIN7j
	tRqYh2VdFiLGEOUZKRGag+JOb3fX9mg1o0RmWEzk/ZVWHK08ZQ8Tqp893fO9y23gDujB8I+JnHl
	zZxoJ7fmCzHpFOwO9rIwbG/O5o+yDNBB+ZTIpwCb8cm/fcZFmYPyuEgXsx+1wmaFUrlujGvalLT
	l5kLz8o43ELmfgPjVbaqWv4MWoeQDp1PbWLEK
X-Google-Smtp-Source: AGHT+IEbOxBx/Sd+Bsqwp70aHm+2E+WsoOI4o1sbT5qYTMXDbDTw25OzNNsCWFVkE+Cq2EY8YZaaAg==
X-Received: by 2002:a92:c267:0:b0:3de:25cb:42c2 with SMTP id e9e14a558f8ab-3de38cc4f87mr72766065ab.18.1750504995670;
        Sat, 21 Jun 2025 04:23:15 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de3761874esm13654385ab.9.2025.06.21.04.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 04:23:15 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: imx8mn: Configure DMA on UART2
Date: Sat, 21 Jun 2025 06:23:10 -0500
Message-ID: <20250621112311.68101-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250621112311.68101-1-aford173@gmail.com>
References: <20250621112311.68101-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UART2 is often used as the console, so the DMA was likely left
off on purpose, since it's recomended to not use the DMA on the
console. Beacause, the driver checks to see if the UART is used for
the console when determining if it should initialize DMA, it
should be safe to enable DMA on UART2 for all users.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 848ba5e46ee6..b98b3d0ddf25 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -860,6 +860,8 @@ uart2: serial@30890000 {
 					clocks = <&clk IMX8MN_CLK_UART2_ROOT>,
 						 <&clk IMX8MN_CLK_UART2_ROOT>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 			};
-- 
2.48.1

