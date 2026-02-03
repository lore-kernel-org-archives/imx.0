Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847F539C62F
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113096; cv=none; b=IAmcLSkCNkQL9PVM+w0ffAXEAvPazjHbpaYhJP0WMaJJKIgeI+0mMX37TAq2oX0I5Lt3pSgMMVHoP6XvwuSa7xJOiHFr0aZWkwIBBa9lkeBZsuReg/VPH6KfK81T0CREwVFmPNAk11e1tIQN8G5m34c7AjWABNjIKBeBQ90UQyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113096; c=relaxed/simple;
	bh=LTDt9fi4JHMSnHlrIwfIAx5d5MWGZYp0pTmhyqg8FnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ib0f5QAsd9OhtujQesvTDeXBnDmudV1k0LWpAtcnh0uvo+4pUvR1Yg4y0StS2cdCvHeF0GrsKP9V9jQGkC4rArrWILJdwWC72H0sC4VVptMZ5TjnBZ+885G1x+va2lvJhqMQy6z7MtC33rcQOPQoRYWa7UrB8NPRabANP6sQ3fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilWNSxxY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilWNSxxY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4805ef35864so46462965e9.0
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 02:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113093; x=1770717893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3UlFA0+6h5s1DkPOfyU17WjXdqB8dUR/b6rqqbq2XU=;
        b=ilWNSxxYABsJxGaDptZWB91gXyb3SdnHLZV602dDCUcZFux4t4jYzCkzFJlph1D4c4
         WMdJLiOguVgPoE0+wYwz8CZnuAvqocJWjhlRibK9sFcpz64npzBJyHMAwW/ZrCq9XXIl
         uOYoyPlcQjG41PMJZKXHX/Nh8N8TeDMQe5G0lq0DjZNlVpTU5NM0kWF9T67vMmDIBU8G
         WvdZau2s/Q+yhdk17jgA/fcRho5HjwFfN+Tvo3atRVsA/N9lAE5VcZ6khKzyEr08AXme
         Gv/uia7uloJJLkmSjCbvm0FWFeZhHr2r2AVXBTx8IVTrH+7oNL1Dvy+0fHAftKwHRFTo
         dO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113093; x=1770717893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p3UlFA0+6h5s1DkPOfyU17WjXdqB8dUR/b6rqqbq2XU=;
        b=DX7RyvoTejzm2pJysJ8uBfNG0Tyfk7ym19xXAjfNHc/sblQHNBy4Ba1WGHukb0dJ0+
         p9lHsWYQJTSBugCwhNdX2lrPDqSAfoOLmJ26rT23SeDk9cdZtRWeU7O+UulkADp84fak
         7mx8jCmGwqKtIxXzPeIRLeqc9cBPa1aVJCoBYDhAv4QjbT+GcGuvIt7ingYVAS7GqnMs
         cY16WcxZ4FTxB25311del7MADRkoV24FCZHhveHU3lxFFVljQvHqLvsyPqJcjkVG6Inv
         DVJXJEKFHzodT4EWiAdVXcT7vgj8V/a1XMBnRfwa2pGrZ9z7tagDArtiern0guUWAZK3
         TNzg==
X-Forwarded-Encrypted: i=1; AJvYcCXHgQ+pIze8FAN0X9S6H8L0F8UyverjF9A2jT3o6MROODWs8U8pIPyBgo/J6m29PuX8kOc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPEr5zJpi031lsHJyOrsAEYzXv7WJV8/ECP3mjhUeJT/+kiQ/X
	edzYQP/UfJ5mzRw6WQrii1tSJVS+mM96lzlTtGXjc6FqaJfQ1UQu12bReo4/VA==
X-Gm-Gg: AZuq6aKRXoUYFoB2+d9/+b7AM8AMN7C9TejVGMTpFR5ZdtHdJ6A0EwB3OKuw0ZHexcD
	rtF2aY8Jyqz7ketatZ2f3hQS9QmJNThzU/PCV0NhDpGVAah6HC0PeK0MMd6IM6a+OiaIoLbe9CY
	BGH6uPmnrJ1J5DREXtkTWPCwAnb9ZvMDzTrhndDPBjXtL97GYhw20XcQEPEq6sGhjRMcFO2dkPJ
	K3Euq38BT3Nb3+39r9pj3duo0FdGANEQERdmNRR3zcPvnhagNmZ9UdeczX6K7m1PX1x3WosAiGz
	x/v8sMC0RySPUp1UJNLEj6QdzLqlLVN4i4DsRAkNvlNjzrpgydZRw8AFpUEQqZsC63sUAG4KRrt
	Xkk0gkfjpXspuRodF/eX0fVVp+NhBsoqOMwGN6ZHXztTDtbzJ+8iCh/JpJtTZi4QqyO7lSgi0d3
	awrGkkj+edkbcOJ2KZ9EvETEVsl1Yi28eIAYDIJA==
X-Received: by 2002:a05:600c:6088:b0:47e:e20e:bb9c with SMTP id 5b1f17b1804b1-482db447950mr171113855e9.8.1770113092893;
        Tue, 03 Feb 2026 02:04:52 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dffd47c2sm115534365e9.0.2026.02.03.02.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:04:52 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 1/2] arm64: dts: imx95: add AONMIX MQS node
Date: Tue,  3 Feb 2026 02:03:31 -0800
Message-ID: <20260203100332.915-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
References: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for AONMIX MQS (i.e. MQS1).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c88..0c55861d673c 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -391,6 +391,11 @@ scmi_misc: protocol@84 {
 		};
 	};
 
+	mqs1: mqs-1 {
+		compatible = "fsl,imx95-aonmix-mqs";
+		status = "disabled";
+	};
+
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
-- 
2.43.0

