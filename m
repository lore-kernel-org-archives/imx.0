Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1821723AB88
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 08:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408072; cv=none; b=AqtB3okIGGsHVRwVZdS41dNtJsESfQICOgJ6PHCU94xc4HPVurUngS4xL6L+zHnghA1qYnpupchAgRW25N31FyADQEVvpAO36bM4qXeBLyFLfFs+m+fx58xEcGwXPTHKwQENj0inaCm+4Nx9UgpnGTP+BFHBDrrTV9ZeZYce62U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408072; c=relaxed/simple;
	bh=1EQ2d2sJwVwWPbVXNM0qlXgvYAJxPsfqyjjgpjMJ+BM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQ082Q0YalzrKIp2uzZ0/Ev6lzHH8F4+2faf+P4ZCKTALmk6/H+GiYsfG4YerQFx7ynxGwCfnk+Mru9CeKsI2NAFqaaUu9B/EkQlXlZj+R23kvHtlU5ff7kextxHi3BzAmNoZdfcmnlimFIGXoRfFSD3DdEo3TZSjEpHQlPr9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KzfW3lEQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KzfW3lEQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d54214adso11630215e9.3
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408069; x=1751012869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=KzfW3lEQOtCNqSKNYuMFZXzzX6Gx56oxL76xFK0ycJQhiHQ4kHw8KLMobuah7hxSDv
         x/vO0aGxJXzTDG3zSHbvyIRaQCdpvChqvqZ91S+SaiPlefMsfmix/Op6vKpzPgmXAOMd
         T5b0AVnj2rZsqdCAklJ+qS3MLpU0nBNXmd4jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408069; x=1751012869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjWUaZj830iJEScbjAkMyM8p8jFPI25PYUQdDEHFIkg=;
        b=fNyfeiW6VBBJiB2TNztqRA+RjXK9MRLUwPN09Na790Yacf/FrsJS18KxvbDOkSbdbk
         ybZlEg3NDGkLK3c+Chl2645JN0q9ADlkK6ZniItmtChXrH0Fvt/zj5jrsmBPakhTYmGX
         9d5STwoR0vGw7VoGlBCkDxbuz/U6oZGJ5C1FTl9zB9uf1NcqY723UN/remx05vuoZQc7
         j/CgomnuPT7779zjG0bVQJ9aoYminOBvKsNubarQ7QOF9HSUCfq/Kgiak6h/7Bbmbc8I
         1z4k6HnuiGpAM3D6CVX4gI9zu0s55O67ewg2p8FW/1uu5+iWqxyZfsTxkwQvNM1SkIhu
         7RYw==
X-Forwarded-Encrypted: i=1; AJvYcCXv1qd4rTL4kX5dnvQilCekBqE2PubanQBOYUWzRl/BjgGQm1ze7tU2DAkC9ytT65dgg/E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3lsHtOdG7/lDyoWbl4cwXSXHUQZd0uaYPeF2cTz0n/K0ImVDF
	AhqsJSYbSRUM4GhKO8ebOQMrUBTY+U+4jttxD3KQmgxxnPtYLXWT07BRT/8FGMcA8Mk=
X-Gm-Gg: ASbGnctpPjOhR3sz7IkR7MRWDGxddmd6gcDYzOAb1uujZG3luMZSKP9pV23e/Db1T3u
	vM2lMynmEztMBOj7wA+GRDwQHPz6wqIOeC6FbgZ5ct5ud4KS1VUQvilnvyRVB4uujLgq2HL5Nt/
	AZ/27YWpC29Gd9uRSP7TQ0cwvroUaF6bRyW5fytWi00MiaQHYSb8QYU33fV35rLBD4ifa7TTHUg
	usTzOMAo+w6gdiKmA1wndgc/kfdnljS663WRmwDEDMu9HDg9OJrtBVOSlC6uenujRxzyAbr71Uj
	UjPe8bC16F7JWPpqFLxFFDoU8+63e3J9CChN29o9zF3GeXj1zV9DnofGYCEVFXFmtNC3AqBvBjh
	N76qEpf99dhwCqxVoZUd+MiPbcNzeMdup273zEJ4/mE14jj0Vecku
X-Google-Smtp-Source: AGHT+IFxJQt2EMofYFFEc+wI60+FOtOAa7Jz8MXXVt/8qC8IgOmSsAJ9wzBvAyuIOyuqmNjPgJydyg==
X-Received: by 2002:a05:6000:40da:b0:3a5:67d5:a400 with SMTP id ffacd0b85a97d-3a6d1322ba4mr1436177f8f.33.1750408069390;
        Fri, 20 Jun 2025 01:27:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v4 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Fri, 20 Jun 2025 10:27:09 +0200
Message-ID: <20250620082736.3582691-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is required by the Engicam MicroGEA BMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index d40ca9edd264..917bc8a27794 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -180,6 +180,7 @@ CONFIG_TOUCHSCREEN_COLIBRI_VF50=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MMA8450=y
 CONFIG_INPUT_GPIO_BEEPER=m
+CONFIG_INPUT_PWM_BEEPER=y
 CONFIG_SERIO_SERPORT=m
 # CONFIG_LEGACY_PTYS is not set
 CONFIG_SERIAL_IMX=y
-- 
2.43.0

