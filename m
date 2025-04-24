Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5591F2BAB
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 06:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475734; cv=none; b=Dktor0D7QWt2GmDcElt1A3ayA5cMQS2ZhlWaDO9f8ZLzSPYGnVRvF9GpeKk6CsDUmUnaJ34PGr3OBn/z623oexzuBLIt+ZjGfgQnvadm3BmeyylanAwEFXguQHcICYdR1B7DMFEgluSqztQAfhq8AEDaCvCPKLgsp0i5la23ue4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475734; c=relaxed/simple;
	bh=4JJzIfTPYd1xwS7ML8LLTZkwdWqlo3aofGz7RuYx0M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xqk1jpTzU9R7R9Z5lovHSvUk8m5PD8Nz4SWQBQ9RPXapIwfPUn851LBtFbq26mliBJWOB8ofWA673b27NgO1d+HjoIBwviNLtULxy/dHgzJVJOZMFTUNMRmVs/qFHZn/I0uzZ3k/TJQAz3YGPovJGhzXNq9GuttTD/tpOOVjJLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MmjuZ9qI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MmjuZ9qI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso6338235e9.3
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 23:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475729; x=1746080529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=MmjuZ9qIiLsC4MWqBfkFo67+oLPheyBOvmx+4o8xDJlZoQQitqDB17lFvQZSUwekXY
         xyC8ZtZfQSSUhAMdHzkbIM2ds2HzlTRiZXhMIZe33R1k755+fY/AitIyNEd7ALOvB2NJ
         MJPLTf5+1mSiSAMRDepBvysckh5SH+qM4c5hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475729; x=1746080529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=iEUy5SGsMeSBzwMEZLKDTZilfg5K5uN+alpciIWGOF6bRKx74CWMmP4hcKDanblu56
         fF/BmR3T6rFWN3iozS9h/H+mhgrURcQYmWlfYNP1NYArAybp/mLdLWTq3fxfQiwDy1Lx
         XGc5LRM3uFj4FCnSBm4EpMgVLGAKK8nlz8zYb8U0f6hgi2YtGnNwY8SBfGqRfioRFdG5
         dN7oswBzTo6d7o4hQLfz6YyT/+bh5P5n3xcnv3M4m2EUC/C2R5NiVmfFdBqOJBCCOmi/
         npvUcmaxijDv9iZw8mV+JHgVHLx9D5zUpq22xzNdatpy67trbKjKVC1boXhlVnc9BOAT
         gzgA==
X-Forwarded-Encrypted: i=1; AJvYcCXhh5sN1rz4NL+wX+4jiJo5zSprGRFUoLLDtfS3rCwkLqZJcQwb5hYhOshF5ge9QMzrYJk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTzg+mdycu3ubVn3xkumKl69gIgGCCzZbgdu+fScwtg/jvE8dF
	OseL92hvrjPcnEsebdZuAmKAEzuBbjMvAvr6vC6uz9qSQl3oncZs3HerIkpaRw4=
X-Gm-Gg: ASbGncuAshNWa9RKLVLUMICMxTIUAoiWRWof4qZI9BzOsgZcqYnhcrbcxFNXfxqhlfn
	B1Op8eNh5zi/B6VbTH8mPzJwGCEA5IrbmnA0PLKK91746o5MY3KMTzfjYv92PcZ7bXAeTAHhdLD
	A+da4We8Fjm/8hUose0tfFuULu3puYEI3uNRuCTSNKTIF6ZMkB9ZHwF6UiWdKbTTiMP4RQr63/t
	FshoWjpWzYO8zNu83V2Cj3jLEMKeq318PLIv4EjJWa/K13+ZhgCOmfTT5radWiIcBYRfHSu/6ba
	PYS688zVqnqyhdXrkH4rcdcpN1dLfg2Jtp2BOi7m9cyTeJH1Ay0qP3Or+0OySC+i4craKZXPnvt
	3UohW
X-Google-Smtp-Source: AGHT+IG82yOPXpYwfi2WQXemi3Y+w+Y+YBgmmwEarjbKGosn9nFuDaCtfqEsVXKjXrDc3OfGAVxz3Q==
X-Received: by 2002:a05:600c:444f:b0:43c:f689:88ce with SMTP id 5b1f17b1804b1-4409bd8f0cbmr8682185e9.20.1745475729593;
        Wed, 23 Apr 2025 23:22:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
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
Subject: [PATCH v12 06/19] arm64: dts: imx8mm: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:36 +0200
Message-ID: <20250424062154.2999219-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
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

