Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291921F5403
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397590; cv=none; b=b8eSM/I4Ft/fOCwMdyBUHm+AJULw3YOPe0jsmBtlE4qvAeXWUmrauERecqQGcKGT6WD/YXkSEVhLTgWY9uZbjNxvFod4/IIQLcM9pNyjThDCy2UPePLVYnvpgGQU8+h57wSIJdt6r+XpUYrrOXXYTRP7fi6JOO25oVyWiT51nxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397590; c=relaxed/simple;
	bh=maUm8Wtz4uhoJlDQ4e0Kldd0ifg3+fK7gvr5q8t40fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7i5lEv6bjvlBJhnKhkBU8+pkqOMxw0c1Mpa/YDiOHgCAE++sPh3gOdUunok67Qgu5MUi8DWBJeZvMkBx6DcKxKO2U3na1G6m7l0ZYYh/wxH/CNJWMBG78+cYEpFoMhHbFb8j3AlDlKuHN5eVugZgSyeqTZQx7h+OzXOmQXjweg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QRM6RrEh; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QRM6RrEh"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d0d4a2da4dso1185983a12.1
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397586; x=1734002386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfJsRcPD/8EPzi0YLbSU3Cc8teD2P8WEd5mYwYdJZ8c=;
        b=QRM6RrEhGZKVX6lDOyMpLMdXpXEzztKW696a8m7IRx0fkQejFRi1jN769vYn95G03r
         KsWeufoUb0ZEoMzDe7gbX/TLmS84TITatm5jns9bbpahpyahRDyhXYmF6o1hiGs4ZnEB
         7ZfkiYmFFHfK1Sr//MclyhmV1jqvNvLu/PpME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397586; x=1734002386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfJsRcPD/8EPzi0YLbSU3Cc8teD2P8WEd5mYwYdJZ8c=;
        b=oKeStjNIonyptLRnZ4XbJkTPOiLPY4j3T2SIi/j7ezmTgYdmOxNFmnnfVo4RH/XH+k
         Cw9HCdF62vHexmFyFh+e2IJfcN+dGBgA6M+hA67pn0k/Urm9x5fECa5YDK/GBOD715SR
         QaLpqveHoUGTnEi0CzxIlN70PsYoVf+cRXTpZhOuNgkPxGnEuwKJrnoXNVV3tl3PecOH
         SBIhzdckKPikTgNZSsY4CpuBGeUlR8/blHyopZfrtxwqkzndKfO0/uOUJHhDht+Y4vtq
         Ymuka8G6pDHBNGjrqppKdgDZ46vJi64HrOrxgtZxlL1vjgJX8j28chfcy6Qcg2yVtH4s
         9Q9A==
X-Forwarded-Encrypted: i=1; AJvYcCUiSpXm3YGZaHm8Rxsr8A2UM46Ihe9lIrg5d8cXqK568mbHJjLGlBX26q/yADdcDGG/eVs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIhkImWy7L1JSnTuC2cM010YB0q2xIUEcMie2T8qoBCAcZ6L1S
	S6gYp5asbL1QP/Zq3DKWxWCI1XyCdt+tUewzRZAelVn+h1HmFGSw6B1kMioJpn0=
X-Gm-Gg: ASbGncthHhJXyTO9/xnoUdFQnWjRZcHLVuFPOUxhL4Gn2u1ZPwz7rlxC86JTiP7Pn+4
	qo8UlCDNJ6lWR/0yOnM6uX72wUssKFDSQLZTcqM0gWUoegj//UZDxSKS18KEc6b+b3oTWDz68fL
	/xFbfp2im9e+RtWJ/4rMVOIZ090TrdxttFK+au/cpBTdZG9Mpif+sg7OheJzTbc6RjGx0QyER6S
	+fKtxppJHYKPnNoZULOf+rEovomzSSmH2Yixz1RH70sO/9VGOjjBkXpLuBtTzE1gJZXZdXyuW4a
	nmZxlvd3ML7gCawKbrQeeJvyWhU/u1LiCA6uVCJtgzBXEQ==
X-Google-Smtp-Source: AGHT+IEvMCFVKhXQs/BEo9XGkjUrPVab4oCHkJg6oXUg3V30XKOK2YMJHs4Q4VAghsMiMHhIuTdfyg==
X-Received: by 2002:a17:906:1da1:b0:a99:3c32:b538 with SMTP id a640c23a62f3a-aa5f7ecdd96mr850956766b.42.1733397586585;
        Thu, 05 Dec 2024 03:19:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 03/20] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Thu,  5 Dec 2024 12:17:38 +0100
Message-ID: <20241205111939.1796244-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MP_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MP_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- New

 include/dt-bindings/clock/imx8mp-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 7da4243984b2..3235d7de3b62 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MP_CLK_EXT4				7
 #define IMX8MP_AUDIO_PLL1_REF_SEL		8
 #define IMX8MP_AUDIO_PLL2_REF_SEL		9
-#define IMX8MP_VIDEO_PLL1_REF_SEL		10
+#define IMX8MP_VIDEO_PLL_REF_SEL		10
+#define IMX8MP_VIDEO_PLL1_REF_SEL		IMX8MP_VIDEO_PLL_REF_SEL
 #define IMX8MP_DRAM_PLL_REF_SEL			11
 #define IMX8MP_GPU_PLL_REF_SEL			12
 #define IMX8MP_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MP_SYS_PLL3_REF_SEL			17
 #define IMX8MP_AUDIO_PLL1			18
 #define IMX8MP_AUDIO_PLL2			19
-#define IMX8MP_VIDEO_PLL1			20
+#define IMX8MP_VIDEO_PLL			20
+#define IMX8MP_VIDEO_PLL1			IMX8MP_VIDEO_PLL
 #define IMX8MP_DRAM_PLL				21
 #define IMX8MP_GPU_PLL				22
 #define IMX8MP_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MP_SYS_PLL3				27
 #define IMX8MP_AUDIO_PLL1_BYPASS		28
 #define IMX8MP_AUDIO_PLL2_BYPASS		29
-#define IMX8MP_VIDEO_PLL1_BYPASS		30
+#define IMX8MP_VIDEO_PLL_BYPASS			30
+#define IMX8MP_VIDEO_PLL1_BYPASS		IMX8MP_VIDEO_PLL_BYPASS
 #define IMX8MP_DRAM_PLL_BYPASS			31
 #define IMX8MP_GPU_PLL_BYPASS			32
 #define IMX8MP_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MP_SYS_PLL3_BYPASS			37
 #define IMX8MP_AUDIO_PLL1_OUT			38
 #define IMX8MP_AUDIO_PLL2_OUT			39
-#define IMX8MP_VIDEO_PLL1_OUT			40
+#define IMX8MP_VIDEO_PLL_OUT			40
+#define IMX8MP_VIDEO_PLL1_OUT			IMX8MP_VIDEO_PLL_OUT
 #define IMX8MP_DRAM_PLL_OUT			41
 #define IMX8MP_GPU_PLL_OUT			42
 #define IMX8MP_VPU_PLL_OUT			43
-- 
2.43.0

