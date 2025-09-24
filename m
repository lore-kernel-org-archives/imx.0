Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0352DCC01
	for <imx@lists.linux.dev>; Wed, 24 Sep 2025 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709013; cv=none; b=QuT+OFJMyXhJwm5h/aYzi0mOK9SzYRMggjFU0CBQXnyHg5VQkHwTzagn8lPeR8AFDMrFVgkXFu5GpQZ9boY1XoQ849iR/7kGH7ORUvywxOw2+YCTgtgKl8jKhv/9R3J4HeSuTr6LVqPM8+VUPT8eYhTExiUNa2CUGMQUHMBxU9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709013; c=relaxed/simple;
	bh=S9krJNAXbYfiBjHOowFzU/MHlCd/viA3rjI5GntmR2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTxxBjoCfGUxMKPIt22728wY2skPL+as1MElA8DArfuUzF8V64LzLWqoE5W/xpmmwlt2f3q/zUt/plj/cFC+RiR8OOwr4shhyn7lZX2DMn5bFheW4Xs3S+UfrqFE9G+VmqfOH2Mda3HBMXT+yqeQ/cBCBTPdnIFqPAWJHt33mU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=H74G4rmA; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="H74G4rmA"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b2e168f0a75so450370166b.0
        for <imx@lists.linux.dev>; Wed, 24 Sep 2025 03:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758709006; x=1759313806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr4AHNLZpak0/qwDXluW3tBh9480ZbWvsfmpnJ8cepg=;
        b=H74G4rmA3de7oEYxCBQAW67ASAECJINa5y2qiIFuR99xKqKZgVKaMMDUgYQdc/AIcJ
         10yhUJMKVGgeyx+zl1Ff8i6egfx1ABKtidogWMBaOn/lXOVBUES3rd4JzUgb+3rUYYAV
         StQorM87mBZNZPd9yLf0xM5GhzbEq+yQnOM94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709006; x=1759313806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr4AHNLZpak0/qwDXluW3tBh9480ZbWvsfmpnJ8cepg=;
        b=JmlnbXN1ru4HQxxfjKi3aFCV8lH+sViun/hEWyZ9HeqdfVz2/aI9PI+j3vEliHy4v8
         YXUkgrUrvh3jdb+yEPVo9leO9gjssa5K0AKl/QHXuAtGtwaZFjO31h1WiqoRXcRq1vn6
         +dKB3Zha9I8RiRcgTZplC6B1jysVuS3Cy5049j7m6ZxT6fVdiRd8YEMq5c8nApbU8SQi
         AXgV1KDicKseiK2xpO3oW7C0wBBhoNTz9EpCg6NYLfe35+EGHcHrEbHnaieSBlcVb6dl
         H9Bs+KdTCTHfnx7EjYMie7jp+mmSAkiQTwLr8M7KMmXlF1jnTzpOzftpjqJv9HRRxSUQ
         sD0A==
X-Forwarded-Encrypted: i=1; AJvYcCXTfGROtzhK8P16AkMeShoeLyktHANidzLuBB6BTxcI/6N+Y6+6GATdmrd8ayGnRbVRiY4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3IvLLf6si9yiSkxCGp3SJdnUqCPgQ8RwuTgYZa/NEeP9U0LpN
	YFCTZNpmgdt+bLgJFkatqxyUTi/SsOYIzWXxR0XHco6U/1X/rCJRIzLiF6aXJCY7A1c=
X-Gm-Gg: ASbGncud8XHWmuXxojFLxjrCF4iNEL5YJBn4uAenNxjgY8/g86glxiLccYTZ5xHKjql
	cR7slJjQXFT9fmvf3fq8QJjBQ2QTQgYNZxBB5+hclYHtWaEukAJAQZTO5+MNF6h9Ogb9cKv1L+i
	JkrMnnXSUWBSQvWe5P8ijkUMULZ8MWNu042YD0OBKOsPy2VNsSRkKvpRW3DsGWfIItKcRxYnTyR
	u1SiG84sqV7uVs7UfFKPmAUvBEsOrGYdyGjjpdIFTRi/zBQVCHpX6UpmDVRCXv4yKAvCr90eOSi
	oco3is/3b6Z8fGwlFb4Vh/1PWrbCGJwNheZO9WHiL5+WPf6hvv4382VbTzkABD78rce66X0uP66
	50dYK0JyIZLTUgXW5s/fDHcgZn2BhECBYJDxhWJNeNK2woUFKxwRdS/GsBoyi6DwPU4JKq/R+Bs
	weoA9JjxL4HhnjUkLf72GBYsAKU2ZVgo7pOiJdi9zw2TV+Mbrnynel45hP7Ow=
X-Google-Smtp-Source: AGHT+IE7L5itM2VG+Ck3uzCsPeP/CVsjTWyWIegSsTc3ax7OvaG0j081Z2YX1lAhE+xoVbkexzcJ/g==
X-Received: by 2002:a17:907:3f9d:b0:b2a:7f08:23d5 with SMTP id a640c23a62f3a-b302c2f813amr554123866b.63.1758709005631;
        Wed, 24 Sep 2025 03:16:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28d206bd13sm949712766b.31.2025.09.24.03.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 03:16:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: mxs_defconfig: enable sound drivers for imx28-amarula-rmm
Date: Wed, 24 Sep 2025 12:16:27 +0200
Message-ID: <20250924101640.2942635-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
References: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable TLV320AIC3X I2C codec and simple-card support used on Amarula
rmm board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/configs/mxs_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 3b08c63b6de4..603fb003b223 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -100,6 +100,8 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_MXS_SOC=y
 CONFIG_SND_SOC_MXS_SGTL5000=y
+CONFIG_SND_SOC_TLV320AIC3X_I2C=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
-- 
2.43.0

base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
branch: microgea-rmm-audio
