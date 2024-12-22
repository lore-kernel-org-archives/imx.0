Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB5F1AB6D4
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887165; cv=none; b=mfcPm9l2MlSrEvwutUDUWfkx646z0Pzc9x8ZquK3HOEhNekmDta7U3IJErarZwdYz6cRmBGSW9XwdFWxEwa4fLSec7XuvhANYry3WbF3DyCVGG2izxDDMF7cnD8I78sRrOqoF4eS1p7h1sZOUGAlqCjUYGXe7V78GT1fQTF+RwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887165; c=relaxed/simple;
	bh=UMdg/7HEARC6ZgU2mWDyh9m6gc8+etDqX0OWe/Oj1Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sz+qJO2fdB2ItvXq7rc3IIsq1DyBwXEL9Zqbqr0ETbmT5CAyYNXENLmbPuGSvNF3j3CKC4pXMRvISFbwsZVN9DtNrDMJTHJAW//eRCe3nPnNn7QU75unfoUm+dc8gRSylkD13hLd8WXFUmK5c/xx16kc9xVtjlJwaoosF/8T40Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BoTh8j10; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BoTh8j10"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso595072166b.2
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887163; x=1735491963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deJRTkp3cj8LQIAgwHRGE8nfXmDlGN+dwLVOnyJ9CpQ=;
        b=BoTh8j10AoRT9g/XcD2vJGmUjF5DTvimSAf5HnwYWMMLB4/UuPSHyaVzl1WW0D0fNp
         efGPyAyEg9QLhTneh1REIOMhiHto9WAa8izB1lypnMT5aABNyT7ostrGbXc7Cz55RDTs
         zMMgLEMvB+fqOczRECPmSOe5lQ3xK9mGMFRi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887163; x=1735491963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deJRTkp3cj8LQIAgwHRGE8nfXmDlGN+dwLVOnyJ9CpQ=;
        b=fyiesdfsALXm1rL/bwfeKGZknx2OKPtIAfL04GblNCHOK5+3hoauqlUCIGX4UCPIej
         Qd2PnCPxBydn9dWg6aOnTp+2yn4pkmyVgAxtmXBDIPcZ7zKvn/iLCFMLSHuIkcpwprIK
         hwddq7pnqjTlQqfUbLRiRQz1fjqY4kg2obmn+37pdgnHDdLWSR4yXRZpP7GCNZFZq2Z4
         0JTZKh8PWkX1oJ1o0hUsZy0s+n0MrJ3eVgIyWE0aUIdikY6OV/Ukg39qXSFNBuuog3lM
         QJBcZkv5gGhNzeTw7ruyF7RBJf4hppXIWVa63VDglLnT4u84rL2Bedkqj6eXSxsXgPLg
         +vXw==
X-Forwarded-Encrypted: i=1; AJvYcCXQPqozyhhinBtvuNzGNTEne7PAopCzZjU0UzGWp55eo+16QzellmULC5eaCSqCXHrMfuU=@lists.linux.dev
X-Gm-Message-State: AOJu0YykVlQFSLTTEOBSiQAfldARg+tNDODj0a2t4lZ5F9W5zFBZMyAq
	XLdO8lW1PXhlvmI+fMY07pfGhLfirHr243giv4Q5TpEua44cs3t10iHqcPHg1dE=
X-Gm-Gg: ASbGnct7SMFqYwfSX673SKhFVvDESGESzT1I/vKUDq7uumtZ4/WXr4kXSQUZTcCSBUo
	w7VNs17Jf09akEbu+cKGX7fg3Hu5zbdGlA1pmKTzKbEIBRB5ar05rQ2KkWvoDNJphCKWDP683q6
	QedpKooZpjgEtZM+tYieRaGR9A8YgEPHG/8pcpHoJ8pid+TK8ZSPaNG3HhYDHncpZJbo7qsA/28
	7H65czFhnSZ+lmLpf3p+dRksZZB1OquuBRS8yEHhDpRTquJYPsPBYGEz6PSTaAVFh3BCYvRGNtE
	mpXD8ZZO6VrD/gaIy0PBPKkQiZ0Wtm1SQVXJAIBVSyREWA==
X-Google-Smtp-Source: AGHT+IEHT0otOomGSUQ0XrcVfX2T03CnBKdUdcleEln+L6jncWNWYmfWUaMBTp2oSHdO5rJBcTrtbw==
X-Received: by 2002:a17:907:7f0f:b0:aac:1e96:e7cf with SMTP id a640c23a62f3a-aac334425abmr1040495866b.20.1734887162609;
        Sun, 22 Dec 2024 09:06:02 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:02 -0800 (PST)
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
Subject: [PATCH v6 14/18] arm64: dts: imx8mn: add PLLs to clock controller module (ccm)
Date: Sun, 22 Dec 2024 18:04:29 +0100
Message-ID: <20241222170534.3621453-15-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..aaa179784717 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0

