Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54E34C6E
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685509; cv=none; b=PHY4awDivYZoZYSWTifNaMZWVk09NWfZnYU/aFG5aXyGSDV312KSNBtuvLENVa/vBSy4qStsFJYCpWGJ5q5ndvoftGCWazWcnR+Rb+Cndj7U4tugXj2mq2iNB2Vww61m9Trq+L7laP3PFmOeX7bV6I2M9pmir48cBa/uEaJD1Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685509; c=relaxed/simple;
	bh=eeI965bZjLro05LN9x1g2IrBacFgY7A1LEArY7+ur64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btz2i4/2uhZT3g6L4dYdotH9mfGUUsyJeDFgY1tII5gox/PDZD8K1O0ic9ia4StSqKtsrnFMWe78q8077aedlcuL9KksZZLvTeQIsSh4dKDMj2ht2b3ZYUnBrJ2wy/kx6bmA4gJz5Pl/Aak5kIo2N3KahW6Yj5bRyplJbT8xsuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=h1BpwYwg; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="h1BpwYwg"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so1825759f8f.3
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750685504; x=1751290304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=h1BpwYwgOx6GR4I8oAJlls9m55HdrZrEEdvSvUkY0AQUotyf2ogtOaD2qlei1AttkJ
         21I1XrE1G7UCySkCz40ZO9kDihWOuamnT6NKxOL6tdp1xV8nhUjp8YWZ/rA3Zx/bs/1d
         zPkIOvrYAmIEhAnCHA2SCox29PfWCIZUo7UIFrKkOHW7eH6Y2OxSOd1BTYGsWEp7JDXz
         uL+SqmjYMtxsrWWdnxpQEzDiNu4mykyrL1wNyEBp+OCTeMFem+jlIOVibljmYgXTZXpT
         lD+2yjE6X0PsfCDyJ1/S9iGe02AngpFn9x/f/wAMWLzecNP8ZNrTTdOkS6W9UFtySQE7
         shbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750685504; x=1751290304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BcRT+NYpbdzPXOED5vFm930hD+F6AH0QJgXxP3RxDZk=;
        b=LhqFekdtZvKdHLajSqaU/BKQhVauk8xgHDx/CVXEYXoJEnJHgsiN5zLrDVSzn05rOW
         WMXXBF1Nd78B23CbT67aMSTALLubiSjogSCZFMBHmHTQgXrRWgE/YgQb3H+mJCOwQOsS
         Q3aHBUzP40fY5Al7FgjnfQyAkUyHagtCe3GhA+CFyPMmbZ6cwOkDELaSg+p7jJ/hjBjP
         xs2G7GXeoTZM7TSybkOzBO182HRwqp5F5/prbH1z8/DUUw+43K6FZnia6IF1FLe9Cbzd
         a6kirCgDeH/ifadfWCHvAcZLyjX47X8fKjLuR5vQm4NQoeiur7tfudP9wrzTNtiwpehl
         z/Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVXUIwioNuxE+afHRuFM8ZCEpfXVQMi2pvGZQX+TCr5lsPSCrfyLmiW7+wsQ4FbwpCLBto=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYbtWX2JbDzA80btP/BsLfGs4m0WQHQdmZphgkSQl1dHvwU+5M
	wdcwi4apcgwPMnCU0WtHd69JdZJhVleSkk+NL+31FJZ1gwbndfAUxzO0tlGCzSkc3ws=
X-Gm-Gg: ASbGncsdnsQGVMYDSRcG4gOJjNa6TISkilrmQWHVGwMAnFXD1wh0kbc7e6OHoWQKgot
	MKB//+n+9aSo1TWUUqrv41zFmETWS5X1mNIcxP1xjriCq9kHCmRqyF0CuNMI/iBhZGA9ge7C9a9
	poM3n+aya+itb5rU9U80r8MZDLlmjbindwEh/296Zm0CGDD1tvq0+oHbuPPwQ2HUBWq7es0fWD9
	zXhqQb5AdsnUyBsznvYAdrCY5xnpStqp7alq+pBV7zjcaNkNvO49WpYBBIFdLKXYI+VsHzS91Tk
	yLIEJWPkikvo9ryYvwruRb8PHK5ufsGY686QuXm1RpJB1KmEmvMi5RDEEK2wLYS6
X-Google-Smtp-Source: AGHT+IFMA6wLpwWOu66ZBT/Uwcl+XoqhLxK9+V0tMp8/c191NViuqFm+b+1J2RS5eF5XWF43kziHdw==
X-Received: by 2002:a05:6000:491c:b0:3a4:f7dd:234b with SMTP id ffacd0b85a97d-3a6d1164217mr12380643f8f.0.1750685504100;
        Mon, 23 Jun 2025 06:31:44 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1808bsm9401818f8f.24.2025.06.23.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:31:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: (subset) [PATCH 0/4] clk: use the auxiliary device creation helper
Date: Mon, 23 Jun 2025 15:29:56 +0200
Message-ID: <175068537068.1888277.981802582113061223.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[4/4] clk: amlogic: axg-audio: use the auxiliary reset driver
      https://github.com/BayLibre/clk-meson/commit/301b96e0668a

Best regards,
--
Jerome
