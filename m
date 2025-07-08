Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA552DECA7
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751982883; cv=none; b=jKrxuTzxiQtAebzATj5haejbfQn+RzsZPtIostZCL08e9I9asDAHCSQHJvcTKcYo6t/qRqSCfvVVaFy7ET54ivsQS+XDrt1iFe4ZPELfnDnN4CUoHNFgxtaks1wYATcWv/3+oXoGtpV9bDhPel/zV98P/fLA/Vp2uxI4qQ4+J9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751982883; c=relaxed/simple;
	bh=+TcuFQ5JXfXnFqeAMBmM7+3WUpidAPgIKaNnz9SsEQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lGONJamCQYp+S3aKQI7DTlfa4bpQQAEQG7eY1BY1OIOvmLEL9QEpVkRmb2vCn6WSeZ6RQZB4OY4KLPkLx/acxVMUbEtJHNBq0ycpbH6MDf4/iKnABEk0S2KDPFk/i97/CesLn7uMQsSMO/3YDnwdHtLINAwPASlfEgaVicaLDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNnY4Y0Y; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNnY4Y0Y"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60c79bedc19so6786021a12.3
        for <imx@lists.linux.dev>; Tue, 08 Jul 2025 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751982880; x=1752587680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QuSzMUX3wHghxJbKlKNyZysFBPZJv5OM61rjXeShdRQ=;
        b=LNnY4Y0YsCc5vCEv8ib2TFipaM7knFMGuWaOfKiYXvgty18qlg/q7lZ9oHiWpvWNk/
         ExNHKpLObIj5iZa+eK202+HQTrHwHa7FVZo4lJIDTmxa4ZcvzhWYYhjpeQYo0MYQBkMb
         l4VObeZMxIe87wPe6+nwDi023vxUm4XrxuWXjLpLiQZQ+MfuUtKaO5S3uYRIYIA83Cmh
         437ax28uGKy/G2ErdWiFp/suzaFcECz7zq+nxOKPTG7IyjiH4qnErztangFA8jpFaGC4
         T0N6Zx3FnA8Qfji5mt6eRc4eRJgDLGcesfXLdfZA9RTnOCOKyOSoZwsj0kvPcGE68Wfm
         DtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751982880; x=1752587680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuSzMUX3wHghxJbKlKNyZysFBPZJv5OM61rjXeShdRQ=;
        b=fRUxsjkBPOBTwk0KOWewvU9ZxbRnTKlCVTKgI0VxL4VhFtyyAJXU6Ow5vQV9FKfwhm
         X76D1lnwG6NVR73z6S0Quis2lQ1c1v+Zg/zS7uU9z42R5CMr+HJsIuzSo0X0JwR/h1sW
         i7X6rPEHe505k3GmeZTqKIbiwsMhFYkq5oL4O6/8WdfZ26lEyaIYhM43+ETXqNMs4EEX
         XSUHDZ1Ajdhy2fTdhde5Ztmx/HDvRL+57F5YK6HHY9fGTWJJZptB6Mq2IXmgCH14tQaE
         PbE5pz3QWx68x9fq+3aia5bWhfwLe5CeEAy6Yd5UbpziuVeEkoJVJynLmrw7GSsBXtjh
         LXcA==
X-Forwarded-Encrypted: i=1; AJvYcCWGj6fwSO0HrkdJfIZjvywnS38L83jvPXWIIX8xDnDKN/shXscvtJqKyNvZlkwVNq3dhIw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzE0BJ3x0J6n/6UgqIrWKKUm5Fgt0Ngq1RB0tCQspJhKAqNeXPs
	7uz9lMWTRdY11lxFNQ4Ob8tDpJ/oMzZxYh1S84iR8RY+SpsvEedFpStb
X-Gm-Gg: ASbGncscSpGbTkdYMU/4515B52r2D96BmSRjw/M77Wq3CGyPS7Og1PjEqtJ8aaZqKUU
	gucz56jEr26YTCeQgMUVxICBd4BsJNa1Z0/tJoxeR225/pKRt9VK8pDi5KAxBgyYZm55cCHEp//
	kT1pq/aWj3CbmcEuImMVkMidsEX3ISubH4l/sm/8lxBhfEVdFjlhi8kH3fcG4eZg0axLG5yR62b
	nlP4/EErDC28us1gFvbosKb+/jzSZ5xm+YXyk5A53eeT7NlrgVUBiCHByquno6/JpOwgN419MYu
	BKBtuj2NjBIJmq9gVVRsXyli0/c3IR5ysdkVcPpaaavsuGD5n/3WpSru/l5DzsBh9euTiX6PAbE
	6Kx48B3Wf+qORABLQtPtAXaKY4R48y96QJ7i25/LE90VwxA3hGDJxXzn7ujzjfCDG
X-Google-Smtp-Source: AGHT+IEg8FYXr6keG6fLz0S3lPAROXenPPWH4ugJsZlSnOifah2zO//skjGha+hpIpCH4Ky47GCywA==
X-Received: by 2002:a17:907:2dab:b0:ae3:62cb:7654 with SMTP id a640c23a62f3a-ae3fbc54c72mr2019958866b.17.1751982879591;
        Tue, 08 Jul 2025 06:54:39 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac6641sm910431066b.99.2025.07.08.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 06:54:39 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx8mp-toradex-smarc: remove gpio-hog on lvds_dsi_sel
Date: Tue,  8 Jul 2025 15:51:40 +0200
Message-ID: <20250708135300.2855155-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

The LVDS_DSI_SEL does not leave the SoM, so do its pinmuxing on the SoM dtsi and don't
leave that to a carrier board dts file.

Using a pull down on the LVDS_DSI_SEL signal is enough to have the signal not floating
and have the SoM in a defined state.
Thus remove the gpio-hog used on the line and leave this to carrier board dts files or
overlays to use the signal as needed.


Max Krummenacher (2):
  arm64: dts: freescale: imx8mp-toradex-smarc: fix lvds dsi mux gpio
  arm64: dts: freescale: imx8mp-toradex-smarc: remove gpio hog

 .../boot/dts/freescale/imx8mp-toradex-smarc-dev.dts    |  5 -----
 .../arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 10 ++--------
 2 files changed, 2 insertions(+), 13 deletions(-)

-- 
2.42.0

