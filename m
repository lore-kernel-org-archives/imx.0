Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F91A00ED
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204072; cv=none; b=nA3VG0hMJk9ihU4/YdGkU4AdK3QsNJgpkXEcQaKqDB1yCa2mYRG9qTRAAG2EXh1RJWsK2DYIiWV/AqjOCkssEXuIfskz8+L4xTNQRsjoNax2+SXAD1YOFViqUxbVTfMWZ2SvEHbMDzjx8lMmkYk73NMkDBCNZRncXvDsuio17oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204072; c=relaxed/simple;
	bh=vc25/TFqvg0Ekr2Sm4G/VkkviBdPeMF5e7FdTWNCvAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=INa/PkxsSbjcEQDMZjthKhyYZMeidzYxpbqfoypKXHXGRZx42mrr4DVCdV3VLMHogASYuDp8UJKkyv8PUQe4NWfEP4f4TGUg66IYWtsOscKBUZN98uEgiC7NFpiPEorvhs1zvUDwWEeKTINlDk9o71oKafDpqdlXk3yCR0zHIr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Hauz8DZi; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Hauz8DZi"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so593944666b.0
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204068; x=1737808868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=Hauz8DZi9psLGxREjqQBVxdsDnQ/3cmyqDgyyMl57m048N8PDNq22JMNmaoVMGkiA+
         8y7aNznb1GpInerOB+yLcTM+NZMlnF3c/6zCoEFPJg+fLkcOXv3CVKHC/tQNRIjDh26O
         A/1nD1bdzqF6o7oBlU8C0RTYS/Cl1aFUgBgX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204068; x=1737808868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=D5iaJSRxjX4VA0qUXQ7z5YmSU8WKoyS8DRb4++dDtExmRcIizd/eUxht4sRdWraCMx
         MV6PxwkUT+NxciGHEsM07dcUeTPDhbXIU8uEQdJdAjQ0ZUxCQoEaoRqr9qQhEbDInU4Z
         yextSMBAQH/mLv8CX9BUs090Ws5/p8ywyzrfdpWZFNfWBdpY6BHecWs4pcZJaEP5GIsC
         1oYmh/RLLpUkmc3awuK1f/TGbxfdXCrEysbyGcnbBDgdGuFU6uE2C/DVuBiEHmhrxEBt
         ObyLKvtwzkyLaIEYtZASM4a68Susd5MTAwo513Z8dbo9SHMC5Lnv63a3HJXOLj6lFoVJ
         IjKw==
X-Forwarded-Encrypted: i=1; AJvYcCXuLEcLM6LDWnTPQyf3RUsTF2sC30JxW6tzZTGNaGHF3tgBFA6YozLz3ZP1bMShwDeFce8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMwDKrLtooauzgEMBz495NYINsTDc1W3WtQ3uIdLpEqTLHhxoj
	LQT8AHEX+xZaj0jBwosLfHfocQ11SGNfauycVA5hCnCVihfxFppdbQ4jHars7sg=
X-Gm-Gg: ASbGncub/VGvwt1IC4EUuX7PmwA7iAEVRQXr3AivscXw2sAaMY8+1ABxpmGckvd4Nkb
	pTm3XMiFLEpKD8+KDNw0BWJpbWCcpNJ9+vvefAVysoHolDo1Qc7hmt+32qBSX942RopFopQBP1Z
	k99NJeoGNc1l1tVDY5BMh4/J1pFaEA4wXMNc5wYbJvKNrOrRzdTuE2GcoLcptDLXzh3S5Y0cu4N
	UsyPHtwpHrkivzGFgG0y4WcLOBO5S4kGz9D242XPibxEO4g1/aA214ktNJuSSBtZhkWlo1uwRyF
	cqMo+Tm9Vic4lD1fS2xKl/KbLDQ0JL4k5uO8zzOeGOndmD2O3DYWLNRP4sDB/l5mkYuGp9PVBFk
	xX6rEPsTBwl6kpHLXDRRIRdrdrnjff1/CwDE8
X-Google-Smtp-Source: AGHT+IEjVsxeqV3q0cuCfowb8sHunl1c2U0QJyl0v84iVeugrlhDgI71TwU/pUagXm7GAT1GfAlb1g==
X-Received: by 2002:a17:907:940b:b0:aac:619:7ed8 with SMTP id a640c23a62f3a-ab38b1e651bmr538826966b.7.1737204068521;
        Sat, 18 Jan 2025 04:41:08 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:08 -0800 (PST)
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
Subject: [PATCH v9 09/23] arm64: dts: imx8mq: add anatop clocks
Date: Sat, 18 Jan 2025 13:39:52 +0100
Message-ID: <20250118124044.157308-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
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

