Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE8220AF6D
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 11:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260659; cv=none; b=i3NvQABC25UwcQKzug9/QLu580U4q32BG/07WyXC7kfd/u4nOCcCd+dKGnhyC8QjUkQeVR46YiJ16nd0yhS/pcdBoxriqUAkgq3VlhGMQdGQRP3wKWRmb2Gl9O0ktAm9foVzWb+H3grdszq0Hn4MTJ6/ebm7E4pjBYyUiwklztw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260659; c=relaxed/simple;
	bh=gzAb8Vev7F0m4l48I407MYxa8qXR/pteEzI03GTE0HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVyHT1wggyF8IvcatAVUuOqhFfBq2BkS9EO+Sk1JBl6JnpCa4abGzIdl4HLJfx+aORwxNxAO2VInpcrRakjbPcg/Y8PTT46Qbvy2lww92688g29FEu07V9I1qMn4k1YHWo2u2feMoD0nexWVMF4GSPheAqy/GHCddwEr/TQ9v/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=LQ79p0xc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LQ79p0xc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390f69f8083so521613f8f.0
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 03:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260655; x=1741865455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=LQ79p0xcmJRmFo+AtYcicbVOBWE0o07oJ1Jifxbs063/MCi+42lgvvOsxWeap9Ykhb
         PsFK6zmWq9ZVQl4QxbOLKrbEJzbYUXCajEL+0WTDGuM3qR8pCXDzD7zcpqy1KC5lcAPK
         sZqR+agKnoQENc6rmv9z4ccizP7IWrl9U5COc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260655; x=1741865455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=Nlt3988Br22Bdk6RzLIEN+dKpWHN1nZwNBCgJFTyLICaOTJKGk88918tuh1nBjhigR
         8oKa0BzXHmV6bkWW278Ip+uQjFvB2D58YowWZCKk2bgTeS5RgCbzw73N3llE6mjE+9gx
         6TRWnGccBEUN2iQnWjQheBENP0bTN+TijCSJiRBS9x6n4SfLzszyUn71bnXMS7p3Loxv
         azNyeoX8owFs+nmgzlkbCIuGrtlsh8nSDDPkFLn2ZOpqiecrFZlB4c6rJzn0qUuVjBmn
         9qR63rnFb7Q1HJY7yf7bqz1rVooqjBi7hmgxI1CEqO0ddGCzfeeG9DqRk8ZswMIQxxtG
         B9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWLOrOOmsTnhjWNPLYSEQRe2ITQIn37Xo4pr+SnubOiqaSgRia7ZRZzz1CO+c/s244EnBw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yye8yLHskC7r5mRNI4depwocLnsi3nZva9gCt+Wr5CRVHnqufDt
	8D5rlmydVVw9qzPpekYZQjIK8Cenk5yfiN4Lmgygy60NjZ5CVb2AoHeFdisLN64=
X-Gm-Gg: ASbGncsB7Q1QFiwhZkqBeDyNf1zmzGCSR+yoZusEK5UAm7XNG/GoXZOpE404o6DehSo
	PsHbjV9EhpZTlZ/ILOL/76L3p+87fjmPDccUsbcTm0tyeHW2+cBsjT0MKIWnFnz56C1hKNsJwQU
	2UihDMRTNrZ7ISzAu1428AYod0dINKmtowvPDPzc9759W3tVuWt7hHM+KMuSGbAtHugjQdQUb1c
	UKLsAfyJ4VkFlKED+MWd6IJNYupTEo4k4IyuF+5CZQ5oGdMpfBON7Ullb9i3ToFQXTQ1XQXsnIr
	pAFaUO+SxZBuMPZzoQUl0SETcuIxrzuAdaHipZMTAC22BBq2eTrySm0NB35VMiPLgbj+mBSY9f3
	VHJpKPg==
X-Google-Smtp-Source: AGHT+IEZn/9kHcDhx+uHLD679Aq/6iWA+3OuKqlfoSyRAz/qXxji0vn2yOVWqnfvegWeGGNMCqwuaw==
X-Received: by 2002:a05:6000:1788:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-3911f74e675mr5508637f8f.26.1741260654829;
        Thu, 06 Mar 2025 03:30:54 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:54 -0800 (PST)
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
Subject: [PATCH v10 16/18] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Thu,  6 Mar 2025 12:28:05 +0100
Message-ID: <20250306112959.242131-17-dario.binacchi@amarulasolutions.com>
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

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..79f4c1ae7d8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0

