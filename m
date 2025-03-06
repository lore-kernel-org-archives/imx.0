Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E61020E037
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260648; cv=none; b=eb0xwOeZJzMIQNpiFgjAZKZxjX+ZmNRdslzHrlu1lQ3w2mtKDpzKYke1mnPY+mqScEDh2WGmaKj6rWAOnoISxB9EjFX8UbN67rv3tehXKKRF2lCeErXlGOysSZ/rZpvMayPZ9GiX7MmqCmzAc5py18qzvfagLJgzrmtyL9wEyuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260648; c=relaxed/simple;
	bh=vc25/TFqvg0Ekr2Sm4G/VkkviBdPeMF5e7FdTWNCvAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C87fHwgLhDjjmrU+HL2WSd1WjyYW/r4Pe5l/4xNzeVtgACXyQICKuiTFHnVk3Aa0qJRMG4WJBs2bIPejkA1Cj0zaPx8Yo2aR/IzZx3sK+62vBwhqLRSLFkLBcpjXzYBk1hmF+/ORwS5rrXk3LwVPj2f3/TYyd7lADJ4bQMqH7mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iap8EnuM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iap8EnuM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43bcfa6c57fso3095825e9.0
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 03:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260645; x=1741865445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=iap8EnuMid5Duh6EYbxQrwGrl+yEOYfBe88PSf3x1vHk9ShwDqwGh5mmOqQr/0GPsQ
         3RdEv3TjpNzMDUhQyivb1Wj6ztEwHlzSWnEkz5kpiDAqeASirLN785K7jBIv9vYoYpQy
         l2fApxgTjuonk3E+ICxGlHRrHbks4TitSiJcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260645; x=1741865445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=sVLwgwH0/7u53natCm+o6cduO5qRZAZzl3EKGlWl5wCniuwFOW4JFCaJ6dSC+Tle4m
         +8jO8njSFpxr2HmL6CIC1EMyaDqC3LdKQx4BrbLh5mNKzNXzyP3gCg7Ck50JaSla+by8
         Hf5SNbP+VZB/J8vQ+1Q5BTD5Py54pzVNY7DnVGV1HL4XsLXC6NEd6XOBQNCcjJFdTGS1
         Za0NoHyerH0tim2XPNPTGOtIyj8fsa2TxT02iKZdOWK5xGRR4BKpViPOyL5m3OdyvH0k
         wmo51mOiE0Pt2wA+x4NobdP/MqeVs9eSnGi5gm0asaEcsl8Qv9ktjRWfmVvzznIp0WJF
         mqUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS9YmXcRcOIy05yj54eBfgrPLkj6Va3gcWDgIDsTQiK00+t+Kv+VNWuGQcQUue8EdA/hE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoiS2g6fGklesDbvHqDrzEc2mj4NnVeh1/+F6ZxUR3xAl4ZXry
	tJOAV6Vw+Kel38UuoaGwe+pKVSzTEhld7buhRoVL75bohESXH+wDlbDbd+7ONYU=
X-Gm-Gg: ASbGnct8njxOuLGUzHEJ6TznhcL+80kuBZEFX7c1MFg4StkQ1fNh+F7M9BGGjqex9iW
	juBG1peXcz4Srqt+vL+QbpVheY3aocs2dyh7yAlJlEUaWdRBiaf3AJC9zdn/whf7INd17iyLE8e
	P8jR/z1iC9n0AC8b1o0foX7kZTroX67Lju/o1wnuMh7nlJXHu+BiCL0FzIUJ0+U7Fa7gj/jheTO
	Ih44kVSNcOovOq54apG04XVPzbCQBr15eLVNSX9d4KTjjGOaJLeWANA/o5uN1Be/U4L7ZIbpxux
	TXspSlXOD5bAUMEBJZmmTFdJfb58mai2beDyhscs7NNOEVQ7Yvh6DmKA2Xya2eJyZi0jQliR/Y+
	tLpY5PQ==
X-Google-Smtp-Source: AGHT+IEIhom6wfbT8hJyrqgr8W86q8u3iJF7VXHkbhSBY+5SfYi4rIInhmlezzKH/X0h3w//D7kRaQ==
X-Received: by 2002:a05:600c:2e48:b0:439:98ca:e3a4 with SMTP id 5b1f17b1804b1-43bd29b4cdbmr53979685e9.19.1741260645366;
        Thu, 06 Mar 2025 03:30:45 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v10 09/18] arm64: dts: imx8mq: add anatop clocks
Date: Thu,  6 Mar 2025 12:27:58 +0100
Message-ID: <20250306112959.242131-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
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

