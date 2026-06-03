Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B4D4B8DF3
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 22:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527254; cv=none; b=uezBGnncEASVfvSH+E/9WY+SSM2T9N1N2qIYPcEFbgDoNYDwXdKjbhvACYloHJ7Q/BT3hPYAIjDDAfLcLL0kKpuQVlEg9qrzuFVRT1yvpoRLOPjCmwQOy3j+OKmpjNfAxIwxj+7oLJmUQomAHlWLdmKWwyDa5hxkAJFJosiIEeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527254; c=relaxed/simple;
	bh=qCfLsJoiwZN1FHIn/QReiEfRsi64SrW+21HyyLc6Y10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1WpKs3wqx5Wu4JHVp9183XXXHC2VTajE6STMxxsKDx0G34BM1IXI2VQtv77ugb20ka0Obr1rQkMT5BzZNaIQvWVhF1Lrl8Pck1zVcCcoAYOXXUbYmlTozIWu9oo7Ec2NkTp5YEcWr0uZE4vONi+G5uGrm8pJ8DmaR6axrEOqvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0dl97TQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0dl97TQ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4908b92904fso900245e9.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 15:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780527252; x=1781132052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3C+gaBKcvAuAu/9BkeM+uxTwGBBZ0/WtClg4XV9O2Y=;
        b=b0dl97TQ+lltiEX9yEJLOXLXPqoXit0+GvQ3wju18DulBMNm0mdKA9I3gTSJRDbRP/
         61YadN6ghOCjyTRIEvTtGAKQYTkVfGlCrrwgQut4POntHJ9a+33Yh/OF4B0H7ftJxkol
         p5A2pkr9+1AHvoAanhBZ7Ins2xY/QOzyJsyNdKQYI3Ikeli9Ph66oBZSgeq62ytxocwe
         +BeW0DNedmnzemIkLYtc28v6Y9Z1McsztsPt73ewg7NA1lMnx7G8D38cnWlQCWuB2gpV
         N4kimYfxELmEmJTwxJL+SXqqSQxgumnc3W7AuY36oPQJ1dgzhNMJ5Iopd9n2SZEbbkjV
         nUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527252; x=1781132052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u3C+gaBKcvAuAu/9BkeM+uxTwGBBZ0/WtClg4XV9O2Y=;
        b=Jqd/s/RLbeWIE12xQ9LGK1de+6Dm2sleUp6DD6duF/ZX4Fsawh5UdgOEJD09YAw7sQ
         iJc7DZUSC6+fWQq8iXx+1j6Q2X0On7w4ThPBs+i8Acxk0ouGylFDkcFMLz6AIIy6p/Ai
         IuWsLLcHNglLM850kd1/5Jko1Hl+QNVehcXQvkgJPy2XyMueSeFGnHlf2kwZeysZU1yj
         skleYQVQxDS/PTFSqO6e7UxZPBTw+W3LFKNor7xMv8naK5fDPr6R4/t4hq4p2pUl5UcL
         KsMHx+NI98ZJYUqufSicWVTqk3tapDv4vRITV/tr6KseDXijqfe1a02UNxtDCJLSYxtI
         BMjg==
X-Forwarded-Encrypted: i=1; AFNElJ/vdli3LAYU9F+58tJmAO8bAh8lVaTM8DVX57Z7akXiwJKQNhc3wq//L7EH/5iZjX3aVsI=@lists.linux.dev
X-Gm-Message-State: AOJu0YztHpjYZ2ReqOAWRaUZNUkr2Ku2QO5og8D0i6YckzMdt+3RDrsb
	Rg/tCu6JE0HUUnbHRY1pD7d4RyqTXnbvf1S44OCSVMh0wQK4OuFRueQg
X-Gm-Gg: Acq92OGkUwOtOWUuOu7po5okAFmalPHy9cDUaEKpF8mPzdRziUDlTSkHt55OLmzLo5k
	XlRxRdBaoJTLqe2A8eutC8pYMMxjA/fTpWPSIG3FjApPBuXANGZRx16Sf1TtB2JFBMPwPOf6s6W
	PUW40ofltMmF3WKyTBx3XNnVq3xZ2QgpgRSmdQcactvHizD6pbjejS2kKJ3o1HzWs6IWU8D3nnH
	Wn8J+oDlOsPFmHQZcKg7ZoPY3Fv2PO22ZjVBAMGlKlRew4Qnc+5dc/2ymt8E0+KRxAYFfaUtJJD
	9hEXUusNmB5KoNe+6g/Qw+rs6yh45lAmZrZUtV92qQv1HdzvQWoz/3kx14pv66p5efNx0WvhsP3
	LkpDgSMog5oJkYJGsBsmG8b/qSt+9UxyRlygK0PiPEnYUycwubzmNfcCn28XKPgoeGQCSSww2r1
	jkoCHVdU4GnPsFYbYzhDqtuvhHNEe/wHkrHLlFSYJZKCcIy9VvoANdpx+eSS/EpiuLOoDFPB7GS
	cJM9E65n2dVVUffQJ6GSNyona/mQNakXYG646TRBDUF7qQ=
X-Received: by 2002:a05:600c:8216:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-490b610a410mr82034325e9.33.1780527251928;
        Wed, 03 Jun 2026 15:54:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm26366385e9.6.2026.06.03.15.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:54:11 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 2/2] arm64: dts: imx8mm-var-som-symphony: keep RGB_SEL low
Date: Thu,  4 Jun 2026 00:54:00 +0200
Message-ID: <55fb7ba8f5249a0be5296a0b3523ce20a668a89e.1780527068.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780527068.git.stefano.r@variscite.com>
References: <cover.1780527068.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 090752014ee2..fd0a1862ce90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -168,6 +168,14 @@ pca6408: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

