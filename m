Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9BD357A31
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761766151; cv=none; b=pHs10XrQ5PTaYfNSNquivIJfs4rMgoHlQJX454uGrRVBrHfk+VZ1Ol8NCYK7DViOpYNugrbuRRYQwaxU9SOjO2HS/PGaKyo+It7zipkL29Gzy2B7S2Q0uDxl1hdlIx2EDVRiPhcWBG+y2YlSGJfTaT1ukQGUv0yRCZQC/Jzun+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761766151; c=relaxed/simple;
	bh=2wqxvv1LyQFzj8yk+I9X6hMiGmB+zBuKRmM0nZOP2cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kEc9qJF+CkYyl8viob/ICfasXN4HrCdufkRMHp+l8MGh3Sr4FoMao80KE3z+N5eowTemW2TMhUUQbH5arP4c9DmkX2VJ0JrVlqQL8cug6dkE1nT41aqlWWZBKsrfVgYJX2sBUWN8mOhP1oWcl6P/1b3uzXXZ99fOQT5gcdnyBKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPAjluoO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPAjluoO"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b4736e043f9so43830666b.0
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 12:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761766148; x=1762370948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NKKJA6fRomltCp481BiLWPXK7LT4XBfRN+VIaJM7fMU=;
        b=CPAjluoOUGgokL8soE8I64qKkSTjLTXIyZEfZ+gwYzLxtJzlyFk4YiXZk72n2NsB++
         Y8wyIWgE9EIrr/pZoWlYp6KpaKaW6D/Bi7npxutoyGcgH3TeGsxdDTjNl6sM5UvvEdsB
         6uRTEXHVAcQihVWZnaidmyuDAd7MEIHT4mNwQ7JX7KT1AE6FeJ6u4p/kX+9QyYO/IPL/
         wxQFREdmAsRx6V3ZaGvzDzVZ1oJPShLV1ARCh+ILeK1A4dffCM2RKj3gUv7SqBk0P1/Y
         36juhTO8sXTCP2IMcck6Zyn5mh7D929hU3D2RhPgXQAd47I32DVTPe5lYk2dTnoRNoYZ
         efQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766148; x=1762370948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKKJA6fRomltCp481BiLWPXK7LT4XBfRN+VIaJM7fMU=;
        b=GD+o5ytfxvZDZZ0O4uBMF80cMzBegqssgDCLMqUw9YEhInHtzFg+tR415w26SXbCO5
         yw2ZHmcB1bWhE92ekWeHn7Kag6ZhaojoMjbgfSQdNButtz+YMD4KIwMkVxqFZAp+7mIQ
         E9s380QTIbU5/7pUYqU/W4Z/GmeZJH7JlphzWdz1yA7QrXQJ8w0vPRCAFjHuCWW9N4Vq
         TlW6DKtg3vvmVuJRaF1wvJT5hIZMTvcY7k3sb64dEIDhIDA5hwbk1pYmQAHmx6yB3Ehi
         owRSCclGMrO/pj1zQ8vXRDXiP0wU9d1Ue75vrXCrKOxUSYHqJzj1FIAyahirDNQYuDxB
         aGCw==
X-Forwarded-Encrypted: i=1; AJvYcCUHE7ikBOrXAozUYmcGDglK/gIE42ZQd3mPm973YBSXjnbFoFrVhUE84r4NmNIEhxOS6bY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGHuD2lEQQRHUU1Iz9ZAY5sG8IOV0m0XBSMWyjQI5AKdMJAOVH
	l0yippbT359USJ+KcZNNEiy/SIYPjzpOnwjXUVidtt2S3Mu8vdIa8wlz
X-Gm-Gg: ASbGnctpFpP9Gnq9D+lyjG6HIIrci96tMtZ95t2npcceSpY83xJDJZ31+iLrHp71+hg
	Jnisg4PRo8FPUvNkByWM46sq+MHAsUcAm4mqYP0PkNK8Pyp2Chkh3Myke3ET1FlPaVTPPrj5IzS
	vwgfGiKBRzfF7pwXagJjpGDS77c/IPOxkOE8AwIzZixBE3k/puEo5jMkjCErETq88VSv+k0vRw9
	yBdOgLPaAgXkjaVpz8OIqPoiAVvvQcw82n4GoTSfB5EdqyhAqBEFpVgVuFO6N98PEubsTiGOEcj
	QMxzTFSCtXxRBwCX9WHZe+bnPXXBSShVCWb0JyrIhMtVt2jjX9qtpM4Eecc+pdB03dLuVXVYJiA
	NjorR8DCSXzz+PNvQnHPNxC7O8yPO6JIoFXnTFQc3KEHkP0gUk56GmZOCHs5TD+eGtVw+yB2nN9
	cUX3i708cr54QsA8Uam9w4bXDe3nJFSRe+6B1vEQl++6yFNUdLyIciI6gD4dpWHg==
X-Google-Smtp-Source: AGHT+IEDxtG1HkFG0ON1dBWQF24t0hiWuuyPwYA2hBUikGtOaNbTeVCqCxQo2KWiYZfh50Es8IqNeQ==
X-Received: by 2002:a17:907:9721:b0:b3f:f207:b755 with SMTP id a640c23a62f3a-b7053b2a721mr28389066b.6.1761766148261;
        Wed, 29 Oct 2025 12:29:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm1496673266b.75.2025.10.29.12.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:29:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/4] arm64: dts: freescale: imx93-var-som: Align DTS with hardware revision
Date: Wed, 29 Oct 2025 20:28:45 +0100
Message-ID: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series updates the device tree for the VAR-SOM-MX93 to align it
with the latest hardware revision of the module.

The updates include the addition of missing peripherals and devices present
on the current SOM version, namely:
 - WiFi and Bluetooth module (NXP IW611/IW612)
 - PMIC (Dual NXP PCA9541)
 - Audio codec (NXP WM8904)
 - Resistive touch controller (TI ADS7846)

These changes ensure the DTS reflects the real hardware configuration and
enable full support for the mentioned peripherals.

Stefano Radaelli (4):
  arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth support
  arm64: dts: freescale: imx93-var-som: Add PMIC support
  arm64: dts: freescale: imx93-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx93-var-som: Add support for ADS7846
    touchscreen

 .../boot/dts/freescale/imx93-var-som.dtsi     | 332 +++++++++++++++++-
 1 file changed, 331 insertions(+), 1 deletion(-)


base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
prerequisite-patch-id: bfa4df6e3787b415218cd441317fb838824e06c3
-- 
2.43.0

