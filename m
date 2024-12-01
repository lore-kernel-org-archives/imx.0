Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4A01D8DF9
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075248; cv=none; b=e/p6TkZJ5vDfSYjcLNq+t+7gD0IDGEtF5UnqMwNvktjI5McYWAmjr63S4SR3nRSC30h7JxuQWUeVeiqWK+soms+x1d42OAr5a3Kb69NdzMCX+2oaSn2ZVy1DS26RmJEx0rn0hJmm7Nm/w8qvBgeiHVdedWJSc3PKkJ+F4OEkGAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075248; c=relaxed/simple;
	bh=SAZvMBJQuptH86PltCTHVI2tDobwe7nMav/Upl/Cf2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+vaE0vZIIchNwlt0si17cviK0wNs9nK4hk68zkV+v8jK919f3Bfq3rdl7ApazEXYhc7fDmrvRyom1GGzk/6UZS97ecngjvgSBAGNGObfBaBliUDqxijYM7bxesdeEPEOW7QlREOmkiSe7caqhoCf2OFp5Gc5PhsBLR0aLe1fjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=SvHSk5qZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="SvHSk5qZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa51d32fa69so550100066b.2
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075245; x=1733680045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdCZTLlLc9wAxF7wv9T8uwvI64qeiIyF1MUa7CbWwfE=;
        b=SvHSk5qZHY2erL/guAQZ1uUFwasvAJmAOrKfMlG+oei6WIgKdVOohA5q/2h/jao0Pf
         ZvaubEsWPmGeY8u6ICskqzM6JZtsdyxoiyw5+mXUitEJLl2pFNRKKQ29Ssar4x7NtHbr
         91tyMDmtNWCW29+V1qou2DJk69QoOd9L4m05U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075245; x=1733680045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdCZTLlLc9wAxF7wv9T8uwvI64qeiIyF1MUa7CbWwfE=;
        b=c7f7gW1XFE9Ptv8z80Y60MqXCK6bPSmcvyjUPop9lvz4q13GaZMJtbbu310Rw4m57M
         Em7MDPUKiQ+6yFPIBDENtGWnGhurSYcP0ArJ4pbfOJdtPEaErMHxU2P4dog6aqpLuTR2
         w9aYexNmReA23OZr4I9b8lPH6FcgL8mCP9pwSwVqh8LURqC/LR8okOnZA5IXAEAmt4/g
         y2a3q8Zcks6fp+XEBxbsmBnZy08fGQlBeABjvbXu3bxvAJNM50OiCZyYrZsxyDe1/icO
         p9Tn8NcfXOR4VkdatW9s36w+4QgjXsDmG7w+cAUAgUS0pz8G9Onw6I6OeWNannVMUWMs
         kaUg==
X-Forwarded-Encrypted: i=1; AJvYcCWNuxtzGCj8U8CzbNneLhyJtipxSAp/6LUcT6FeirlN0UCYZOEbhyNwS5a+/b3FPOsZ4Do=@lists.linux.dev
X-Gm-Message-State: AOJu0YyH2g/P89JhQWdBCmKhIQfEGH3f17cGuhvINS+N2mxzuTupflAV
	tQn1l2buVW6WtwpHvcieCkLTrrAt49Kawa5mFzU2DL2r90KcvSrs8r/4KKKNjqI=
X-Gm-Gg: ASbGncvJtN5grN2XOk6pPakHrV7JpPFU4Aqu0AIdBVBdYHJXy1/YIrNZUumPLLEK1ZU
	DE84sd19/d9HXlI9PGVso5TFgkAsoDyxbG6/S3BGlppD4LiKCbfAgF6FYiDk5VikaKVLkklf9R0
	Q7hmgFOsWB9hFciL4NnUyfrkEaCIxRR5y78cNF2CNwdquhGkkVK2i/hTcibZCogF6PQ3jq0xa9N
	XCfno/0z5GJ8Tew4pwTsvLIHMv3wJvBROfkrPkGJ6QFPEZqeXgYOz6wAw+PUIFw+HuGl1UM3898
	nHBUopo0av76AUSkgbqCIT0PIfHJBUduU5sV4abtLBhsUbASEzQeprwdC2SHIgytXT8Vd2KZD93
	LTsyCeBHD2VRbxuBS
X-Google-Smtp-Source: AGHT+IF3ozv+j8XMyBjfOQVkJHdfyEzrE1dxQCNDxUlGdrVm5RNwVlOhcKaS/di184NLxV0j1TYOVA==
X-Received: by 2002:a17:906:2922:b0:aa5:639d:7cdb with SMTP id a640c23a62f3a-aa580f0ddfcmr1431249666b.22.1733075244684;
        Sun, 01 Dec 2024 09:47:24 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:23 -0800 (PST)
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
Subject: [PATCH v4 04/18] arm64: dts: imx8mm: add anatop clocks
Date: Sun,  1 Dec 2024 18:46:04 +0100
Message-ID: <20241201174639.742000-5-dario.binacchi@amarulasolutions.com>
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

Add clocks to anatop node.

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

