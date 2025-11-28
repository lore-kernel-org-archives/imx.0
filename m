Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C609262FD0
	for <imx@lists.linux.dev>; Fri, 28 Nov 2025 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764342040; cv=none; b=Ct2CjPM5bg3nsMRe9sJ6GpmAm3KhJeliZO7UYiY0vrINtPbchsXHMO9NJvZCCHI6D868/llYQ6X8kaqnbO06p5XtKFCk5eAu53gsFY0Z42jD4vQ6+P4/ZNqevsxL0NvgAAnwSKBvMSlhaoiARIvpR3UEGqDsMX9QoXZt1zfRlNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764342040; c=relaxed/simple;
	bh=TciEAbtsvGcFZl9jW4Er9twv3yB42WbQ0zm1R7TgeSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r+7ZumrMhQIq7S4rU0FVS962YC5CVOAVlavNTaSwHGbofkP6DZb0tIpvKoNWRsr4a1qlzUlMGXTwcDdu+bC4ehYKRj3IY0AHIlZxOXc78vQL76pRoLo6IdRBmLHIE1vkT64I/kO3PriJgwXGrIN+v9+TlTXsCS/UKNwq3U4aSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hePaDdMm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hePaDdMm"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47118259fd8so17233655e9.3
        for <imx@lists.linux.dev>; Fri, 28 Nov 2025 07:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764342037; x=1764946837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3grBSr7H93iE0zqeBum2PxxsOd5GXTmyNW+XcIPut+Q=;
        b=hePaDdMmGdN7UH13+ug/uyXkppNGdeK4rdM4UD0NYarMZz2T+CMETzP5UVzy9DesRL
         gnoNScFiLVA+xhlh0xNqnK/zmG6nyfZrMVq5PcEb7PF6MCB0XaLFei3CKrvIhHG+cxUD
         8cjOpaL6MKyYuZqQ7UsY9kQYZAI0MwxjPNzTYK7wFxb1KmXsYj3wzMi11kvJjosS93/B
         glX+zZY8dS4OQpUPiQErBXGu26z4ircJxNkg4Dljec1m34jIWrpoOJl5RTng8iazjfoI
         QwW6q5ZZwUn+HlPSAIBUM3oEsFmigwieQyXGPrQZ2JMChbkMrN8EGFjwKILJmNpX93mS
         Hhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764342037; x=1764946837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3grBSr7H93iE0zqeBum2PxxsOd5GXTmyNW+XcIPut+Q=;
        b=Kc0Ry/fOUvNLeRi4LVE25Qf+u+0p18ix0Q1tYTj/sJb2WGM3MNKG2DN53yT5aMRz7O
         BNqkLX8b+C8n4Jic3nzlgcSxPBojOzabZEMCL0SotvOtyhe65xSQvum18izJM/y9wzvo
         IVJMBxRiWq57bV4Zti6IXa7laFb2Gm98Xt1o3fTtCuhzTwiBpZcH5NziQVl4M8o6F4E3
         LQe28c7i6nDAf1hYspeFOezH3wRDeSR5GO6M2PyuyKyDu8dCLv6Km2/BRe0iRqWZ/m6q
         tt2cQCcxHQ924HLC1QV/3XkqP0yUyj9Phdmn95EkHUdd7bw8vlpZEdXH14bQ6Z9KysnC
         XDYw==
X-Forwarded-Encrypted: i=1; AJvYcCVoDfyM6jQl1LG5xrgFHU1BYyyjtBQb1rQKgaEW0FtfuNo6d1pPaaAubHzPSBEmZr0FzLc=@lists.linux.dev
X-Gm-Message-State: AOJu0YySTdvwvx7e816qOAJ/k32DgMECKhrZxa0wG7xubKWETnRlEYQX
	ZFzezsA8j43cgqdLUizxvNwXFxBKxeLHqYYaeYF9+TRrwIw6ZZb7CICa
X-Gm-Gg: ASbGncsa8WSreYrLOt628PAbnqIrxGj1vTOqA38e0c7uK08oCyBJuW5OzF0CM8JeawB
	UJUtXxjGu4L7322LTWvcFEiDPtmgjGgjPdr1xn/8XpoydhkCTykFGjHmrosZqnwSkTOdLnwVylg
	+ubJBahWY41sfuqImck0pH3qdwWtmq33mjK9RR/YMWxvqXhwsq2MOIzEn/kEdfbHOOZX3ExLl7l
	jgtLup/bpPCr2DwSLzldrGIRwW4SCyqjxnJTZA5pK0jolzdjSM8vZCWOZnxqbvXrxe3YRDIovCy
	nV1DAKgvclRmq6/jyHsILvsVGNxpPyMNMkS9iwwK3z8xwgmHNwcbjgNEY51g6Qc7wuwyVfPV6Rd
	RoRa+L3CPDU7zaJFFhNo5TvUn3e2nyBnFiQ1OUCwdH/B8HYvB3rQtlZD2ZyFgCl1y3cWxxSOc9a
	tUnwXb2aIuGkrwQgVjs8s1v6X3f2k=
X-Google-Smtp-Source: AGHT+IH4P6a2V/tjh2KXwjJUvz5Qdlq1GmBHoCSVv5o2GzhLFLANE09Z8jLPuflofJUEZAkCRfafag==
X-Received: by 2002:a05:600c:1c19:b0:477:7bca:8b3c with SMTP id 5b1f17b1804b1-47904b10379mr201004035e9.19.1764342036665;
        Fri, 28 Nov 2025 07:00:36 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47905303963sm93117975e9.7.2025.11.28.07.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 07:00:36 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v1 0/2] arm64: dts: imx95-toradex-smarc: Fix ethphy1 interrupt and GPIO labels
Date: Fri, 28 Nov 2025 15:00:26 +0000
Message-ID: <20251128150030.35931-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

This series fixes the ethphy1 interrupt configuration and corrects GPIO
expander line names for the i.MX95 Toradex SMARC.

The first patch changes the interrupt trigger type from level-triggered
to edge-triggered to match the PCA9745 GPIO expander hardware
capabilities.

The second patch fixes the SMARC_SDIO_WP gpio-line-name position to
line 15.

Vitor Soares (2):
  arm64: dts: freescale: imx95-toradex-smarc: use edge trigger for
    ethphy1 interrupt
  arm64: dts: freescale: imx95-toradex-smarc: fix SMARC_SDIO_WP label
    position

 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
2.51.0

