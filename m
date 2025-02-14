Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3471A83F2
	for <imx@lists.linux.dev>; Fri, 14 Feb 2025 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739574771; cv=none; b=Yj1GmgfrbbCCrLM1hIt8NysXjjyXUJSLLQ0ESz8+hVNkmfKGjcYjMDk2HJGL+8TEGuWBbre9qZjDGUtgdcDkATvuLlkyxK9Cq5HKRGNtFoMC5yzIvAAy9GCipbdPTX8L1mwqFVC0KmkucjjfB9o3JX3y6PMx02NBW4+wQJXudZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739574771; c=relaxed/simple;
	bh=1HodoEsYvID1utfqD+WrCKo+0ulptHHJtuUpdZXnGGc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q07wosNUOO5Le5UDPE5u5C1j9/5UNp1iJmsEESd2gkJGkHtsHK69TcfghvZFgNFKBJt58i8uFEYIi4IpZFsWo2m0Iaie5zCnR8s9whTprmQRF8nOi0iuDqQnHZQ4pk1otQf1/r2vwfBFfboxYPpF+gGvH25m0uHqJB82Weh62co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AWq6xiJJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AWq6xiJJ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so2611514e87.1
        for <imx@lists.linux.dev>; Fri, 14 Feb 2025 15:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739574767; x=1740179567; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=//3kaILmAVCifLR+ZMBAtzVbHvcdVOa4q7e9Zu0PGvA=;
        b=AWq6xiJJOru8UHzlK47T287z4EnSIVxQN9SMe9wAwwX+awSQp484qAw1vACroPdFuM
         vJyk1zD927JQ7XfAg6mZgE0WIasjlqox5/PDwBseZ4YY9RUSSzHcHxc3O+cMH6V1P3oW
         oBlaG9bPZIgljx1pppYmeVQLxnYjmjV9cZsJnVn763Y002TQbPYZdGk+tKI67oZQ/SZa
         NR6T+wBthCwQY5V1AixPqfgflJ7CE3en7rGR4Z2ZtTHHYSdudsc4WAus1K4KDNj2wVZ9
         Ur1foPA9qp+dx52ITDLYmkNkXY3hKn+ehWGJFoCf2TzcgKb/3EvRPhPosOvw7UVo4f2Y
         xdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739574767; x=1740179567;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//3kaILmAVCifLR+ZMBAtzVbHvcdVOa4q7e9Zu0PGvA=;
        b=OW8UCSJPlCXcSdXA5Su5EHYS6+vUiTdF6Mwb0Gk5BTl7Q3e3dPdpLbl3ZH8ETw4MAd
         kM2+jk7RhzcIpKuWCP9F/E6V9agnPPWxMVkjukcBHXO9Lcru1s0IuqdNxaKhS5/jQewt
         Y01XxCueHTfraIoQlu3J6MOgzArifKUVX86+Y5/Oxnpygd+ICrchrd8RMHW1x+9CaYGF
         643R7Fn0czqR3aoUACXuXV+/8GgwwL31Gj2cHmqgLwxmxT8tqT0kbG9jO0lIlJxGTY4T
         z4UM/m8SgRLsJ/PHmFq7kQRFdKp2z1VJI8En16oMBalEYNbZTn2D3f7e7Hve5MMPptew
         Whag==
X-Forwarded-Encrypted: i=1; AJvYcCVixTSAvYyR0cESArj4hT4A2xODg8nfYIbuRihNMq7oxG8X3jSa0sEYVtaj7kKFRGJnbSU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9sRT+D/r0098ftBbVEZKW55P61aigokQtkenKNsZqgBF+WWmC
	iU8YXE9e911/DsYmOdKdgGp0PLLrgVBQvSyTQFdmrZa4u1OsDdpbSRjTEfMIr3c=
X-Gm-Gg: ASbGncsEoMoP97bE35D9ebpr8u0SMIq5l3coybhDY5LeU1zmOZ+rMykYrXxOdmomQ6P
	GNm5OSeSvD27Yk0DOw6hdeQUP0u8dUIPLC4hVUAmhqSoy+oLIs+nIi7soBG64W4SwvOBSCT9ukY
	yhBRinCYsWRwbFgMwi/CLm+YNpLnfwgabg7qXdShFut2+Etb7nMKPz5rVXesecAczYfjdoUhKK6
	Q1HFWUmNGKr+q7FPIB48tAhWgcCHut0RR8Kzzx58+4ua0FpMIQzGqRq4RczCmSzxcY96Pr5ZBHY
	wyWIe2REV2YwRqu8UA3g0GtzPg==
X-Google-Smtp-Source: AGHT+IGd/KOnanlyObtGQI1NfeHu4pY/roPX3rU9GRBVTaBzLAtz1ji+zH2PWmWglvfwspa27dyY0w==
X-Received: by 2002:a05:6512:3996:b0:53e:3a7c:c0b5 with SMTP id 2adb3069b0e04-5452fe26b9cmr383538e87.10.1739574767246;
        Fri, 14 Feb 2025 15:12:47 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452f676aa5sm158515e87.50.2025.02.14.15.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 15:12:46 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] gpio-mmio: Extend to handle pinctrl back-ends
Date: Sat, 15 Feb 2025 00:12:44 +0100
Message-Id: <20250215-vf610-mmio-v2-0-4a91f8c8e8d5@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOzNr2cC/03MQQrCMBCF4auUWRtJYo3WlfeQLtJk0g7YRCYSl
 NK7GwuCy//B+xbIyIQZLs0CjIUypVhD7xpwk40jCvK1QUt9lFodRAlGSTHPlAR6HywOZlDdCer
 hwRjotWG3vvZE+Zn4vdlFfdcf0/4zRQkpjHPOS91pPLfXO0XLaZ94hH5d1w/o4X2ipQAAAA==
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

This patch is made on top of Johan Korsnes bug fix,
so it needs to be applied after that is in, if this
works.

Plese try it out on vf610!

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
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
 drivers/gpio/gpio-vf610.c   | 109 +++++++-------------------------------------
 include/linux/gpio/driver.h |   3 ++
 4 files changed, 49 insertions(+), 100 deletions(-)
---
base-commit: 8e2ad024bbbbd1add00e9ddc4aa943d3a27fa146
change-id: 20250213-vf610-mmio-eddfaeb6b197

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

