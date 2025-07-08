Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48642DECB4
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751982885; cv=none; b=cFG96/CbrPJ+uWm/TA7aZYYVwF+bk2bTa6/sMNnHBFgbjYnV+DweE6NvKhb9JZ5jrRK40kXyjdoB/EkiRywyDX383PsCadAYjJrDGIGXADhtTLeCB0rjPA74jexUbthWwUsi01ZBIoRQfr85RSKZg7csDydBgpVrWXIHLj/4TgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751982885; c=relaxed/simple;
	bh=+1R64dbCPXKSNdhsS0mTg44oOFv0FtrwEmKajgqa5H0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtEc59I2pEEzThKhXR8mWHmmBeC6AbDcBZc1AQeARV020Izz+iDAaJs/JLxTBwfmx+FfZHhoNlc3sGF27D9NmI2/jFqtO214cCDzmw+Ws/609q4RPY+1XyWpYjWPWENDZ7krF1MruMM4QYE2HNjzNIQ6/mWjEPNCk1EqZKwE71c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3VS4W4I; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3VS4W4I"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae35f36da9dso840645266b.0
        for <imx@lists.linux.dev>; Tue, 08 Jul 2025 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751982882; x=1752587682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrxF6nK+mYO5VydcxGnIEhVOlrvvr7ZKNJscXE8JZuo=;
        b=A3VS4W4I9S2uoQckNlKV8yy9mKN9F3JTAzW3Up63fSsZeSqtj/kDzyLif5wrMjToHt
         1MgwJIOpbXSFVKDzk426QK7OqJQMFaxalL070paab4vmDdNfkLARQSgmsQ23mdfl3pHD
         MklUi4c9WcHFEIv/9xx6k75tXgsE/KjhIhXPng6GlFUzOVZm6JvQrrU6xQs8a0S2d42C
         MH9fG+wEKZuIGzrd4KgmRjCHCL7vQ9kjylFV6RlWz145Q3i58cxxd0GRPEb9CgAAGgSp
         FPrP2tNAEseWBudX3K95LtBFb2y23R4a9s0AvBY0fJCkRjqgn6HhUL0IdpoUqF4E6Yk7
         j8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751982882; x=1752587682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrxF6nK+mYO5VydcxGnIEhVOlrvvr7ZKNJscXE8JZuo=;
        b=Cr/N535Xj7tVLwX033JE3gxPv2HIHs1flMPZ1iIV/2W2N7BS3Fg9Fy5/hxwSGdvFPg
         4fbYUt7wII7tStIfD///gnggReGIEoYuqnR00TuItpztyIEz1rVPpXhhd+EljplygGCq
         4nT4t6wzhY2vQVkenTss4284b0GSYnyyFHnzmeYWPm+3egIGY2SZP2y/yhCKMRqBte09
         NSGGJL6cxXliMJW4mdGdrENHMWdJgcyIjA1aE78HfazXN1np2WJVI21enAu3et6JRgNu
         ouf7dzcOZ/eGXgGpfoX5/ZdBTXGjuXjwyx/OEjdBtBCUOIsf/uNjzPCaHbTXPK82WDfn
         0TWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPAqPdScdCkIGCo3YsRFVTSH64TiHCEvEt1y3WPXvGfVrjIbAlOgGm5z3++bxiegckMOY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7vaXx4NWMc579KP4w7DibrMa+F8O0dhTrfFwXVKc6eUnPxEOa
	3ftxWkJkMEdAQevBAFUuZUs9qYMGVTXW6TM3ZvKOBEYEt2vrBIv3nXnbJbYADg==
X-Gm-Gg: ASbGnct4T9oZEf74dYSTBLumOM6fwOtwF97dLJ1vBHKsmvb7OtsoYBsQhsu8PYGrOz5
	0r+dRNl1Q4u0tqPjUzR+VU0h3N88Kv3+LKwpgAuYJH1n/9OEa3EyT/i2a9lD2SmJ/nVbbPvAZl/
	pxhe3QMKP3CWLP99x/6FPHsVNvcd+XqlpSLhuY0kNMQc59LNcUwqE3zfVLD/XlEys0ONiktotOQ
	1Z9QQ0bnh0viTimTzD/eiMz7pAkR9u+9e5DcNM3SEiqfXfRgkPRzzjiaIcb2flIzzgYbYHyvpYS
	iqAJcs/lnXzcNRfYHVWxDMAgMG8F/I+Sz66twZpAv9LuaT+JorOfndzRllonaN6KFyZWGGl+4jo
	YjqwZR7DJhQ8GE7WE1X/T+mwCYbrOwspY/ouoG18E2AXbTu+Fq/nbDUbUa7hx65k5
X-Google-Smtp-Source: AGHT+IE/M5dxRM2q5OIUramUmzAa8UWPZ+qACUHBsAkQqnqxLmZ2oTxm7Fg0gydn9CIl664bZfqKDw==
X-Received: by 2002:a17:906:c10f:b0:ae0:b239:7fd3 with SMTP id a640c23a62f3a-ae3fbea03bemr2120751666b.57.1751982881901;
        Tue, 08 Jul 2025 06:54:41 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac6641sm910431066b.99.2025.07.08.06.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 06:54:41 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx8mp-toradex-smarc: remove gpio hog
Date: Tue,  8 Jul 2025 15:51:42 +0200
Message-ID: <20250708135300.2855155-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250708135300.2855155-1-max.oss.09@gmail.com>
References: <20250708135300.2855155-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

Remove the gpio hog node which forces using DSI signals rather than
the second LVDS channels signals.
The dsi signals are not used in any of the current device trees.
Leave that decision to the actual device tree which will also define
the consumer of the signals.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index 11fd5360ab90..bebe19eb360f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -351,14 +351,6 @@ &gpio3 {
 			  "",
 			  "",
 			  "SMARC_I2C_PM_CK";
-
-	lvds_dsi_mux_hog: lvds-dsi-mux-hog {
-		gpio-hog;
-		gpios = <7 GPIO_ACTIVE_HIGH>;
-		line-name = "LVDS_DSI_SEL";
-		/* LVDS_DSI_SEL as DSI */
-		output-low;
-	};
 };
 
 &gpio4 {
-- 
2.42.0

