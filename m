Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB992267381
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388188; cv=none; b=ScQkmKSmJ0T9wxrEky26sAYTflgpJQtLg1GqK+gPXGGL7EpoyNuL3SYqWo9QT34i+2ou+F00ZMi66Ydt0CZ93I+idlP6T/CaPMFBc3JVJ2YiuGAdMo+Xl9SJYq9fwY2Sar8YVDerB3dBnDyXjNTnSde1DAfDh4mErfJM3X0S1CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388188; c=relaxed/simple;
	bh=4JJzIfTPYd1xwS7ML8LLTZkwdWqlo3aofGz7RuYx0M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kcu50i+dwtD/Z0OqD/hTBogG25lk5yQ7atW9ZIWczbfxZKaXeSEqFI/ay9Y9sP+z6mjsPGzhcJUjnR7wkaKPG4AhLT84aes2EQnRa1+qkrLb6PxbeZblo1Y3sxjG1bFjv0bmF3K0zhfm6GJIjXYk3edhNjlyFIZiOWDuftqU2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cy8qoJs0; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cy8qoJs0"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac339f53df9so1013279666b.1
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 23:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388185; x=1745992985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=cy8qoJs0PLxVGwZ6YDxoH8SXnRgwQFz9xj6MXVNlhxB92NW+yHAvLhe/gJX2Uc4IT5
         bzK1u2aBGHcZU0k3jE/cgJRYPjsNsNNRIR0Ame9Xcqtjb5kNjangMisp9Py1xAoNY8o2
         NPiToaF2A13Glt+7t9o17fbSAUxvBZDz1/yMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388185; x=1745992985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=mMVFUlROGg17LJQvsktOSOAChSwOfECg8sVN42MHvJMMmteztwQmOfceTK4bcN/7DT
         ov6wtY8B16tG0Q0js3TIvnuobrRxcJj1R8p5VhIvJFYv/zpMV7BaNsXHTr/uk3fg4YQI
         dXALm2NBED5vnZcfC6WdCNl4oskQFfPHsN5HDSbJ4sAPEiHLIVaEP5tMEKSYP44JfNjr
         6MGjh3xua6GhzWJVU5qRoT9oAACJhQkFt7g1XneLCui1iHkUeOjjnc/C4QNEpYloATe5
         JQSdpXL4P5DLOtdEUa7YddMmINtPAFulNLYsQ2BIDSjKju3SItUzuXWxU8CPF9jxDSoG
         l8hg==
X-Forwarded-Encrypted: i=1; AJvYcCWzqFdl1B1snEeWQcU12FK6veGVf9xe57EU35Q3Cq/xZ1d5610hdiVmE39IGXl3HNacJDg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwJ8u4P2mRPDI43U33cj+I9VYGsOivhPfOBUm8G423XZjOZ5fw
	m1r6Q0FbiTNAL55QlYdt/04t1PjVkIdU1PmAQgGbFSpT+DOp61Bc54nZVDiFoaw=
X-Gm-Gg: ASbGnctgFe1dVPH9q8lwcMsrERNBNm9kvyug3DsFjCMTS90JPFV6ABz/Yh3HkYCN6s/
	Gl0CH/WGO1TgUK7oYUAwW6wAaN9g2JLf1MS4WXP4QJE5kSqvF8f6YDNz/2gFXQabncEK+wgpXcU
	YU2oME4nIHiTrljQRppgjkKni9d4QLj2xpQs0OhrG9IrB2L5vBNJlfdDn+GV+G1CEbGs886v5xR
	A3v/mBYf6b80B851u1FE0C5wbUImjHGRFXw/2mTCoITtZFWAkwr8XmLZwpBtieMPrzNolBSIoTI
	VQmWZExolBvCMCkymzIJeIk5HXxzkuqJF+ttuKSv/IShMkE+bZg5T37k+BFNKBetRwlgXtgDD8o
	i2Mdh
X-Google-Smtp-Source: AGHT+IGrspoHDsYpuHpBd0xkLyZI/0PkKVqNxamXnpGvjKWbNAnUwCBvXK83/LAVhSGUiYAa3+5Q4g==
X-Received: by 2002:a17:907:1ca5:b0:ace:31bf:30f3 with SMTP id a640c23a62f3a-ace31bf409bmr477621966b.43.1745388185104;
        Tue, 22 Apr 2025 23:03:05 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 06/18] arm64: dts: imx8mm: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:23 +0200
Message-ID: <20250423060241.95521-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

