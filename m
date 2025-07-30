Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C33F1E5711
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 19:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905185; cv=none; b=P+S0lL9WoWZwVSnclKS6M1A/qscYzgO8mSw0eI258UHfw2Xopi9n1wpYX8y8QPLhEDHAR4PKX9vLWKi0u8QMYF9hBMdLM6GuT44cOADRE/OFhlniCNDeWzY/+YzAq+cQfCs8b2Sa1jxgYpSZgcvh4tVryH8LgHPguelidzUlkw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905185; c=relaxed/simple;
	bh=MfTnB37EEj32Y5FjkQTo/dmxJhOyRQ8e/zW2nSleFZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZ8p1X9q8+wVTjBk84Lj3sMxHup7PXHNmjMi5Mc+VTpZ/bUH7PW9JUtKot4L8ubou6vG+hRgNJnQRjoLuy3LJ2c1rRpwRr79C2Zuu5hN1TNbeZ1xa073Al6dIA5JdiVu50Cw6JkOyj1kh8xkjmcfQt4mVa5vNF424k40KcyrEYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VEpcbgn7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VEpcbgn7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45619d70c72so9986725e9.0
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905181; x=1754509981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTJ04XJW9rCytOzTtWrCv6iwwB/BOv81eXrzl0rsCXk=;
        b=VEpcbgn7wJTxYj/K+IWhmh/uQh+KYulvecM3Q76hmHbK8IIE9OOco+gq4yT24CAP29
         5esPQw5whgjsFUGokteTtB/PM1lh/i9I4QSP2OZRw2uSEeGGaKZ5r/u0QHRLJsgydJ3T
         Nl95KWU5QEEjyJIn+3/qr/iPnsodx8/TWGKAxPes47hy4rbrrUhk++QQW61oOyIUF86N
         K4YMluFxayciS2MX3J+yZHkFhDbQ7WtlVvzk3d5vWJs1TqP7quFi0wESin2xoQDzPS0b
         T1FfAbUm8cYCdXjXEfjRWNq9ZlbA0Em9u+svMvhfKCyVenaTvFg+Ion/RQRswVKTnf1k
         l6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905181; x=1754509981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTJ04XJW9rCytOzTtWrCv6iwwB/BOv81eXrzl0rsCXk=;
        b=RQ3CZ0t8u3LErf44DRu1aNYQMKgjPqoDos7k4KC72h/U5B4HYBScjUu8mLzpBjkM8z
         nX95onfTHJipIPx6fnoX/Mzfk1eZnNqoVQtrbH5YQT2SOKqJqBBiVDvg8lF7EHZa0uVz
         QozOdH1mw882eIXYqE3q6om3c8IwLQf3y9HXSY6KvmLz8x5WZVwWV/EnL3iiCTdoeeDG
         MfIzNUdpSbK7RtSOQ/hJSdAcY6DBDskF1JbIvwxLFFcTzaNKlVmlFQli7VjroX6qmt0L
         2bk595n/Ua1vezq9c6bbZg+myGTMY6A45GI2kyXlR9II6dDjJI6sGgaZ3xpXUbLydjFH
         RqyA==
X-Forwarded-Encrypted: i=1; AJvYcCW88u518WCR6AOMhpaFEkjaNkLyNcwhADkhHmFtUl1pRC1wnyn18dK4hgFK1NUqeF8m9k0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvCu7NYHkzH/HGFhmtT0b6V9ffKeNswMT3sCeFOBW8cERZKn5p
	Oxdqap1AlX8vemL/7G34DCqmMwSttvhI/ktN2n2JGGHVn3MZ057KeUM0YMadjS3Kbm8=
X-Gm-Gg: ASbGncvI5oCJV19JXmrjg5GfVAR8VoFBxXU5ZydvtKj+V6m249tfEIKl1xxpOXkn9OD
	f7rvy9aHtrYi0ez9UKZ9YpH/Xh2lVjhPTAkM3hDiLXYMB3Z4wqJBcpGE8aQz101hcHJnTgra4sT
	jsn2RXeuMSmioXnCWz5yQDsPLXwDE0rTDk0cJBUEoIovtS6YpgxCTqSSDCYjQi/vakGo8f42NwU
	QFixkRo67UEmmcPQ0Tef9fKNe652wJsGmVdCaNZrNjITCTUpN7f4Z4UqzM9oK0L82nd/H20qDim
	NgMZ5Mfdef0q7A1E0M9Bs4GQSo19yALLH3XV5OSwq9CPVLvkJl/j5m1fxp9NLdwx0jjRKwXJ7LI
	7WhbAHyDkKP/rksWUW9EAbyvMjv5s895vNqSPBUj/1wWpmu96
X-Google-Smtp-Source: AGHT+IF1QpqFcMkkrFcPI7L92Qa8qVcCM46GAZ3UfOx8fwQ0i6q08CK1SCZ+XKjU+FsVU7KYpwE0Xw==
X-Received: by 2002:a05:6000:2890:b0:3b7:879c:c14e with SMTP id ffacd0b85a97d-3b78e6239b0mr7443255f8f.20.1753905181405;
        Wed, 30 Jul 2025 12:53:01 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:00 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] Add the STM and the SWT descriptions for the s32g2 and s32g3
Date: Wed, 30 Jul 2025 21:50:13 +0200
Message-ID: <20250730195022.449894-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NXP S32 SoC family includes timers and watchdogs that can be
dedicated to the CPUs present in the system. The documentation refers
to them as the System Timer Module (STM) and the Software Watchdog
Timer (SWT).  This design originates from the automotive domain, where
the SoC can be partitioned, and a group of CPUs may run different
operating systems or firmware.

On the S32G2, we found 8 timers and 7 watchdogs. On the S32G3, there
are 12 timers and 12 watchdogs.  Please note that the 8th timer
(STM_07) is not described here, as it is coupled with a specific STM
instance used for timestamping. This makes it somewhat special and
requires custom handling in the driver. It will be added later.

All timers and watchdogs are disabled by default, and are selectively
enabled depending on the platform configuration, which may include
different combinations of Cortex-M7 and Cortex-A53 cores.

This patch series introduces support for the SoC and enables both the
s32g274a-rdb2 and s32g399a-rdb3 platforms.

Testing was done only on the s32g274a-rdb2, as I do not have access to
a s32g399a-rdb3 board.

Daniel Lezcano (8):
  arm64: dts: s32g2: Add the STM description
  arm64: dts: s32g274-rd2: Enable the STM timers
  arm64: dts: s32g3: Add the STM descriptions
  arm64: dts: s32g399a-rdb3: Enable the STM timers
  arm64: dts: s32g2: Add the Software Timer Watchdog (SWT) description
  arm64: dts: s32g274-rd2: Enable the SWT watchdog
  arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) description
  arm64: dts: s32g399a-rdb3: Enable the SWT watchdog

 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 119 +++++++++++
 .../boot/dts/freescale/s32g274a-rdb2.dts      |  20 ++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 195 ++++++++++++++++++
 .../boot/dts/freescale/s32g399a-rdb3.dts      |  36 ++++
 4 files changed, 370 insertions(+)

-- 
2.43.0

