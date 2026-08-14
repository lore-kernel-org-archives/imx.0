Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3087C3E835E
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693637; cv=none; b=OlI8zK2QHezz7VyAW2yeNrZuMWIiRjnWgrVqqfktMF6dYNqljHHLExNGoQOwGzKwI8ytrL0R1drDiju3Fcal7xUoFWLdFryvNU6Olh+uBSeFOZ76GsgjK0fqM8b70ZacxVdPkjOfCj8PnV436S9aj7/6Sh6ADN/yft83mTzOv2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693637; c=relaxed/simple;
	bh=bEcIOZ3o4/YBQO9AvFUt5JfjZrSfxQHFfPTUj3NXnoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0/4EH2CrFFTq6Nld0H6gH/1d/tfS/hGcytK5RPpo0hEdUb8Bv62ubZAn5nbytp5dZqFRd2Hm/9Wg0c0PFoOBlISwvD3ploKfcL0G77Hb24+UbQxxevFAzF45FQMtJOqUaXxYx1H7MR7TTdCS1xEfLCYf91CJzOR4o7KTpSsvlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SElD3BN9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SElD3BN9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956242332dso7287275e9.2
        for <imx@lists.linux.dev>; Fri, 14 Aug 2026 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693624; x=1787298424; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=SElD3BN9S19InW1O2EUVzciOUNc2CUeQJeOfiVp5Q+Ih2nQQUcyJKl3hLLhFgCQKRp
         4Ujz1Oo4CIDnLHUmSCdlapinHgkRM9JfrEcj/BhtJatZeIyP/R9pgvODoSgnBlbCIyrh
         lqJE5vtYfuYWWlyKSN3FgPGL23YUd2b/q1/n7gWV5dJ8yTOQGzFmxOLnEgaTt4OMVKH0
         nTdo8NtuF4rqbUy/sMvXOSHoL3giIfjqp9YW8HJ32NWgXtbNnxGKYMx9tTeEv2kBs0tX
         8y88J3ktqbxF0UbrfXXtElpwTHXeLIZzWs3r27v4/DtpA3JiQ6UxfdCI+WValnm9LeFU
         C85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693624; x=1787298424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=lIk+bWRBe0G5mZ7KXoejMN6ze7hC6U1kXW3aGEdYpjQWpsthdX5vH3GpEOM82jrEx5
         AJUxSO+d3cmthQTxXP1bBQ5SHObgpfz5R42q+9elhCZ3rUj99WLvhL/fYoNKUr3YgdXQ
         fQV3xzyrvmpQ2yalQYrOvknWP3dk5V+Nk3MsoFb1/Xc1f5D47QpjC7AlA1SAh5vHtSGx
         7l+GAZ2ID7LrLkvIlyBsayyWD+tey00GwEL3YjK7zyS8cwZiklsIwFDHG6kVftZLd/xo
         ij0JQ/zonB/98fxZtd9cknDHnWt6+7vbtw7UB10wc0U7TwqUQvIpHXgdx/sj46w6HPoB
         Rj1w==
X-Forwarded-Encrypted: i=1; AHgh+RpA6jQwN3sTsOA6+RXibhu5XFwgL8T2T0ckguLkp47UCEsDKWj6lZaP8wuS0NS7K6V0v08=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoFo3sOwgwsSTWhP9lf8EZF1tWu62k3XVXn8/1I00Y/8MTz2dD
	8wpeZ2P4wERN1QlXSzaR0NDBjAQlczpJAuElla/ghjW1pH3URQEIm0y8
X-Gm-Gg: AR+sD10kgPPWnJmvp0Lp2kMcJ6UID1E/ZMSeECt8UAH2zWCKRnPx9GiTXemjMfgubyr
	yF+dWwXgTiU5RC/iBegx70JRqMlmr0ts/a4Lu6QYx8EMUqKn67WvkbjxIf55Ujd4p/HpIFOZuxs
	pqkI29NABcgKA9wKDqBmAtVascXz9kvqx+FeXe66xMrgf83gGJKhIM2MybrEOKV9rVL3pC+TBPx
	d/Q9rlczevoOzMK9lsv62ADS/+iqusfCS0Og7SZSQXZqpl5grhUijc9ogSLXKpW4OnaZtrsH66Q
	AixrV/Rlb7lUuTC4lmY2gcqpwU8Ff5ylzLghWO2o/k4O66g8f7//SKsIX6vboHJNC5FdRZX06Jn
	CHi3z6Vow2nspX720PJkvhFtj6PyeemyvNcAS/JT0fPgNNgZk55tEUK9F5ngwghm+il4HnmS0ta
	RUdDG7I9bUbSBfpWN0JDYzz2WW9aMaH/bzFyjM8jW9XXXa2FOfv4ix6Kl1U/uMv0RxyNnYztiXT
	5JG
X-Received: by 2002:a05:600c:5494:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-499879a52aamr48387325e9.14.1786693623509;
        Fri, 14 Aug 2026 00:47:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v5 1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Fri, 14 Aug 2026 09:46:57 +0200
Message-ID: <20260814074700.2491256-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814074700.2491256-1-mehmet.fide@gmail.com>
References: <20260814074700.2491256-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl_gpio_ext describes the three Colibri EXT_IO pins, but no node
references it, so the pin controller never applies it and the pads keep
whatever mux and bias they came up with. It is the only pin group in the
Vybrid Colibri device trees that is defined and never used.

The three pins are GPIOs on gpio2 and belong to no device, so hog the
group on that controller. Referencing it from &iomuxc would work too, but
the pin controller would then depend on one of its own children, which
fw_devlink reports as a dependency cycle.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 98f9ee1b0030..74afc7b0d74b 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,15 @@ &usbphy1 {
 	status = "okay";
 };
 
+&gpio2 {
+	/*
+	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
+	 * than on the pin controller, which would depend on its own child.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_ext>;
+};
+
 &iomuxc {
 	pinctrl_flexcan0: can0grp {
 		fsl,pins = <
-- 
2.54.0

