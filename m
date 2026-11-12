Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516785;
	b=ROOnSCaq+HPs4tAZq/uT0dQjveK3F92p+ZOjyKkLy7eQ8CvAy6UIcHzAQ4c8cUzPWmR4
	 4SjZkroZwMy3872qLRv+Q/Ju74zlFzFW6/j12/GeqOKHjg1fdEKEpm3foeIML/Q6v0bpU
	 I+dd7bBSe+m3lFm1l0VPwylpoYaKEwnqOJ1+V8PoXQ8iN+SdgeHDcX0sCcx5crmXbe7Gd
	 206A5DPuGcdkBY/QfWLZLoJhXcrWS06+Cib2uBtPFK94LoAsBL2MzuqjPKnbZQJ+HmChF
	 1EmYQDzbHPENlNoxckkfDfF1TmgIFSspT87T/QGa3haWeSljKGu/KMd65k2mLW9R9QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=;
	b=KTgU24C58em6yhfib1SQqfcyrvKap5Fod9tKHnI8Pc4f6E1HvSZvtkov+TfsYzYjomcu
	 Dsm1/tcgtztXaRx4rH8aic2H2dIqtyJT14uAsSdrC6vLJ/qyXMRfOVZ//8aAuCVPHSsFY
	 jxOhkp/iFvEzfVHuKEC8Muf8kjrR2hINz5rwJx+TNWr0R9YS4esqrD9FDHJnujJowUf0i
	 tfrdzh7Mi6LBlRmOLuS/n94L85RG89lDCbKMCEjmVAMvhII7Sj+0R9tTzsDvgsWh2gJgO
	 5hAYWLD1DjpAjQ99Q+xyuAN1KW/JSvMwa6zuiisRB4F7aBVpJ6H1jzxb3zF8O3inmag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WXmCc/3T";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F824606A31C
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 20:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F824606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WXmCc/3T
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so2466945e9.2
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 12:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516784; x=1795121584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=;
        b=WXmCc/3TAGlz5vyGOdtxobj3P/0ujlS5DB+d4o28x8k7isZO3NGymIDgDggfsQOEa9
         qC+ktVl5LC/n9C3d19KTIzOG5l/miYgF8Nn23Xm4Acy4VgCoKtFE2HpM2IAyQzjbTIRn
         e0CxCu42GnxsIt14jaKWoTKX3zJk58azYXtvb1t5AZxDzv+LiKToxpi00xdTvfkSmbgU
         z1xcT/HQ/8IKieIeVxfTeqmG3yEyniiS7fkZLVTa7c3RxzcW6/cp1D6ZbGqnnLkPk4X4
         Hv3uI1oB77CVnCx5vAYw92iGqF7EWNKwTglP2jOyNDZv5RGgfpBTdGdpEvLGMSo5xjjD
         zTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516784; x=1795121584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTM3x5PCW62ZDqiRn3t8EhwYw4e4i3P/RxCx6K46poo=;
        b=D0PXisDk0d13ZuJKt43tiDw4OstprKDz7FR/zI7mb8IMyilhkOY0BdW6IOelF/kJ/7
         27qcMDw+nFdMY89GzFYgpbn1V+92bMXMU1WJwHlHuFCXy+XXHRhHYE/LNsMvVmS/bH+i
         Jg0QAHshE5sNHvBkDV0nmgp9bp3GL3cDhJJoC4MAwbbFJiGI+j5X8PHm4HX0UJJQzoty
         B1facddZXzZbtKtbpyp9+8Vj6/XCqa1FvIDpz/FVNr4sY3MPcUQFOtpnj72WOPoGyDme
         VdXoKzdDXisawKFh+joJ42c36ezF7/k+4MwvT9cTuYdZg603J36NWhF+ldgApcOOoHqL
         AG3Q==
X-Forwarded-Encrypted: i=1; AL+hErF+n4j5PO4tDOk0+BB8olpKFF9b5mM6/qXfcmFPWkdL1Qv6FuNlMrGpoJ42eWpUAIYjFK0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+VnAWihUY9fdOyZkGfA6LNOTmHhJji+vvVO7FvD1qNJ6GXt5Qc
	D44aSvFwePDU5MaLJ6jqblTBRD59SbKsQjylM6wNZlrahsDuRbWD/KZ9
X-Gm-Gg: AYBFou1ZKehbu11sOouSdf8eZZl7B1DK+OJ0jAgGK8728kswBDHQMEYZfurLIuTs5I2
	ZYq1+C1Rlize3IalQblG/nYhMevVcwiVhJwZv+Uxwv9Bh/iq5D/o2RIRY4TLSyjFisoZiC1mF4b
	9xSkzQZdA66T9t1HEjwgYfhkVQfE5REIxwk/nRlIrq6CrKt4SZv75WEbr28xhupLZ+PxC50UNiV
	6+K9uy9JdNaxE63B/c5TIWZCcjnpHuNDgMBEzBkmdw8cTLbGFhdXFLLo3DZUkBNe7kDmOsx/jfc
	0y2eXszB6idrvEErSW92h0wMAyjOlFQt7gz8gtK2PNsaqLRztpvuPsbRrOUA2pLGDZ72hLiApN2
	dGgS65zj73IlRyzXYIbqdCNlyoeIrtLBs6aiOhNcN4uPkoZOEI3Y7JTfViekPQ8KmAu+P1bQIQL
	dFN6Jz9KZBh0Q3ph8F8KAPt5t7VzRXEQPj3u9It4kAJwWxisUHo/1DqckPwVwKGAbaIIrPsf1X8
	heS3Q0eK6VmVtXU4VDEOx1Blr3Wn0Qh7jL7RUsuSRlMHdAf+bhF6owWTxWL7dPBmhGF6RpUsKmn
	KTNE12xTMafYO3OWpB5qifgp6wKZE/d7viSlj/yXC3dcznNMH2XJyGgcI7e3ONg=
X-Received: by 2002:a05:600c:46c5:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4bb55a9b453mr8505215e9.32.1794516783607;
        Thu, 12 Nov 2026 12:53:03 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm8695655e9.10.2026.11.12.12.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:53:02 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-hwmon@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] sy7636a: power the panel only during updates
Date: Thu, 12 Nov 2026 20:52:26 +0000
Message-ID: <20261112205228.42630-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature only while the rails are on instead.

This is based on regulator for-7.5, which has the rest of the series.
Patch 1 depends on "regulator: sy7636a: bind to the I2C device directly"
there.

Tested on a PocketBook Verse (B288).

v4:
- drop the patches applied by Mark and Guenter
- patch 1: keep the hwmon name (Guenter)

v3:
- drop the applied patches 1-3
- new patch: no wait when power good is already high (Mark)
- move the I2C binding before the hwmon read change, so the hwmon driver
  only probes once vin is on (Andreas)
- explain in a comment why power good gates the read, and its
  limitation (Guenter, Andreas)

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- no VCOM enable at probe, which also removes the probe race
- read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (2):
  hwmon: sy7636a: read the temperature only while the rails are on
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig |  1 -
 drivers/hwmon/sy7636a-hwmon.c        | 35 +++++++++++++++++++---------
 2 files changed, 24 insertions(+), 12 deletions(-)


base-commit: 89b552ff49551960b9e270feee888a0298a12d94
-- 
2.52.0

