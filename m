Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCDB24291A
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408082; cv=none; b=pVB0K7ZiOC35/A4Ih4XDsD/pHKhy6fafqh2zHUYTn5azwlt177mbY/2PyJCIss3xP4tBE8v9gAFlPzazOu3uj/JJf8NXmgDbS4w7tyVwbuXy/tbeD4J4IcTtc8RQBVV935CSZYgwyYJulFM8TY3g5fCrPPuFsZC+IO32AozkeAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408082; c=relaxed/simple;
	bh=DOJVEz79hyx4B5UpuGMdFTop/BzR1Uh0haptnlOJ+7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e3ThDgANGfCQBB5n8gTZSzWYUrhL6f9wgNmB7i0u5yXYQgnKChj1qXmMSL7xZ3qI5ZSnKBoLOJk1rYaorYT9I+MvfA5Qm4BaMxdYfh+XgB6Ki+yNp2MvX39JYb8Pz8tOEsx76kWCXqYVMyPc8K/BKsU8nsPAZPTTCn5J8zOrMlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=EtB4woW4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EtB4woW4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so11653785e9.1
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 01:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408079; x=1751012879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=EtB4woW4fX1wnw9zQxVTt74ZkCA9FliOOXjuaNlz53vn2sqpiP4VR5He9Qb/3W/way
         3mTva3UHS1dHVL+tRL3iJjH+fQZ26nB+BveJP3ZDi51oIAA/3Ais1l5jf45M6i6jx/Gt
         WI/WV055N2dYjDmgh1tg6E9YjjnaZqs+6kXY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408079; x=1751012879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=f5lnN/TBZYtthba+/dkpZU7LVbStlr16wsD92rCq8Aln0uZTZcxQVhvVeDUdxR/5gs
         Q2qfT2OSEqaV/coZBN4t4k/srCGg8v0Ys9uV9YEJtqs7xQmhCLe7Wowhg8PZ5vg5tX0F
         rgkDTYZBKpOUiRfEcrKCaEljpHcGmaryReQl0Pg9wbBJPVy2zWMVqE1NywcJJAr+iWgy
         E0TtcJkLDI6vQemxtLhYAhTK00Yawr4yOKSHyWMKmhe/URCMSmSD6KK2qZGEaKFT1pEi
         oIGp8hB1ubOTV2x+1GvSAgcqObDwYYAw8UGMbJRDpNA+uW3wVtAs9pq+JULsrsY3bC/V
         Lrcw==
X-Forwarded-Encrypted: i=1; AJvYcCVIY7U8QT9xDcYJa1k7O5RW8L+OY+AnQHST/x++2aUT4GHsdDqfJpew0hSh3Xhtw2z1WaA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5zhPekVSGvux8KDcFGc3bJqjyQocDqWNXdc3qJFv4IpK6dQWF
	TcYJmo3nyYne1y4OjagzQ78+fJ2zKmQwYHwTtehh3L4IsWP4dW5rqqSwO3N+dKjkeAc=
X-Gm-Gg: ASbGncty2RrV676IvQHfUSNPZv5bKGunR5NL4pdVHqbiX1FkROg6eu/6X0cm6KWTXkF
	f4Vlh/o5+cgO4F7DX8P+P0I6wkWxCsoZmCtqNHOhsBgMo4mzoxksmfopNknnsAEQ/5VNl1EpxIW
	25oT+0dHF5j/ABLL8HRU90KoFCCTaaDW0odjN9T/bEE3/Bd1TSfO7luLW1mrDyHcBEB3EOUOFwT
	S5ihxPAP3tXh0/EVVU0SFiyxeoxeihLQaVNSBWMlLDes+syyWxuE5Y7wo3Mf8IrYa8E3sHDAdBa
	LJ4PskjfNnjLjnAHMoRZ/NCiDMkmdbvKHRL4aQwsBorK9+irkkSFQSpShL/Oz0MYJuPcglpIKr5
	gj37N1M7H+YKMRYsfihJgbndFVi56XgDuya+rEvpLhCiPQc1kFSqR
X-Google-Smtp-Source: AGHT+IEZqlrVkb8XWCDX/j/Hz1XI4PFQ6/Jwg9k4S2zDKT2iPFzlG39sL1OWvC8PeJquwOivITL15Q==
X-Received: by 2002:a05:600c:4f03:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-453653a337dmr16663085e9.14.1750408078875;
        Fri, 20 Jun 2025 01:27:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
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
Subject: [RESEND PATCH v4 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Fri, 20 Jun 2025 10:27:14 +0200
Message-ID: <20250620082736.3582691-11-dario.binacchi@amarulasolutions.com>
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

