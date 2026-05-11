Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7E3D9DD4
	for <imx@lists.linux.dev>; Mon, 11 May 2026 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496226; cv=none; b=AqUIV3P8uPhd/MwRcP0j5GFTbZqSSrkhfButrRpCQ8w3S6mkTlbJE6m1NUQgmSBoeip+XSFgDZa1xTP0UpZfvkxXj0u3dCMSyH+WewFEJo2c4kP+nlfKT7tkmiZCGdVIsnH9wUgYvkGdcnzNf0+RuL8PEf+b7rlbQ+pj2G9oAO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496226; c=relaxed/simple;
	bh=iazWrLtJH0ZvfQXHNMDmWoeTvLKqPTMtY7iZ5ZxXJzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r15kBdXyCzCKUiostpf9X+gF1et2FHRZD+y6r4nI2J/X4yxOLKI+HzZwUqQfj5n4IM206kAkQlLwVE3bvXwKQko6w2o4GYvOGoVylih/6Und82gelJAPUAhfAT4d1+yeWQeSK4SBRKz/C+hxdspncdPvvVUZSJK6KFwMLeCovsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwcP63sK; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwcP63sK"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-367c26471f5so1408191a91.1
        for <imx@lists.linux.dev>; Mon, 11 May 2026 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496224; x=1779101024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=mwcP63sKFvgfSJw8Hz7+Wg92tQ21+ovVJXAFz08re1lS+HSpFe6Fr5iN2FKz0x7SWc
         WWjddXkH6AMgTCs+x/AX5nsiFLHzFnKcPC9i5ZVqLfKUbimXvaKPIpEy4a5BD6ttpvHI
         XV5KPIIdFShlLIXmB0RtjPgUbPQvKF1H6a8wDX97tjWaE7Uq9cZYhpxUAwgXbeuS6k6N
         29a397deI9leFdhcE2XCZ8CtzVRTjEc38IfBEsIZpCg+U/enDD3fJ8BcCJzXwkYp5koC
         m3c2xjU/3M7eyY43556cPQV2cC+7JxJEVMwqxLuCGw7K2mLZPlc+6/LtALwN7jUqfWff
         kePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496224; x=1779101024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EVdxV8Se2LiyuEjyoag3giBCPKNVKgEYji5bgopuUQ=;
        b=RzIgO8MmOD/GSwNAi925gYbBg6YJS0+4kSUhBnsguJkgDZkrl3qWnwcD0+xUYms36I
         0r1gR+gl7qBqci8wRgFxtn0Xi0nw3WRuc9qoEKQxJ6fKXdKwzuoaS3LW8A2isCKjZu2K
         VFAPQY+170uF4yZ9UsXmx9gtY6OuZbUZH9FJSAuua6VMSLGrEQgbBdq30RfXqHyoarfU
         MMIVfgzYMjEPs8B5QCewz2HXoNNlHq9sdTvnniDlpvbLMdQeWdeyqYKFxlai54h992Cc
         bqfsupVqgVSNhhu0b5NPJaXA4hF3IABYVkheD+8KLCX76iQIQmdhcVpnnMsBfXkIfgg0
         85Xw==
X-Forwarded-Encrypted: i=1; AFNElJ/H8eyUQQ7otRuDdYyCsvHxJohwGayyi18BwjCommALHEWVarXrOW/j4qLxAXC8detgWQs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yylzsa2kYGRP4IzBGO2YBUM4Tw5jVuHgoDmHds2szjwMIAD4Xf/
	sa/bcCc6WAfZASc2q3ihbcb7sAASZGRM7fvyhTjdxbt1Gvk6OY4/pl68
X-Gm-Gg: Acq92OHOM+gXsPJTAzeY1XqOF3aCn7COarSOSoIHfk3bwnfUJniijLxq8NMj7+CpAko
	MKVifAetZwN/0BfGyQgre9H+yRpPdEK6cE6BKhRjsZtIw2WA19bu72C2OcRMbxZnqZBUE+f2eqE
	lzz1bS4UiK0f40AlZ46XbyJj07H55XUbvRKmGogJfD4b34eIbxLsQGzH8+UY3mo4ZfkFxRCiWSi
	8kVBLKQ0ATaP/rosQerOZb+bzR6ggAV+fCNnRib/HWMT6pUIFVuobczrq4Xb8tdqkfHfpNLNm7e
	rGSGMuvsm0JAO2f55lK2a9pk6ie2J1jtpbsAVS+3Q7qPrqumvKn1lxgEBo1kyBnq3dxmVt6c3A/
	wnHMTqEOjy1VdT7bidM+aawLVJ2h3srIsAxiSq7kgaQDPHua+isW5x2+70pjoaqC76IyTSY9BIs
	9j6BvI1YtVslJlbRh6YM4bHBJ9xSL/1B0opYpZV3A=
X-Received: by 2002:a17:90b:57e5:b0:367:b9ed:665f with SMTP id 98e67ed59e1d1-367b9ed8035mr11528030a91.13.1778496224312;
        Mon, 11 May 2026 03:43:44 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:43 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Mon, 11 May 2026 18:39:27 +0800
Message-ID: <20260511103927.279550-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / post_div1 / post_div2 =
25Mhz / 3 * 90 / 1 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.54.0

