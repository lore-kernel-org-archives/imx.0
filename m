Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC11BC065
	for <imx@lists.linux.dev>; Sun, 12 Jan 2025 15:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736695677; cv=none; b=gv+M6V6vHNyTE40YpxAyt7uEmQJkDsFX6qGIYP2EFutaAcbfXEstNeETrYRwyOifzcrl8V3MDNu4mwPT6ee/v9lC74ElNsAT5jjqc7nn4ueckGwOh7NFzLFpblkcC9vYdWvSe1WizzbaYFn7CW8i5kppYI8l8wiDkT2TR/GCBpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736695677; c=relaxed/simple;
	bh=rcD1d64iYBKXvYv6LjGuCAaPSSQMypySS6wyMSoAm/I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ahi+aXBucMG1Vpo8ZOajjFjyfEG0kXqM8KVdr/S+Hkvyt/bgDtBHWtyjMuF4sQaLW7Zf+XDYdDFndj2i23gZMl/0bILOy7W+B+Cy34sR23vbQu914BodNp4qJ5fw7nqqvtvmoZUFgqRfgxfh+WKGuq7tznHDJxzdqNng3MimtHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHb+gfsc; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHb+gfsc"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2a3939a758dso1153455fac.1
        for <imx@lists.linux.dev>; Sun, 12 Jan 2025 07:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736695675; x=1737300475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufSZmiJg7tnVJs1W6WLAaINWDzw9jNeKjD7XxxhjWnI=;
        b=VHb+gfsc4MNGGOyAkvJsgJY88DDwYbY13iGzZvDjPA3OrFKIuUs2IphTjPUFSi6TAR
         wMxfioL1Qs8hDa907N65abnoUTZ3zgycIeRhzDRamqm8Ogn9K3EPJcYs4w4CEn+KiqIz
         vt/LUutPubRxX1/I/Zk7boKdiTPOHSELk4oFSM87MYdFc4eRYZspDcq2I//JotJIwfFx
         dQ266qkNanIqEPSWUKt/jw+ycfjpDPk15fDAt5EIIiUxTotryBl+jCuEzE8PFRAM71CH
         GNRadDqWtF6M7FuRQ4Ty5ESze5fvniNaINbQ39b2pYsMD+Lme9AsZpgFA83wZMaK5f92
         qQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736695675; x=1737300475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufSZmiJg7tnVJs1W6WLAaINWDzw9jNeKjD7XxxhjWnI=;
        b=AMeoI/Omp5OcL9DFibUHfh3LDhMGxi0han5ynT2VA4tcX/XZ5gBD5lgmZIlDxkW5MH
         Zyy7skdEIv+pgCsnPVHd6vpXUJsiTDouexjwheuvx8jdN/YmNTwDdHpawJ7xw9qqkckl
         gQE9kQbi5gmRk33X6tLdWnKIk43t9tjx/t8yBifx12a5ASNa038XomlQJ2olxYk09e87
         6pSBfRv0yf9PYfTnt+RYkFzYISEDXlMlaP5g8oiEFuKowzzWHGirArzv9Vcl59GmN5+W
         hvp+lUAWaXHSyM+4aGHs9EYQfqZp55tDkKnlJQ8mu7uGK9+sYqJEJrNRFwtHJzkwhS24
         ql6w==
X-Forwarded-Encrypted: i=1; AJvYcCUnER1Zt3sHdZO9OoGDY4S1r0M9oxodygSzCUIU0gDKcRsHUg0HjYLtZEDf9VHuHX56rt8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoNV6SF8vMlHLmBOZrEGAUxRe+B41NVuKf1oQ62e0kcZYVQ4EB
	rOGzlGbD7BVWgy8+RYgmjqN2TNF5MVSn4UJ57OIKgUKIyJ3EXetT
X-Gm-Gg: ASbGncuDVSQ36ITyjIlyRYugy8u3R/XHJYlRWwUJ1W7JYErtXF3A9tEb88QGgh+d8QI
	HKvidSB1VAuzCPTtWn6nqQgOxrJgZEkifol4hv2ZbVUy/TFIpkcBrvoeVlg55j4cjR8Moq5C9Ln
	H+w1liOHe6tU/EGc5N8NN8q5UBNw1ydTITdVO91MwsYu88G1cvQJucgWxweQegaxd6eVtq3Dfiv
	c/RH4hEr1F8nRcmL777pp9+RbwDX/TuOhYBYNrQVMUaxcKiPPUPEwgYYEx3A3izZwHBOA==
X-Google-Smtp-Source: AGHT+IH/+RAxHFYqIOyPuZoSqSonhUnJs+lnRAyM2sKWo1AcFTT4c04wf85xXiYXKcP61dZvTha1Lw==
X-Received: by 2002:a05:6871:a08b:b0:29e:76d1:db3b with SMTP id 586e51a60fabf-2aa066470fdmr9828945fac.5.1736695675132;
        Sun, 12 Jan 2025 07:27:55 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c53:b609:d83:9568])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad80547c11sm2858083fac.18.2025.01.12.07.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 07:27:53 -0800 (PST)
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
Subject: [PATCH v2 1/2] ARM: dts: imx5: Fix the CCM interrupts description
Date: Sun, 12 Jan 2025 12:27:44 -0300
Message-Id: <20250112152745.1079880-1-festevam@gmail.com>
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
Changes since v1:
- Use interrupts = <71>, <72>;

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
+				interrupts = <71>, <72>;
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
+				interrupts = <71>, <72>;
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
+				interrupts = <71>, <72>;
 				#clock-cells = <1>;
 			};
 
-- 
2.34.1

