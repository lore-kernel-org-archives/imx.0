Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AE024E4BB
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 21:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999079; cv=none; b=Z7ZSsQiEFjRsMmuNDRoc8C+5yPvjMD2MkewGlRx4EG0/jvdx1ALCuyhP0Yb7AKI5y+5Goz7Jo8MaCOKgg+H2TW86HI+EHjYj47a58n7YjBE5seGAzmXhjg4cg2M3Q+7u5fK+JkGAFQ+d8kpGeHxwW5EBpPeeIouwT5ofig+yJvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999079; c=relaxed/simple;
	bh=6PbmenX2LEeW8jN3Nn/1RlvBvwHpIFUxkkLC5NdK6l0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CIaKgkFSyiP1+JCQQ6ij38Oxe/I1jS8kygtqILxW30JVAZ2tozJHp7x3CLoXMSSV7uWHJMeqS9P8KQM/aMwNMGbe/GzCeILC8rOsJq4l8jAreQs64HBqOgDMij+G2KuE8ZtTj17ZIDeTwKN0RVlV7bqM7E3WTmUynOXp9qodN9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XnVwmMq8; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XnVwmMq8"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30761be8fa7so1957261fa.2
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 13:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999075; x=1740603875; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qd1m4u7A4ptICedezSzy+OtXgenTplb/TDvgBRHVg4=;
        b=XnVwmMq8tAfpC5jjslQPFNmvOcY+wwOD57HyPCLBwd96a1+N3JE79DD9kKs1zwXfKF
         N2rBgrZJjJdx0uTprouxVDzuRDB6eYMNNWeRdwkDK7vyZ+h6minROfnif2icOpkxsETh
         xutKNGuLlXyLK+aNwuiT2qJyIG89Rp60yhtnUhXVRHj5bmk4rG3Gc6b75MKYy5BP2SMS
         qLm/z0HSzLWa2jJe+ZtgEgHv9LrezFzJbHwVE2/tCWkSsH4wQw/obHMkuHFX1KH+Rj7C
         +UzzkJwLsF0osNdmRuwMgHKz3ATEtjPgsz4nRAJXzkamkKUSpok9WevtAGVdM8KlTAvv
         ImIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999075; x=1740603875;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Qd1m4u7A4ptICedezSzy+OtXgenTplb/TDvgBRHVg4=;
        b=PljxVSOwWN4mN5NRnUuzk2S+eLzJ1trE+izJvrod0QJ7xS2m5dpLcUu7QKcfB2yrs2
         +PD5duGPF0qPD9iJaN7IaKECNW27MAxwNSqiHnxangpF5hjupvgOK5eQHnWxyV6Gcs4X
         SJYFUCCfijmP6Fzv52hRPxXklqS41qrKuOmoLwL86MJidBYDYPIRVmx5Fn2+cRjesgj6
         tlnv5jqyx2DA0ZueF6z4g25+c4enbDF1Dv0pv3/2Vjt7ehiubQa6vJO6GGMBufSb1wF6
         iadc6Zx9NDKziSt77L9kwWPMTBKj82vZU0dsqhwylAnRTU4638yDgNUmN+FzNWH973tX
         xqRw==
X-Forwarded-Encrypted: i=1; AJvYcCXf4+nyQc9Mo9sCgqoS1b6R+Y1ZEu9b332BLDT3LKzva4xY7GhrueMC8eVAhCUwEk1Tr+A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKfTgF7vUcXcfBY03rgL60Q9cV5EUILEuTu1+GitrsFtY5q3z5
	7YWQu4tsRegicqaymL/mM0u2LmVLqjc2KNyVM6O/RhUsYMbgaWSWcQE2Ca8lLEI=
X-Gm-Gg: ASbGncvo5Wlm4xnCy1f866aLfDwHznChP1X42anhxTa+o2wLscXmgVqrM+0lEMutLbG
	r64dhtK2XdsRrlldiVhW5TRuGqkw9u97VM7xeWO/0LRD24Oprq0nFUvsD14HGoDbxEn3bMM15qo
	kUwZIhca+9/F5MC0Odmc+sMhb8twPytMPT8o14N8uccxywcMX3n3N0DIb9MGXFmg8zHtvVauHbe
	XFUs24h4zb5PqnY3HFvhcmjU+A+PqJM9oULfkfqwoZeZ4KXZMuX3h4nItS4cK7EJKiN2RcIahVX
	LhdCS3+qxiq+lp3radKsVi5LkA==
X-Google-Smtp-Source: AGHT+IE18SzMLwF3utlkSZJlOpCr66UsQEOcgJJYDVN6NXM/57M0cClIXolDeJb8o7FFzhwJQYeJ7Q==
X-Received: by 2002:a2e:7d17:0:b0:307:db5f:c44f with SMTP id 38308e7fff4ca-30a44dd63bemr16825581fa.19.1739999075258;
        Wed, 19 Feb 2025 13:04:35 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30923bc174dsm18977791fa.84.2025.02.19.13.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 13:04:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/2] gpio-mmio: Extend to handle pinctrl back-ends
Date: Wed, 19 Feb 2025 22:04:32 +0100
Message-Id: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBHtmcC/1XMSwrCMBSF4a2UjI0ktw9TR+5DHKTJTXvBNpJIU
 Er3bloQ2uE58H8zixgII7sWMwuYKJKf8ihPBTODnnrkZPNmIKAWIEueXCMFH0fyHK11Grumk+2
 F5eAV0NFnw+6PvAeKbx++m53k+v6Zas8kyQVvjDFWQAuoqtuTJh382YeerU6CfVsfWshtpVvpl
 FGobH1ol2X5AVz9FPLhAAAA
X-Change-ID: 20250213-vf610-mmio-eddfaeb6b197
To: Johan Korsnes <johan.korsnes@remarkable.no>, 
 Bough Chen <haibo.chen@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 imx@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

If we're using gpio-mmio with a pinctrl backend the
direction callbacks need to finalize their work by
calling into the pin control back-end.

As I was made aware that the vf610 driver was missing
only that to use gpio-mmio instead of custom code,
I took a stab at it.

This patch is made on top of Johan Korsnes bug fix (v3),
so it needs to be applied after that is in, if this
works.

Plese try it out on vf610!

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Use the port->gpio_base for accessing GPIO registers.
- Specify only GPOR for setting/clearing/reading the
  output, hoping a RMW on that register works with MMIO.
- Rebased on the applied v3 version of Johan's fix patch.
- Link to v2: https://lore.kernel.org/r/20250215-vf610-mmio-v2-0-4a91f8c8e8d5@linaro.org

Changes in v2:
- Use the dual input/output set/clear registers for output.
- Provide the BGPIOF_READ_OUTPUT_REG_SET flag so the driver
  behaves as described in the commit message...
- Drop the now unused spinlock (gpio-mmio has its own).
- Fix a speling mistake.
- Link to v1: https://lore.kernel.org/r/20250214-vf610-mmio-v1-0-6cccd0292e84@linaro.org

---
Linus Walleij (2):
      gpio: mmio: Add flag for calling pinctrl back-end
      gpio: vf610: Switch to gpio-mmio

 drivers/gpio/Kconfig        |   1 +
 drivers/gpio/gpio-mmio.c    |  36 +++++++++++----
 drivers/gpio/gpio-vf610.c   | 105 +++++++-------------------------------------
 include/linux/gpio/driver.h |   3 ++
 4 files changed, 49 insertions(+), 96 deletions(-)
---
base-commit: f751bf0670cbb166c58e99d57373765405178426
change-id: 20250213-vf610-mmio-eddfaeb6b197

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

