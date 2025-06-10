Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA028DB42
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549725; cv=none; b=R0OobILRTRG6rlQ6Usvb8EoHk+aUED16pRD0xlbKN76A0A35KC/Os1BjQgrkDpbAiJBDnTA1aL5zObOAy6hdIUcw+COfxEOT/3InWyS8mNaSGOeUXl8SncYt9tKJv/V7i2TXGf4bV4UQzfXevPle6Y7G4/f8EguTsCm7Gt1Jnt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549725; c=relaxed/simple;
	bh=DOJVEz79hyx4B5UpuGMdFTop/BzR1Uh0haptnlOJ+7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQeFtUWl6C2hHET9HWnm20/1LYwe8JWWPRYIt4HDv86bE1VTcLIuxC1vLY34Wz0xhAelFZn5bi+eAkXethvyiy+6mGSbbcK7j6frKoD7Qm2aHzif8Aqnf/1gfz4RN+WqitXMy7/hhg9/zCRb9vMx/mAnQ/aVrC2UshFvdVP2ulE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rITQx1Oo; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rITQx1Oo"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so10314576a12.3
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549722; x=1750154522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=rITQx1OotUEZ4TEW7jSRwIUFJ3ySYS7CThaxCQ0A9mqohp1SbGy3EuXQzyHIKTG0OT
         baJdEZslEsrBytMl1FDTLrImZI20SZ4DWIGKlRm5nkSxQI2ilOn8qxGXha47I2I9c66X
         QRaAodB6Jrv7V3SeMC3SCX77ttA442QRcfgSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549722; x=1750154522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=UHjMYJoDLy8W2EqlR1xufFZS/svLLRgDgP/86H9DJhVsn/WRsjajiO8W9JrNlQzFfi
         1ybBXd553NeZC60hQ2sak5thmEEEc3LdUfLPvGIRG0vi+0tR+M93cofQBHOIASSdl02G
         y+t07alK3KQr3/XKbXsySA5+qCd8qAZUIi0xb1wiugc/+6K+E7n0USEKrDPbIPyuKl3J
         fNMfxq25pAQ1Ifx/q7yKoFV16SVez0AEt5sgBHbFF+8jfka/2+ij3kOM5/ori94jhl4m
         4mxw6sWXvw08SP1Zd7LQPK5PHvRLJcEmEQnkRJz8uisi0mboJuJxVfaN041Pc3jCxawG
         74kA==
X-Forwarded-Encrypted: i=1; AJvYcCVzICi5bwTBzPt3h216PWie7eccMtyCSid0X1yqXBPwOdH2Ii8KclEHBsZRD+G7vfurkWs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/rvjow4ML5/jHdL3GTIMl3ZNnsBMKJgfJZQlDmIqdvt5x8BQV
	1sI0kPj+b915kr3Gw3puNlk3H/nnSy/mGVFgo1GCCXMFP3qOTlI99bVJAfNkiwRn5CY=
X-Gm-Gg: ASbGnctT9+mzhFJ+DZopI3LWJWjnTz017Pxr7Zvw8VsgB4r7rWy/j7YgJQ6RmX5R8LG
	LgH7Tl5R+cdoWH05KbdbTUCUs2HViJ09iwKFnzAGKowMyOTV9Ew4B+zIqyyyDBY+ZvVsHoCKXCS
	rnmXYFCOfkWrRh4Ts96OWftITgE7E/HM9xp0+MniScz60PHLzfXGqfnzPTOTfV0bOleQ9VdwBy+
	/GBzlDrN6/LtE9inhG8BKtNYYrtDqAtS0pBY7AdASY0f0wUmU5DVtZw+kKK7V6fb+lgfIQC5Y8r
	2dm8Wnvq4p0PZhx9Z7OpqbieYU5FTDI6qb+xdTOaZ/wkD8yDKxbZmsjLImvVmhL3Fb7+Tw1m/qZ
	iou9hW06d2UvMB7fbcIP3x1T3lwk=
X-Google-Smtp-Source: AGHT+IFpzmTpzfXKwO7hSH+KrhiZpJlmcFC4ApFNg+muY/xafPN/5pLnUmMU8U65bPqg/2CnqXnQXg==
X-Received: by 2002:a05:6402:1ed4:b0:606:f7bf:86f3 with SMTP id 4fb4d7f45d1cf-607735120e8mr13987501a12.6.1749549721976;
        Tue, 10 Jun 2025 03:02:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:02:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Tue, 10 Jun 2025 12:00:23 +0200
Message-ID: <20250610100139.2476555-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is required by the Engicam MicroGEA GTW board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 917bc8a27794..3181775a214d 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -335,6 +335,7 @@ CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_TEST=m
 CONFIG_USB_EHSET_TEST_FIXTURE=m
+CONFIG_USB_HSIC_USB3503=y
 CONFIG_USB_ONBOARD_DEV=y
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_MXS_PHY=y
-- 
2.43.0

