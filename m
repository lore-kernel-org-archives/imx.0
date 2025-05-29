Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C13C22B598
	for <imx@lists.linux.dev>; Thu, 29 May 2025 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529359; cv=none; b=sFRCZMrSMXLAC50j0KR/eDtf5a4QUUbEQYjYZ4K38DL+8wVZPBDEey9NGXBUepXGN3jC6BGLdBrbf7gtcReYu+HZQegYBFe6YD74y1iw8hIQHhRrPYhEC219dRpTF5iJstFS2mzT6a56uONKRAqVmv9aa7gFbhgUwToEfcwIfWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529359; c=relaxed/simple;
	bh=b25DzXlkwtKRtrQxMdt2zt8u3SZtqu8bn40z4T7R6MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SF9xL1T3tRnoBo0dlLDS+NhYexTzta0h+W+nrwipS2X141gp4P1Y+aOgIZuRHGxn55ZYSyykLp3gDgYV/yh+3dc3gac9hdyxySL/B1ecAdHe5wKKFPqMjrjGlV6ETIzRdeBuQBp/0s2TQVWg+Dy4NfymG7fHQoIeypthysjbd0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Ns9a7nRz; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Ns9a7nRz"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad89333d603so188309166b.2
        for <imx@lists.linux.dev>; Thu, 29 May 2025 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529356; x=1749134156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkvbYTVTJvU7EjQbzb6YoDEjgSySPh9u6IORDwoh9j4=;
        b=Ns9a7nRzciNdQc7CDgoUtYaw9xFiJp3X7hQPE11f94d/XJanYWsqYqKyD2OPcuOc64
         t9vGOfWjjuCSXLuv39XahYZnUPzq+svP4YtpZSW7F+h1Ka+699ztVASCz86zRvOdXQQM
         as7bLKUMmuHpPjUfs2OX5guYKZ4s2VVA/Efxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529356; x=1749134156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkvbYTVTJvU7EjQbzb6YoDEjgSySPh9u6IORDwoh9j4=;
        b=xLNtrNuFRG280a3ZuX94vZDrMtBv6rTu7K+AvfkYfw1p2eKZ7hgHiZ3jUnpkNbZAUV
         RjPZnHOSrqUKMlZdHbRLb0ZzfTGWJYzGAHux3ZU2egnUPYrJtW2r3nBa9gOCUQL/RXRx
         Srtl9nE5SuhrRwnYY+w/W9RXF1fURqKFm3vEOyih4mymx3OoI3SR5HIdqQkMUEh4nRFb
         lMp7NdrVhx5Q31nrnVDLe/4YnNWazMtfcR3aLKm03OvnZFbNJXmrUC01BXJFghX4H2xE
         35Xgl8hNP0kK87IoYk82wZhFJeRGoEV9Nsg7ghNzLt2ecaT8G4zfIYkm/kXtnr5jEk5S
         wgmg==
X-Forwarded-Encrypted: i=1; AJvYcCVuGKpHSVY71G7ouc3SvKhlN/mJKLjbt2B8cjiwV16iaFjFYan2Jm6tr+XXGkWGtUjNfwk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIRhQEN7gulExgDAG8lh9KzzfphcPd8rXwdcWIQSmZof4uTeka
	2OUQYjZhGJa0STIqjOjGkY1aSOJuusQ3gXVweZsBnUgQzvCeOs1ZfqmNVgScny4vCus=
X-Gm-Gg: ASbGncvhMzYhZxLY4qfc3VN0zR4ve4Yg1T9w+NKLKHUikrwNt0C47eVb4hUbyZeT0b2
	n08wNqeJGPEBUooPvbuYEq0x+7IyvA42T6DKE1CTtPM+67Ax5pZx3DoiNcgR+EyRFNmJCveGpS5
	YdwyzDeoSdWy2Pp2PyOfUtK/noa3JRRvDNVPRltVdpXDz9Cks14Ya/680MEADmG2j1vD5/zwVvh
	RDzvAct8O6WK4juNTx1koxkQmWv1NVIgiZwOQOqgQMk0FlS6ZCn+brwMg3eDFdExv8Co2vtCeKc
	PgVE5NgewUpxBVRZhQMINbWl5oWMBhXFLzJL+Y/VZ74GPWvo1sjQ2Xc3Zl1H/ZM0PB5re8vfLoq
	bsdX8fsqNtQlZF940
X-Google-Smtp-Source: AGHT+IH7hMfCJ++G2vbyG6z3aDCBiHFQjVGVk7csEQiSuSaeqRhezGzT9pf16kPHKXh10/ID/WoiyQ==
X-Received: by 2002:a17:907:3f29:b0:ad8:8529:4f73 with SMTP id a640c23a62f3a-adadf2a1046mr245445766b.49.1748529355765;
        Thu, 29 May 2025 07:35:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:35:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v4 2/6] ARM: dts: imx28: add pwm7 muxing options
Date: Thu, 29 May 2025 16:35:09 +0200
Message-ID: <20250529143544.2381031-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative pinmuxing for pwm7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add commit body

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0

