Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7108648CD4A
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637467; cv=none; b=hWsPLkxZfYInfV0OX1oFNCPLeQ9NQUVB79reAkR7u/55FHTT9yTK6p2cZ4DgiW2xqV2uQZ8mfQsaUYnoP448zHcg1aOLZoSZn3sostSxCLwPbZQ5T5PMNfNhhpN+SI3IdRDCCKKfvuOvxWfx6fEg4tFFeBdkL0txOYRkom93ssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637467; c=relaxed/simple;
	bh=1Dp5lap9lrpf8yBi562e4hhl5LXAXrcbzfj+AqT4nyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PjqXFRgQGVKTGJhIPVP+XNUZFn7drq18DJCL7XoUIywAiEMTTsUpAZo0+gXySmC2qKLGmwmCgJztVyDY0+osa8D3BT9jWmEoBAUzP8ONP7xNXflJJ6J150xf//XupXvdKKGNYgwqvpRm06mNJSAz4ULfXWL9Nf8tkw9cs6nEqeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBZoHzVU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBZoHzVU"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f633e6058so2492f8f.0
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637463; x=1787242263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=REc2CNetkw/IR0cYYmcVDcXvVokY9XmMkULq1ud2MQc=;
        b=hBZoHzVUCgy3TNwLugFJonC0WxdPJvRBrwO7g5YYu/xQT+OZZprVQ+piLhDy+Ad5eK
         EGq2hEKSW+2MjW67oqyDSrSJ2YxsQTvwRVCEgagJVvPgIuLr2vo0G9rKnJkXHRdsh3dr
         gGIfsxLaFvEwLtXsFlQAecJtwN4n6NCcIzqZd8k0PmuP2uh2wYx1DJ918BRcVogqeXl/
         4p/rnvdFCWAI9Q8Qw8DBI2Sz4ahGg1roNlMFaVCMRmiJVdv5Qct0+wlpaxhKbhhGtsS0
         PTBN0WAWpC9ccTXDf07FZUldMvfIzb/H+R+TijNokzoHcOdaw9jMy5bk9wCTH4J4bFz5
         bMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637463; x=1787242263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REc2CNetkw/IR0cYYmcVDcXvVokY9XmMkULq1ud2MQc=;
        b=mhb284/mks48tcptTGQOwENP7PUUv5GYk7AmczzW5XBLdIduUu+Brgg/YPYRv/4qHd
         UisWeukShK1PO5EHyDoV4VYFCpMw16qOOLm47sxMsNMEA9eQFhMmPdtCpznTRdn0/spG
         8b49ldsxkcI4MeFkfogIwkQ5EEfHGM+bp47czovq5Qdk/h0AIwQtLBFgLlezulGoXu9e
         S1J8WtmZ5E9oJ6hJ6kDBmRuHoUm/QpXl0bDYd29H+Hk7cWpWZcVeNkEncDTaBgmH/oVe
         cr7+StSYSVTXmoAO8WoYn7hs2bthaFtb3ajE1u1bA6pxDeEalarSnMs3afpSNux7L5j1
         WblQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqz3yZ4L4BdSk0NVVlrlXZSCbCT+mywI2V/HnkfTg6eXDQcvNPucM6ZmKZaTqiuTiuq0Vg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBxDKh4ta2mtRXi9lU7zbzy/faKTY05XrHYffzjybA0iGJmau2
	X/YDp/SEa/JCjc7v76SBA533W/berONLkNEi1OL9CWRaSWAsd7Ho7csm
X-Gm-Gg: AR+sD11+aYhscMCc6YPGFQhDh1ILNr5B24Inh8ZLvWsj78cqLDQEsk8aaEiq9HfaIoa
	rl3ll50TTnc1VxeC1myJxuFHCjnwCuSjh1TpibzBiBNO6sV0t3bEqyoYC2RA9oLDOtLt2kTYpAY
	IWXW4BbdYjAzwJXC/9detsFBk+IBtCnHx3/T2j2d4NvRhOq8YZPrK21hX963q2jAl4QR+nowPD6
	V//TZuoETiugIoHjazmcgvxTu/f+CazQTNdaQb151CGrCL2O8UN6In0fEcN5Mb0SXr8INAmhan/
	NGAyld9Wx7p73g6r+Nn/phVD3mXQdAag/v11ONkj3bcf3ciPvGslXe4271UM7i9yhv2nV0IxyKb
	1KZEvXdq3ErsoAc6BUN0HNNSugDUq3BmKIh5vqHqJO6Fy7g0EV8Av1s0n/IvN5BJqb7EbvGFbd8
	Qu+K9QAYEuX9C6croMRf7lj/8M3BibDKCiAb5d6oJk6Oe0+zJgaWIiYNi5Af3u7jBOvVUKspmnj
	TDs
X-Received: by 2002:a5d:5f56:0:b0:461:e27d:5690 with SMTP id ffacd0b85a97d-4815a0414f0mr9891561f8f.26.1786637463204;
        Thu, 13 Aug 2026 09:11:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:02 -0700 (PDT)
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
Subject: [PATCH v4 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 18:10:57 +0200
Message-ID: <20260813161101.2274327-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

This adds a device tree for the Toradex Iris carrier board carrying the
Vybrid Colibri modules, plus two small preparatory patches for the
module-level dtsi that the i.MX Colibri variants already had.

Everything was tested on a Colibri VF50 on an Iris V1.1 running 6.18.

Changes in v4:
- gpio-line-names packed four per line (Frank Li)
- keep the EXT_IO pin group applied next to the carrier hog group
  instead of overwriting pinctrl-0 in the Iris dtsi, verified in
  pinmux-pins on hardware (Sashiko review)
- enable pwm0/pwm1 like the evaluation board does, so the dts matches
  the commit message; both chips register on hardware (Sashiko review)
- the compatibles keep their hyphens; Krzysztof asked for hyphens in
  every newly introduced compatible in the v2 review

Changes in v3, following Krzysztof's review:
- fold the Iris compatibles into the existing -on-eval enum entries
- use hyphens in the newly introduced compatibles
- drop the fixed 5V regulator that only fed the VBUS regulator
- sent as a fresh thread instead of in reply to v2

Changes in v2:
- add the dt-bindings patch for the new compatibles
- describe the USB host VBUS regulator instead of hogging USBH_PEN

Mehmet Fide (4):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 .../devicetree/bindings/arm/fsl.yaml          |  12 +-
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 126 ++++++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      |  56 ++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++
 6 files changed, 220 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.54.0

