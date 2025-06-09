Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BB8253920
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464222; cv=none; b=d+i+p1RZljdk1FBSibBJfKvCvWMWPSJxKwbz0N5LXmjVEhQL+/hnQHkUwC4YY+56X5lupgELfRRlZBbz5Ju5qKLH4pBHx+9mHYN0KoQzOkNBKHv2y23YIhJUE4T+V6oicCESbfXiCUn0ehRp7/MrZXvWJ1CDx8ET9ML+cOC44xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464222; c=relaxed/simple;
	bh=DOJVEz79hyx4B5UpuGMdFTop/BzR1Uh0haptnlOJ+7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOYR5wupzslo5BWRqjl+WN5KrQmj2GSmVvDYP2SQ9akIWGlYD64UitfAuIUHNswtR75ztjYEk0htCQRLA1CJ7ZnJYsi/5qOmeEuFs57RJSontKh1nfEny6JLF86gnQHgwiXIbit18M4+VUuw0Fgqch+GC2s14UVKg3Y5krqicno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=lHlEPb8g; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lHlEPb8g"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-adb2bb25105so653275466b.0
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464219; x=1750069019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=lHlEPb8gnHP+hY/1nr4kZ8F2KGRsJ+DUcOX+8uy9s+57x+YeAB7048zkk71Ed9/6m/
         i3PFkrJLDJNL/uZIlnvtsVpIYoJF+vJNVxc6jCQSkZ8XdokBH1Yv2WWMDwDHT41NMBGl
         Z7qGrod20CmhTSuEdO2Tfo1hxEUQ9WRYF66OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464219; x=1750069019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=EnfOFRHXFfY2v2n6938CsCD/3HYYCftzjpf8FUhm7MfF6S3GiL+qqjoPmtGl/GWTsu
         a2hr0LdnS8ikPfNJdm+ktxNZm7AKBuT0zpGwXHgijYTMj/K+qG/0q8YDtYQQA8wWkyG9
         uCos7Ul1LRS3PaJ5nilUa732NLNHOs0FjqEicMHr+/9j2pT/mTHuDF1mbGaKAXKWKXEZ
         bWGPROTYjFB+m76pALdxwuSrCDeh2O/7+mL5TX3XkPfwK7o6ZKvYTMRfmTsusRoVXPnx
         VjhcV0XrkBKda1qkySryZmXg7jGmPArWKTV7Zkl9JCjXvBVQyOgHWv96ootGa+5oZasA
         CXxg==
X-Forwarded-Encrypted: i=1; AJvYcCXDwpVW24D7OjaAdXCE1PAPklZ+5x4YRjRCNJ3vwgB8Rhwzcpr0JM8zSAxsgntjWi784YI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw6DH6oW5reblCiDmA8nITyu+2XpwdyzwI5jSMbX10lhGe2DjV
	FuEOBaaKQUA0mc76Si36fwoVlBxa4ITU8dSzspSjpheWXQnTyszCFSGtJ49tfOnBzNk=
X-Gm-Gg: ASbGnctVVm7ysdnmhC3s9Byb6Zjm0zCO1tlWMsP/2Po8DPWmiMsmnn4G0S10b/po075
	wJJQ74nYzYULDSelIordc5i7tNBBou4kItkUgQcWTVTfmlY7DawNCInV1j8Inqjf9KCc8BX2IkW
	HhkvTIS0d8NDSuAhjEv1llw7gX89iUp+tOQvgia+CzCnm52r1Uza18i96mpi/4UuuqFyfk6n6hl
	OVE6T7iYsyIHIe/9qgICfvQtU+/9utrDJ/vzeXfWH2ECdqZCnNHhieqTCMuYe2tq3D5kwPF5a0e
	rbf7lPyY7dLnjRPCEKoI4rDOTv6C0ITwCra8Qc0e2oacQ5JWxrG6qc0aCt03fBHaxe8P1Kjd4lN
	DgEuH0TYb6bCHg4qMBAlfT133FjQYNimjTnGecpRV0O3DkNWtYVg=
X-Google-Smtp-Source: AGHT+IH3gsxVUUgw8pn7niv+7bX9R//knvGpYp8ip0Yy0FzSdBl9gPYD+Rs9VowG2jDeFdePscxQDw==
X-Received: by 2002:a17:907:d02:b0:ad8:9b5d:2c23 with SMTP id a640c23a62f3a-ade1aa5d45emr1170457766b.10.1749464219247;
        Mon, 09 Jun 2025 03:16:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
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
Subject: [PATCH v2 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Mon,  9 Jun 2025 12:15:43 +0200
Message-ID: <20250609101637.2322809-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
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

