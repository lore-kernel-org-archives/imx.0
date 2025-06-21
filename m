Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DEB43AA8
	for <imx@lists.linux.dev>; Sat, 21 Jun 2025 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750504996; cv=none; b=M4gf8JSObimssnKJ6roC46nJhOiDSO6js22yG3vfkAMEi/FGmvu57EYnjZ3i22XiMzgKbTDKwptgoUHO8Hr0zF4yMc25cGUdo8mBFVwjeSJvOSi8sF1eeWJr1q/8HvX1d7W1a2yHe8HqgBQ+I00GNXTpxJT4oBgfGaMLUuBp3e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750504996; c=relaxed/simple;
	bh=xtyMvTu8rIA23hY9kaMR1I90uDuUCANKxURZNeP5bI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fWdAibg5TYMqDa8BEEQ2RxRjGM6irKiNpLLohh5SpoFkXsorPXDED1jpVhzA6uZKaVUaq+JHDQpplBUB/KBYqjwqg3GJgbVp6dXnVg+c4iRfg7kAFoylC5hVaWpoV+BuOkYuilSOJYcWlU3kV2SxfKU5rsaauelNEvIW9ZLmlzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0sZ+bNY; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0sZ+bNY"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3de1875bfd4so11002485ab.1
        for <imx@lists.linux.dev>; Sat, 21 Jun 2025 04:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750504994; x=1751109794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UF7hadND9s3UrrMKF80WbZP/w/q/Chjap2NrEwYw97g=;
        b=c0sZ+bNY5VBagosxQJXEjIfexFJGckmVjMiGWCm65YRiP1PzsLNuzo3UdyiG9qJvkY
         CwuodyU7mrKUT5M389Oell2LJPombv8D9ZfRQXw/GxvXEOQHGm17mYlIHNJf6NKIIEQJ
         f9UWgSKIttVU5qSn5lhbZh59dVWU4B1yKD6HyCAoBMgUWEpX2z+SQVb0h12yxEFPfp+x
         UxWBzu+0Pto1++06o86a2KJP/S6JZ9po1D8xI/J879SfMq66Jm2t/1Jl8wEsVCOVG22C
         J/5pfOBv4q2gJdfT/HQP19G5lvUCp710jmj4Kr1eEq3Js1CnqZv4SZwSa8Q84HgPK4LO
         31RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750504994; x=1751109794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UF7hadND9s3UrrMKF80WbZP/w/q/Chjap2NrEwYw97g=;
        b=KD7H0uE+v5dtJoee/4HiQoia/fMzVdBytHlRSN/vFppbWlLHyX2Y6UDqN2T01ul8Y9
         kej2L0IuDUv3STkF26kGrpEoszmomBORD/1s4MozXHLAXcxCxB1Mn9IAgHObpjoSCgCf
         dSX4QRNv4Tcjl337L18/SGMrpEGmhMnGXVt/IvM+PIodLSIu5TKfvrhrAxJ6OrIcRBPz
         r5WiOpFU9+17HKa7n5Ws5V76Wx24q85+5oTjREeWQ4s2yFA9tuhz7qPdEVDbj2ev7Nll
         TPZKJ+q2qRUEotJWCJE1kH/ISpXSClUTcTejBc8jhR9gqui3JqnCaAz3pOPOlR3CvZrH
         3FdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXSClaaTJgASzHDzCA64C+stTndn2swyNE/cOVPEc7cbcuJRXkSW//SBw0YHdOEEyQKV4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCNVqjUUIIYA75BiYR9ryjQmI/ajRodGGaIbx8iGmgFfFJlVDD
	h+/fiusqIGoxEoY+aSoGU1Rj1PJPz9aaMXxt7Y3RI0PUIHo6N8IPtQLq
X-Gm-Gg: ASbGncuXq5qJl1s63Ob56tbFPjto25MAf5BLCg2+chVq6PE39gqIQaTwt4spy06ey3U
	HcTbxC8j70NpTN5u7qcGJYc2fBVU+hpfuoMLiMjVRu/cct4L4jH1r6SxvhvSxVudokqFoc4A+T3
	f7XPKitIKKSv8cPr0YxF2oKGDdgXV2AixpjU530YKbXbWLdmrioYA83R+xZdgHzuytWaWeNoWB8
	nWcyWgjlnJxRy0Kv1erI1jq7wRtDIKabdsNhMEyacyOacN0IzEBx/h2SOXMJWwEKPfzeUt4FgRx
	2tuj1znZ7W4pF8E6SlXX4pZm5y6v2TgZFSnpaU61hz/chfZKSjRaZjqZBJ82lfh5juHHYK51+nJ
	Owi2lVlzJ3z5+b54KU1ik8D+SIM9OwRjLtSqa2XM9BCw6Vos=
X-Google-Smtp-Source: AGHT+IFygc8LNOika5Gsbzg0FvICu6wDzZeaHLaClXsS2ujOTAv2/VuH7qQJ9WvXWPOzMEJqiZfyqw==
X-Received: by 2002:a05:6e02:160c:b0:3dd:d33a:741a with SMTP id e9e14a558f8ab-3de38cc23a5mr66804735ab.18.1750504994014;
        Sat, 21 Jun 2025 04:23:14 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de3761874esm13654385ab.9.2025.06.21.04.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 04:23:13 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: imx8mm: Configure DMA on UART2
Date: Sat, 21 Jun 2025 06:23:09 -0500
Message-ID: <20250621112311.68101-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
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

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index cfebaa01217e..ded89b046970 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -915,6 +915,8 @@ uart2: serial@30890000 {
 					clocks = <&clk IMX8MM_CLK_UART2_ROOT>,
 						 <&clk IMX8MM_CLK_UART2_ROOT>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 			};
-- 
2.48.1

