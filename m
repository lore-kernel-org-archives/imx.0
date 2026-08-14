Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3665541A504
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693636; cv=none; b=d8YHIZvG1saR9X4hnyElJENm5XpQjKLlpPmiZX5nEfsfmhFvqDt/SQR5gEMHmPomLDzqA1gxxltustqGSHgC0XgQHggxpCYVaV/R2Q5XCUvQtcMDmAJXotGxSIlOE9u/NrfvHoixRSwJuJT1zTszUSCbayu+qMMlgQOIe32DZ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693636; c=relaxed/simple;
	bh=ekkvdcRXkpbM4hGg5dbbnxL6NU0N1v5cVqGhil6KP7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bAPrA56XXUzRAaVd+LjAcedewcCiRFGgJOi2Rkqc8TJ2r1cOfoGR9DGZVtVqY4b9YupLjzP5Oi4CkbiMtBWHLixH2rjLwoV3bd5GbZue4lS920YW5tLtJdrkEpBgqa06xhpRQJJySXu7jMGfNl7b3t0tRUmQuAchQCND+DKMAkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMYTDs4B; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMYTDs4B"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f703a9d05so462440f8f.0
        for <imx@lists.linux.dev>; Fri, 14 Aug 2026 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693623; x=1787298423; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wlLfGsWdr8phAtVLv97nZ0UPHdHbGHGBacvXoI9xCQ=;
        b=cMYTDs4BBqs/KACnQ63xlSIi8VHn1LlPydCOnRoHHDQD4DZ+U3PHIrqM8ttNez1aaU
         i2ey00aEd04KCNBi6+DUg28EU5dE1oHICAoWDEP0P0Lh+hdsR+ACX6gHkbBXNxTsHShS
         cZGLyrm1fMomxoEPPy2A7N0g6jcpqdFo+r9QrtjU2dAWlg08IQBVvu4I4pJ8GG65sMhU
         iPgyRbanR1jQdzv6vq4ZBvBNLgvD0EdzflXlEBA2LN9wLLIz4BDUtXy8kGTXkPFpacIl
         03ZFe9wG+mgLDc8XgDobh3X/ZfWwOiotBh2nLizubSYtipXPmd2LQbSv0CVtz5kq4oXu
         HkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693623; x=1787298423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wlLfGsWdr8phAtVLv97nZ0UPHdHbGHGBacvXoI9xCQ=;
        b=KI4v7hVWba8m5hsasolv+lIX87tp0icTIMj/6JFx/zh3KAVSd5ja9WCOWipMMH2V3g
         ++MRY/YlLlUqHSsTt6+F5UrXWf/5VrsZ2DEfiftiXZgWwGDkEzwtlBmzkZEbCrP7cAKt
         9EHXLax9Ju+k3Zrx2NAP561RcF0xKN76X2YaXdbCOr9VbNsOcgVUzMnkbHVnjaHvESvb
         ze8LtW1OQJPlnwNKMrUcPc+reW10ULW8bZLk/FjTNNbSeXMkHSzGfmiwOi3C70ueYQGk
         hR29VRcU0Xn8x6Jh0FHXTmQEbrVhc+SpTFlj9pMnfOG/TfPBp/hTEe56KygbTL2NdBrR
         yNNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrkZa3ALbX47T0d7Vs7xtQybC1E4HidroDvde2syDacq3EH0NRb/tMyMZ+vtWQKfmaz0AA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwMwpZiQkaDPOF+OgYLnVPw1np9lzgqhzawazXYcC5Thybwa6j
	OsUzNgbrScu+PAiztzNoO0rCacGpHCLC16ae9ongPD7+Uo81LykySKoc
X-Gm-Gg: AR+sD10JypX3QCiM7J2KZMIzFpRGpPLUECneO67TqwRTzXRRp4V/LYOOOaj3U7HplgR
	yTUv4bowx2NoHCbai8eF4mgz4w/vaid42hRsnW0R2fPgmaaujnYmW+YeHGEDlr0sfW8EQaveTbS
	0tKZuaTs5P/d061DAPp6xC/vfn+ExCdU8RX36cxUds180QCdg9rbTZtREdql+2yptJedLbppI/v
	IyfiLkkPPMEWZ0F+P7omQPw3oNqEUoZCjZ/jtStkGUgQVGTVlp9ni6ijnDhZILGZ+hhjCjZbLn8
	eJZHb/omU/7W13ZpCvpS176ldKkiJ3Go18RCwws22hADSPkdIh5nxK9z0VG/VerQLEuABDCz6h/
	gn6Xo78xFQjK24jKzrlLisqJaWDoqlMfg2GDBHx4wUvc62riiMYeuzmnu+bHP/nhvOH346akmUJ
	ZwDUtMcfMHx+p+CxfoL+SfyIFCBmKPW/hks5FsyzEayJ1SYA+UY6ARafy3vnbxA7J3fA==
X-Received: by 2002:a05:600c:3496:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4998796e478mr55812165e9.13.1786693622590;
        Fri, 14 Aug 2026 00:47:02 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:01 -0700 (PDT)
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
Subject: [PATCH v5 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Fri, 14 Aug 2026 09:46:56 +0200
Message-ID: <20260814074700.2491256-1-mehmet.fide@gmail.com>
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

Tested on a Colibri VF50 on an Iris V1.1, most recently on 7.2-rc7
plus this series.

Changes in v5:
- drop the kernel version from the test description in patch 4
  (Krzysztof)
- collect the Reviewed-by tags

Changes in v4:
- gpio-line-names packed four per line (Frank Li)
- keep the EXT_IO pin group applied next to the carrier hog group
  instead of overwriting pinctrl-0 in the Iris dtsi, verified in
  pinmux-pins on hardware (Sashiko review)
- enable pwm0/pwm1 like the evaluation board does; both chips
  register on hardware (Sashiko review)
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

Good old times indeed. You did this job before me and pulled me into
Linux in the first place, so having these patches reviewed by you
closes a nice circle. I seem to be following your path in every
detail by now, the hairline included. The tiny board is still out
there measuring every day. Thanks for the reviews!

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

