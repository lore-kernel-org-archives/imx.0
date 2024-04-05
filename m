Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFBD171069
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 16:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712333258; cv=none; b=pR50VUYhO//33GlHWdV9U3lAghYCqrhDxuIGDiOSLNi1Av1tnfYrePS+W0Hi5NmjzHclF6w+bGoy+B/rmKrFrtmHH+c++pD0854PYf8cWwz10wYGo9/Sr5iE6S8nbzNig875Kfe/RsVVJtklQ+zfTRix4wzzmPSGtTQb1IVsR7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712333258; c=relaxed/simple;
	bh=JCg24l5O0gOfe0KIuyI+DI7HRre4Hr0HKChSVFoKMjo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Aep8SFGtDTFRUYnWCi2W8+T29rIlSORwxF8aEZsmTifQjy+GygfV3WRbi09T41Eb5mU921I1On+5GDvdqtI5Ku565kr2hbIVCNAOUVLMFcQo6DpJis80EOCTPtP4v6n4eX6P0ZaRBfLt+IbWWb0UY2Q9MtbOBO7jUCbMegZH9CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KB23QGQt; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KB23QGQt"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d476d7972aso30342501fa.1
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712333254; x=1712938054; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8ACUCkXVn+Z+2m55cWPPzA56jBR7xG2uunEsI9uDIY=;
        b=KB23QGQtVT9mmneDLe/Vsr5PpLzcE890c9SLzup+t2cEaQ9ZPOUv74imujC5nQKI8N
         TOITWZp8+EM1gkVi/5+FYivz611kLSfa/khb3/Dpnr5ywXEei0zTnFvv23qbv6NmwL97
         n3ZcTnKbzjQM0MwWg0rv9eoA/ekwgFekdWU6fEwAsBq1KwrYFTBdG1TF0FHzvk4t3bub
         6dC5A1CvURbyF+SxOJ7WvRPnioRcSYml7WDn1j5DrxKxZ98ysX7uFZXE8ymoMm4nObNu
         ghsZh3gDdoV7kyTcOpyi+wgIy0UAYjSC3UYyiJGCFVqv0t0iJtyhRqcFCafMpgFRqQHo
         IUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712333254; x=1712938054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8ACUCkXVn+Z+2m55cWPPzA56jBR7xG2uunEsI9uDIY=;
        b=IMXgEcE44JeSlTVM7g3+UovRK1rwU9L4PV6773e8VjEFhgk73pLLqO2mTrQApa2QO/
         t21JN7vgsxFc2E2DZPNObX9Dy+lzHBZTZZKeo7X068aJf2A3xDZ2lemqp9wp8yGcim5/
         ipG0og30/bqBYtjVlSUAoYt2o/DuRzmI0gG9RZTgx2Ey3PjKdybgw9TncjN/Win/faOm
         jKPxy3NF6LycMGzIXYkjP3PcLx7sTBZNfrUk0HVqQc+r6cZPRT4pfk+YFUHq5Sgz5idI
         Cj50k3smUCYmwle3MKL2rkIX3aQvBu7kowAdUOeAwcRuFLz53XC0qaUkXh4D0yKqHFOo
         9Yvw==
X-Forwarded-Encrypted: i=1; AJvYcCXPykfpvrnCcxpesvPSu8sR5wuE/7IB30HHQ288tA2t+0d+7zCxGLjTQWkGHQ7U7yiUabPPcEdprNcShyX5qmE7ZZE9
X-Gm-Message-State: AOJu0Yw3j9zVpeH1gRgsCDGwoRvjEfJtTjNoDIxtMyLXyELW1jokr+mi
	rGz8C1F8zRVJ/ByhFIOUkiLcquQoEW6udGo9AYZNblBGqWxS7VPW
X-Google-Smtp-Source: AGHT+IFSqqF7fc40vyf1BiVSyKrPRsJgTa+Q3MsIjbw97gBnQC3Jo7hyUsS9wUJ/Dl9TigwPbatgHA==
X-Received: by 2002:a2e:9f4b:0:b0:2d8:6787:eaed with SMTP id v11-20020a2e9f4b000000b002d86787eaedmr1764254ljk.2.1712333254344;
        Fri, 05 Apr 2024 09:07:34 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:f624:ad13:2091:c808])
        by smtp.gmail.com with ESMTPSA id k41-20020a05600c1ca900b004156c501e24sm6902651wms.12.2024.04.05.09.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 09:07:33 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 0/4] arm64: dts: freescale: verdin-imx8mm/imx8mp: add sleep-moci support
Date: Fri,  5 Apr 2024 18:07:16 +0200
Message-Id: <20240405160720.5977-1-eichest@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

This patch series adds support for sleep-moci to the Verdin iMX8MM and
iMX8MP in combination with the Dahlia carrier board. sleep-moci is a
GPIO that allows the system on module to turn off regulators that are
not needed in suspend mode on the carrier board.

Stefan Eichenberger (4):
  arm64: dts: freescale: imx8mp-verdin: replace sleep-moci hog with
    regulator
  arm64: dts: freescale: imx8mp-verdin-dahlia: support sleep-moci
  arm64: dts: freescale: imx8mm-verdin: replace sleep-moci hog with
    regulator
  arm64: dts: freescale: imx8mm-verdin-dahlia: support sleep-moci

 .../dts/freescale/imx8mm-verdin-dahlia.dtsi   | 39 +++++++++++++++
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi |  5 ++
 .../dts/freescale/imx8mm-verdin-yavia.dtsi    |  5 ++
 .../boot/dts/freescale/imx8mm-verdin.dtsi     | 26 ++++++----
 .../dts/freescale/imx8mp-verdin-dahlia.dtsi   | 50 +++++++++++++++++++
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi |  5 ++
 .../dts/freescale/imx8mp-verdin-yavia.dtsi    |  5 ++
 .../boot/dts/freescale/imx8mp-verdin.dtsi     | 26 ++++++----
 8 files changed, 141 insertions(+), 20 deletions(-)

-- 
2.40.1

