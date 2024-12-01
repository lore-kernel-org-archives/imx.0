Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4410D1DE2CC
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075266; cv=none; b=HGDCOYUXunJ1U5eW9whq3kZ4b5z0hDk06tFfcRBV0nU0RRUqFeV48ahB080Irj/uG9380JmG62E/kVF2Bi/AG2e/mEo/3jtBcrBNQsc3uZFOkCYonHSA+5fc1nQezAscmKRUGUbOLIv6WeNcwRixlo+ct5B6I33A3YJByg/+uYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075266; c=relaxed/simple;
	bh=b5sQPSBRgo47tB+ebeagJ2XOKAg7lFzF2AsAXWJ+C/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OY8twwpkIZVeJxpltu/YaDdDVoZAfcZDt6uj2I8d1km4AcVuTjILo8xTxErRO5y+Zsj/zEnyqgG1IsiGXnCQ5XfAqc3d9+pArNsYpLWFCYfsMBN/sOUMeZt8duk2PmL9LbNHVg5XjB5NRt0gdlKbsFdNHNUsmbIMPF/0NkT7dlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=jX8W+Qo+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jX8W+Qo+"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa52edbcb63so795354966b.1
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075264; x=1733680064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/0iXUlDnHB4vmCkCvqYino8rMZyy/qKapLkvYLstbs=;
        b=jX8W+Qo+/KyYuJ+szqVExOkcqr45KztAYiYifYXNsFJ+TgOseDsBpNVOvE8iJ5dnru
         o7g6B5IhQHsYOiuT/sB/Jjp94fiAYt5y2Mb1UzjKtG8Xdork+2iMuBN8qceguniUN0jr
         GoOgY1mDKAWYZegU1MItyorjslo8oEGSOdeVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075264; x=1733680064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/0iXUlDnHB4vmCkCvqYino8rMZyy/qKapLkvYLstbs=;
        b=us/Av+H/a3uwKImkd1aeY2o7CPWPIZNBN17duLh6P+fDPUHb9bPcv6tUHEJVMWd/a1
         0kM3kUMooHuvtpuoN5uISUjr7KZQ5l+RH3cOvmsXp9b7J2nFZxhViORel2VWBiXoTrKH
         v0X4y6kRtiGUNhIlj5nlV6LAwmH7eJ/mDKrQ8IxBYZbCAZQWTGlA+GmvnhWyPMQL5C2o
         arziuu7CHmjgAtCDcEmVBHNtrqMUYIKpmeekJ1QC1kSL4UtoGaVhO+cYYw3GHZB7hCvz
         b77NaUB5wEjuL8qXeET6L8t07jJvVVX6wHfF0BhS24JU3GjZJygtvXUvKk7Arcw18xM1
         pCpA==
X-Forwarded-Encrypted: i=1; AJvYcCVpeIRDj0D1swvyze5p9v06eEo6Kf0bzD+nX1HmWl07CPSaIhoSk8Rni6oNjSk/AMX5FU0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyavqZwMX4QrIkpQQgfnZxPr9rg1pKRGNTC1dF88Yd4oqVRAoYU
	r9Gn7FOVB+5BkVNbejzF1KK7bi8sKJAcZPg4f4OI8B7kUMHoOJ5Wl54qJLgrW3E=
X-Gm-Gg: ASbGnct9iXXqm0GEjxQE6ewKTjKJDvdqQXAt1rJFH//ZXyHtSDrd6+sV/bQCN/LUJI5
	napt5C0u6EQD3Pat+DZOAkQknRjpgo/bG+h1stfERns+FEuAVdps4I2AlBHo0l/WgHG9ZRFTNQ9
	xIvFs8Wx0/OZSUy3wGd2wUHqInnKs+P3BXny0IBQNFKzXGt1YPnrQnf4FIK9xnDJwuaZHMK0c3t
	RvV6cNaiX4MIGWYJsC5IdVPkAcdudSx8JE42ifhf9uKEm5XCdQVZU8SG8WUley0nLx1E7q3SkKX
	Qh2Ecd1jH/W4zvgN2Kdvq0MeLyE1/+rVSfNeP+F6zVdVkB6XdpD6fVxFyFZS8HYCyN4SHfWBZti
	mK4i5nJuRFKT/G8lr
X-Google-Smtp-Source: AGHT+IFj8fxBbCctJozB81f2fryKqDo2iAN8X7SxR3YpQJadp6U2uwo7YTwRhSu0ED8hkicMtVTnog==
X-Received: by 2002:a17:906:3cb1:b0:a9a:5b84:ac81 with SMTP id a640c23a62f3a-aa5946e6d03mr1472151766b.31.1733075263673;
        Sun, 01 Dec 2024 09:47:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:43 -0800 (PST)
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
Subject: [PATCH v4 14/18] arm64: dts: imx8mm: add PLLs to clock controller module (ccm)
Date: Sun,  1 Dec 2024 18:46:14 +0100
Message-ID: <20241201174639.742000-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
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

 - Added in v4

---

(no changes since v1)

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..0b35aecb6755 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
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

