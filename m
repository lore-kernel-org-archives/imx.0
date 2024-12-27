Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C821F8AC1
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318658; cv=none; b=b+sMbovNjetpRub+homKxukekuFDdZzuf8M6I8EBTQnt5aUNfTJk2EuDzSL+MRoIwkicdUEyd+ISWwW3znJBs/vC+Jc2m1BjNXik00uo07uidfgmM83x2rnQ8oesssHiFrIRjq7HZrmSUEE7uihW8HEFJMlU4UojAJ5EDXK4kXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318658; c=relaxed/simple;
	bh=MWwhsP/1Gq2jtC+XMH/+PSmlpfJmY2R2gm9uwDR4fZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ljpKHZWqxNrw+XMmiaahTs5lxv8jbZsRDS4sXevSWcqznXj/kOGtYg4qmM5WQ0xXVoMKVx+FI3IaKOFmIaK8RRLsU1+lgpwjimgvHRXnXuV8nT4vc+VVqrt2L0y/8/TnKjTVYj5eoWsy/YkJIB/HZwxhjAG0IbUTozvwRnCMypg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Xc9/NoF3; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Xc9/NoF3"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aab925654d9so1327507366b.2
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318655; x=1735923455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=Xc9/NoF3o5QrcGFDtje5W8cE8PMEch1cOyPdgtfbQJ3Kpzo7ccXQUDgBir4JSgn6Th
         Vqpp2Cbjf3uoo3wBslcv3B9nfED4sFy+Mac+v1gVmVCOA1wcsW2c3xdTZ9r6clY9IMFX
         sUKeeCtTDb8dSufolTq5FIFi52VnV66cQjmKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318655; x=1735923455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=e20jvT4JsyLSJlHVQ1OZJhW7BxsspN/5JGJHHI0l8JW7mw9PIPnK0Dk77fsC5OZcOI
         +4OhvaEgLztvGOuo09iomM9K8l1nkNDyuyLPpmoKlTdazmBk4jZMH8DVGWCPnsF8ifSP
         YbnoYRt4HSCtFDUhBtxz4unJ56yYNQnM7gPUus0LJ5sOCzL+V01Zu1C5ehOAEtO/zXPO
         0nTA55H/Me/RenBlvtNmNj77Kft1253lgr7KiUTTMLzmeAOUzPdPBOB3FE3jtEqV8vrl
         Kr60wzil+hT0WaTIrnYuum9xA/rhkhSYQnoTYotyTGr423KcsgIXdx2aX4LwrAU1W+Xf
         c9Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWPd33+cmQeea8PFP+WwzYLCW1ohbcCSdljRY5ete+3d1SsdyF/rBOR68suybFdO2TZBUc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7GRbkYMmnZsPfh4B4eD9Lc0cOd5iYRhXvcQ+lEfkbbdSP56p4
	+fPLHZatGR5QO0BFjR1P+p5Jj/5hlylf/Bt1knUAqfiZAYYNrMmHDKTurT483hQ=
X-Gm-Gg: ASbGncu7N6aMh4CEPCGA6L8CHFIsu0F6ZadgTXfEw05160bGL8xzXsJp8ld1DQ/J8yL
	/mewPMkZ2hZEqpBil4w9VW4li8qCU3XeoFTly6MpZf5NIhSbWb5qba/Ovd3qvNnZ/8WoscQrgGx
	pTjUBB3Rg4nuVdBvNpiw/gIf353wNvAnBkTLdWYXS0CV2wLG1ottWJBBLcG0nO8nfREb++1QgEy
	2L7rSGCznevPvVeGcGbNPLRf06b8vx3ay6sT8NPbGNJ8wIQ18NKQ/DAHAOxMace5ejD6nKpXqdS
	mhlyCcYxra00jsNFuWu+RQ==
X-Google-Smtp-Source: AGHT+IE0OOORdYEPfw3l5TavUkTwemsNNoEqAVu6kBH4Ag8emI9J3IoeOvq1nphdPOb5Rod0D0CmkQ==
X-Received: by 2002:a17:907:d9f:b0:aac:619:7ed8 with SMTP id a640c23a62f3a-aac28748b30mr2647750766b.7.1735318655550;
        Fri, 27 Dec 2024 08:57:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:35 -0800 (PST)
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
Subject: [PATCH v7 07/23] arm64: dts: imx8mn: add anatop clocks
Date: Fri, 27 Dec 2024 17:56:10 +0100
Message-ID: <20241227165719.3902388-8-dario.binacchi@amarulasolutions.com>
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

