Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC97B1F8AFE
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318661; cv=none; b=ME2ke1/ldtlTFbRQP8laJLs8qvUA1g7g0szgQIMo6bkJnWcqrqBQJqj5Zj00htLO+Gcm42+K9GdHaa8wMg7ETENiAm/XEhV4e04RWe/fA4lqLvWaJXD+TYCpdqYNOt+G2q9fBH/aGPnvGw2QBSZdgye9/TRo5ugsjzUoooIopOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318661; c=relaxed/simple;
	bh=vc25/TFqvg0Ekr2Sm4G/VkkviBdPeMF5e7FdTWNCvAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrpEsHNqmEfH8dd7L1x93Bc3vakD5LeWwNwt9lVRmVt6rrHGfQvt+1WXMpYnkLtve0qw2dmVJAMpjbmJYYdXLf3P96WeaW/pHOEUbS9smwRkJuq6MMRLGefwhQeQvbYADJbFNlvD0UiJhsrhoNIe5H1Y2JDKwmfoMuZ2XtYcLhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BmCj4tbV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BmCj4tbV"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so11803492a12.0
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318658; x=1735923458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=BmCj4tbV0iIWCe2+rPQEj1TbOuX28YeK0+bMuCG41rYR6aqbvtotKg0317M2X+H0xI
         I3RWb9S24+MWMyk9j2lCtcstsPUx+f8c/luBfassIAxEXgqLc9qhAUfXEhL/kQgW/ylf
         Z4EZavd3C7X35kgGix7OghqVtAFLeIzcQgnFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318658; x=1735923458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=Iqltq/5kQBuXVPn8AWNpfZhX2ECrpGSWb0kQ/mjWbEkwIXWQUasuuZAEXusAsZ6+DD
         mlJQW7OkmGO1rNzQcmBr0/MLs1YlyAmUNNKtPUbu+6hdbYqfWCeeaGZ7B4qaQgvUQf1x
         jP0NODRoBRYrFv4+SrehUsJjxEZ805FpUyP3GsvNegHN5qECAx3wsr4DiDs/HrQROc09
         erkO23qE4yn8o3Gr3X0NJdQuFtVml2zdhH0UBceRmxvn1x7gXSOkPhjCthWKt5ZbHZHD
         75lQP1ewOi4z71OpXyohRY0F8FqCOP/n6vR+3Bjf9Gk7YLbXmodxtdyaZ2gB5s/8ebiI
         8iZw==
X-Forwarded-Encrypted: i=1; AJvYcCWRXmaD/FmxMONR8tMHszTsZ9Uj1dq+txiIO7cyhamB4SoXhhxlJIsjpGe8THcCi5vW4Lo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzzQ/0itvMtGHZmwdWRWYkiaPz1I1e//iVu2TgIovEsl+fHsEw
	BIcJArbsMZ6y83I5z/jS+6EJIQI1PxYddS1zZL/K/FvT8/TOcBG45Vf4Apzml4Y=
X-Gm-Gg: ASbGncuG3Y8wuWGaP/Eu9udMDCBNAMseyZeKIrjHHHHGMS9YWYTcxS6nraWdntaNmFb
	12Wmp5XN11h6QxvQwn+fxnhe4v8wLO9PM0UIYWmgaS0eePaLIwqfS3Qx0DkjUiXSWx527BddKST
	EUVxvR78+/US2/ZkoA/CyW95jeq04EWWhtDiK+W4dIvQ7h7YylYLosC5vihr9sPRvSXRisRm2Sm
	bPb/XD4648eUFyHj0xWb6+adrfm/Am5P/pUci0na9GyrTl1EGs/CfpwsDjf8P/QJXQY7+vGzFaV
	/fqwM5xwu1mjfE3Fzz60DA==
X-Google-Smtp-Source: AGHT+IEU39RTa9ECIPzQT71oAG8YXlNy7WaA4azCq4x0ZK+7kYxrqzuYsejzC7Lx7FeHEAwhQoFPPA==
X-Received: by 2002:a05:6402:1ed3:b0:5d2:73b0:81ef with SMTP id 4fb4d7f45d1cf-5d81ddfdb67mr28928804a12.22.1735318658268;
        Fri, 27 Dec 2024 08:57:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:37 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 09/23] arm64: dts: imx8mq: add anatop clocks
Date: Fri, 27 Dec 2024 17:56:12 +0100
Message-ID: <20241227165719.3902388-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

