Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3B20D516
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260646; cv=none; b=MY0xjNewaH0VxbLVbn4E5mSqF5BnaR95oC+nz3kK4fZO4Io9BIKki27niVoMpB6X7u/917mcaLCSiy14dxiYXXhCSDl185ZIUDHX3y8EMtIRAeK8RV2/CJeuSTiXX4DiMKRkjMDuB8aPoaKE9ymU9kFGaGDpZ6ogBf66wztraa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260646; c=relaxed/simple;
	bh=MWwhsP/1Gq2jtC+XMH/+PSmlpfJmY2R2gm9uwDR4fZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Af7pp05mbJwPPJcYmcVqVpbklTOmqy2xo7gSWuqzi55OBkUqouI1fJBywdBF3xJpx20tjRwTFQu5dZJM1xMFRc3+ir8b3m2KLv3ktqMjNHCRn8fNAKaiQOZXR6L+iGcZWsYWKoBF0EZmFud3kVUv+tC8WOdfUROckET8KZXxxBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bUwuWuOQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bUwuWuOQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39129017bbbso235628f8f.1
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 03:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260643; x=1741865443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=bUwuWuOQ37/XnQIZgZk8VQMh/likS1wTPP331WFNeKDQw+BMWY4Y7fRcwX8JsVi7Fq
         VweaMfOsJ9kg8vhsHaoJN8Y8NAf1JSulpzF53/7N4mBS+IJ+NyeopC7QSHNxl+a9/NRq
         H3P9k6SX2j5u/4ii5h3HczSUmhC5W/U1DlcB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260643; x=1741865443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=oVPlj176NmnRXDXd0eWeWylxQfP8jXZ6GurEjYvh4cLHhKltPue7Y4yEWlBIaxJsIV
         SWXoowJG+A67qBOyBvLHPSR1aoRLTxBUSobWf8QYgJaGyt8nYrasG0Mj4JROHyKP9b3/
         C/0FpqfzNN7s9Ouj2S7rmGA6ZvMzZ/atW7Fv3p4nG88UHEVsSNwQUVCEkxLTWXzPn9FS
         p9n89cIB8l7E4DhaLW5lclwWK1i8DbgnV7tTvzlvMUNh7VBe0xFcqnl5jPkyfLbNwVk3
         ERXhBSRVBusuUmvCufO+HY6Bhzia2yHluUO+8lblVWQrFZnsfHTUlKJH4kSGt4hjOpjg
         beqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbBCSTA7Y3TSEFdlMgleLJnIKfS8zjIBCeX56nqDd0ZX+6XkHxjYigqDXXt0l5rHBqwpw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxilyRsQj/qeFkyA0gpe5WsCTbSDVtDzN3YAe9/Q4AQtSvJRXP2
	EtDR1HokXAWFHDCPkrVrFAM2zUePDDy4AFtU2u7foBXi3gkGpB5NTLPUyxx2d+4=
X-Gm-Gg: ASbGnctTh7aYWEpfRxJ1ALMZOoWflRZa5FOgjPz5ItHM38RHT2t0EXMZj+H9wlhPG28
	6n1RWTq9nqddGaCpKcHHwzmDjeqGb5cPvD5sSyQW6/hQ4H8uI2R/67Cy4X/st7waINtUSazjEei
	yw1n9vnH0bLR1sRP7UHX2rexIk42kwYqK4zhBXvK1POoCopb5Asa5X9ar61RpmhuNVp+w+P1aff
	/1oWj881mPLpUbF0aWkhulZCszeU73CofatOn3T1Esrt0eIN3Guk4YX6P9axgbMOxA+zP73s1Xq
	MRWURv8vVsLXHq8UQRBm+fSKXS48p3Os+PjR4OLb+ca3XtTTsFBYjMthPsVU21DhpNoq6tt8F2o
	guBaS9Q==
X-Google-Smtp-Source: AGHT+IHvHIK6gnR7vBN0ADzhz0P4KuVyIojDRjOIHgSb1eLz6CEIpvyk+w8pwsH+YWiTBaZGmarvoQ==
X-Received: by 2002:a05:6000:154a:b0:390:d796:b946 with SMTP id ffacd0b85a97d-3911f7c229amr6475681f8f.44.1741260642721;
        Thu, 06 Mar 2025 03:30:42 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v10 07/18] arm64: dts: imx8mn: add anatop clocks
Date: Thu,  6 Mar 2025 12:27:56 +0100
Message-ID: <20250306112959.242131-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

