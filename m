Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1746360EE9
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051973; cv=none; b=IM7Xuh4sDf88aDRr+7nmt+m1DoKF8spdNYGZHR0Tz8itG+Utu2Ett6oZg7syAFY3jg5JDEvyXPauw19ES0BMOJQygP1d49Qi7h96WdWMS02e4rt6GUHPEEFJ86zLermZDKMG57R/8AIIvenIVtv330u5/8ckV1G40ePrgftaO6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051973; c=relaxed/simple;
	bh=EbOkg0xhW+b9L9neCJpC2q3mXdwTWg7SuTznO/Nvhms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bjp+ANFqozgjWzgXERoYCVyRQKamRwMx5/uVRWr/BNC7UYIlEkmnGrC+lx1Wt4P+yPP0KHmZgknMW+C5jIcJHnYSA5otCo/tfU4Kn0qQ/3ya6j3JI1VC287kkZzB+og2rGRQe7JVrbh88xHlaLXLzRuDRyXRZ7nbUd3CQPTEVnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5Moy8mV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5Moy8mV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eeea039ebso565759f8f.1
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051971; x=1780656771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Clr1sjugbIK8mVuhgaPmuk7DeQ8AwBiKW3SgLxEYIc=;
        b=F5Moy8mVPHCBkQIMWZIn5QLBwa/9RALOFAPufOwWyza6wbNUh/Iu6s3jPNLxAeF1xj
         aWV9DA1H6qMIs0l5HSVRczoV5XdBSvvVO7GVPOHa1+uyteOEAjLgGBTSfVTMSPnDlG30
         OI0dqlO3Dokc1poWkNE632MWRNRBlltA8itvj59KEo4vdWplGgPT1fiiuDFVaMytR4S9
         I8k9mwxqojQvnWJEZ2Hf1QkVdT8t2J2lW1Rosce5wOSIlotzsm2PyRShS7XamLMgmwug
         3jze/V0Kfo8n84YOKopupofTceIHS6RKtKhqZPXWcOG931V5bPwCBMVFOpmSxkqJixbB
         pe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051971; x=1780656771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Clr1sjugbIK8mVuhgaPmuk7DeQ8AwBiKW3SgLxEYIc=;
        b=rsX/xYZOP4EvKwHYg+ZhdrJz2R1fVuasdXs8H+KtZts2EZnB7UxnTVOwDca5xUMdYl
         33/Cv/NJPli/nBJc15mHV7349kau4DhCJ0HJ/qRs7BIU115bp+566hgJm+prRV4dU6Z5
         IDIPW60+FKfauK2/6F7qxw1uXF3v4UqvQBt6b07KCtc/ikDGf8dCNSYn00Dpi5ApKb//
         oUQSfyjQolKWRmV4XDy0S5M19eaVWq1pdDycslkrOM827yxux16PmrwpLZKM8+X6Kh8S
         RbRXMJ1WjE2YMqv9f+eJg24O+oBLz/iLxKKW48P9KXTkSlOyQmIM159jKghQZzZgmJIW
         d7tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bGnnkoft0p38oUvxzv6b2mwR3l41ITIPb9QJIOpB6jWxcRtf/ui/DPKBEcFrI5XQP0Wo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyl84+jSyxh/vtpEN/42GFAwnoWxiQFMnvu0IXvwCTAfAud8kaC
	yehwiPoRaxise6XdTIb5nY4KYzCscw/ZQBfYGMbVLquKhVCieXXouDv+e+NgrA==
X-Gm-Gg: Acq92OFHPRhmpACmtgIxkQxL2tv5KTW/9sUriITWoY+f743YrzjZjuMKmc+djRWcMOo
	evhGapsUW17gsjylsKLxHA8+SPH0DuQ4BwFEBr5AnJRSlq83FDgaOqjVfNkoFJxour9r7mAIZ1Z
	9KJ0g78y2NZubhUCsfDn5SEQ00aTStMDwFn2nPGZvXxlBKAf2uAUJBHibkMeht8ff8UVrr+JSSP
	xRVkNul9Bj/kdhpTK3xONnIF42fMF6SfMGmsfjYV9oFk9eIFkhHF0pzCzVQoPJFOV15d9yPkcO0
	AQCbEZL66Ek92YFvx37WP54BZOUukDYPJ5Hz7c8hFdrDG7dadplB8ev+/BcpDJg/kB7l6OtetSg
	GMLmMsqR2hfjvylRbttyrY8/Q+yyn6IqbAQ1xWiKULksL72HpNO7ymo/RNS+av/Ce9rh6R0tDGT
	5SKy74r+v/F2SFQXG3r6z9YpHZwIcN5ymG3IXBwtrGDWbR3JxCVUcdUgiyCeQ+AFR73BuCcqC0y
	rCbsbYVcwJjGjcGY7qudb9D3/u9ktQyEpdyyyEA9UTpGac=
X-Received: by 2002:a5d:588e:0:b0:441:1cf9:4f06 with SMTP id ffacd0b85a97d-45ef144e415mr4343407f8f.31.1780051970866;
        Fri, 29 May 2026 03:52:50 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:50 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 0/4] arm64: dts: imx93-var-som-symphony: align DTS with hardware revision
Date: Fri, 29 May 2026 12:52:43 +0200
Message-ID: <cover.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX93 VAR-SOM Symphony device tree to match the
latest carrier board hardware revision.

The changes add support for onboard peripherals and complete the board
configuration with the required GPIO, pinctrl and PWM settings.

v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

Stefano Radaelli (4):
  arm64: dts: imx93-var-som-symphony: add TPM support
  arm64: dts: imx93-var-som-symphony: enable UART7
  arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx93-var-som-symphony: enable TPM3 PWM

 .../dts/freescale/imx93-var-som-symphony.dts  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

