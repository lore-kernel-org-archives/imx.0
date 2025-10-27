Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767E2277CA4
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557547; cv=none; b=Hnew5sqKra/vSwaF1wr1GQQBJF6aV9hDCT+cD/Nq30ym8I6mVEFzG2UTUVYsCRGKqFGZv4xcFwxUsxNVZkSmJ95EYvZB2783VpFfD0e0mFSXzJynBBud2EZohOXsjNgFFXhsYW/YO/+cAHmB3ByzSXu/zUX7QvqUvqDzXBwkmHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557547; c=relaxed/simple;
	bh=PwYvVZbDfnjUt+9q3Vs352SJkjyRc6eTPU+alUw/55k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=owDkU+AYHsHZI29BzNZWX4fmdS/oamL3yoFhle+e9IJmqkMIJKtuKDxCU9eomy3F5GNBjksD20n0oomEI9uQZVYd/4uk+KIG/tJ26L4rWBoBJzAKq0T88stX+RPAsRQIfVgFLztWJfAmJi3Ojg07M65heaGZF6tOeDsqrkxB9RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8fA0BCl; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8fA0BCl"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63c4b41b38cso9604401a12.3
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 02:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557544; x=1762162344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFXNnIoPUffpq5LRnYNe5XZlozI/CQ/SXlZWm3Cx7lg=;
        b=a8fA0BClnmVtkKddV0Q2x5TKtuG439JiH6FlKJj+YwZZuabTbd2OKlVryBiwJmUjJb
         E0BAwjaiKzvxSJQ7iK01LxQaxRKCkfxmPRlwV57HWt7wXueK6L31k3c2MHjKTijFDHir
         58uvoeo6kTm8r6QIPpkONWej9MR9pGhfaC2sq/7nsVDz4hTSI0M1DEqN3quB/Zb/PUN8
         wB85XFbx1ORUhszcruQ/5/4ZFbYxPTDT6kD3pLu1zPSCsudMPyxFtlsSWpans/4lzq3n
         qKcpPzsxH1fCKE6yV3GBZoPwwaBqrJZ+4Vv9pXa+/x309rO6snq9nzNEcsFyJtyG7ADn
         44SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557544; x=1762162344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFXNnIoPUffpq5LRnYNe5XZlozI/CQ/SXlZWm3Cx7lg=;
        b=AQaJrxSbd+jVoYrvT4Z9HWZT2BL50obTu7NRke2WPPL5O5l0K64Acfp5WaHkmJJ5W+
         +n9VsEk2FB7TRgxtRZ74lAZ6FPXtHZnLZGz9YlVquosa77yoqBXEMedHNt8AbX6d7Io3
         cAs3qRlj1GevAVKiynB2QM/XKOtjpyZO6gX401toLwmO6t2AtQgE3T1yQlaQRNI9wOkq
         9tgTbyF7FozQ6PLwqCCyqVLPlrbo9a/po+DKOjHOD/+0bsGpFK8Nh8LMmXBifxwMAMGV
         5TJDWdL4lWPNaJfaIqzWCs4zmtoMM5gXbrlHN6Fm/O47rmarpiWrtJkKba6aPcRLvO4S
         50oA==
X-Forwarded-Encrypted: i=1; AJvYcCVTWLhskDC5QqQZcEzI/R5dMIVcFbNk6ErFPG9pKhZVOjoHYzq+GhQa5TEwHVtr9eniFLA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxjw1e4j8MrG1igLpniyLmxqkal9bO39gwn3JZlO3ZwoDkTWygU
	D21n6i958YMAxuoQQxwS/gBLnHFJSXkeJwsFF4XtoOKBJvfEdRT6SrOf8hw2zQ==
X-Gm-Gg: ASbGnctkF0UbzoFge4TogOzn2XJiwKsP8Uh3W+J2yKqFh+dstRuVsEJX+9hwrr16c9W
	UyqDHzxoDf1wmxjPNyZrSt2YWHilKTzWHmLaP0zMB1j6yvJOYk+kyW4N3YHrnXBmwwOyRKNOrm3
	GA8Y3AHqaJn2Sc15WfwtiT6JYlTFQcgX009zRD9E3qjiR7PoYVNdIjZeX2JC+ps8unM58nVDPlV
	oEkZNgP2wkj3wUxobrUkTTiRWeq/9q0vmy4pGs4i/FL6pYymuaHe0DHxfvWnnjwOeaiayNxpIwk
	NorzSyMMBWLDwzeAAG6Qoj/aH+jJoKkGBztrkNB+k6suU5SkDnXzB+dnAw51EsjqUUVbjS/Y9uT
	adNBLWnGMihhAeBrL5wuI71c0wKfVVWtJj21GJbmAbDu2e8MYb5WObAa/W6qit36sjYnpEy+U0a
	UslZ+UNusadz4uagX07YkyCdXdbhmf/NZ4MZWb96ZDpekoRKK8n/aw2i6XPQHGjNIaf7NY27xaD
	1y3mqVWyl3GZshg
X-Google-Smtp-Source: AGHT+IGfPIauWeOpslI13bmvAnHqIt73uiqSk5b04/1UOaUS+qZFr7MvAFxL/2NZS2hRKHY7Dz10qQ==
X-Received: by 2002:a05:6402:5206:b0:63c:1f3e:6462 with SMTP id 4fb4d7f45d1cf-63e3e479149mr13612800a12.23.1761557543459;
        Mon, 27 Oct 2025 02:32:23 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:23 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] arm64: dts: imx8-apalis: add additional functionality
Date: Mon, 27 Oct 2025 10:30:06 +0100
Message-ID: <20251027093133.2344267-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

Cleanup the regulator used for the Wi-Fi module.
Improve ADC node by specifing the used reference volatage.
Add thermal nodes and cooling devices for the PMIC.
Cleanup TODOs no longer applicable.


Max Krummenacher (3):
  arm64: dts: imx8-apalis: cleanup todo
  arm64: dts: imx8-apalis: add thermal nodes
  arm64: dts: imx8-apalis: specify adc reference voltage regulator

Stefan Eichenberger (2):
  arm64: dts: imx8-apalis: rename wifi regulator
  arm64: dts: imx8-apalis: use startup-delay-us for wifi regulator

 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi  | 44 ++++++++++++++-----
 .../dts/freescale/imx8qm-apalis-v1.1.dtsi     | 10 ++++-
 .../boot/dts/freescale/imx8qm-apalis.dtsi     |  2 -
 3 files changed, 41 insertions(+), 15 deletions(-)

-- 
2.42.0

