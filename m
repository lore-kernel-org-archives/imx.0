Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B715B3EAC9B
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995469; cv=none; b=YEF0iz4Mu2Nv1DMMijMheygR0NQWlX/RVI/9uXskm2J3mdrIa3PCc0uglYKFjO01AtlM37M9Fh2v/lKpdMry6uOuqWqwopZIastNELDetiB6lE07KZWFPzh4z8HvQqDYfTrnrwrT1ncfcwfm5JS8yaGlrLoy7MR3b3yKiDm6suM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995469; c=relaxed/simple;
	bh=snYz/D/hcVPZCP1uH4dkxVp3T3bXMnNXrhtHWe1Be3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kg1rAbDXuJclIZnJorKxjgzWjLdy3EgrhLOXpIY+mEI4mCQsxqqvFEo6My5wDOufEPI6UtqKPAau1cSr2JK3JDZbPgubnwTvHWBw25VQc4XHccRmLxIkV2k9RYNkY4ucN0LMDI0vyPEsdXSNF6qDTeVd44uG6lgBQck5C2Lv1Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJtbMDtr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJtbMDtr"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so33002505e9.1
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995466; x=1781600266; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5J1tSAGT3QEqdiMDMCGFat+rOeDsCvBwWF1wlYWcmPM=;
        b=cJtbMDtrHbBfd1d+b16l6sWG9aacMQY1ougg5+NPP6erMIHSzyDRMzLr/0W8kBqQ4F
         b442Y+EsBQdgqI+BpFSI4sV87Mi2ZfOJSst8YTuwVKYJ6aJeDY62UODIl/xQiknkQhGe
         lIzjycJW1+G+nCCZqY0Y2BKzPEpaWFMxMjov7OFOdAD3y7TcIt2tHBfz2nMdBMY7q0cN
         lzWbyZ2h67hIhqFtBbYpqYLIz3Pne7itTdq6oEcy14nPzrlryjqdzUbUfu+RbHid4/BC
         WJDXJ5w+l02VfHsKIRJKx+gD+gQYunSOTKOSYyIDJqsP48IGcPu7RMIpktE+wOQGsBZs
         bcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995466; x=1781600266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J1tSAGT3QEqdiMDMCGFat+rOeDsCvBwWF1wlYWcmPM=;
        b=gQ4BLX892g6P40i9v2puMlTZtZawPOFKF0wM5dfoaa7WUQ7Wf9HJCOqdY2CLlHaQ3M
         GlMnK2xqCxxmI/gk4acv6waK+TNSPOjzelJ/8qVIpEb4DgGgQfQz6ABntcv+8CKj/A6U
         hxR4hojPSydWaQi0icxYLG7Q5J/5VUEKmJOGcneXTKArfDWnP9j6VweV5be/BBRP6BiP
         9SgEoiUp8g3V6F04y88iXdu4jxtrTwVlbzBrWJJ/cr0O/LcSTwlHWAD/jsizs8vd6K6N
         xyoFRbLknzNTMOO5l2Q+rb779H5g3xUNeBjghCCnxaNDBaJt+2vP23xpssMFzeXc0k+O
         +u9A==
X-Forwarded-Encrypted: i=1; AFNElJ8pIxk5Kqga/O+5Ulz8rYm6+tzJaxYXDuLLmD9+zxtVzHslXzy2vc7SGn6qh7MUQ0m0TcY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYw/00H+X7/55K6Vw8RfSUBAaJg1sRUnX37apxqJsryvEf/OBT
	27aj8RFkr6z+hV2hKvS67ANgdZpO5AUrGVqx+t4b5zqxuguzG6bUyKWB
X-Gm-Gg: Acq92OEu6XxXxracyRpmYx6sGeEgsNim1M2xtgr2dRDWrw2vC6wnlzxTy+mGkUIqi/B
	hxr1U4anr8jXlgwvPRb6RxoQ64/Z82kByQ9ygFp1D/ez5nhStriFHjjPbu3WWGJu4pneh2mTH45
	72W0/5UR/n3aFGa01d4BGo0xZ11mG1qTkF4YjVNSiHQP2Lccaahrx0VSABvS7Ac9GJluX4jZQm+
	VvUSf+yvxGrQ2o+PogNtut9aFoYcU3UvTukM3g2ozEmy74zH9Mabr1WmutnF11bRTzUrbsoQJIR
	VcpOZTS0T3LsYghIUihcAPZsLExHhUZnTaYVz6WjmzJewS+qZ6T9BUpbILmCD9mC+7gQ8BGPdx3
	ji+kxBbKreFXFfTIMjKiqOE8OddJuNlJRJNUPNKr3s6l5CFNOiuta2mbxXQHHapi1eGy8Q+R7Os
	VXsWNHwB02YjDK2jVU4+5qrgXZbkaofOCoVSSrVinHyg3BBOca/pCphjPfwzmcTeUtT2vE/yXn+
	l0R2p2vxLv9MWRDHgz9MZznc0xQsZdrEleQjk8HlqhJbig=
X-Received: by 2002:a05:600c:1d27:b0:490:add9:7f88 with SMTP id 5b1f17b1804b1-490c25dd709mr334881915e9.21.1780995465435;
        Tue, 09 Jun 2026 01:57:45 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm305234475e9.2.2026.06.09.01.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:57:44 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v3 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Tue,  9 Jun 2026 10:57:37 +0200
Message-ID: <cover.1780995368.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v2->v3:
 - Fixed wrong som eth phy address

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 723 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1206 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3

