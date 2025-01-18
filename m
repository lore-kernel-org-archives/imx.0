Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E661E19068E
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204071; cv=none; b=tSvcbQJQQcXfBOs+FDpbIXgrznGMVBc4r5L2ZZd4QdY3JNo1OYrcMts51N1u4CJG95xRMNmggS4Ot11Fp87AvsDq8PCt4j2lQEO44zm05orlyqVSREmO70eOFyq3UDwttTef/Tzyhqde9Bev+EJtvDhrErEFkwVhN6M0JCks0Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204071; c=relaxed/simple;
	bh=EfuJYR878rJ4Cw+YuO97nDjgeWj+F6WJVMj2hzhOd0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbSnaKTp963b4DJFwVeX7j70648peejeTyzIG1+/ie5Lo0y4Hor7F//QcdWQQGXZD78HX8a7U10WwzN3QyNaFbfSZtHz2xFDCQqrBQWh5FqKIHuT2j0oo2OUSN2z6Jjy1YjxrZOTOmu5HEFL4RBbxZsrLpwO8gYduETRpFonXi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=SOel+xmK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="SOel+xmK"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso551762666b.2
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204067; x=1737808867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=SOel+xmKJkdjGvm0z5glBM6Q9MVYsW/BrjRCV/t/8jEEDWnWL68SYvNJBTJnl+Wods
         THK6eLw9wWO8WxFUF5+FGDji7ouIdhqBQTDWIukWNnM97bzCKLA/AyluP0fSENkjfQMZ
         vnq4CJE9OB9M3qMltlvAX0vVZXT63H8nhG6qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204067; x=1737808867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTseU8DWKtdHNNseUc2PJ1vcygpii+LlAX++fbmk+pc=;
        b=WCNoshYiSfKwapoe9CMHGtFS2MvalLpb1LvnTjwbG0DAfKCFDuXty9GNdSgOn/iRmD
         YVF6ETQPRmCe8knHBviZUqw3ATGkm0s9QofSqOY9LB0E1s7a1g4Ungv8y5ItAFNXVfCg
         J81e+H7tc815AONMJv5FsDwiyEHGlVQxvOhJYage80u6e4Mr245MEf+4II9u1MUqKUWN
         wWR+QdA+aTsji5YZ/NjITyVt9odUAwhm7iLR4v4AvoTfPnxLMuM971JHea/r2O8/HOBz
         IAlIXZxc4RkzjXPGtc5kkx5yp6DI4pzcJt52vWz/oufw68vVxjdNhmOf8XABKhBQq6xa
         lRaA==
X-Forwarded-Encrypted: i=1; AJvYcCUgklZRyHqN+VRGmBUa1hFbadyJv3InRZ2EBGZPszXaIMdJk/evV+/8S6xwwlbDqJla7WI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxB7zp1CD3AkBWn4L6z0f7tows2HHB2Ek2ZvB8mCQTLnbh+LIqV
	VkXa1gJA7Soz7QkKEdRBQHZpuJ1S9hFK3bWsn2qwGeLZrJjBNZdzMgdT3dpHAHE=
X-Gm-Gg: ASbGncuRP8aUFuvaKqXYuKEoprLi4EYHiwWLDDpOcGgrYhwwwHMDXpduDvf+j4tjbAd
	vaeK+z2cVQbXrOL+YJw3od7SKyMDMlS/lwl+VdUDCF3MLhqt6J8J2oGOElYNqyrpAl/Gtk6Myxi
	61B20sqcWrMFWS/l/MI2ea0OKJQ/IPeV78skWE/lv2/kzlAPkqp8I5hxqh3ti2AEyjN4l9Yy2S8
	pA2ZOtvaM1CPkMlBtFhhVWmQ7yRgJr3nfa3cTouJ3nEnh2sz8xPo8C6BUeE6IyJzKtMqzx9/4qS
	5FhFp0FIw+cu9IVUD97UI0oC5p1STZvfPE6wkK//53D4rLwRZC6qbzdcLRWzbCpWd3K5m86Gg5Z
	3SFLTwe4FoheKVDonjSYy/xjWiXz8wh1V+sSS
X-Google-Smtp-Source: AGHT+IHX2I9yy/tg03FjOqBgNh1ud5x4FkNGAAghKsVjSyjjnfF7XR2jyfI8B0AX0C2mCSM8Nkikkw==
X-Received: by 2002:a17:907:7256:b0:aae:85b4:a07 with SMTP id a640c23a62f3a-ab38b19146dmr492323466b.8.1737204067196;
        Sat, 18 Jan 2025 04:41:07 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:06 -0800 (PST)
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
Subject: [PATCH v9 08/23] arm64: dts: imx8mp: add anatop clocks
Date: Sat, 18 Jan 2025 13:39:51 +0100
Message-ID: <20250118124044.157308-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
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
index e0d3b8cba221..0b928e173f29 100644
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

