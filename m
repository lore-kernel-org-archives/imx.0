Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120AAF9DF
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563001; cv=none; b=cUGYV9mjYF3BxcVhmo3opZcr7fSIMUUwXN5Gg7ml+nWZi6FXnpsVuJttP66n/70b3r0hcvMVdw/AYQUFZS0981qWeu3XUVBahIwutdd9GTlp0lmNN8U7+6lkpr44jWHl5hxqdgeJmIM6INZgMAejZ4EeOsOu9m2aaD0DoW7ynBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563001; c=relaxed/simple;
	bh=s5wgK4Qzugtu6DQ7chbTlwIxyhWffDlpy+oXXn0nhCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p7QjIHXxSQvUaehSSQFVStcBAH82s3eRiPOHtdN9Ca6wKrDE8w26SSxi6sO+NMsEyP2HqztGa4j57HmW0gqySy4e8Ttzqb21NbYGJlwMbWJvuNlBBtVsQlZz2rQtA2XZmGfxWqsgX2YjvRpG5buCd0tz2cXRSWWd2pMavM+IPf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDSXWezh; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDSXWezh"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5d5eec95a74so2332273eaf.1
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724562999; x=1725167799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7M8d2Iwbu5bICVz8NIEjALytlWBvPo1Tua0bm0Ig2w=;
        b=DDSXWezhxMq8F5N7EQlnfp5ZVAfI4GQFpNpXHDBvPlJi9OD8eY6mzSfFtz0ZDBtDCd
         xQBRp/lDx+JX4QQaVB7waqYtvsWELOGRYJXBrm0BvpbQQIK73cS8wf3cwanw96U/xK4I
         KMyzhC2xm0tjKpbXi4F9WUnQQ0GUP6gifNh+M4wlkxR5GZJFNUSjbBSIaeXnLinIe718
         rhHcOK5BIwS7wXuW5fc7/IHINSevf9P1/yHFIxso+xOKUsYpqxXhCPcjIx/9jlXD02mv
         WIqUHPZiPsYlcteKy2jK8qnIvxwzPw7jjsUxWIwhDtijbmhNkqIHStD2nGjEu1Jwjmvr
         aFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724562999; x=1725167799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7M8d2Iwbu5bICVz8NIEjALytlWBvPo1Tua0bm0Ig2w=;
        b=AcTkH4gPCnjuX6xVYyekXxq9QCin20q2giYZt4CX8UpXAi+qTdJpN8d2FMa8Ml+9Sc
         lbWFUeW2/r79N2wQDdlGncDVQLj3Sb7ulZb/dqkMjvy+OMIQ9Fmiej9Kz7zcjR++O0pB
         Qj92N1uoyJ9FnbmMh+m7qsU3Axoq2KK/Mc6bH4ZNETRevR5X9GYi4iGj5iG7+ugv/QDW
         r77H1z/uzZa7DXIVj1Gbcrp8pyBrYoG3iRAxWNBd7RMd+Pia1pdEYj8F+EAfBEFhAL7K
         cHjOI86Lug3jSsET57/JZi6l2Y//lR3nAL7Tj9gyP6XxUl7KcS3nD+4+mRJEZW4q4HZm
         YdMA==
X-Forwarded-Encrypted: i=1; AJvYcCVBhz9JHCML4A/kS2C7pJLVm2WZtmuQOP4gZ6fFlmZ1JMF7aEQYrz6wr09PzIGKHBDRqEI=@lists.linux.dev
X-Gm-Message-State: AOJu0YybhI3LYcp00eo79m/1VIoiCWa+VKwjrrjfQ5HXMP9bPHMUqgzU
	jO/Q8XQ0nj9NC5+R5xxdtWvvX5zrD0ygVvdOLagg9k8hNt6OSuCK
X-Google-Smtp-Source: AGHT+IEu/+1X05YCf8jaUm1G0cNhbqDxQwzltk1XvDFoQrjwwCsat+bp2wBTAollbQUz/0WMsmlMyQ==
X-Received: by 2002:a05:6358:3a0e:b0:1b1:ac7f:85f6 with SMTP id e5c5f4694b2df-1b5c21edec3mr830073955d.19.1724562998831;
        Sat, 24 Aug 2024 22:16:38 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:38 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 00/17] Convert keyboard drivers to use new cleanup facilities
Date: Sat, 24 Aug 2024 22:16:04 -0700
Message-ID: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series converts drivers found in drivers/input/keyboard to use new
__free() and guard() cleanup facilities that simplify the code and
ensure that all resources are released appropriately.

Thanks!

Dmitry Torokhov (17):
  Input: adp5589-keys - use guard notation when acquiring mutex
  Input: applespi - use guard notation when acquiring spinlock
  Input: atkbd - use guard notation when acquiring mutex
  Input: ep93xx_keypad - use guard notation when acquiring mutex
  Input: gpio-keys - switch to using cleanup functions
  Input: imx_keypad - use guard notation when acquiring mutex
  Input: ipaq-micro-keys - use guard notation when acquiring mutex and spinlock
  Input: iqs62x-keys - use cleanup facility for fwnodes
  Input: lm8323 - use guard notation when acquiring mutexes
  Input: lpc32xx-keys - use guard notation when acquiring mutex
  Input: matrix_keypad - use guard notation when acquiring spinlock
  Input: omap4-keypad - use guard notation when acquiring mutex
  Input: pmic8xxx-keypad - use guard notation when acquiring mutex
  Input: pxa27x_keypad - use guard notation when acquiring mutex
  Input: spear-keyboard - use guard notation when acquiring mutex
  Input: st-keyscan - use guard notation when acquiring mutex
  Input: tegra-kbc - use guard notation when acquiring mutex and spinlock

 drivers/input/keyboard/adp5589-keys.c    | 39 ++++++-------
 drivers/input/keyboard/applespi.c        | 72 ++++++------------------
 drivers/input/keyboard/atkbd.c           | 37 +++++-------
 drivers/input/keyboard/ep93xx_keypad.c   |  8 +--
 drivers/input/keyboard/gpio_keys.c       | 44 ++++++---------
 drivers/input/keyboard/imx_keypad.c      | 27 ++++-----
 drivers/input/keyboard/ipaq-micro-keys.c | 12 ++--
 drivers/input/keyboard/iqs62x-keys.c     |  7 +--
 drivers/input/keyboard/lm8323.c          | 49 ++++++++--------
 drivers/input/keyboard/lpc32xx-keys.c    | 18 +++---
 drivers/input/keyboard/matrix_keypad.c   | 18 +++---
 drivers/input/keyboard/omap4-keypad.c    |  4 +-
 drivers/input/keyboard/pmic8xxx-keypad.c |  8 +--
 drivers/input/keyboard/pxa27x_keypad.c   | 16 +++---
 drivers/input/keyboard/spear-keyboard.c  |  8 +--
 drivers/input/keyboard/st-keyscan.c      | 19 ++++---
 drivers/input/keyboard/tegra-kbc.c       | 45 +++++++--------
 17 files changed, 169 insertions(+), 262 deletions(-)

-- 
Dmitry
