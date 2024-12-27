Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A321FA16C
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318679; cv=none; b=twUBPYSi8yq13lZJKu2wod5AV4hC7Oae7Ib8YSKgNv7J2bO0j66hW7LF2SH59Bu33taeHoQNJH8ajMS+jCoS3lGjpgYCNxn6gAiGORiF6A7UhsJnNIf3EMvRR+vVeIfcWMIMeRRa4XnFV9M7cGQnflXNfNdV484k6DebJmirU/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318679; c=relaxed/simple;
	bh=GQfdS0kr5E8nwdLPiF4Pmvz7xsX6Pr29PRtsziZLSbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uP0twaz5kV2/+kDk0DoqnrA68dD2+PSMwAPyZsaHecz2J+dnmKxuCWmcwcZGXRMnhqNIx/t2GCqiRphA8b19AmHipGqLEO2MT+hRH937OBiOub/jqg2hod9GrS0XXCm2YriGCNRrtRDlsqvacnO/YP+W/j5Q1ShDeWHCNx0gzVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aYCClOlw; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aYCClOlw"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa692211331so1406933766b.1
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318676; x=1735923476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8SU2g1cyJY/YhurmsY4xoxi+5SPo4QoddhIipRwE9k=;
        b=aYCClOlwY+dqf9H/JKaCiK/iWIHbMJx01poKLAzf3WwZSSWk1yXxx9PhWW0W2BJijC
         dk63tiOxPjdLdXGO8B0X7RHWSNSdEcTAErnPYupUzbW4CXQO9xjgZo8VdQQjFMBYQ05W
         zTTveRt58Jr8N7xIeREodQr/zZ6/FPFp6jXUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318676; x=1735923476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8SU2g1cyJY/YhurmsY4xoxi+5SPo4QoddhIipRwE9k=;
        b=rWGQBl2Jy63ffCaYAzTGoIMrvUcYd+xIkpK2fuCQX32MUMBmopxfXlFghAmO9tFfs6
         mKwHYZs558coId3vkIS5Alov1Zj+4hHvr3DJivJ1qHBRkrNOErFRnswVd/rE2EUFkxPM
         2F2u1aaaX1KoVBe46k9YTPrPEfo6jqt2zPlh56UgtqKj2/4iZw3mcm044rpnN7stSzE5
         0cg5rMEAemEkJreFszzWrCRtsSIutGihxvbJ0NHVfO6k6ITkxWAVaeYO38WvBFO8suj4
         wU289PoY+JFkJHuAya8RwZGgo+RGCfpsFLXVhPEt6xTLOVp/m3yVByTSpwRdz+SiUnO+
         UFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWklFq/ZKVvOU0xZKeJ5jPzdUP1fP4wgkufEvPR+A4iNnWwD/UUuYkZ+uSJCsFGorxX/6M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxewc1kIJB/EnhU9vcz0Ft581dHybNF0h4aIUzM05Q2coejax8o
	YBDh00yB562d+H+AHWN8M2akKlCfHBNsHEjytOBBp0zNBAkrPgl4hgeViSDd748=
X-Gm-Gg: ASbGncvcp2vss2K5RqOSl+/6vf+q/8WkxQnuLAIvHuq9xXWL0DTmzCgpY+NyTL3imlH
	XhRxRl+1EMk8HOH2JBjx/UlqVpehKbbnF0RRVrLYm1SeKLxAR7YvL9Ys+BjbTBeDjUnfwSIwEON
	puODhAyxlhBUHOQfWvbWW6RjG24VnU5+qqO6zgcex3oK2Uk/MN3a+ofnlihagWJWArrtbG4WpqR
	KlmrTnRGsjqahFlj8kBr82atYjetSmeHEEolhuq8hh3oUbocbYLcbya+rCtsqtQ1WfYQoFb6NjQ
	nFt6vP2kKh8Hkwc4j+DJbA==
X-Google-Smtp-Source: AGHT+IH0lWPZ7CSr63+Pe3YNPdP7iCVlRpFAQ9r8ey6JfEjfuzqQLJzkM3y+9Wa7RLtt+3lup5Nlpg==
X-Received: by 2002:a17:907:969e:b0:aa6:938a:3c40 with SMTP id a640c23a62f3a-aac08228246mr2206907566b.24.1735318675830;
        Fri, 27 Dec 2024 08:57:55 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:55 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v7 20/23] arm64: dts: imx8mp: add PLLs to clock controller module (CCM)
Date: Fri, 27 Dec 2024 17:56:23 +0100
Message-ID: <20241227165719.3902388-21-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index a1872b5d6e2e..ccf990a63372 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MP_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
-- 
2.43.0

