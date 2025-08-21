Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38252F90DC
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 10:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755773807; cv=none; b=n3TfqIXOm6/EzV+g6QkH+HJzdLcA0iHbWhi0OjtVnF+kWD5uFTOqQ5PBDHZDbJXiV//mF4gS/9SKlmMH9iY7tbMR8GUTVVRjUt+erv4EPOioUBvZi7HslvG29G2IUsxNg5wEX9mg2Tj551exaCtP2m57rV7BEd5Ah26lvnwnk1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755773807; c=relaxed/simple;
	bh=FoGQcz7DeqX74u0WtayvPR42rWrDI1OCq5th/Z+nfuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NLm0FiAP8pkGY6xdfunVWIpdi4J5gLIpykS+sa793kJ5tpoOHMY8iZP2a3ysbv3yuQ0RbvifetoyXyjA9w5HMUzGMXw1/kDAxbw2VjkZ42Z+/UMNtLr0aHKPkdODfOaMOAVAOZY7qHl0TpI1KxmlObKd2z4QlYpnRffkkIm5pek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRaPHZtn; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRaPHZtn"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb72d51dcso110672166b.0
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 03:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773804; x=1756378604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sMyUEbLcanRX5H+fT/hbCuFWtgzsfYsMYARRkrN4bEM=;
        b=JRaPHZtnlnfyrDO+woLko0Uar7tTg9psZf4ia6X4cMATE0Wc3j4cMz+jLp93JTSqDb
         CKPu3K6O2fvhBdmkjKSRba4DawPOqLSgAQWsrANklI025wXXHIVFIK0z84zx+JD/Dr2z
         KF/cZexK+V5xL7Pi6X0Kyv5TiTbLEf+YerSXp+dVOe9xyZxwHurdlURbz5E4wH/t0oT3
         GLK3LfGae6rUtSMelmAORR7u2KGaB3fhlmKnBWIo4r44u31dzBot0bcNxckc1ZP2YPUH
         eqF5qO7lphRoMKwuC+ms6kli4vZtIvsJQpnp20lakyBQf+kzwny42HUB13m9kBE39Gr8
         xpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773804; x=1756378604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMyUEbLcanRX5H+fT/hbCuFWtgzsfYsMYARRkrN4bEM=;
        b=xEtwlgbsmtefXbA6JO9llN9tpwrcS+KSNsrNkfxxxoL66/MVtWChxT9XO7BwkDIU+O
         txPgMekTkwqfpYP5cWOP9R5laEPBNaHa6+uMMrSaXzfz8WXZKAqaVIaFS00Iql6d0ZQX
         SgSQohUQkpeggEwy8uA0WnwhMS0qydNKaUXaxto21oMMB3nqVpZvoaGEKNw+DpjdOdZ7
         OZ4qaSWbnTGd8Jfi5h4/3PwbdBXGQmclb7kJh7kXssB3TfbUW811joRfpoSbDdJNb5Lq
         GkWUk9DRkxZvipkBV6LEnn/j5rj75PsZDiMwKoHV7EEPf66zdcQb4NEYtDt6XbdBiyId
         xn2w==
X-Forwarded-Encrypted: i=1; AJvYcCViYXgI7ZRBz/gMuahHEeUEljzQ5zyQp1yyhxoETBjOplTPAs93NzDOKKqKElaDq/LI+q0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1WAmmYbcyWze3M/mGJ0WqNiAkM61oZCdbhM0JK2fCeJVdB7UY
	ZgN7cCX19qXNPDZ8Q2aTcA9RmyDO8nbVAGY934EDjokprWTE7/QDqCNL
X-Gm-Gg: ASbGncu0iP0vieWso6+LqjjMnE8nyRs+XEXt9xfjz/aqA7yhi6FFH5ruQfrYtkUe1bG
	IlgLSeBw+IITFZM0vrNy6aShnVAeQhCnnxuHknS/Dnc6IEEschDyf6N8j0MpjUcYv5AJBZqJakY
	oOHyCdKRmcx4l0F4lvXFGRKPi6keDU3m16z7HiS9uFyUVmnPsJC4HjAlQGlLGFI4LZKbXCe7xXO
	P8ziypJYWNZdbwvt7tj+8xZJS6d5NCNXBDbTYU9b8gwOouEv9EfAFJdoLCN4iFHVbiyMmaaKiLt
	cKcj5DCB2JaNKpNHHMP6jGfOZIPWWJCxEWlAyaR4zbSjoWJ6gJrEK18PSZZH0UHCJ6YEDm6GRUB
	uXe+D/gp7yw/YIM55FOYc44WPxyjFPcj7C0m0zVDgpjqGnQ9CHcQP
X-Google-Smtp-Source: AGHT+IHms9vlv4FD5+T1jUisxyplhUFRbxyMMUf0tERN5qe6K/kx17X13rQpCE7FAsb5xSQZMirW1g==
X-Received: by 2002:a17:906:f583:b0:ae0:d9f3:9131 with SMTP id a640c23a62f3a-afe0781c6c1mr151935066b.6.1755773803670;
        Thu, 21 Aug 2025 03:56:43 -0700 (PDT)
Received: from DESKTOP-TTOGB9M.localdomain ([92.120.5.3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4790bbsm373602866b.56.2025.08.21.03.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:56:43 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Switch to using AIPSTZ5 on i.MX8MP
Date: Thu, 21 Aug 2025 13:56:30 +0300
Message-ID: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series is a combination of the previously dropped patches from [1]
and the config-related patch from [2]. This enables the usage of AIPSTZ5
on i.MX8MP-based platforms.

[1]: https://lore.kernel.org/lkml/20250610160152.1113930-1-laurentiumihalcea111@gmail.com/
[2]: https://lore.kernel.org/lkml/20250707234628.164151-1-laurentiumihalcea111@gmail.com/

Laurentiu Mihalcea (4):
  arm64: defconfig: enable i.MX AIPSTZ driver
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz-related definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 16 ++++++---
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

-- 
2.34.1

