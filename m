Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653B81F4604
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 06:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475738; cv=none; b=AujAYsWOBglLAr/pyE9fi/vpnr35VOAuqSiXgUfc/fZ3RkTxs1CIQ2E8sMt010y4ciJRACnE0VxPdn0NpGWeDa5+upIi2N7+OVtCUEB3QwFKW6wL8qKAzYzNmogeOI4T0BhPgE/KTLm3hbGMQTwTZwfuWSuOnnMpovxhKpNIfdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475738; c=relaxed/simple;
	bh=6Nf3p87xmE+b+aldFiQfNcyvNboXQjvT/SrC191QSNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OYE0PE3t+6k0UHl0xZ0Ny1zzzz//tmr6CsmoVbQeEfA/aulg1XaCuTJiF5lvhpmh9gLdJrNOJLlaYWKs1aJv0b18ub/Ax923pRMvYSfSEv+qv0AhYPjduTdvBcfhu1EjWrrZcgZwYojeRJ4CZhHFIyxbG3OaTdrvms4M+YqNWK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iVxX3HYO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iVxX3HYO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso3926585e9.0
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 23:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475733; x=1746080533; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=iVxX3HYOjRE2OH0k8iF3I9TNf7RSsXqGkeN2bRLNrtfNQajpRotPjY9VbmBcHrhXUS
         aMR04Lb8Upp068crWLZcy3IzxtatmrRMPJu1VA7nUBnuSEoCQffWfNZzEDocSur07OV8
         FqLBOTXGYgtJ2t0yMMv0atAYoeK8Bwc0KXGCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475733; x=1746080533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=Hxig6mtnM5+mS5JuZdKgG4qbrDcGTWsKNuj0xdijR3ZKcKk/NTsqUil0pK8LC+ipMr
         51tRrlh/aPaR//EvjFzp8gtIm7v5sqdMtNmu3Boxr/4W5yMi712/i4L5Dfd8Ao1HH+Wt
         P+bvHjdduWlsRlS4qzQOK5s5MscdE+3iIeBIiTWkYyhGw5kdjHLvLlnoKEOBmq9ReXqI
         PagDdMeB873E6cAn6byEuitYHwTl6pH4pdp4a1qHKAxnGo42r8onq6xDEiEF7gpW2ii2
         VqM11dDHXfE9BsHnQGtC4QKUglXiUjZssV7iudS5q2v0DF+Fh6iddYU3gJwSCMYH8m4N
         R43w==
X-Forwarded-Encrypted: i=1; AJvYcCXISWoQg1wrC8vrOLBxh3+IDuiC758Cr9m+hXBOnqWfIH/jrkIR//rCM3hrp/puOJ3Oq/A=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ2n/fgH/oR3+KflgcYVNoKo3jWEawB7lZWKWazsS2XnHSpocW
	fUHIXuCbeNypmlJgCd8k7n8CXFvoR6lWPlz+z2IxsDltC/ZWVMV03HW5iKfq5cw=
X-Gm-Gg: ASbGncsQzfgeFAKNm95mMzglipR6NjIrUMAoGETU3Y3dHUIZ/76jaSIqnKByNTmMg7W
	vYi/NospT6s56vo3AAZQdcKK2O5LUyZ1QRQeUrRSiOOZUnv7999JNxF9nS1vAmaDppeCFH5r72X
	UzzACzhKMxSf60X7hZV4zM/vYGfaDykrVLTZBWCX2z31Ng0F8dljG1h3vUgANOU+KcXMI08j0sP
	1VFvjDrY6+AGcRAU1+dikJe+ZKL6EboOKXnaWHyZsIEHeVbz6DuUfSRjiM4oe2fFnemylXcDj7C
	5TqOYcil1EwRaz9PV9okIuinDpf44SfI0S6lr9KQ1Mtc5GyFNqfuyV9ZoxTLTUjTaMJDOeYRlN0
	29OGg
X-Google-Smtp-Source: AGHT+IF8qsSIOhwlMtkI7iNCFFbm4c6JnD6bm4eccpoJ3Cg9vwgWn75lQjxCqfd/J1n/mFg6vXi2Gg==
X-Received: by 2002:a05:600c:3508:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-4409bd8c247mr9014035e9.22.1745475733483;
        Wed, 23 Apr 2025 23:22:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:13 -0700 (PDT)
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
Subject: [PATCH v12 08/19] arm64: dts: imx8mp: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:38 +0200
Message-ID: <20250424062154.2999219-9-dario.binacchi@amarulasolutions.com>
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..78d71aacd0a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

