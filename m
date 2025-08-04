Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D64D26E17D
	for <imx@lists.linux.dev>; Mon,  4 Aug 2025 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322917; cv=none; b=Pb1S8A9Gaa39UGuHnDaNZRyk5PUtc/Ey/Y1eUbdY9sUC/AGQe0aqBCU0h/hGGyASeTUwOMP0rVlau+zkA8HIhsi12xOPEyoWCBJvOLoVWkQ8EnUZlZZHQnXm8WXVgl1UKXKeGWKdUhbxd0jrBUw21r49tRo+wmFOg1AWaYLTInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322917; c=relaxed/simple;
	bh=TPV/gANFLQmr2bfUQV8zW1ahfpoF0zZmztpolXyucCc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G6zG0sYa06zcCsc48Nq7bWSiExCeYArpbkFkASADEoms3Dg6swNyyGdISJP7c/xo+hKg51mv+Xcby4i8mfW4Ve8UcFHJnZouZOcT38q7MYRI36suJchiV7s8wasDPnbm1aUn1uk1VQ20wx1Xd38RB7x82FEi0Ei/6I7MTtkld6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5OJUPDf; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5OJUPDf"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-615d0b11621so5622549a12.1
        for <imx@lists.linux.dev>; Mon, 04 Aug 2025 08:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322914; x=1754927714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2SQBN2LqLgnFTTK1bF/iTPkYmGpLMu0WNvqsbmaEDQ=;
        b=k5OJUPDfsAJ1FeKl2zdXHow13Hax2jKbwITuzqOx69UmsL/rnqPijhOZ991aQw0TEp
         rTyMHMgJC4Z1sbCHZE9zPF3bbyGW7J6VC10iVvI2B32HsWCmqF3XDIRV4/39u5Fe9QnY
         1jSDz4LF/T5e+v4E7F6RaT5JbuWuJkxN0qyymieb+Oc4OG683SFpSBwqEREHAO58m0d5
         v2cWCSd4odFTRIfAEDVYMsSHisahY5fAJYR6QW/wj4b52qvchkob3sBybkkcEjDWiJYx
         sI7hN4KEnifwF3eznia5W1MwIb/kA6ZdzxN9fe8Cf8FCKhFIaJbGUMriInFpQGMqCl2D
         1+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322914; x=1754927714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2SQBN2LqLgnFTTK1bF/iTPkYmGpLMu0WNvqsbmaEDQ=;
        b=B28X6zLmAvsO2ji8E/TsBvSDBjHq58Ds8qV/xz7acvAtDTpey3UL9FTYp0D7895whz
         KQDGEPNGe48hPvlsbSs1rfAPduZJehHDzYcrJS7aHdk8y7Msv9uVicFiwNze6orxdmVo
         3yqwn4JHk8M3wsl0sf1LBiYW6YTwChuIoGiDLiVQiA2Gs0LguDjLe9fEcWPhzKcmANZh
         LZoEQwBWtt88uIZ2gXYFV07i936YiRGU9p8Y9R7wYJMPtnveTC78XwS7tXfmMEFanyOx
         lYXSRlVJzemHJAa/wAC5zFiYXSDvoZz+fA89PxR16COgsScv9LDTMeDgm4Hlef7cjFp6
         mYvg==
X-Forwarded-Encrypted: i=1; AJvYcCXoyfK+CcuArKD29nolQYMzyQ7K8isZY5i+DMyrvEO6c9i5nIPDq8QeqNCUOrcTy789MDg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxT/jP0/IRri9ZwGlTMqwMs1gS/UF4cBtV96+lIuKvCbPHwqtHu
	lozD8bY513uJUvuL5yorG1ewSmmAMp5064cSO3gwitzNdDrjTiZmX9zH
X-Gm-Gg: ASbGncvmqsHR8EqQJLfkDAueOAcA1zxoU7VfM5Z9qz9/MZ7kPbckU6kAFK9rbU5FAwj
	ZOoMgPlOwZSW+ueB9RvJIHApFNc+ZeOhij+RvkytybDVaihQPS5vjsejxyKW7wWz/6B/nzy4nMc
	g5W+zGf0w5njlEOA5O709pnvwY3ndtAahUv3lLrjGmbpnM1DqdQqr8nS3uEpDrSvEB+xserGP3q
	KqXaeolUrfFwxtQ4+NcEvf5Lq2kmejw8bd0M3EOz7VyzK2IY2nAG1sSTMnkLFzWGkP/gGTJ//Zs
	uu5SEXOnSb+eIaN2h3PrRqhzgs22gvJTWSk1479JFVEPlD2+a7qf16IuJ+FYvvxtB7fUNocROoh
	PPrIXNVHAPTbqUD/INX4s+IQfYEDZHfHEURcpy5X9GsPZGWSXu7JjMwMWZPE=
X-Google-Smtp-Source: AGHT+IEWkAzWDKPbEqjRuqq3sF8A9XVVyaZnj3ChlC5hZyh9wED/CGb0dzmMEblht1brVSC3lOJCEQ==
X-Received: by 2002:a17:907:9722:b0:ae6:c334:af3a with SMTP id a640c23a62f3a-af97d21fc73mr11381866b.6.1754322913598;
        Mon, 04 Aug 2025 08:55:13 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:13 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 2/7] dt-bindings: clock: imx8ulp: add SIM LPAV clock gate ID definitions
Date: Mon,  4 Aug 2025 11:54:02 -0400
Message-Id: <20250804155407.285353-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add ID definitions for the clock gates managed by the SIM LPAV module.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 include/dt-bindings/clock/imx8ulp-clock.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
index 827404fadf5c..ebebb4831761 100644
--- a/include/dt-bindings/clock/imx8ulp-clock.h
+++ b/include/dt-bindings/clock/imx8ulp-clock.h
@@ -255,4 +255,11 @@
 
 #define IMX8ULP_CLK_PCC5_END		56
 
+/* LPAV SIM */
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_CORE		0
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK		1
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT		2
+
+#define IMX8ULP_CLK_SIM_LPAV_END		3
+
 #endif
-- 
2.34.1

