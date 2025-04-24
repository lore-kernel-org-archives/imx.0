Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F7A1F4613
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 06:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475739; cv=none; b=nsrae6pwTv+eGnpa3sc3CCbdBtuhOf9C05uC0UEWErPMyWYt1cZ0UGdOOex02y7WJcXk7EoMkP3hgtn5oMsDD+tOFEMK2pFYczr9y+kazOVqyx6aHt/hJaUdjiGeT39EE7qNbgN64d1MP2s31ktZarAvj9VJSACPEiRGmZKp57c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475739; c=relaxed/simple;
	bh=vc25/TFqvg0Ekr2Sm4G/VkkviBdPeMF5e7FdTWNCvAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6qri1R+hceiglcygAqsdVLN4TcESKNFlpJSj0h6n2ExPzrrDvpE7nQ6fFnVI4SZr8iHdBT1JD8E7CQzxn6nKCiVfBgFy6MylIDdHcA8cstvwV/JdQb3R/THd41ZKZApGTMozG7KRNxrm/ofAmH03PX5ooxVBGGdsTfNeJMx5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nxdpj19b; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nxdpj19b"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf848528aso4129375e9.2
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 23:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475735; x=1746080535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=nxdpj19b47rkXbpijrsJ//XFZIlg8EMZQ8J9sPqDOPIqo5mE9lui9NlevCifOWH7JQ
         c0oWqlk2foUHH65XZwIopVzy6l6hKxz9ei1nxMxuJ7ugMgMHsADxKnE9zIfNeEFyEpEP
         x1sLkbk+FIxai2/EI3jZdd3Wvml/PiajJDwtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475735; x=1746080535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=cOQuQD2XRmxEkw0OM+7uzVmCcyba5JNiD6pCjouIqieHYJ4HAooX2bld2o2W7349lI
         5uujTI64DaGDZi9+Z8N4U1EM6aBzx8Fm8RZKOL4NR1SOp5mPNRyz71IfgcN5PnCK7mTC
         YEJeU4GpaN5oPwK8Ay2FRLn7MTyZE2VrSfvM6yAaHeKvWT1FFGlce7pg3EpovoTG13Ca
         Rq/IcqicglGqIcLQcqlQ+915tpzjjHYtw/t5hYDTVZB5iPD4CGbQT3JDaM4dUm0sYtUw
         cvp1y0eT3kTXySoopsdMBNLRMqPidlsy6lBFtsXJMUhA1GMmtHccqaWK6eYROr+AmnoF
         kpZg==
X-Forwarded-Encrypted: i=1; AJvYcCUwiP18mJX15R4ubG0iW225x3xBpV54Hs98p2/BS4/NRqHkK2uJijFqtZ4rt4ZcLDipP2o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyW3TSR7KMO2JRv08trRsJPE7NN3Xhvo4Y0cyV1CYQJMrY098R3
	cM5YfwnoccT4o7JeipiqcKITUsFTdZUaRihzdaUOkbJjda4680iHUNKuwBcd8FY=
X-Gm-Gg: ASbGncsPEVf4cU2Qzr70LgWxq/sTQgRwybD/bOARWMF6YQ6P6egtGUufoAnGZ8E3hqh
	A0lhg4jppqIg3PRkn98UY4Lg9Ygox16r5v1+aaibPDm2b78B5gob29u2CdvgTwAwa4Ytf+4SZfM
	92r//+H9hhiT8fe5V8eTd+XHiEA7o+fx+pQ/bGzlhj7HFV9dCtgV4FwixXFZzT20uUpRt++11SU
	0B+supNsX9UlhFezJirdFZTEPvyvb5m/+KwOsMbubrtix7ABBpLbfrTGpSMNf5B96vIHiO8hME7
	UhR5xDffQPkZZQXPT8+9HUSj1KVz+aJxmvWrfw6d4167ID++HChWOxthe7kjFnyVX2Bx8J1EmRY
	dJSUl
X-Google-Smtp-Source: AGHT+IFfEKxdwofjLbOX41KrgGZVFzC2ffJ2xkKI3k+BOtUiPjGXL5Rc03EhcJrNDo7yGHkwvRfbrQ==
X-Received: by 2002:a05:600c:1e8c:b0:43c:fb8e:aec0 with SMTP id 5b1f17b1804b1-4409bd236ddmr9097865e9.1.1745475735057;
        Wed, 23 Apr 2025 23:22:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:14 -0700 (PDT)
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
Subject: [PATCH v12 09/19] arm64: dts: imx8mq: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:39 +0200
Message-ID: <20250424062154.2999219-10-dario.binacchi@amarulasolutions.com>
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

