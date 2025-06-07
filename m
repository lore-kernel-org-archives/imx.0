Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AD1221D92
	for <imx@lists.linux.dev>; Sat,  7 Jun 2025 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288845; cv=none; b=EXEgQavKu6t9bQu6LG9LgoHL1Zh+LEXfW8V6Dh1mQy52jTrEAxqvXNuI7JKjgienhHn0jYvQXw5izW1RoikDB+y5rQIAwm1wlNGO3gMJbkOIEi2HR27Z1lAHri4nISMrVkvic95MoOelOX0WFxp+fCbakEcXpgZ7P2ZSsL/9Rgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288845; c=relaxed/simple;
	bh=5KQWjhoLWPA/krvVZwsgas9XRMich2nXKYzqUbLffzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kog+DJJ5/sZK2DWALmNTHpo13IJtos0KOCfl2CjYbceSTj/vIB6KhEtQU3Ak1uR4JbN9ftKwJb6w064u1P4Z4BbK7qPGiWuqA0a3v4/Hwj0Fmy1c209zvi+Y2LPlEsRJ8Lc3XpxfZqgdhH3EZo+UByYZpLJxL3D61JcQ9s0JiBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Ko8vTxPT; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Ko8vTxPT"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so3532827a12.3
        for <imx@lists.linux.dev>; Sat, 07 Jun 2025 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288842; x=1749893642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wep7qVH6kKRWEOlGk3kF7+QndMZjc4UpPN5qp8DyFqo=;
        b=Ko8vTxPTKxe6lk0BIhHIsjsDUlh8wwBE8h+bxKyyf/SDuoMgrDJAi0yteWGOAwZ489
         KXrSy4RjPxdfFJfmkddDpMqQ3Bq67DZPmw8AbwWfIy9RrJ6DymKHGwPFyZ2tKKG5cU1A
         hiclPABcoj3rrmVJimRnXMFr0JuM6BPcYBqWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288842; x=1749893642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wep7qVH6kKRWEOlGk3kF7+QndMZjc4UpPN5qp8DyFqo=;
        b=YmOWa9dv66y+zgAgvGYnTzKWjRWRTw8Yrfv4B11nfiwsGp3AeVcyCJdS3lE5ReggzC
         DCbnb3c4HdWBlwYsTivessdY+y0b29PeD9E+XR77zO9IcCfYRVgDxQrhKQSHWLAsKdGV
         ISTNKv9EDQWTufw1pairOxcETw+3w0v/Nh1RLBIUY/qEqgDLYltRSsPHER5fh4kpvNwR
         3vbqc+ysB1QjGshxNoNDTxvzsJ5tAqqkciVytdbVzmjjsK1Fsjd1FzyymPwREtOlQ+8C
         j/QE8ynN6V/w8EWnXdshfyf3MLJp+7CxkD8B1u35/rCYVbfrzs9AJZvOcyPBbLLQZWqU
         zXAg==
X-Forwarded-Encrypted: i=1; AJvYcCVWgBW/0/dM/k8NJGjsxmJqhAIu2YimA7KGzmlziq/tKt6RDmRc3y0ty/rpI5w9QjI1q7o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx65HKU1JUtrAcl7e+YvWmss2i+OcLGxRIX+YPdwOPs/ryZgMdd
	cy39di2xG90ZVbDs4DrD7jZtMdD9g6JrfCKzRxAdgr8q8v/+0p39Y3uo8iTuNx4NZl4=
X-Gm-Gg: ASbGncuC9oFEAdsvY97HUuJduIuexpxXOT9L2/gkmNAyocziTFKlYN1RbAYJhEOJW4P
	uuqj0SWtTKeCdjoY3XbxR0/wra8f4uISMThZ58wWzOrKPnJxPiJYeX8WYBE72/1C2F5fWW3FvBe
	rTrwxQkcnJNSoWJpm/nH5i9rqBjxmtLoEbgphew3PxlXMPeoJbYo/ZKAGNtqQPYHLnzcozJ6B39
	Z78xW1tUAJL8SnwqgVdfPPsDJXHsTQt9rQiawQeDyMeiIM39/HAxjUs3AQ9/9knOy92STA18lMN
	+NUw26Z63u8lR+yKVyY0muGL1pTEJGLeeji0J5Gi9hcKGDLqsYZuXKawH4eRL24g0EC4UmpTqDF
	FioU893mXwmVD1nKSGMHSqkMDVZGXQmxK22cXdI9jWw8pIaEd2zpayDcLkUyv72yX4EMgK+EA3F
	Z3CuODDi461Fk2ZPb7zeq7efM5rojYLWp0AQ==
X-Google-Smtp-Source: AGHT+IEr220dwqbHwABkZRanSaWg0ZAOBrjnV/y3GQiOc5eTmcmdbp1c3FhkJ6PtntZ9o0ybwDZdQA==
X-Received: by 2002:a17:906:1994:b0:ade:4304:6b7d with SMTP id a640c23a62f3a-ade430470fdmr89505866b.49.1749288842311;
        Sat, 07 Jun 2025 02:34:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:34:02 -0700 (PDT)
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
Subject: [PATCH 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Sat,  7 Jun 2025 11:33:22 +0200
Message-ID: <20250607093342.2248695-11-dario.binacchi@amarulasolutions.com>
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

The driver is required by the Engicam MicroGEA GTW board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

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

