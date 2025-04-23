Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41863267729
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388193; cv=none; b=M9/dX4by05E/jymLkdz8uaVEcpuv7nVTbRVvxFYHptYY2pFWxQc0Rn6QjnPGE4ek1slKttC5eKQkaeEiTY3dHbU7Oka5K8osthRs3FzIwYY846ULHXfJr5NM3VhOEhjqSEhW4bKYX4iRiM6/OCPNlq2Lc3Nx0MZlLiMT62Qdqug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388193; c=relaxed/simple;
	bh=vc25/TFqvg0Ekr2Sm4G/VkkviBdPeMF5e7FdTWNCvAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svNDBJoIcYnIZhOG7u0l1vtfLDfUybQKS0cGmP3TCSpCT/735Q6sUQfP5yfM7BvlTiLoDUqQgW0ZOG0wNc+R4724nst3yHHbJXPDfiram/2empS4D+QdhHMdxvsa0GI3bjUehxlGovs71Q6jD1h+iGtEsqjpdepvTs6XeOAanwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OQMtyzJx; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OQMtyzJx"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abec8b750ebso886147766b.0
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 23:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388189; x=1745992989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=OQMtyzJxC3rnrpsHcJEA7x/rHddxnrE/fe/pCUlbUe5ePu4s8GhF/ebzaBAgCvbg5c
         DKTwH6j2Vd13W4kekLu4j20rPCFoTtUu/giz9RxA9w7y5fCkg1m5U+F3+RvzDiZBLRXl
         exeZUTlQamfndC8K4p8nXd6qDt56rw8D27+Pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388189; x=1745992989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=QVhOCWArcFUBgzw55p1dAibDBmC80/VQLnyHmBzT40h8prOKgEgYIRvnJrDN0P/xv2
         AERDplovy0VQNHoVpGIZ6NqgQFrTzqzJBu4Pel88EU9e9Kicv5/gDXVC04upfqq+BUAi
         9IDngjWUzHjqJ0cTzdigI78AcgwRAdZOQXg9y0xpkFYLxM/iPfgTbC8LC0nEbF0ctI5t
         Ha/Q14cdxRwUbOgxvTUPFY3iBSM7JhlODzu+GZCaAwqZNkNbMjWHgfQYdJSen0hSljbS
         TdqycndLkvNFv5kSch0FBxEcnCfUVkXf+jQPoJOelEQ5yKnXhmiDD45EQBjjoMUnVEaf
         GtuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCm3L+f2JQkfjN3PUyJKpoV6X9bfdp9jUkOK8G8sE8Qj0QwLOP/WLHEDqSCIzOeNsGP9c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhkDf6EtmmU1QDfPuBwzABH64GfRhQRFeO7sizXOxds7xMAcmX
	rEy51Vt0iGqXPkVkbHpsVEc6qBs5wyaNPGkV2kEMjiueEEW3bZtZ9HRpH3G+iIo=
X-Gm-Gg: ASbGnctA/CxYbXj8rx1d3P/Hm0ltJVXJ9XEkEZTyby51Q6hVUJlTw5d41gfNN5Zl6Go
	fL+IVm3pfcboTHPwfA5W7y5Prt5NhszHwbQmugHO/orl/409ZXi+353wYpA5N0N7AK4GqEiMSh4
	XL0JYsgiF1xs/ZXfaY36xQpEtyfC0gCbJ0TP4OW18EZKUG0AZV7ApSAw5rUcHCix8ju4zZKJn0k
	XpwUTQLYKY51eD4C8C9lhDJcGGbmTb2ddQhsnolepUcP7XDlzgeVTl9bass/7AILtr9cUrNm0n5
	IGrM6LwTstvOL2FnJLog6V7rmW71ANN+tQt3r6YVMsF22Hi2DPC7RRc1g0ULe3mh+8rQHD/juVP
	Ar4eI
X-Google-Smtp-Source: AGHT+IGJfBUmSx7xpArhxmxiAbzE5ABneyuLMS1Ivt2d0nKwCtdMFf2EWGfW8vDplA2S4cAk4a6aow==
X-Received: by 2002:a17:907:f496:b0:ace:3a3d:7e35 with SMTP id a640c23a62f3a-ace3a3d808bmr240038966b.53.1745388189491;
        Tue, 22 Apr 2025 23:03:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
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
Subject: [PATCH v11 09/18] arm64: dts: imx8mq: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:26 +0200
Message-ID: <20250423060241.95521-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

