Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B914ABBBC
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659714; cv=none; b=BfP5rS7c/Vkl6iBckQrcDHccpVEZ9UMyof4WwXBr0RDWeTamjUSQqT1yldzor84u7vxbQJrprWYETgeIKONdPejwtMqg43I0abyWZsViUiCne4AUlNJZ1GzFaxYjkoL6Fx81OIdV72KinywOPzGNlNRwCkdgTg/8oz5k7PK/U8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659714; c=relaxed/simple;
	bh=UDNJflXLP21/068t+43/BbPA9K4CsGbb7V6J7alYdPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJa02sfWzlJar3yhyKLrffTzfbZ5K4AiSGml6L4OeM0y/sXksW2/Cm4EZ7Qb8H94k5YTmvO61QHn7k9eMKRMt2SfmU9sbNQ29SKThvOhZKx+mxqx1YjFpMzcRJrDNFZf/HSRcxwxvzcJbXYBuHq4k0Ns1RqagMkpH4yQN6CyaoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4Cjj/Th; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4Cjj/Th"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so7440615e9.0
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659700; x=1790264500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3hYwC+8YXd3ZBbv37u4GOv6TST5pjo7r9wcpsmJejTU=;
        b=b4Cjj/Ths/0YrFKmjAivm7Bn2tj+A2rzxLsIL8XPbDR2HO73+HyJMOUKqDb5PxNgPP
         EhZIeCAKP7uKRtX9dlyi+ZJ8bMZTTU1nWS7UdZrzheQQNY7hlm2AA6BM9LIe5GYuhgxT
         Y6daUfgCGmb7LvHq51Y8SMnwOfA6GXb3Puw9IXBWCnzF66NMcXrAocs87QbLvb5TYLHQ
         wg5BV5xTvJTR4lPyvMj/cZZrxTjFM9wfr0kQdhPJHSSl/lLxWx9b1XTtAa33KQsmbbr0
         RA+tqKoKEFK32fShuY8zrlgiZJMo+GEjAW+5u7cs0bS5SqLM1UhUfy53/DU+++QoggLW
         LgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659700; x=1790264500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hYwC+8YXd3ZBbv37u4GOv6TST5pjo7r9wcpsmJejTU=;
        b=tPtNNkJVXqhvlwOVGuLQNlGpEE0rpJjopDff28l2Vf6XwdF40pTQxER7gfOEMpO7LY
         N4IJ0CSHtisOSbJ4E57JUBe4t6lu1jw7k2jLqH+sSk0ZW5shGIHC4FBRjNCFHvcEA2V8
         7Bw7g+Q5OxTHA50tDWRnSGGvXDeug/Bjs46YUGk08h/uc7aHfotpoba4GnODOVm7duyb
         zTYY6xkchEPkHgS6FoPHOzET2zlw0/A9Mkcx0qWQix0aq9eA3lDRFdkAKujNXHn9Jktu
         FpOybhTB4TzFQtfGHEYQ6kHU6ye1yJXDFBv/yROWl9nyUwQLTDgpOevm9Lsyi9Jt+H9r
         PvTQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5LJgAKcASCsYtBpm3n4Fg7nyOm9O9tc3b6WlcLS5qS/HiMWJ4KdZwntdqG3YqyFjn4Nc=@lists.linux.dev
X-Gm-Message-State: AFuF++n1dl0R+1YDo4kE3HfgUXK9gJNjDcnslGzLozucUMN0JK0o6qvo
	mHxli0MBllN+dAkBGtkpEdxMOMghKV2RiLNw0Rju6D2kZvkvqqu0U6Nj
X-Gm-Gg: AYBFou0N/DMtMo3/DY6gVtR1y6gzT9Xt76Ly8TdiqcgtLI8tPaPy8iMvUa9nDd7lgda
	wdiyfqHD7EHfveOBHL9M5mbZLokXiQhwpNfzZVnFAMXfBp0cSKlMiCIY5RAhcZxVyjNsbIhP2/j
	dCfi8FxfbykhsJE/J8bCoKRQxXl0F2iipAVPfpUw2a6y/HhPOHLWnq6aamhf8YTwRpxfBP90DP/
	4/OeW+ScocAkKxsC6Bj7FaAYIOPdEY7xNbMOpaEHWRB0Uaa/Ylpt7wzLZojpZTmh/le/40vkgLk
	6zppt40FmJk88HIY/QXSUFLdA8skHBHDv90FuYHjCixiwcw+1fpdCOaq++6f77yBzDvJU2bCBaX
	r47n7kIPiLwNqVZGfcuTugyXxN/CuchZZpwe82hdwVo0+paZtupeT+0cEZDViHpeBYovHNKBdYP
	9Yk70BULQjaB/lOfGsbqCEYm301KkS7vqMaOwPok3FKsjtwV5OQgs0z614Z3Vj6TdMvivhGFKNv
	GBn9USHtD2Q3YVSh1b54+VYIVoq5wt+DMDttaBzPQf6tFUs+OaT/h7gxYNC2Yku6cPWqNXO7vZf
	1d/s6i+PRsk72xSTTRaEpQ==
X-Received: by 2002:a05:600c:6298:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49eb73143bcmr86991055e9.4.1789659700261;
        Thu, 17 Sep 2026 08:41:40 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:39 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Thu, 17 Sep 2026 17:41:27 +0200
Message-ID: <cover.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the Variscite DART-MX8M-MINI SoM device tree to
better reflect the currently supported hardware configuration.

The changes configure SAI3 in synchronous RX mode, add TPM support,
and increase the Ethernet PHY reset deassert delay to improve PHY
detection reliability.

v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

Stefano Radaelli (3):
  arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
  arm64: dts: imx8mm-var-dart: add TPM support
  arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)


base-commit: 46d8fa682d263271f3ef7bf95166b124c19d6c62
-- 
2.47.3

