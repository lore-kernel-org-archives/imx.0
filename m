Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5577643031C
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330515; cv=none; b=t3rygq13IkYSrOLKon3MM/kUT+kcwMAOhKcSjsGLgjl+pNEGoHfzB5+sVWBg3gen8e2xzFUZInIEvzgMZbYLQbRCJUGgCYzdI5m5IMtUz/PlKjFmcL0V7tMnBwrKfg6LQJKyYkU/dj2DkPmt42jSJk4djtSnb2wVFy3cU5ufCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330515; c=relaxed/simple;
	bh=Q4v5bfCa3zcVlX407NKJzOWwffez90vSERchrwCoa0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJ6LO0bGdeEJU+LLg1pvzeJoerQjoOgNrnZyZzWWR2wAkP85SyE+E1fLkBL+JyZmFY449pi+e5f/q9dgEJRxt0IXH2ngvQhk+miRAlyvrb7Ok/h0YhZuQeMWhvZo+IEEnRNr2A1dZufASGqJJcxxe/itd/3AzQdeJdrnNBdMtfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afwDbaox; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afwDbaox"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b27c7451so34208995e9.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330506; x=1783935306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XwcD1YM4S5mxZpb6HPRyUkQ1D1PQTfgU3TqWz44TsM=;
        b=afwDbaox0DLfQ1u+qD3GYzV9MqOBEsgAb+2wusC6kUEbj9fdDrMbnStJ+ZJepH8NTJ
         4q6hCXc7KAoBl/nPq/NMZrblGu/dAMcJuIBdA3/y6O/mVG+dOvBLQSMqj8LLuRxpshC/
         O1YstHNtviVWXUSUY1UrXHmSnzR4WaJmnv38lK2WHJEC5T9cljKQKscORL1t4K3QXicZ
         R3LzQOsDEdP1bqGspFit98rD8EVNOxDnwiQchqfEB/ozxSUVvBGKasnhqfUudC6pM5Gd
         is3q4daTYMjydYiraWpWcLb0Y+5wxR3pqPC0PFrrtoVBCnbT9SlUhYPQKG404x6JERyB
         FDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330506; x=1783935306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XwcD1YM4S5mxZpb6HPRyUkQ1D1PQTfgU3TqWz44TsM=;
        b=IOVpdgZhowXrDCiQCqxhNivWOWtQKLTRzCnIHozREoxze6pnZuXvc37ov1pq9D4veL
         Eo0ZCJuzC+BtLLRMiZLw1TbjHH3y+b2zXM2SEP3RyEWpRs0WXAXY4bpGMAmeFmU2ePYT
         fLOVWUpmKX+EvRsgM10nl6P/7zqQ3vvkxVs+RE0buXOQ9T6AwtIl9U1he1Va1wO32xda
         tfH+gZq5L/QOljpaJTdNmhnyGVqLqQYsp4hvJ4uSUKWWBYlf82EI12/PK91Quso6dlfy
         zh16qGA1o4VaH2DFjOHSYczd4kW2c9f/bsj16r09VsM3V+7kxCaGgEGlEnDMUZOXmG/I
         1MAA==
X-Forwarded-Encrypted: i=1; AHgh+RrdPf1GTlmS8w3Wp+HvyDuEICUBULDslYiavB04Or+r2MbxdoDwqawDOpIf+9lLZYvfYI8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnEsKhZLUWr73LKK489dtLp4XnsCY76coJQS0iJaoWaDu4tWC+
	ExJxB1LEl+aGN3d7WQ2/Msb4dcfcMZ1Npu/7o3XeXDr+8XM/e1T67f5f
X-Gm-Gg: AfdE7ck6NLGdezjRUC54I2UUwLxTql6zjhniJNusC6EL5M2fevPhXlCGRT19VMPod4E
	8fGCOPEUPSMjtbzcVoQnH3ZNyUgPHnVMIFjcZZ00NehVerrcL3Vo+u/ZidAFjQgtKoKFaivlex1
	ddg1za80VZsF8lo/GzM+GyEjjWLBtrelyN8LXFR+tKM2we07n2iAYxlOTwXPWk2F5Ka6xiBE+rV
	aV62W/QCYIPj/UuXGaVYkcufSjLMkFaeeiyD5vv4bP/QDStj9QKnqcLt+TcbAVQEDAWzWwCkz2/
	srCwetblB1l9g+LrEw1AVcOImo72LlR/+b269c/HfGE2IYK0OlFlTcXZA9TPByQLIlIqdrG2z9R
	NkjUCt0paUnnRqERRH2fn5b6A8yqiUG2ybCKnuCere+oGPGIEhAEUlOyPzLqBUURgztDL7Gas6S
	SbG2r92eXbJlplbyIrAiVi1cgKi8yWHo0pkEd8T1A8RcNULpIBZlZo5I3zSQW68KPH+pLXN81F9
	5HsPtEWyrXTMCvAdXUHScKwqw==
X-Received: by 2002:a05:600c:37c3:b0:493:d3c5:6c32 with SMTP id 5b1f17b1804b1-493d4b50573mr74590875e9.6.1783330505673;
        Mon, 06 Jul 2026 02:35:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 13/15] arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
Date: Mon,  6 Jul 2026 11:34:43 +0200
Message-ID: <0b02e984925f48a2b22f46e21d7e237fa9558679.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index c98dca8e7889..ddd4651b35d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -168,6 +168,14 @@ pca6408: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

