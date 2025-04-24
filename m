Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9FD202C58
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 06:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475751; cv=none; b=EBjVJW47tLj2j5biEIZK8/t/W0PyN/8cUyZgeccU6Kkyzej9LU38/PYYbHqfeI3ZRpSl0Q08hzUorkUc83RY2f/oLu8Ng08kFnQJsIk2xckDpahdr2Dd/BUUzBsmgCxIwLhMpmqOMEWOx6EZ0++J1Q4iUjEy7/fs2JaMWuqVEis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475751; c=relaxed/simple;
	bh=HWXVCNEIxoZ2DGv2oUaqkHyisgW7GzYfA3+b+MP7RzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7gRU4rpQDOXm9ezFFsDZY3J5YHinJhICa8mtjjrWLuaK5jNnrrBOk2dUiF1CQuDBvNxY/4T8+4F1FrZQ1xugJSZ6QUpZmSJ2UFtw0BcntAtq8paHpylQJlkHk2IiyYgADW9dIfpXTOassy6jbsx9wUwHAZj35g1Qb9+SCY+n5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=P/a2Xmvf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="P/a2Xmvf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so13098335e9.1
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 23:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475748; x=1746080548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCP5wX50ZPJSIbPo78DniGK7SxiDEu6J15Xy0lcbUzo=;
        b=P/a2XmvfEchyVmso2RTbTpeYNeY7JRgvcWsY8ob1I2Q7z43TVpRKmIIjcwAzf6NF45
         M13S+gSi992vScZv/VmAsvLQv1aTiaWANKVUaeeaaZ+lLm6pGJJha5Uag7LTnIhs+z3W
         8I0uLBYargPqedapDLmaqGK6v+ubTxG4y0WvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475748; x=1746080548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCP5wX50ZPJSIbPo78DniGK7SxiDEu6J15Xy0lcbUzo=;
        b=bxkDcsmcujVQAfU85jwnak65ZpotA5ZYCG7G+kGcpDba9G933gWYCGfffqHlv1qZZl
         fSXRIqueqHi3rYceO1/BLOv+A1BAdCKiFQNOV/NA7LeFDN3/5fnQ1YuoAJxY2ZllaZu6
         K5ZBTvwPZ/cfdtpM49PxOUGvPJNfhGbOxrxGEuU30ChyRI5Eakau6ZUeKR495su0Hxrf
         Ckuif/sWRAe51B0n7orxdvfxo6CjKb4e6i7V/KrKBgh4c1qod7dYGNWXrWFy1DOoNmA+
         6PkQaYNwe+jODQkpSzyhsyq1EbdKe+HcXyHvrBkik72Rc/7KXey07j2O8viCI6Cyw1v7
         sS3w==
X-Forwarded-Encrypted: i=1; AJvYcCWe/dX0LtD4PzOAZS8ijg223zrqECeion8NOpf+OgvMNmoV0puvyHTSkotNYzEYWNrbh1k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr6M09tL56Dk12m2aCrHEqHEWNlfGpgxDDab9pb1tDnjIZEpA1
	rflQ+Od6gwid60WqFkWFf9X6bY7+vTQSouctZznmtOh4iclgIo9sfqhyaocdlQY=
X-Gm-Gg: ASbGnctr1oYQ/G+0RaRM1+JcA+eZ3dcNRzWZiCmF27WBm62OFZ10iW15qFk049zJNuJ
	53ykHJvz+Q5VX/nxYVMxz1oebm1wH8QGfpsJVMjkJxBjVZkbNsJ9enlH4+4Tx2W7XWgE7VzWchw
	Bo892rb7uHzoaeQZ344m7FVHn1KhZAu2fRd7ieKCTz0TvFUOuyUeCrtGIoZu8sIwwxvDFZ0LAAW
	K0m4rcb6+cD1sJ/uqG2HddxfKvqsuHk/SeSPTR4Ti2e+VbHCO8sqnTezHhQE1Sp+TwkQufVunC/
	89ixby6YfsGXJd1LGLCaXyTJ4MijcVHhYSVALuQGH6wIb4teKrHLo1RmLp5GPfhR3LzMKQ9PTns
	IynYn
X-Google-Smtp-Source: AGHT+IFoHdGVBD8O1Hzz0CKgZ9opqhMg+ND/xcdm2+qcZWev45QsNCVd+jDdCasqwcizMo62oEm1gA==
X-Received: by 2002:a7b:ce14:0:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-4409c453b1fmr7692385e9.1.1745475747768;
        Wed, 23 Apr 2025 23:22:27 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 15/19] arm64: dts: imx8mp-aristainetos3a-som-v1: don't replicate clk properties
Date: Thu, 24 Apr 2025 08:21:45 +0200
Message-ID: <20250424062154.2999219-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clocks and clock-names properties are already defined in the same
way in the clock-controller@30380000 node found in imx8mp.dtsi.
This also helps avoid the need to replicate further changes in case of
any updates to the DT bindings for these two properties.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi      | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
index 231e480acfd4..6c6c6f180785 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
@@ -151,10 +151,6 @@ &A53_3 {
 };
 
 &clk {
-	clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-		 <&clk_ext3>, <&clk_ext4>;
-	clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-		      "clk_ext3", "clk_ext4";
 	assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 			  <&clk IMX8MP_CLK_A53_CORE>,
 			  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0

