Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDCD1E1E1B
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 07:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392520; cv=none; b=hm5LbPFTVy5ICF2gD+3hfpml70aGFHS3z/EJaSqAHGEqIfLNfwa1PPatp9wcVQzC3uDc37eKffwb4ucy/gJLqT85ARCqWal/M68EnuYpeAib44Debz1Z0/Tf/ptqnKqEGAvvEAIAMhhE93bsH3osd3sicOdpElLmMJ1yCL7Y+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392520; c=relaxed/simple;
	bh=P8T6A2RfhQi9cs8jlDhrwJia7IeYiHPIj6iHNUhHRRs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PFrIxl7lFE7SpvLh0GinjeTPKRw2JFAa7GRLKQN7eRVCkAyrC6R1aTh1Yl2dSJX8w0+YPwADLY0DxC9Z2coEKk9Hyglf5LUrq62NA5vxw7lrfzw5JG8DNYMBnLsOATDJt1VJOeQKv+BmLXTvJe0WoJ9SPeTTED/twKdmnyEHaUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vPEZAQx4; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vPEZAQx4"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso5028795f8f.2
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 00:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392516; x=1745997316; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kfQbp+syyXkO/RHw4GNJukoFm6a9w8JqJKtPVgxdN5o=;
        b=vPEZAQx4cVEPJgq2rJWsJ180lGzBrlvVZMGGx920fHESOJlQYWeDR9DwIqdrRSIxbR
         +xaE59m8bf9AXXoZdgPoKuJYg9OhC/BaTi8c2zQbzSGTkI3+MWu6AaVcqoHgJDjBHPAa
         LdsgsWABkOb0+PFzSxc3JIkYYM0LCbpWCQMb4MP2lmY4U9KJ921zFdbMw5qKIRKAVxaH
         3yFUBk2tFSZKgbjTIEpXMwVFXzUptXMZCGUI2sVDv/+Cz275u9lIZIifn1VwBN8eYDGE
         3cDhch7jM4oGhlU0mOqeK8iLZOXtLwze4x2hkxAQzAu8Xzh6t33VZGJriDFa27sMyt8N
         e1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392516; x=1745997316;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfQbp+syyXkO/RHw4GNJukoFm6a9w8JqJKtPVgxdN5o=;
        b=oIpQnNtHRwqhohS62I1cqBPNnciV1ril0hqeRO08s/9efF2AGCGhYQrLoq55ZtJn/u
         UTeRbf9m2hv8qRjhRe20ymnAHd/uFY+9OC80w0zSUl3MGSMyoIE9BVpUZYKBQ6bnMHKg
         lkpoOoCFGhE0N8BvtILVpHLc3NvRKx0YThhZhp9QYNVNAbYRjXYfaR3oIAcJ4+bQI5nO
         HkfZUi3DV/NfLGl5FjLoX2Ch1K6vdWTs05ft7AlAhgW1WLJtz7yjQ22ZV7L5OSk2tPNV
         fDZx/XXFgl1bF00+2mo/YrRisrcFMQcQ0EYrdRZ0xjHe5Ui8Jv3AZMvzAGlmqoFg+JUq
         kjfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxNYGlVrWp4z+1zITa3VYCWUVCJLeqV4D6Gb6xOFlxPs6+3pmA3K6mOop2I3QP8xh0F1Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx89IwxXbXrUYoFSbeQXdSNfv+vhMZTF51oFvsMRUr8bTMkbodJ
	JJ97ZIBQTQF5eO4F1NjF2/V/7M9sZlW+KMQYdw9WMdwKZ1ynMvpcC3YoLcfj8HY=
X-Gm-Gg: ASbGncudbZfQvdwc4lGr0HgIouHfcNA+O2qkcjnpUMVQ/OrqLovyL/qeQN2PzoqzQlu
	NGFJJFQEKFvNVwhuFmZAldaOC411BfLezVnv14K1Jl4LD2FmWQO4KvSYfeVD9CMmz6tuDShe/X4
	v3VcUBF6U3KIelUS1lLfzbVDOAdXQKx9OLqi63m+VSrG0rX3rInYxkdchmd8mAn2katThvXcNBY
	lbeSVNh2iI/VywU9G5uVnoBMhdoHoLdFv7xeBI05FPhfbKAj2TP8QDOj59OchQusSW31yvcRWK+
	rAY6RR0P+f9DGYBiQg0b6PQjZz5AxU9wO9kkPWcQBJH9
X-Google-Smtp-Source: AGHT+IG+tJxvr2pB5uojdqPwlJlUoCOQYCF7lDXIVNF2nVM1sZvKoDsybtSZIIss18Pryk/S0Ef3fA==
X-Received: by 2002:a5d:588b:0:b0:391:45e9:face with SMTP id ffacd0b85a97d-39efbb0252emr14722584f8f.54.1745392516313;
        Wed, 23 Apr 2025 00:15:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: convert more GPIO chips to using new value
 setters - part 2 for v6.16
Date: Wed, 23 Apr 2025 09:15:02 +0200
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHaTCGgC/x3MPQqAMAwG0KtIZgM1+H8VcRD7qVm0pCKCeHeL4
 1veQxGmiNRnDxkujXrsCUWe0bxN+wpWn0zipHKlCK9Bj3nTwBEn2/Wbw2SncAPxtUNX+xaUgmB
 Y9P7zYXzfDxJIbI9sAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=P8T6A2RfhQi9cs8jlDhrwJia7IeYiHPIj6iHNUhHRRs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJN9PtDzo6pQhpJrIbuv3TgdhcsxmnoGxcbPW
 lRtYYU14zeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTfQAKCRARpy6gFHHX
 creZD/4wB84rig0XgfTyX7mc6x1ZYJw3YX7GCsmp8eACazubUCcNQBQO4dD9X2QWoeyiZr9sNj0
 kG9snhzeXa0Tvzh5T2gedGUErStlmEEtNkjAjWsaq9hswKDrmsuc/mKcA5qWrkhvkLhcc/Pbj12
 cpxHdFxDAASelR4triAIaQu18P1ZQp2Vj8paAhxBlPEaCPy8hUL0e4FYVMB1Fv6j4lrnLuw73xB
 Mokir5p0P2mOSlg7jZ1KDABtZMRJ3CPkcRtQNnaeOTtbw+iMAeR5G1DDptYOQFchClFJcz/xL3c
 GPMzwOimJLewFHGUaLNPOD++aD3pgcAdTPjwEFrbnawGcOeo9aVVaHTLh6A6y/5IzUup2dND530
 zgLyZAtdQ1aYqwT43bhc5q8GGZbwkhi44RrPiO6wbxV+nySlux9Qeik/KNe/sCId8qpryzVd1ZS
 eWLn8FftriS0QGv8+xltz/TLVnEDjrxdGBl/xTpUgFPtY9cEsdvhi/cOJu+CgO1aX6HcCbfRbOo
 DMzzTyiMPndixsvtLUQBW71OgMqChX+LF/Ti24nk6z4tzcBW1oeIArw4ew5oJv7DacVyy+DdDTi
 z2Oe6DeVscjg4pu7aChY2RpA1zzxwUS7QhJ3BDJZGw7UjNPoDfYoRHSX/kMd+8zwZFidXAVhwUI
 bR7t8EKz9jVunow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
another round of GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: imx-scu: don't check the GPIO range
      gpio: imx-scu: use lock guards
      gpio: imx-scu: destroy the mutex in detach path
      gpio: imx-scu: use new line value setter callbacks
      gpio: it87: use new line value setter callbacks
      gpio: janz-ttl: use new line value setter callbacks
      gpio: kempld: use new line value setter callbacks
      gpio: ljca: use new line value setter callbacks
      gpio: logicvc: use new line value setter callbacks
      gpio: loongson-64bit: use new line value setter callbacks
      gpio: loongson: use new line value setter callbacks
      gpio: lp3943: use new line value setter callbacks

 drivers/gpio/gpio-imx-scu.c        | 47 +++++++++++++++++---------------------
 drivers/gpio/gpio-it87.c           | 11 +++++----
 drivers/gpio/gpio-janz-ttl.c       |  6 +++--
 drivers/gpio/gpio-kempld.c         |  7 ++++--
 drivers/gpio/gpio-ljca.c           | 13 +++++++----
 drivers/gpio/gpio-logicvc.c        | 11 ++++-----
 drivers/gpio/gpio-loongson-64bit.c |  6 +++--
 drivers/gpio/gpio-loongson.c       |  8 ++++---
 drivers/gpio/gpio-lp3943.c         | 13 +++++++----
 9 files changed, 69 insertions(+), 53 deletions(-)
---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250422-gpiochip-set-rv-gpio-part2-7e2d60e96d8e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

