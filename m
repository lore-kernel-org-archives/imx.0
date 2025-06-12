Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FD2239570
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719325; cv=none; b=k/Ixw10cfCs/ejoaRdExVEg5kZvBDieZ7obeAHtxZDcYgJC6Vx4C2ZMGgSow9r0QzUKzlshcQaCJnW7wHp3kLcPWg7HfgrgX1fcmH1/SCWGK3uA8+OSSUfgEO2CyeCBPJAyP7W/xjMZH6gJ8mg8WnR+f9iQM+mei2qYTJ7ZI3qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719325; c=relaxed/simple;
	bh=DOJVEz79hyx4B5UpuGMdFTop/BzR1Uh0haptnlOJ+7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTxBLFS8V8FNddeQrLn7fyxOAAiZpniGJjjqFVz79m2M3kBGIRdHjZ44NOyCBymV4e/72CBz5MoaZz+YOEIm2e3HLwsGd4goJ5CDzaPkIRkuIdW4aa2fEx0KBPkFUodIdVsvuqebCEBtOfAXlblmbd/oh0i5HQhDg9bsQQp95kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=McJSoFkw; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="McJSoFkw"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-607c5715ef2so1315360a12.0
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 02:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719323; x=1750324123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=McJSoFkwqeN4uBcwvF4YOl2mz7wHUTXMuASy0DN5A5ScbQADZysUYq+wyxNX88wbEH
         h3KR7bt4FEZXR0kzFnrDPAUphwWwZh1sRl5X625fhFr8H3Yy53/zfbjnYdJF5RApSug4
         wUbDPZ3f1ObQRPM6CHCfX6pFQ1hgoYodkXUbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719323; x=1750324123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=xUc+JUMtcq0EkkjfF9iot+cZboCVoTheqRtIFCf/Y8XpCIHYAHeYeBuRJojsiAJwtp
         pojBoyCLySNK1+8vC2d6hm6Sl6nqZnDiZ3QV+8jLNH9chRt0RX9JXhCriNz+JgA8dZt4
         ZvTNy/Ivstsnv/s5+cBh6aakvtNZeQ0bmdsXl7a8xAMDEoXK8CZD/ek8ZGcW8ggtiZ5n
         3BS4x0KwCoJ3JdbVQ5jSBBZcOw3YLLt8X/VumdB3z7tvd+a4p/bWdnifZsYahznAS2I4
         r8oJkVtMtaRAupsYO23hobBv7aDtJ7hv0kV8H93Z9klBTp46t50RsORdWNqfRkJNPZjb
         tF7g==
X-Forwarded-Encrypted: i=1; AJvYcCXT1hhga4lwQLWxGZ/lZdpl7rkrDNWMrBpPacFI9kEkSXdYJHXEflqqMAt9YIAZavjUjLc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTOZcBjXZHG/7RxDwxVOSxhqE49RM+I7UXX6uvPyZ4Gdh8vEO9
	Zo6rooIiu7Xc0924pe/QNkeTvYEF3CWEouOD/NxctxvKKQQrT1CVODO/DR9V4pWbVbk=
X-Gm-Gg: ASbGnctNy9aL0an9so+3XtfimSztkotDi5IuKyYNcq8/5lsJBzeIIBP7uPWkFa3Kvf7
	53+p5EmyHfWkmhK0Gm76KtTrIXddk3PRJS2wietQ4z5KY/4rIzddnVPQp1IGktYl1FqqZsQtGGR
	Y0qh7b4EBPHkmFzEKaxgAPjI+RDQawPjYCKzYrIv2H5LeV6k7ZpsT1Kq7bokFT2dSqrl9oRViMq
	XhBY6EQKz9FADQxKrT1yHBRD7aSxnnfJS226do8lJlSRdA+G2WCXGxJ2vGtX72XroFFLDEl2bJ8
	+kz6JgGD1zKkjNIX89ir+WcTHn+88zXTJpejmG5hTIRwj5jgVauP5NYYt24h5Yv/WRah1nQCOBJ
	69GEHaDLVMyaYeOWxRFg8uYYfLg==
X-Google-Smtp-Source: AGHT+IGLgxdTIlzHs7JaFpku8ceuQrPftbNjrc1l7HlbaXYmuJDrccDuH2O1OVWpwHgXuFJgjQprQQ==
X-Received: by 2002:a17:907:3d90:b0:ad8:adea:4b15 with SMTP id a640c23a62f3a-adea945fc49mr220539866b.48.1749719322553;
        Thu, 12 Jun 2025 02:08:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Thu, 12 Jun 2025 11:07:55 +0200
Message-ID: <20250612090823.2519183-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
References: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
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

