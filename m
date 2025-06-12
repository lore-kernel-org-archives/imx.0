Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE165FB95
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 00:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688771; cv=none; b=Rc/bbYl9X7R+TOFt/x1b1G2uF9lvZAd3o2nrZ0YPHTNfYnvzEh0Gpe4bX5FZNhHKbLEWcpZYWUT0yBkJ57/FixYaDRX6HOkM0T/e0SFskOKEhsZRSECV6TDnSs030ddKSUn7pQrnkbAsWPrdw5uI1opQ9wPC07aAB4tXXBWhaDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688771; c=relaxed/simple;
	bh=pc5IEugCvdYtSbRb0olcPUfngGpQpb1o/qW+d9x1c2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHgWudAw9WdKA9cjWB1o7Kb4Dstg38+OAvDsxuDBZn0vXGZA+2evh3vZT1ua3KnMlWQxqeygjCH7g600nxFDrL2oO7dENp/fjhOmCjUWN716WfH8l5JHl2JS8fITYvMKGh/heH5Ebp5I8N8nlsnfSCa6irABewBeD7rj18JeHDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6TwwpkW; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6TwwpkW"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d3939ecb7dso43414485a.3
        for <imx@lists.linux.dev>; Wed, 11 Jun 2025 17:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688769; x=1750293569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ht07tlK7uVqjW6eAyQxL9Kr0y3ckT/a8+OLYs3oBRRE=;
        b=I6TwwpkWx+fjjxawKvZ+vxGDns3TlBVcYayRfGHBy74fAqnqDoZ+JaBbyyWF/RpCM5
         uppC2LhyBIXvFXT+OL1fSps6xaG7m3y/CJ3DmUHOYgrvMfHpUR7cGjLBXTdf822AT1BS
         F+mM6dOwVyIWmzv1Enw367HWaVNUHL2shSTYSGXAkzg6Y9ypIE1v1eUwob+3UK/UDlFG
         yj9RhFNQ6/5d03ggrqyZU15JdEbovbyy6E2DIvtgjQZDp5lVS8KWDq50eUmmq8km/lW+
         bSUUJ09dmjiZmaQtzEYkbgmELdAoDxi4m/crdmoFrXEYBeD5f1mECtRYxAkn+ffvU1pV
         UlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688769; x=1750293569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ht07tlK7uVqjW6eAyQxL9Kr0y3ckT/a8+OLYs3oBRRE=;
        b=tufNEiCDpjw1GR33912QmQuYyzQRui5Zh1ZR2BqXLpN0eTfgh2WUg4bOP6yKu0Z+Zt
         eDUV11Vr2JFHogi7Rtnjzzv4NW/0FZ5XEiZ+2V+rHNVRmSsSbg+RUIuyKE6EAW5bXufa
         7Nz90/clPu3uqSqnZLtIgeVb4o6iaZcOwJEY8qIhib9pOCgbjqVi8bn41Upi/Dh68ygV
         3DTGo8a4oxR11hsVWwYKBml/hdWYoPfabLMdsmDxLjNTb3qBwhKY7Jeb/sy4mUwzGtkr
         ObIpI/TM8k02t/p6Cn/T4+JKuX4ewIK/iu9p+W+QwzqlXGvBG+yEALZHpInSszDtzA/O
         opOw==
X-Forwarded-Encrypted: i=1; AJvYcCXkoEPN13N2kL1iEBPGMeFdQUNCNnBhTyauc8aUXjc/w8NJN5O4JhjS+J7alVs0kGIekRk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzglB541vqLUc+dTDpJaCwXhBBuVK5Z4Z5XvzojU1PXlWA/zjpH
	rkzM5/D7m2K7T2qZTAYpd5ZKvr2qpex4UXk69MT33RJYk+I+Ypc2nSTN
X-Gm-Gg: ASbGncvTLxXqlZ+ZNpHMha/SzboiPJxWr0J/vxMxIJnzhxj7l4QpNjHVkQXiXYaKv5F
	24kL54cbV4i1r1UvmJIJ8+jff63wR7vY8CCykQc4fjv6N0fLRXpR71s3xHjiw88keW3Udr5D4bN
	mPCQZYdYHpTK3x8uRVOiNRCPH9B4cmUp+t4y5NazzIbny415/pK2Fy1DfUKfbd3VX2qhSxO+xEJ
	+jQJG5cIWboSWwhnzAg4BnahZ4FJbmsYITYAGtInrymASzg+5GS3GfriYLg89aUjaXlukKxGWCq
	QJYc8W1ub91PA+YAH2d8qfysb+E495jElnlTPGPR79YYtf2ov4oVnJXGxtJ+y53OWm2V+FqQpTA
	fjePb6kk4HZtxetP8w54jNNPvDuBWdbwq/LnX
X-Google-Smtp-Source: AGHT+IHj92rjE5qEUlCyMD3EgBcwTmr2UdNmG+KE1Nz52ks8zHt3wuxrHowijrdAL92PLvCq+AMakA==
X-Received: by 2002:a05:620a:2699:b0:7c5:49b7:237a with SMTP id af79cd13be357-7d3b360025emr167835485a.19.1749688768755;
        Wed, 11 Jun 2025 17:39:28 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:28 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/4] arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
Date: Wed, 11 Jun 2025 19:39:19 -0500
Message-ID: <20250612003924.178251-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
References: <20250612003924.178251-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Felsch <m.felsch@pengutronix.de>

The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
VPUMIX power-domain nor their module clocks since the power and reset
handling is done by the VPUMIX blkctrl driver.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 948b88cf5e9d..1bf15c502280 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -876,24 +876,17 @@ pgc_mediamix: power-domain@10 {
 
 					pgc_vpu_g1: power-domain@11 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
-						clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
 					};
 
 					pgc_vpu_g2: power-domain@12 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
-						clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
-
 					};
 
 					pgc_vpu_vc8000e: power-domain@13 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
-						clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 					};
 
 					pgc_hdmimix: power-domain@14 {
-- 
2.48.1

