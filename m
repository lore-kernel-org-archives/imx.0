Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A083D9DD0
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929697; cv=none; b=aM8c3maFosYh0PKC5QvaTe+CtNAmk4odpc8T5w9KzkcjJ29zAKEuMvSJ84yBcE7mOsG2V84vwqjpzSImlpLAW/YdjygnZRre6pfWCCQZdjGLDokr8NTJWbcEeT/7d8bJjgWJgVOEwiHfePApn552UInvJJXLFR7XEot0WuC4o5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929697; c=relaxed/simple;
	bh=c/nrAIO/3dEoo49w7gfgH/7H6dFq7dwv4g6Il06iMgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbAJDZngFEkSFvi6QdzgJOgiSxB+On3+/baWU/z/NQGcWhvcg6uw5KtiyRvumXqZqwRGKVH2YGBeMqDIGfFkpc+Of0jimDjIrKSDQkmvR2Q2dnoc8VXbp3uwBMAtWlIC+t1rbouBQXINOeCX8cOcL4jYxm5ZxSdYVVwyEBUPyp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYGfFbMy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYGfFbMy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b613a17bso43270935e9.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929694; x=1781534494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWodKsfn0KNX/FzHIFLdEyI4kUZh+cmTaV880QtbWJQ=;
        b=nYGfFbMy2tOvwsHVTkaGgus9Z8f1B89cVoKwWaNoKsipWDlh6JDiVb2rC9jq//kWyA
         5LuLTLHjQfeKl4QGzeeOzHeQ3RHEBTVzzdqNsjOY0+z7pnz4QYUp/jv2iGcWlwQgVCDb
         O5ZVuhEnz1hC1erWx91QS1laLRSYTj7IrpYPtfLizurjTbd3HU/pGY0gQHR+Pu1pUuCR
         Z+vQvFMCg5OHVTHvo5U/qxw6QlRAQBmfErCiiMc5717+7jgAGLcvG4swVC4Ab4Dva2Z+
         9fNOf1tE38gG/XXvZE21OfIX4u4hpmTTm2W+pU4kcWDUFIVffabsqTW6LeaheheEzpY3
         71sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929694; x=1781534494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mWodKsfn0KNX/FzHIFLdEyI4kUZh+cmTaV880QtbWJQ=;
        b=UHC7bydi8O3YfIHrH8FxlExoCq3KaUaxCt0zyEqb+tPE7gLAMVmvTgNIXqZQMi5gaN
         Zw/ggygFXTcnuoaP4tcDor9bldEzdWQQ2m9ip06Iv/quh0y2p8D0T/sr9gnyZz5VAVsT
         xR9tgHToBDc4fSgR16oorouLMfvUQgSVHFunaX8IPI1zTtBCV5nu8+onIj2WJx7JtYXF
         +CKd5s5TaJ9BJ5bLqNh6MIPKTbru3ynLrbssTvVpvCSIBg6r3N9FFojIZ+H5liummJb5
         SUpUX2mmFHjo7PcL8mr7yaGvLINYsTxpBkqOfyxcfYqnJMl2oMsR1zCfJ+ej4WmCsQps
         OIUA==
X-Forwarded-Encrypted: i=1; AFNElJ/SarsP17cGz3mb3Daj3swYKPfQaiJ6ts82esbVw0urhCtHKQfPWWX3Vtb/W21AuPtWgnU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf+EchqD0Z/qfhMrghG5w65cx9DYIcy0D35T83Zy82lyfcUXaH
	maL87Bs3nSBg3ouQl6fyTXT+R5gwI2BzJEg73L6UZYJy5PJpH+vWrTTL
X-Gm-Gg: Acq92OG6cfgsOa0CiXEAa1203j0LGpRSSirRLnHCqqHyz76CWlh2i8jZIpKXbdeVQYl
	19JOmN3ZBkOSk/V/w9shIrR4L78FmhjJrr/7D3CRXf5ienPPQK6FF4pj06WS0UQzc009FZ8C9mx
	ZEunDGf2JQyEQF9DDQUawyNGJYgDoULSAn6yZNp/1wrM/J6iDpnUGrlChvf+Mm3+BRHCGu2hBmO
	mnnWLxEzWo0A44j/+BAPAqEEkdArnPJLi2B7WFFGjg8epxjYhuc4nnGmYOeX9N1R/DOczSHy+wz
	CyhChAjatzASzfcivqJDT1bIn5oX3Bv858m2qibVM6ZNbCKEERHBTyt7wfn5nfKcvO0ym0ToMLe
	6Po68a4ZmO0drKflq3JgBF2PyOfZe1gKEYEry+foTkor6n1sWoDVfF5MB4w8GAsakov4JHHcirH
	WvCVrU+mfyxTkn8UGf+4E8gRcJ27LIsewb8FesKEqHFbS3+h+2I5D1aosTvpnVjeptYrFQSA3VN
	L2rSjQf/p41aT6p0m/p+TT3Btn6UygB20LbnL9dXVVO/4Jl
X-Received: by 2002:a05:600d:6447:10b0:490:53d3:47a9 with SMTP id 5b1f17b1804b1-490c25ada18mr185336175e9.3.1780929693516;
        Mon, 08 Jun 2026 07:41:33 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:33 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v5 10/14] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Mon,  8 Jun 2026 16:41:11 +0200
Message-ID: <b4cc96f60a2a40638a30c9da1d190c4a4b0bf952.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 387bbe3454c3..7f5109bb4182 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,14 @@ pcal6408: gpio@21 {
 		reg = <0x21>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

