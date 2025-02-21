Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A365A253B5E
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165021; cv=none; b=MxHP2W2rcGb1usuViYeWbGOq4mJh7h2ladhC13qb8K6SGHFLiXvPoBvoFm0iZEEHZP6iy5RJcEByPRuOm1Xk1SfbXDGHSG8J+9BNfmjFkUux3P3heh3c9rnWWt3J9baO1V/ZhpKZPj+rPiRbXQSsbRG8dsGFhxCTJo1fvGknJEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165021; c=relaxed/simple;
	bh=aGMEv09mgvOMWn0LVWhHooUpN8dKT5EsPlQPTtFVSQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T4Zn7YqxK5TdEA7NX28nHKS01KCN3TcXjvDJcjVRdpAAW6lDGWLO4NP+bqS4Mzp6EsnSCMNfAdE43Puf+yublKa6Km1pTlkHzGfO11arU0yrpmBmYTDzFfpvKUH1LoaKBmVpVzPUu8XZlfmUTdiJSSEVfy+dcgla/tGiBgh5do8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZ3LUSBf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZ3LUSBf"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abb7520028bso343128766b.3
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165018; x=1740769818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3oJX0NNej/zcXG8s4cxQRhfNdLEwQ8bXLo+d66KAIA=;
        b=nZ3LUSBfV9rw2vVJX/6/ZbnH1mq4SRBad0V/ruCioZsjv/4Vb6W/ebxqNJUKNzmnJf
         GPFTou4zHU+X2hEYTPOIsBjWeIU+J1X4J8VRWAsTacfZc4GoudYAY/8BxNzSIdt+T001
         PZOrG5AoKTiqIJ/yIh1+5vbTQCagQC2/j5FdVQllvtXJv5e6SFvLCAUf/e4X7MObbp/0
         lGqAEizq8m9+DWQsTe9+sJfozfnhC9aMDZvWPqPeut/AcBcR8V9c58ezAclgijJz58f8
         HFICcbmKSlIFkeSk6bGazTHhOtS55wLfKymFB6NH7WsS2iDST7eXPr33xgFRzz+zyfQI
         RVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165018; x=1740769818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3oJX0NNej/zcXG8s4cxQRhfNdLEwQ8bXLo+d66KAIA=;
        b=v6Yzs8z5r3a/n5jiwOmJ5d7tbAH47udWvUAEzfdIWgwb/H8M+8sO5Er5VBx7/k/LGq
         UYgT9qEou0wppKwnrVLfJBkhYEf8n3uYEG5GEyBCy4yvUL0mv8+e8v3B9UKqeIbh5zJG
         7FDY+h8WNRPyavvLQrBXlUoVvG9a8AihSR8BqZxleJYHM+E1gLmK+57bP3izvHK2uy8h
         4mb1xqWZGuIUznA+bgO3mKacnMjNElOLnWna0Ml9npOCiZS8wQmCZrCzBcW13EAHzRGJ
         Osd99bKiIhAQV9MpXIcfnMU0YhTlgrLoqbYBtsIpXyRA00dfcJ6uULX+6c9MbNI3nTHv
         1pEA==
X-Forwarded-Encrypted: i=1; AJvYcCUERz/FPrLrQ3/hU+g+tr/jMX8Hue/9nUeyGGf98e/lkvoC56QobCUP2aCSFB4b6no9a18=@lists.linux.dev
X-Gm-Message-State: AOJu0YzS7vMMyoN3QsMDWe/S4pGBgCqevENNk2uR0IZLnVEPe34ugm4P
	gBfSkR1dzqdRMNUpfxkSVgUBEnM8QDhlR+A2H9zAjoifl6iWqlSybbsnvshNxTk=
X-Gm-Gg: ASbGncvg7X85cOUjLjGIscKGoGoywfndakdv29clEiurahSS6b5O/mrsP7mPucr0MbE
	Y8s3cjNI0glrfMdeJ+0yDEBB2jDRc5MEsbw5qPT1GkNYc4KqTiQLZ3OodsCwtxhmfYFwEepFOqL
	IM/6qCXDkuI8l4tGxrZwYNK8knWSQ2tktCLbWgGsPEEDvHIOytSHrLSOvM5aYCU05G5DRq17Sw8
	+KSia7RTn5OsofxpQHpeFQWsvr8FNPKIF8kzB6bY6ATGz5pAWQrJ1P7echAM25Eke0OVL77tPPQ
	YYUY8EBXo4fovxe7+nqCaYE8cAJPUAFJkfhOQy9jokbodqYm+3/15Uhltfw=
X-Google-Smtp-Source: AGHT+IGynN4ZF370Lzvi3ueh0CqKqONEKwybpfbsK9fvcCWm2za00Rn41+jeaxCDTpgJmAnwoZijwA==
X-Received: by 2002:a17:907:7f9f:b0:ab7:c94f:af87 with SMTP id a640c23a62f3a-abc09a4b598mr518223166b.16.1740165017795;
        Fri, 21 Feb 2025 11:10:17 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9b187203sm1027261566b.61.2025.02.21.11.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:10:17 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
Date: Fri, 21 Feb 2025 14:09:29 -0500
Message-Id: <20250221190929.31469-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
applications running on the DSP expect the core to run at this frequency
anyways. This change also affects the AUDIOMIX NoC.

Fixes: b739681b3f8b ("arm64: dts: imx8mp: Fix SDMA2/3 clocks")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 86c3055789ba..54147bce3b83 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -834,7 +834,7 @@ pgc_audio: power-domain@5 {
 						assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
 									 <&clk IMX8MP_SYS_PLL1_800M>;
 						assigned-clock-rates = <400000000>,
-								       <600000000>;
+								       <800000000>;
 					};
 
 					pgc_gpu2d: power-domain@6 {
-- 
2.34.1

