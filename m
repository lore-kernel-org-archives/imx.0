Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10913783DC
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772643613; cv=none; b=AedmWXCO++pFjbbr5WPRxTw6DleyQAOVkQNXgRRHutSZXX4wMHadcN9EnHzPTlP41m3WZ6ck3Yrj9dwtvzzO4xmTGKzt7jL7pLsZterVKnWHquih3J7NpD994Hr7HbfjJ9dcEVGHdEKWJ+EMhg+U3S2Pm5DKsquNa1QyJCLZAiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772643613; c=relaxed/simple;
	bh=k1SEXk3hQTDfN0dLQzmKqJQ4Ry3ZBcRC/Pm3oxOE4Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HB1qtjnyZnV79xBrnzr/YW2lwiYCfaR3RheJ8JdB11xfRydE4prVpnyyF/ncjiG9Cb//gacvHpVX9Oo1Ye1VJB7BhwJ1cXXDZDCIouLrWmkG4fmDC0HOKpi9hoLul9PjEikh0rEOi5z0Rcm2/gXfctiWUCbhEFOestatjL5olzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEKsCUHV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEKsCUHV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48372efa020so62991235e9.2
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 09:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643610; x=1773248410; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOKKDiE8UwEX6D8ImXPa3GsQCDK5MYHljgoPPgkonbw=;
        b=YEKsCUHVEmvK3aJwGqHkFT5xUTIUKVJzlUrt1ZJGpNxLqDSHWZHnKX0Q/1/u/3JoJO
         PyTMgPfS2FcW9bBrGQCKRcsfNPySdF+3C+1RKgiLPHU/0CWmOgXtada39Ulzo8jDCe5V
         cRYTa/FwvajIslAgcPJCcpx8EPne32p4wbkNOUrXx8fTrvGHBN44SIMbId2cE8387fC6
         i41p4NKzLBf1Z+YJTV0wxsaELIBT4VuUCMwjKZ735NqthuprutzNeubx8hqabmJOH8PL
         OnaVFkoVbOxYoW+XnoX/tks1PQFxYPHWW9g71SN8cXe7ID14JPgcJk1Jj6D+ySuUXmSV
         i1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643610; x=1773248410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOKKDiE8UwEX6D8ImXPa3GsQCDK5MYHljgoPPgkonbw=;
        b=NndSxM4+/AgzZw1LbcmgYR7D9chwCx+IflXdWeOuUfiIJcjeFs3fgnhXvKsCs/QnKO
         TbBg3ZUCJIFNL49DiO2fTQTTUQZ7BxnsnsS534lXcuztqp9ZThMs68CAymqIoOc3bGSg
         Zzw0poLPZ+E0DiEWkA0oS2uILRx+tmdg8PWHdqI0RKJGxdPlMQfPeIlTweIjXBjieVAg
         fAB243GQWaFc7Sm/H9lS+PXMK2TakHbfRIrbhV0QG0vH5f/jrh2VakeFIiNEIanzcUD/
         hVI7OSJvkeiVJUTDObS+BNn5dGJUzu21bXCsC34UFPqz5tFb2WAxO+GjPYW3RcHx6cZN
         b14g==
X-Forwarded-Encrypted: i=1; AJvYcCV+WbkHLuU5aOg2S7Ng4VIxeq4iVTgx+lks3bd7j8/06zpl1XREEgNwkqE2PvoQxJhRgkM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnQc4GQzhy8Pg+CrxD6e1D+1o7qT21icoNzmcAieVNBkewq8uC
	cppqIG2h/CBrudblvnhTFcQhNNTx33h71EYR3C4MwAMGxvD16CLX7kU+
X-Gm-Gg: ATEYQzwytnHnOmbnkWhcybUTDMR1CeqxFZZn/9uXnTYv6byn0qlCiwsp9hFf2b+VMsa
	9gGehKGjY2XA5tCgmvTqMEQeCOlthimYelghrrGig/ivxXkfqqiuB06r297p9wAOZuTwech74Pd
	htuIKPVsEsVWNsYTasXjLoK2getxpJ5rIwUxEXMwR4o71jtzeQPCnHarYGA8vTnUoXjCz9qIbIF
	iNiXf8M+KARMOtoGdj0/neDzh5ZpEWaAHW/BW8l67g6Kss3P14Bgi9YSBZvFbDed2/yJa6ryQXc
	dAZ+/L69yPofv9eVv8NemT0WuJNfjGEUIrpWsBfCDvw5zBCUiB8tExlrTFbKLcqyUjjcPbCEES3
	1tnXAL85U5BDrXwzPfctzvUNaj0O7JLT5dRzCJolbyiv4LzjXFYcg18Kz59zaXIwbOlYDHL+bEY
	4PFTntXEOK8qo5aVi9KqVUAGfLbNPVO1o6+y8ZSBlH1jofGy3cyajmJonyhM4rDKJfc4Y8wT8xH
	QTcTcFqowVVp/+cZJnJQsTneS8k/LuI51aaGGnQ
X-Received: by 2002:a05:600c:314a:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-48519883ac9mr47568175e9.19.1772643609888;
        Wed, 04 Mar 2026 09:00:09 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851887fc54sm69946295e9.10.2026.03.04.09.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:00:09 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] Add support for Variscite DART-MX91 and Sonata board
Date: Wed,  4 Mar 2026 17:59:52 +0100
Message-ID: <cover.1772642881.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX91 system on
module and the Sonata carrier board.

The series includes:
- Device tree bindings documentation for both SOM and carrier board
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v3->v4:
 - Fix space between BUCK4/BUCK5 aned parenthesis
 - Remove unused pinctrl groups

v2->v3:
 - Rebased the series to fix DTS apply issues.

v1->v2:
 - Ordering by hex and node name.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
  arm64: dts: freescale: Add support for Variscite DART-MX91
  arm64: dts: imx91-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx91-var-dart-sonata.dts   | 471 ++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 +++++++++++++++++
 4 files changed, 946 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi


base-commit: a251f9ed77f01f16adaaa1b3d2f568fc1b5acbfd
-- 
2.47.3

