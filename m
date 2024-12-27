Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8851F9AB0
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318668; cv=none; b=tohu14a4aIrXU3kn2ZGjGE9E5zaSGJLfxLTl0NO5G0vKzcB9B7EZDd/xaWBhYd4cu/UQGwS1onsYc8F+gT+XvPQqhAc/ywM5tmIZx/t27jvLpFpFhblZyEkxhdPBQf4DYLs3TcJYdlQujUKR0uDpCTbf4oEd+NBipAOy5xAXZr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318668; c=relaxed/simple;
	bh=yj5ENn5hd3kmikL4mIYyyYwweAh8ui9uop7PnQSXapw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9O+G5zFgoxfsTWTCaakGaHDllGZ8iy5p9+L2y4b6jU46nFN7y947+Sr9mn4Ya2izTHfCOXajncILEzKTthQc9XWXD2PILk1DCJVrZhuS23PQO9FFWjOhlNCvqSaxl2TJLi3QSCvI5jnYsH6S9UoeWec3+UV7n8h3rnanPipp2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=omgIhgHK; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="omgIhgHK"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so10315317a12.1
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318665; x=1735923465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/Q5xeJIoq5Ujssv/lVVpXyTtV/F6QlZNcPSL4YMIqE=;
        b=omgIhgHKalFbn2HsKOBp008YL0DB2xH1e+Ftx/PSMtxyIaNcdWO6/5n4ZxvyFgGLaj
         3MFskDtRApcb1CvKWx3Iha6EwyJwZGEJMdyREQSEJ2lnDNpvGn9ybcAslqwNKBBBonl8
         dFTbdSItB62cgGxATGJnpGWJ/LMQ8TyASOulk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318665; x=1735923465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/Q5xeJIoq5Ujssv/lVVpXyTtV/F6QlZNcPSL4YMIqE=;
        b=T1l2bB/ZeOkkC+huGoVdclYTwjlE2Pc6/U4tCUGwam9XAA15pqSiAukogOH6m9psKj
         XhlPy4X1cFUVL/tHrnappZrlsbZGYj/rDpjd5hzzYWJuwS9WJwCG93ElafrqWYbrZB9H
         Lw/lJofqeGY7MmFUtgusC9L0c2dDqimjGZSYS9qUDmRaLYaaa8vx43/hSYPUjaY/pQg1
         Hwo6C2u/fqXBs0IE5kahoGAjwRPSN63ce6pkB0IcipDFBAjLrm6/Wx1HJUqML48WkuMZ
         s2eeYVCK5oTKqlvKzKbljbg2fBLdnkAkjwvrLJrPpPdsZ4zg21KAm4hofuhvcv8EJsI9
         G3qA==
X-Forwarded-Encrypted: i=1; AJvYcCUPIuSCh3APZtitaMdXasUzLTSInolPdoMnF/xM1LSmskLr0nw1eRg7LDpa4F4SCn2tLvs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgpR3z6i6087q2uCYTeiWaEHqoo66qK0Voho9K00ZU8oMOn7xn
	99QULEtPWZMp6wiaBJrqcyk4m01Hq628Ecws/21jNPwzd1zXVVpnskhk/nrJZEI=
X-Gm-Gg: ASbGncv2iiA6wC96MKqhD1TDYVHtws5LeqU3RxcGM/BsUWZEKVB1W0HPFGe+QvlIDSr
	Tknr+1/yJ2CNC09sAH6YxdDyuc90Kx1GvcI/wbW/m2J0cdTeLLRPeaERlG/DeFlRDQJkTXv3r5C
	aRCbq0Cs/kPyklrCOvRHNyU73vsHuXohgZVNvkfUiaFDcXWvV9HiJCLoS9KyTaFS4j9WUYLQBZ3
	6L+OUTXmPZyIrmuu5knW78NWbhjbZTUOfKnG+UJ52Is3UDovT4XXhY3jnUK1WEqkk/h4zhWI0lx
	KgvjrdImr8ljrRUD5JB9nA==
X-Google-Smtp-Source: AGHT+IG7WGJrOsb7TyGRh1ACx7FW71ZyfueLA84uEuZp9U5n20JO6c7QeCVbSZ/v+tRXVp6Smkf9tQ==
X-Received: by 2002:a05:6402:2802:b0:5d3:cff5:635e with SMTP id 4fb4d7f45d1cf-5d81de065b8mr63355995a12.26.1735318665532;
        Fri, 27 Dec 2024 08:57:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:45 -0800 (PST)
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
Subject: [PATCH v7 13/23] arm64: dts: imx8mp: add phandle to anatop within CCM
Date: Fri, 27 Dec 2024 17:56:16 +0100
Message-ID: <20241227165719.3902388-14-dario.binacchi@amarulasolutions.com>
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

Add the phandle to the anatop node within the CCM node. This makes
explicit the dependency of CCM on anatop for generating the clocks for
the on-chip peripherals.

With this change, it will also be possible to generalize the CCM driver
code, as it will no longer need the platform's compatible string to
retrieve the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 0b928e173f29..a1872b5d6e2e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -754,6 +754,7 @@ clk: clock-controller@30380000 {
 					 <&clk_ext3>, <&clk_ext4>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
 					      "clk_ext3", "clk_ext4";
+				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
 						  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0

