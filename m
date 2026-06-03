Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB201BF33
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 22:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527258; cv=none; b=cPAzH6CPPXdKaZ1VZ4UOyQVTKYfCSXbaYts6x9Hs+wDg/LjnCpztSa42biUqvTMlfkUzNWgvTA7/Wt/ZH+wZZ66gmXb3OefGvYB0qCFpePzWozlRP0DGnqlQF0RqZnPIkpSH1iCCWk9dAqzY0HDQTAeczrL71wmjl1eHhViL7NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527258; c=relaxed/simple;
	bh=00Y6pFdZew/zSYefbBU5VVKaSl8ILbGOEdNX1Pva6f4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGMM3BubHjK6j2hSsUUF3/iJ0+NQRSylITlZ0usGS8Kvi4xItp4w74qxtfwaEOm2kpZZwLMv3fkYeTqkwGY6aJza/w8V1to3jYHraE3FWHr32EGSJ354wtfZijNCyBFxhgUJ8jsTh/nM7fyKfvZq5vqkfNBUbrOY3eZGK/Rn48c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWlIlSH3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWlIlSH3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490af320e2aso772055e9.2
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 15:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780527250; x=1781132050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nskxwi9aLc3FrMLPAE8Sw6UzEPAoYUPBwlueZfRNNKM=;
        b=IWlIlSH3F75XqESn2qoJKCu887dCxrl93VIy3L9glHItrlIONg0jKHyc/kul4SZwgo
         9p4m6ha0+T6US/UxVuUelJs3llovVbcX98nyHXFXsWMcZ5ONYg0+rLeI07KreXXJLFTy
         BlYkgJVM9reec3PblLag2pd6StTHUS3zLjViANDsSerXidIL7jmYOge1zJXzR7tqVFWv
         LiWdCMwH4MS5+to/SV4Vus03+tVx7yX6S/kI7NXne/4ZUn/jLDum+vAMm7rX84o82j9A
         gos8wc8RT6X/YLBicHmoZDt0sHUHdVb6mddIoR3A4bWrJ4FdpMBNt8zx+QRFiAUFHc85
         elzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527250; x=1781132050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nskxwi9aLc3FrMLPAE8Sw6UzEPAoYUPBwlueZfRNNKM=;
        b=pOsoFXF/D38Jksa6pnb8d0gUPabj/p9eG3+loJYqxU5qK6UJTsQ+6R2ghcou8gIdtg
         9Q24hAOnCxeaJgSmixBlHT0VTxCdE4C19KFE+Is4pbI+zr+OV0aGei2DrCDMx09hjJWP
         o+YyzmBMP4rjimzoiZPoW9BYyX90oUp6+S2APVHDkHL/0oF7iymMHXvLDNYAL8ddcPgr
         3i1bELA2h7F2eJoLGcZIivGdi1yd/UIY8VcSr+PaO9uWw4rG0GyFYX9wtYf9lqJkWl2H
         vyazbciC2z9cFhBByXFwJNrAtUi8WJxwGlNHYJZSchawxKg4qbplKqAr/NOdpDZvliS6
         fYJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eWGvFZd1Y5AqBxpBOLWyKXSTExBcvWPTy+9eCy3m3N7Mxwe4KoJxtojuYf+vo043A1aw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJWBJL2X5k2K+6VG3Z1XS8UyB5djDBHeBd/2mO2Z8Vfiu8bTTM
	Agyzuk92+fkHRlCVpuZq9aZFsD0Uv6wQZ8cZsV47b2TJPQTCRofKdzZk
X-Gm-Gg: Acq92OFLxrsKGA7bEkNDNc8/D+uxmLZnz3p4v89hmPepWg06dkAALroE7DzuL5No5q5
	flDmEHk7K2YwJpWOSyJ9qMxlfqxAfOHIiN+4iwN+ALWa5WZLEMr2LwDomdOeew5hmbNX/4oWSnu
	5q7qtkFIo++EoEldSHrN5hOZU+t2PyA1ssrnWZdOc46Apx1GJ7BxnPEYNWsHFZ1FCdX6xDGmLfl
	EXmewIegc7FAI8nOAkcbNaj7g2R5CYL9ZlD8tG73bb3p+KA9R+lE6tVArbGS83RD2mciDRRaVIB
	MY2Ya7MELj6vXb/Rhsq8gYutiTmRUKy3TALR5PSmVBVWv0thcPgUanYcrcXIl6DF/KbVyXN6sEO
	9Wj9jfhDfMHhVA2FY7cqWvqZ6vEpgB8uZQ4OEqrv8B2VJgFP3yIsPmiq9u4pabuepkhmhUR27+W
	aBg5Q3dW4jlOxAZgA6oZKLClvMm+ox4IkJgdJt0JPJ8Uj4UYZyfSyVCVb+aOxE6JUW3vg7oYqQU
	Z4znuhI27pX5EZZxxG860EsptlqUKaHAy+WCrwUH+TtOg0=
X-Received: by 2002:a05:600c:c490:b0:490:b0df:9eac with SMTP id 5b1f17b1804b1-490b5e94d73mr88883525e9.3.1780527249399;
        Wed, 03 Jun 2026 15:54:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm26366385e9.6.2026.06.03.15.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:54:08 -0700 (PDT)
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
Subject: [PATCH v1 0/2] arm64: dts: imx8mm-var-som-symphony: minor board updates
Date: Thu,  4 Jun 2026 00:53:58 +0200
Message-ID: <cover.1780527068.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains minor updates for the Variscite Symphony carrier
board based on the current hardware configuration.

It updates the RGB_SEL handling and marks the relevant input devices as
wakeup sources.

Stefano Radaelli (2):
  arm64: dts: imx8mm-var-som-symphony: add wakeup sources
  arm64: dts: imx8mm-var-som-symphony: keep RGB_SEL low

 .../boot/dts/freescale/imx8mm-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3

