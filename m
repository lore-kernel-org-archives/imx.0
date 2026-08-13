Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D7147ECEB
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628074; cv=none; b=rrWMROn6F+jnuYQx3e6NwQhj04i3rxbX4+81cEpKwrFl4/2BrvVLfFmcHuQi94w/EqYAOwTgDj6TIfTf1Snjc5q3UxQIZ/+SxZES1HJZ5OAEMj9zspkXCT2+eArijdJYrPG4tvL3HCwPNbm8Ah6V9LlZmli9Fm3nHqQ7vR+lqIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628074; c=relaxed/simple;
	bh=kggwUX68CJFb3FdGVJM1Y4h2BTu9PfteTxG1M7dY3kI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=It8o4Wu6CXyIoXoRh2aJu9StOHuC3cx+1bu0TwkWfC2W0gNHRl57o9+I0fdKJXasXZep4Z4lx9UXoqGARyS6G/Bd8MOfv1/4YFS5iiiNdyHdZjJoAvhLQsmcpA2EslP0PPIMVxOlU0e+wm6aMpK/Sg1LW5oVHxzn/OBe4KuDOvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mISpd6JD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mISpd6JD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caced6038eso12460575ad.0
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628071; x=1787232871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOTlHuZ+ZwQpxacg2zaGuuKn6PBZaDI340LCQ90ZSUc=;
        b=mISpd6JDeajhiid9cdSnMwF13p5xu57uJItkAGK/guwlfknm6MnVEvCdMuSnqYvYvJ
         co5u39DmlClwIyU65h0HvpZCURJvochA2149z9RjkbFguTTUGmHSMjqanoigYX0bcVrL
         ZRomn3hb24z7hhR1y1iyY81U3LjBJQV2YiePDkEVWam5FAkqGm896vvsdqJpdIls1Xdz
         02s9riI9O2EX9UWZZwN+fiHDpPL0Ve0rditFwrh7jtRoXRZcJ9A8rsaSphwOa93pV3DM
         QQIsVygXbnLd1OfXBrEXX4SddTls7QTu2Ip1hw7eiEJho7Gu9xcympoDX8ksgY/r3VCy
         dZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628071; x=1787232871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOTlHuZ+ZwQpxacg2zaGuuKn6PBZaDI340LCQ90ZSUc=;
        b=otsB+ZyR0ShEF6ibHyVcWiuqCyC9VJuGdS6KYSu22nAzBBZXVC7b2Mwr+iEAc8ZTLH
         Owi8AIEuwsgOY0/lYAjTuM7k0H43PKMbROavLTSQPQCrlBj38H+WFUnMMZvvjlzt21Xv
         HO1PZFNrwGfXClSr1QenIIzx7xWoh2+cwWr9DBzmyBDtNCy3UfCC7w8Fg/A2P3Clg855
         HRV89L7BnG3d1ZLlx/v9ZculM8SEHFCnV0lmIynV26v8GrScoIjhBewc7rjEP/ZWGJFV
         kUsf6qcqftkFhGIn7xMaOSCIFMyAD1pvBmQiOmSDMqSCSmro9Uy7ZnWPNdssM0QSSgHF
         5f+w==
X-Gm-Message-State: AOJu0YwTp+JOC2zHn42IUxoqbaA3Sn9+Q8fmnGzNSYkPi1CP+EGKbWOM
	6LKexq2bkiZGzLnKXKjx63w03Fl3KETGnbT7c4VbyYJKHYgDNQnfTV/p
X-Gm-Gg: AR+sD11+/Vm7GCukS9QC6V8i6kSDiACmHcbjDgFVIem4wEbK49/xYwHQI7JidKQPyTU
	e2zW+rDqsoCO2t9eIwR+He+6tHuOf+iPCJqFmjFMpTgDPjqyDFbtGuuPE2InCuAm0wH7UCGUY1q
	O49I/+cQisQYJiV3IXxllpECYTEcgNY3l9kIvp0lWF7M4FLoP750ZPmczz1yAZS6buEbc1XwOuh
	gXzZEPJK2+pdWjCtiHlPQ2dnTf53/XUTgfraBMb4obh2z0nG76j5NCxCu92COfnhdxKDXjpv1V0
	V1oheoGIyR2wijG9sMJXgQ/kl4apk12KcoN90OZkEOOOtH50MrLII70fpydpjv/f12RY4u2Pqm6
	OkSPgD1hHWSChHyLOssLdo1o2wCx0b3Y+ioqlW0e6Wr/xYXpx+gmQwgtNxQIKe/q4Vmt96WPNNI
	X38nWLMWQK6rdCu9DPXwhLw/Zm7n9WNYpmRRTes+q5T0Jr7ZkxSYGsuKa8p6FFetVN5bw=
X-Received: by 2002:a17:902:f64e:b0:2cf:70d2:da7c with SMTP id d9443c01a7336-2d37f77fdfemr72669655ad.12.1786628071272;
        Thu, 13 Aug 2026 06:34:31 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:30 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 0/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V1 and V2
Date: Thu, 13 Aug 2026 10:33:29 -0300
Message-ID: <20260813133335.1941580-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

This series adds device tree overlays for the Toradex Capacitive Touch
Display 10.1" LVDS V1 and V2 with the Verdin iMX8M Plus SoM.

The display addition covers two interface types:

- Native LCDIF (LVDS)
- DSI-to-LVDS adapter based on the SN65DSI84

This change depends on other patch series, and should be applied after
it:

- https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#t

  Adds the Toradex Capacitive Touch Display 10.1" LVDS V2 overlays for
  the Verdin AM62. This series is required because it adds the panel
  bindings for the display. It is currently in linux-next.

Leonardo Costa (6):
  arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch
    Display 10.1" LVDS
  arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter
    with 10.1" display
  arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex
    Display 10.1" LVDS
  arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch
    Display 10.1" LVDS V2
  arm64: dts: freescale: imx8mp-verdin: Add Toradex DSI to LVDS adapter
    with the 10.1" V2 display
  arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex
    Display 10.1" LVDS V2

 arch/arm64/boot/dts/freescale/Makefile        |  31 +++++
 ...zanine-panel-cap-touch-10inch-lvds-v2.dtso | 107 +++++++++++++++
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso |  71 ++++++++++
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso |  94 +++++++++++++
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 129 ++++++++++++++++++
 ...verdin-panel-cap-touch-10inch-lvds-v2.dtso | 118 ++++++++++++++++
 ...mp-verdin-panel-cap-touch-10inch-lvds.dtso |  95 +++++++++++++
 7 files changed, 645 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds.dtso

