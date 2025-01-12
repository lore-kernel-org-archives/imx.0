Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9562940D
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736685005; cv=none; b=nGMLFfm0hkyznSUR3Fwi1eXB0m15larArKfnkPJdlJztEd4VUfxD4vGJNe7ATXsL8Oh1Gz8nm9e9jXCqBsMJeUmTue9rXB3PoFTKXGeKOMErQxOhmhxvK8RwGUEiDumW2azZrdzM8/SnTH2/3Xj5G7dUaZzehbFVcNeVmBZNzCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736685005; c=relaxed/simple;
	bh=JqALaE1v++PpbcezM7wf/66LPJa9yR5iEjCEheIUvDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aFmGsCct1XQFZcGMBj3qledUrp1a6jNDyOc0Jhcc1ukHSVo9JgtR3/6HbtXG9wHdCOrHbJFQAKxtKf9t/B48c4wFJpALRr6viFfgrDat9Fyx09gUsitrN4qEqiXbiitHTyy6NjP6+sjcRs3x99jNZ6F3xczqH+MNzk4drcY8A2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RP+O9Kmq; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RP+O9Kmq"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3eba0f09c3aso1077745b6e.1
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 04:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736685001; x=1737289801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EOiX4crFqNs9gEIrhVXrHiO5ip88JrNxPsu4lZh+erE=;
        b=RP+O9Kmq3BqOXOb22xsqbqee8yEXK3u84U2hELxXDVSSHQe6g3yvDztejkFyopIekc
         czI2fhRUXW5HALi6pnn/K80s1HfZHR5jeRyFgT8qv0/pqXGu5shfn0TQorFuTltw6eYE
         m11Xj4DO7Zf8i1HpaiBDus1zjm3SY/u8KQVaSW3ufDqhdGmXt4u2xCk582Ml/3r75X61
         74xpVHod7UPs83WOPAy9mB+bd5dhsPoE06ClSHsneTyVDy/Re4YxqV8NLgqzLOWpJ836
         yIpFnN2z9lV8lnCuouTQrFXAYv/zfZR4PFFDOquh1bkrCOwSVjpHQ1OwMjoSOvpEU++E
         e0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736685001; x=1737289801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOiX4crFqNs9gEIrhVXrHiO5ip88JrNxPsu4lZh+erE=;
        b=qsabJU96PllE2e8tsQdwTVl4f+m/M9U8Ij0iC4s8rSiNbCtUszB/+R/2/9DdVd68yd
         K9Bmh2wb0TIqHBuy259sbqi7lv3eksWtJ64q5ZtYUOd+2qN7yXYrT2GjV96fFzct3EyC
         d/GT/6UfQv+oBV2ANk2wQawAfIGY0zMpY0wQcxv+36mb73CAtaWnmE0wmnytS+8uai/k
         Z+RYABvapM2alNZzh2tHMbh80b34cQAgQjJjO6jOq/rJqxiddAB23mEJUOsdWDS2B4Zh
         iZMPoMOIsKYOBya+RF8lCyyj6mBnf3eG5+7DDBqnrJ8aOnKBi6mYfT7qJp9dvEddELTa
         viJA==
X-Forwarded-Encrypted: i=1; AJvYcCXFhOXEduRTt/aPzZBe4CzEaPsrSNEV2txaNK4n65JL43Q+tG0ejbiQivWDpXjp2HqEraU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCGZfJHMo444uicUolwHg5AZfVonxf2EGf6BJ05cIyp9Gwby8o
	dja2lx+poXG9ga0WpxUzwY02ZHPfIMYHrw3FEIG1OFXlvR6qat3R
X-Gm-Gg: ASbGnctyOBytR8lX5vNyOzlit3PMfM+2R5OJNzrGDk4W1+Xondns6eDPaXMTOEXZ+G0
	X1Hi5tbPJcddKSvV+r/mdAWLAjxJIIlpIIxNfeQpI3Zx8egSUrMaQylhoqawwmjcANmouvtreJn
	kMsyebD93D74GdeOrMt/FtSpHNKFs/l6UvGIdtTxI9WppUDMkXOLQBYB/glGVteSmElWHDE6RCG
	cOwkbnlZNATJVzE6/eU9CDhPK4d9EG7nyK/dkkyC3pM3ws32kaTQ57AME9aY3mHSDF4ng==
X-Google-Smtp-Source: AGHT+IHUMa7cT6Nz+jMGSMZwZ5HGk0gv+giMFYc59Vdedh64PI165/u7NrAV0tRuTmem/Cd8rrEn1A==
X-Received: by 2002:a05:6808:1922:b0:3eb:59f2:329c with SMTP id 5614622812f47-3ef2ec6c76fmr8758189b6e.3.1736685001618;
        Sun, 12 Jan 2025 04:30:01 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c53:b609:d83:9568])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f037653ff2sm2196609b6e.13.2025.01.12.04.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 04:30:00 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] ARM: dts: imx5: Fix the CCM interrupts description
Date: Sun, 12 Jan 2025 09:29:38 -0300
Message-Id: <20250112122939.988309-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

On the i.MX5 chips the peripheral interrupts are represented directly only
by their interrupt numbers.

The CCM nodes are not following this format and cause the following
dt-schema warnings:

ccm@73fd4000: interrupts: [[0], [71], [4], [0], [72], [4]] is too long

Fix it by passing only the two interrupt numbers.

Run-time tested in on an imx53-qsb board.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx50.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50.dtsi b/arch/arm/boot/dts/nxp/imx/imx50.dtsi
index 1b6f444443dd..f0b12a70f614 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx50.dtsi
@@ -338,7 +338,7 @@ src: reset-controller@53fd0000 {
 			clks: ccm@53fd4000 {
 				compatible = "fsl,imx50-ccm";
 				reg = <0x53fd4000 0x4000>;
-				interrupts = <0 71 0x04 0 72 0x04>;
+				interrupts = <71 72>;
 				#clock-cells = <1>;
 			};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx51.dtsi b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
index cc88da4d7785..2bfb6baa67fc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
@@ -458,7 +458,7 @@ src: reset-controller@73fd0000 {
 			clks: ccm@73fd4000 {
 				compatible = "fsl,imx51-ccm";
 				reg = <0x73fd4000 0x4000>;
-				interrupts = <0 71 0x04 0 72 0x04>;
+				interrupts = <71 72>;
 				#clock-cells = <1>;
 			};
 		};
diff --git a/arch/arm/boot/dts/nxp/imx/imx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
index 845e2bf8460a..b7147cc7a316 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
@@ -598,7 +598,7 @@ src: reset-controller@53fd0000 {
 			clks: ccm@53fd4000 {
 				compatible = "fsl,imx53-ccm";
 				reg = <0x53fd4000 0x4000>;
-				interrupts = <0 71 0x04 0 72 0x04>;
+				interrupts = <71 72>;
 				#clock-cells = <1>;
 			};
 
-- 
2.34.1

