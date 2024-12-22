Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C67F1AF0AE
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887167; cv=none; b=qUI5UpVrMQSQr8FDmmTNKHfmmc7oy4NXCiJ1Zw7LOxXxIBJHiS85mnYF3krUYop7CD3JgooJcqneDP++bIJX6+Ud337WGb0YUzuvvGWblkOWxvdOHhp3jvw+sl3sVaF+cFGID8/DQ2ZRU46JKb7qlsusAfq2cdmVLiS0CQVtLTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887167; c=relaxed/simple;
	bh=esezWmna9GVq9r7yCdcGJZGlaSCNF6WPrEuO3eSEza8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYzSovMsAIxHwLKDMeA68p/LyxWz2gPcq6ZTSQqKYXzf2te9Y25aXK8IF665JQBRyyuyxp8+M1qznRTuQNgifrEsO7pL2Ue+yNpCi3bcwnr+6c4I2xDITPBTkm410MAVIn0atckIsNHRqdyVl5r158V2ZUjFUiVPQUOsWfuTy5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YyDvdvRe; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YyDvdvRe"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa67333f7d2so544717466b.0
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887164; x=1735491964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biWMPay2nyJxiRsIuM7kfYUrVvGohPt2+JFfoRTvr08=;
        b=YyDvdvReQ0t83CWGomUcNHYClzw56O0FTwhBXCV59ATMOyHz8fJryrfQfFJyZAm+vF
         ohiZS6fH+hSLerNNk0bs10SiHjFcoDFLVuHMbKMbzCFGAFXgb2e5R9RzbpuL2I91Dcvn
         +cKMrYJu2/vOAPuIrv8UaEyRNpFLOa+lAe+/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887164; x=1735491964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biWMPay2nyJxiRsIuM7kfYUrVvGohPt2+JFfoRTvr08=;
        b=YOxofp4ck7PQPfkQ8KIuaqFQsjGLN3sLqMgPdJHgaIa/icKrnt08GwtDJqBlGEur7/
         KthAMolOuYhURhSJLR1sdPG+3Qw/cfEiBrlFfgcos2MHNpexxwhj8qwMC/SFeFJCtCiR
         cs/yTjQRl6GBQ1ga3f0OXkQUKJKmesApU6XH+fFXxAytvcnHiyXATiiMtJ9o2adixBUn
         Ivv5hrm9/Z3KfJMVfsS0JWEhdhDIm5A1+0DU8pd++4b7DOiL3ospf0dS3EccUZrwka+C
         27jKWY/dmWBQ34JKG6wfaEXG5y7u7dHk/DJeHauA6QX9fbG3s5HYO8fo6lPyThP0klNG
         stXw==
X-Forwarded-Encrypted: i=1; AJvYcCVLe+zMUif8fyk6YZueQHgloG1sCbd3FIx/epYTS3d0RKB02M9ZfBJxmnTdKSknQ8M09MM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaEK44J4otAqPEsli5pa1LvPPJ2AuUelDtz++istIj3USZcX1s
	2VeTkgP7ZKxG2Mm352SFF6qHjJ5xNOh2fdRIHcEWMxDBWoiR9KSSkyFUl8fZnuA=
X-Gm-Gg: ASbGncuWAICrCUk6MGcWUxIjAYTRxJ9Z63n3CUOZvvZQJTA5x5yq7xsD+ISj8xoKbid
	I5yEMXBC/9L5x4AbNjSAXVFuE56QgTLflmnUhbYmgU9Zm/MrlpRWPu8ZK/22KfMYfOL3r9a7HE5
	YfmJtfNbyt0UXcF3Fq4NL5o6jaaq/n4m/uxhouhW4/3M/AFD0Y4/A/HWCHS3T3YnzrfjjotqjMs
	7qpqToBnoQdbM8TB1/yJmPfkbsTyPt9wJhu1ZKzdZa9J7k8WrTUHPIDZ59Ln013bdKO7hnNYWKy
	ikMGkg1KOZS7v1ufC8GP/GgMw1LrPx1jrJECi+/bW/loXA==
X-Google-Smtp-Source: AGHT+IHS1WqgQkIx/Sdk7zlN3zZOAZuNbmdvKuf/0PVXS4VuRqhbEOl7O6hKLHRinTiVbfdiOSnO1A==
X-Received: by 2002:a17:907:3f12:b0:aa6:7220:f12f with SMTP id a640c23a62f3a-aac2ad8abccmr1116056966b.18.1734887164295;
        Sun, 22 Dec 2024 09:06:04 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:03 -0800 (PST)
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
Subject: [PATCH v6 15/18] arm64: dts: imx8mp: add PLLs to clock controller module (ccm)
Date: Sun, 22 Dec 2024 18:04:30 +0100
Message-ID: <20241222170534.3621453-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
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
index 0b928e173f29..861bd4f4dced 100644
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
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
 						  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0

