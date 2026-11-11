Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428631;
	b=L22SjehisgAhdvmZW9O6zqiP3JtbpkPzKCOHB3Bjgdwo1jhRL4prE8a/tUk8JEeC6OGZ
	 whPoM5E7FKX8tx7Qhf5bUmC9I1nSJPYZvZmUk9p9hAyAKEikoCx+XugPzWHpUQroOqX5n
	 NCohgrZERewbnOBvSLBlOrbKEqRy3ODMHukd/xcHuyehDe7/i8+d1/meMe09lopwUMYKW
	 PUF9goqPubAxi9cja2gSyNhWGnuFLA+n1asdn+yjP75n7VqybrRawx+OY3AOGEhInwVAU
	 sZ2kbkNu6y03Q3pZkIHmggDXoSw8c/dmmVe3iPfQ0ymsJClBa+rS6OHy4J7jV6wpKIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=;
	b=OtmKU17341ZSb5zs21bJp4AReq2mkTsdJZE/pT4plMl2lXMDznR09Y9e2WsDp/BWQlGf
	 ms3O1RirezJ1vgoGR7+UFa1cS1udWeifEENBZ6AmFt7NbC0CmOQkf2O2viN7yDlp72Oim
	 tmgwPWAZitLfUlz68YqTn7VdHcSSvPpLPesq0JRUG/QVIo4mUSNhQGPaqjZi21zm3JuO4
	 t8M1TXrD9L1EqcpqGrd/YOeJDqC+lRQVek2+2CKCkC+Ru4KYApAG+vklaoBctWJquPbul
	 a4tYy8KbOzd0jnHC90QESs/k9hjuPge4+qThmRxPLZn5sif7CaUrXRs6w9zczrvTv5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAbGkEEE;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC49606A326
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 20:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC49606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DAbGkEEE
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492690dd5daso2853488f8f.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 12:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428629; x=1795033429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=;
        b=DAbGkEEEql4lIEq99Jyex0fm+FNzpgq6LJymGSV3C4g16ZbLnKTROLtlo4femhbO4L
         sAkm4EGSj9Baf5O9L9oHAynov9uA3dVZsDj0v99jKYpp5wERX+YNWCKYE05zRrz4n9Rl
         DDVW8gclgSfCq6RrAzeNFl/OxGp4lJfzV3YyIG4Xl7oF9z7XhnjrjliqpkvOuPaxK5gE
         ZagU7H5gUaSgZ94N6tIfco8I4SoJAQgVf7uEdElCOKVwZYGmdmN503hsjIXmd3Ic1vYH
         o5eZ9GUaODc0DNTEr2PoWf/BUeQCldjnS/hCw0xcxFDMagaEewSbRTH6rAjTkbqqFMkW
         NmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428629; x=1795033429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AG2VBeEI7A1GoTfdc+gJ/lg1MNn0HShTrdncYJaegA=;
        b=lzQ1pY7vwK3PpjIAVzmLbJe2Yeg60NZXvlr6uKdYke8zjMSlOPbgXCu7ndhD3I8qsW
         rXAcI/4nsXP3RIGLGwIBoK3iirlbLVv9U6CD2F26e0TzzaLY7+sqhAO4C07F4E7gT4Z5
         UpWSOjl450VHPIN4aWyVVObXm5XvVh1bp0CYqwSl4VVTIcKWtW2BWvEeeX+m2eWkeLw7
         X3y/zKf4KsbMatOYWK9UsB53fz1QM7RCebYcriK2Cpq8BhcksF6sgH1nswFFs7/2WsbF
         QwBwimbuJ/BKIPfQKw7ys2OdH6A8qWebydt0+7vv6H5hbNBMb+I+4wn57XidAUF+qoNL
         KovA==
X-Forwarded-Encrypted: i=1; AL+hErFI9JyW2HGM0h5gJtULaj02VHKFjwZUlqoruiZ6uNJ1C9/bK3s/xo9e2hTLaeKHmHqlLEU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9f1R/9PQO3koUUULNVmIL0rzddrCu9JBIhthIB8SQMT8r2yGsv
	fVeHQeZPd6biFQyIhOr1EXvV3MiMZJSQxh0IGYknzN/LecKjpzWHpENK
X-Gm-Gg: AYBFou3YXuWwrIm86G6YiLybN5ad41eLiU+y9Gud4Mr0Ax0Hw79de028jWQAkAZdGhZ
	ZAKbov8lDDUUerfieAqF9kx6rrhDwkw4j1qis4zIBuVPpDEezJU9of7ZBkDAowBWCnqMc3Ob92s
	t6JDOIqY5S713+DFVuS+d4teN/PL40soZoceAT8w929UonVJLGKmoo4UmPPUlC+Qz2b8d+Vvrsu
	C1nugM+Jg01m+DUpGS1p5EkniWdij7NTnOhg+CM5RRFLtv48kX3Y5BSnJEkxewnN7a7cYc2huoA
	UjgpI6uYPeuDQ/Sg3W87Xywp3GcAPHjB2fH75D9Od090SJ8+dY3ljheZB/0iIDKyawFCWoHV/jm
	3AbRDIIVvvba0Yfz+hHfl2GLDn0XsaRH9A2HFm84TIb+21RBtQwbi3rUHgFbEFi0GTBuQHlkJGz
	/tseMjGznboY4A3DRzwyvTjuFhdrlRMQya3H4Tny95nt67LcBaNy9QgdfC9tSrIPZfQ8wqY0GJ4
	vUVckvCj6kIUmRalwCkGUcFKgPXFO18c3i484k632FcclCtPcgVb14I4CZxdZiLDj4vSsW3nMWS
	GCLUKPmXBOL4UeZ3A2Q7b2PUK10k2uTAPE7YVgoijrosnHxb3Q2zDde8Kc4l9ik6zIlSiPeVqp/
	eeVH1dfH34eJGzWDuOOgMzyoic+pLcukrwepx1vavVWboO2Fwo5Xi2Dg=
X-Received: by 2002:a05:6000:611:b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-499c89825fdmr6554563f8f.10.1794428628387;
        Wed, 11 Nov 2026 12:23:48 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm12079305f8f.3.2026.11.11.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:23:47 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SMARC-MX8M-PLUS and Echo board
Date: Wed, 11 Nov 2026 21:23:09 +0100
Message-ID: <cover.1794420001.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SMARC-MX8M-PLUS
system on module and the Echo carrier board.

The series includes:
- Device tree bindings for the module and carrier board
- SOM device tree with on-module peripherals
- Echo carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v1->v2:
 - Remove the unused ft5x06_ts label from the Echo touchscreen node.
 - Add uart-has-rtscts to UART1 on the Echo board.

Stefano Radaelli (3):
  dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
  arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS
  arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-smarc-echo.dts   | 648 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-smarc.dtsi  | 640 +++++++++++++++++
 4 files changed, 1295 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc-echo.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-smarc.dtsi


base-commit: a62533fb6362e6424a7bb4ecd4b5afe1a3355849
-- 
2.47.3

