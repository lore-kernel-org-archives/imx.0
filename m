Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D4631813A
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200915; cv=none; b=jdg3QYjCaX3hHXQbsBZX/pTnYtVHKhilO+3eXLJKJdD9S63emqmjvTaX6W8jwmS5CnzsxFXqrSoIWghaTKDjDo6ezsiRT1b7VQR/ZdyCBsj47Do02n2Xgy8Au+ko6CDqlmK0284yPlPgotUMyhnNKV46d6iw+6l8qjsqejCNiw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200915; c=relaxed/simple;
	bh=Q4ut4up6GX/HdckreW0R8OaX0WDAeyY5hviNTW/p74Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l4OZ9dyAlnxDGV0sffAxBHprsZp8NrjyTicXrwzXGdyRB1HckTJMXVQnT7z9h8x9kKgbgKN1lDvfRUiAXfamYUkyyknKByILUDkfGTglCU/fxMfFqs7ygiwDI5n1b9Wi1KByVL1n3Hf97AtfYb07jbI0Cr9ZKiuB/HolqSv/EoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JSzKeiUB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JSzKeiUB"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so32079555e9.2
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756200912; x=1756805712; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hkJG+WUZSpEwjO7HzoCtPjyyNbjxdrmMzotvlEggg7g=;
        b=JSzKeiUBXRrozylOjbNaX4b8qNyoTwlcGCIoJ6ncjpV4waUB4gthYIV43OpwyEHrTX
         5VvO97A1NTuyVAvXmFVMQ/Qs1H5NTErbvVGQZd29dnQu9alJy4a8BX0cTFmCd32lKlI/
         a/V1M4ok3c8+GvhGOpoJv0GojrogQhHIFygy+qp47fV0I0VO0SERO8R3ki3Nz0kXAUpg
         JeChDUAsr36kTO2pCrsRK22wI5Kg/tbGjBHb8Vq59N2N3m8CAd/mpmLjouSAWXop+pdM
         OHboWoekAx/vm79YEWMG5nXSK6qMRVUOdo0ojTeEb7zUDfCtz+tC4gtPhtMwMvrvdCdr
         y58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200912; x=1756805712;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkJG+WUZSpEwjO7HzoCtPjyyNbjxdrmMzotvlEggg7g=;
        b=DLcf8CHmn0p6an2pqNoU6ufPBoLka3chraDojYfzFCr8AIWBAkU1nGMuDIiKtwl+mU
         pVpGzP8xTc/agtI4CZvMnpB0mt44AAwvn7OkxcuANTfY3U/LqkmBH0jzmE76H1MrmJof
         GIYrrwA36jIxOCHc1/+5jiQHwctO3GNpblRO3XEu7sH9OjwU3aqmBT7azu80rwduR/sa
         reYWfwzei9OCfh+MDfeCX/0pR+tzYTftpSm/ug05+hecmBts7JzIpKCIl2Lgid9oRQ8f
         Gbd5x+brBetX2lchL3zMxsskvc5QoXmqPGE+F3oG1rsX+q3TlQHcLRIGRLe4xgxibvRL
         +6iA==
X-Forwarded-Encrypted: i=1; AJvYcCUkCaviMyO1i0Uh2RrUhMEm8eiwDjgsn/reLrHRqb0j52hhkkqPudU8M4WHQf5LjxTgczA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyETFhBN8nxIY54+oPzYq1NwK8RannEP92Jmy//XaEx1uQByNxh
	XuBfEBioCLaFlyHJ189NJaYZX8j6N5ggw3Zf5on+6cICkrrJGVuRF/T4NkpErMARmuA=
X-Gm-Gg: ASbGnct6wyIDH0ezPlhv8ghQaShI4xbxWsIqHYTtxKfe2GbBoUGHe1v0aTPWWM3cXQ7
	D1obpHa4Hg/ek8uDLYBY/KOFw9+IYhWIprXd08oXwH1LJqz/ndrfQTuSYMn1H6pCN+wJVkLneYs
	8Az5p7Ezhb+vAZiN1l1e8d56bxR9BuohEIK9QulS8Y8is9C0HlMLVz/ArwoNyQVes4n90YYuCTN
	hsPyy5YPuK9bf2wSadWvHM0RYNKdsvSg1BGfp5PkW6FxGHhIxTSAQ7FbOMiYmmuwEWG0BkdFrA5
	D6rp2c4O6wG15FdvzJs6EIVNAlARNy3r7HLpON/yQ2O1/ghI9bOy+WMk/IW6Br4k+MwmqLUsyCX
	inC5gxtQfrPtC+mykLrUaPLPRkc0=
X-Google-Smtp-Source: AGHT+IH2xF7cWf9zPiJpCZDblnQIkHuRl4owRmxgCh3l1f0u4tvEtpqb3bPUkqR7KcRXy8joxsDAmg==
X-Received: by 2002:a05:600c:3b15:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45b517d4580mr149020165e9.30.1756200911704;
        Tue, 26 Aug 2025 02:35:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm15308255f8f.47.2025.08.26.02.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:35:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 2
Date: Tue, 26 Aug 2025 11:35:01 +0200
Message-Id: <20250826-gpio-mmio-gpio-conv-part2-v1-0-f67603e4b27e@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMV/rWgC/x2MQQqAIBBFryKzbkClSLpKtLCcahapaEgg3T1p8
 /hv8V+FTIkpwyQqJCqcOfgmqhOwndYfhOyag5Z6kEZpPCIHvK6Gf23BF4w23RqlXQ31ZlSud9D
 +MdHOz9+el/f9ALS1ILVrAAAA
X-Change-ID: 20250812-gpio-mmio-gpio-conv-part2-0ab8e4871d4d
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Yang Shen <shenyang39@huawei.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Q4ut4up6GX/HdckreW0R8OaX0WDAeyY5hviNTW/p74Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorX/IsQ61XrGh+TV0cTJdfuJwQ0IU2AzJI6U6B
 xODhnvRaf2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK1/yAAKCRARpy6gFHHX
 cmJuD/4s6vLLL4IJvlMcBRWt+fL3p/MdEMPyIgv+IS4S1jqjqxW26UsphEQIOFT4zd+2Ei6Qx4E
 bYgNLNqataNIqWb6AtcX8wjj3CWWIqrMTZD2ZXpw7rLb951R5Dotmo1R6kM58oDlTaNJFZjbg9n
 ChkAEyNlA5GRhB6foaz3+Do5OJTbItx/BFm0lH2dyCt0s/6WsRMwal4Iv66YCXtvOGUGiQtRnEP
 Jl0NjctXUHuT0bmeBEDxXiB9np1PybcUOTk1AhTTyvajEThwU8fCt+oaavXD+6mn4QIBRfnqyTl
 jYArmBFJBtDETk2cAIcyPpsRLaXJQfHPIXK+35E53tBd1AVBBWm9wpL/18OzvnFdcVibRnfb+dz
 DpPzPGdSpxkREQGdv1S4HNICQdTQ/FtrRdk0CEJluBKeMXcPSEI0yuhZMEORT20nSri9kTKJgAL
 BMa8VJSwoEoUkx2+GBgUcJYRyPlZ5d4vMM3eFjuiezT9WnyRp4/QLxWBVFxrBIdwvb30HB3FZ24
 WMbajv8vTcO7A4A+txRMVD1IoNqnjKQ5ZR0KDXSRml9ykbYzC8TKlOXRAEJte+Z96Yt5BWlfzIc
 5oHMXijNS4BrvrtEiPsnVbf7kA8XquJdZMs1dq7KwCkiXlLtRlhonbsjN9GGfNZBkyhVrchsZNd
 QX+14T53A7wjY2A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Here's another round of patches converting GPIO drivers to the
modernized generic GPIO chip API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: xgene-sb: use new generic GPIO chip API
      gpio: mxs: order includes alphabetically
      gpio: mxs: use new generic GPIO chip API
      gpio: mlxbf2: use dev_err_probe() where applicable
      gpio: mlxbf2: use new generic GPIO chip API
      gpio: xgs-iproc: use new generic GPIO chip API
      gpio: ftgpio010: order includes alphabetically
      gpio: ftgpio010: use new generic GPIO chip API
      gpio: realtek-otto: use new generic GPIO chip API
      gpio: hisi: use new generic GPIO chip API
      gpio: vf610: use new generic GPIO chip API
      gpio: visconti: use new generic GPIO chip API

 drivers/gpio/gpio-ftgpio010.c    | 48 +++++++++++++-----------
 drivers/gpio/gpio-hisi.c         | 46 +++++++++++++----------
 drivers/gpio/gpio-mlxbf2.c       | 81 ++++++++++++++++++----------------------
 drivers/gpio/gpio-mxs.c          | 31 +++++++++------
 drivers/gpio/gpio-realtek-otto.c | 41 +++++++++++---------
 drivers/gpio/gpio-vf610.c        | 27 +++++++++-----
 drivers/gpio/gpio-visconti.c     | 25 ++++++++-----
 drivers/gpio/gpio-xgene-sb.c     | 53 ++++++++++++++------------
 drivers/gpio/gpio-xgs-iproc.c    | 34 +++++++++--------
 9 files changed, 215 insertions(+), 171 deletions(-)
---
base-commit: d0630b758e593506126e8eda6c3d56097d1847c5
change-id: 20250812-gpio-mmio-gpio-conv-part2-0ab8e4871d4d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

