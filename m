Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C47D215193
	for <imx@lists.linux.dev>; Sat,  7 Jun 2025 09:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288838; cv=none; b=FegbShWHYwRDwxr53PUuPaX/H6haRposZ1uCm+OTrPXIceXb6LK8GkS/EUqN3FM68IBm8pxpiaD7rXWlBfDitK5/lv2Vkuw71Mpr4ZklVrE3xTp/qtBEJv6lxrSHZECNT8zNfQEFJ5Fk74r6POwPZtNNcvYGeNrUcM9dlkBLjpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288838; c=relaxed/simple;
	bh=Ji8FZAcHW25BE033AGpDNPViDDq6R0Ry0UGT2bdHdqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/K30BUDE8VCdFtLNnfnj9vKFgS8wRmEVMMp3FHUz8F52V4CKC5FjKMtBSAoly5rihq46cqEIF5etYpzkS8rVwo3DNGhraGQ5ssANxGAkInCE2vDuI23OJMGKsW8btE0XGZYA9zTnQ9QEht6+SArutiM4z0qPWD5c1GyWdPz8P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=pv6vEp32; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pv6vEp32"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso5156003a12.1
        for <imx@lists.linux.dev>; Sat, 07 Jun 2025 02:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288835; x=1749893635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTNIBChwjFjiMOn5hxM9LK4OsxuMYN3qgXh4AnRdIkw=;
        b=pv6vEp32jTH2b5kHEnpmFV6+uV1IQPHkQGZRPXA2+kfOU1J2Wh6NIekPxK9wkR8Ypd
         /4DXlFo2MXV10iVMmZHF+TJxw3a1JUS8y6sdfDguSlGPXtkVqQaMPkfPt6m3/C1zTI3N
         DlYHIxr9h0eA/tKjv2ihbjMl6Z4FlL/wVn3aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288835; x=1749893635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTNIBChwjFjiMOn5hxM9LK4OsxuMYN3qgXh4AnRdIkw=;
        b=EL/JQlDNQxJ78bJp+DXoNuxO5hmzXE4Pr8VQT1NyQsc2WhJ1b0sDkgCQjshmcNYju0
         P/eDHkFVXuOSgdSoTqeG91r4bswDNoD1NfGptgLms0jfOXTmYSluhfdYXIkLI/4ffh0w
         b6WC5HmKIQV+YfM1MzMJ5n3wJKQSH830662BLLHZY5M21fkp2tW7j3l7Dd5nXVqM+M7/
         3uBlR6vfdx2GeLPCSjNKmZIp8SMuj+rasG51Im2cmQAaVztdOy5RMguvLz/vMYys4sMj
         FeO6BX0CkNnktez+eUzF+VZOiGcSLB43F2du7P7ZhvqFta4lel76H+nvfyo84YGnXnb5
         j+BA==
X-Forwarded-Encrypted: i=1; AJvYcCXW9BDFVvODChFgojYQ8Sqe1qHQQfduWIxUNX0FBFrEG4dgTL67AxKIDSF0TVBHrsTGWoM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw77+xdRzvDIwsyfJ2GES6KKfRItK2qUwM3VVliNlhZcpx6nfsy
	tSMEctj9zz/CxS5aXtQi+lw+5OkWHLMq7Xpog1XS7RAgb8h3yVoMUuZYhq1Dy9p3ZvA=
X-Gm-Gg: ASbGncuXo55feV3IkUNm5GL0A5tqq0WF2je2vctGfXYGKpxu0FyFYd8rVIBohAUIRZd
	SVFxL1jir3djNzARat+R0ARDk3PKbD298uOlkBWNWLkK89DAUckHORPPTp6fCLCo4aDrj4KPXJP
	2aM1POXZmadNkiS5Ul0DoQ098uLLxfDW1zpqJKMhjgoZcvxPRNjTSAoeHaZss4E69mRM6Em8QjX
	qXkX4BYXNezsOtWVWUfZVSb/x2ahpiLO727lkrfYAoneQQFyntcVvN4gHGKe4r2dbYCVH+3RKM2
	LMB6FOr9J33wtJdDo/VvwlwEVbTYbuug9jyZ7DzcyeTN6W96lA4OgPZ4LvyfLfIX6PGrvuw1H38
	rWlQWEpKXSUwKdUg8SwvI1Q1HOjIdZ811AQUnM70bjF3PsvJAwMib1ogbbILnZQs9D57g71ifIV
	s+yjvgxUCYA2prsfbKGk3L+bw=
X-Google-Smtp-Source: AGHT+IEm28qBVinuNhWsImQPcSHvtdI7CTlAx5NAM/birwbnUAeQpuKn8+d34Y03cUHERB7oLJ6qXw==
X-Received: by 2002:a17:907:1c0b:b0:ad8:9257:571b with SMTP id a640c23a62f3a-ade1a9057b3mr642580366b.16.1749288834791;
        Sat, 07 Jun 2025 02:33:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
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
Subject: [PATCH 05/10] ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
Date: Sat,  7 Jun 2025 11:33:17 +0200
Message-ID: <20250607093342.2248695-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
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

