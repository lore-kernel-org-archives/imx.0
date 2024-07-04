Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFE31BC2F
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113809; cv=none; b=hS+X2yM4V5QbVVoRnUGDIdyfhhdESq8p++nq0AG0mCAv/ZmyYuxhcwVznYXPFukq4g09dmFFyLBwOwT1hHXflMS0S1B+DOiUnUJYuA8LoOUqRvDsEfGE5kbBPYVlN0HKhVudmbbl+JFWZq67gavfPSkAQcqRnhpriMuFgW+7wu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113809; c=relaxed/simple;
	bh=rm6V+HkqrAt3iBzlQj+eKYG83FB37ocahkPR5ID/Gns=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ItC7B9WpdLrtBuroeyvM4EH4WCJqWiM6+icPJC94DN6mQhCKTo6ANeuZgSGDpGt91sNMqcZH1NN26++FXlUIStd0tOrq4kR1lvBeFcZzMiyxFbWorCeZZu0V0Im02x7v0iMjx6J/h338cCCSfBSgBYf32XvkLxhQW6Vaa8GB6sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VI4U4Hd9; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VI4U4Hd9"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebe785b234so8975911fa.1
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113806; x=1720718606; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H5ioC1B7C90z2GxGmkOViXNkTNH2Pib8pP+e0Gm1Tpg=;
        b=VI4U4Hd9MLJwDURyZHm5lHhF1/v9fTLQwqreqleC4lqi35Iqzwj9IqwnuwUgao7lug
         9JSP96s9ukUPg9jghJnfs8ocR1/Vpmyzy88uXCAJLeDkdALE8FN5qhnqfFrTClAwDTrD
         rAexNjYfo857D8zDLvdbK0QleS1MItSgipGomyEz0RQknRqYenXpyEBuWnPIzVGt75UT
         L1cKZ92gWWrEwCCWDPmFvSNvoprBi3PDVkgHvb+nV6xPRcU63YbFwt4Fe6v00pdQTi6V
         MslKUi/XfquqeFP62Jtu6Zf9ABDpr0CHrnLGeoi1+h6vam7CnYqN3jFdlwGo60pvZnRJ
         +NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113806; x=1720718606;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5ioC1B7C90z2GxGmkOViXNkTNH2Pib8pP+e0Gm1Tpg=;
        b=dbJlCyfRx9jDwWu7TxePSK79d6XVd0cjKrwCcbB6jwxMWSfQVA0LabXKla7RHAffK2
         gfXriP+bHzi75p4tKFC+29a3gP+3nrdhH7pC8VyQ2nZ/EXk8HcWmlxjvPIJH3IjcYjBb
         eHm+0UKbOeUHXqPrRaLPlqKEKUnpwCl5lm/zXKABBhVfW42QbSFmShPwJZpUBptLL6Yl
         FYBMbrrIo1ZIZN36nV+FR99YOvd+5lx1MBByO2gTpenXtvc+tTWrOy88svBaMJlL9XHd
         JUt0aqnSy/yxmYDLNMaHA8BbjxTQDTqR/P/pMvgyq+G49yHvhbN1FrDk8AQieX6HmYCP
         +E/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQNRMXS41fwh/1ZQ21EODM49ptfkVdJSXYU18Igf79JTWoEiGGllXl3ivjZhyagHEtrP/Z8o6hcyOUqI4yUQM1pQCH
X-Gm-Message-State: AOJu0YxHo3OB14A7BTDFaKpAEUcfaVWdykbzJWAZvnWOJPfurZrW1IjE
	fzoae/61PWjq9leKgkklWqqLY4RG/n2zNa+Dv2AjKnLaRz5H6x4w
X-Google-Smtp-Source: AGHT+IHxpM+9xvXLDW81oYndN0iZXo5BCpV4N7sqVQvlL7P+4TIcvLG8Y0qZI6MvjWcccMRwTZBcNA==
X-Received: by 2002:a2e:2a46:0:b0:2e1:2169:a5cc with SMTP id 38308e7fff4ca-2ee8ed42730mr17076041fa.15.1720113806204;
        Thu, 04 Jul 2024 10:23:26 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v2 00/24] mfd: Constify read-only regmap structs
Date: Thu, 04 Jul 2024 19:23:10 +0200
Message-Id: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH7ahmYC/4WNUQ6CMBBEr0L22zULCKJf3sMQs7Zb2EQoaQnRE
 O5u5QJ+vpnMmxWiBJUI12yFIItG9WOC4pCB6XnsBNUmhoKKE52pxMFZNH6MMwbpBp4eCZx2eKk
 tV5I33FQO0noK4vS9m+9t4l7j7MNnP1ryX/rfueRIyFwbS8RUPu0ttfo6Gj9Au23bF1KGvO++A
 AAA
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=3366;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=rm6V+HkqrAt3iBzlQj+eKYG83FB37ocahkPR5ID/Gns=;
 b=jiqTx6tSOfA604GU0jTEgspr6vMPK41qCW2J7KSX8WeC+Cfd43af+Iyi1jHlB4L6VToCSUUIQ
 hk+lFyALj85DmYDNks2goHvTf5kC1tScvZse5SWvGRbMFsj/iQrqHay
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series adds the const modifier to the remaining regmap_bus,
regmap_config, regmap_irq and regmap_irq_chip structs within mfd
that are effectively used as const (i.e., only read after their
declaration), but kept as writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Changes in v2:
- Cover regmap_bus, regmap_irq and regmap_irq_chip too.
- Link to v1: https://lore.kernel.org/r/20240703-mfd-const-regmap_config-v1-0-aa6cd00a03bd@gmail.com

---
Javier Carrasco (24):
      mfd: da9062-core: Constify read-only regmap structs
      mfd: fsl-imx25-tsadc: Constify struct regmap_config
      mfd: hi655x-pmic: Constify struct regmap_config
      mfd: wcd934x: Constify struct regmap_config
      mfd: tps6105x: Constify struct regmap_config
      mfd: rohm-bd9576: Constify read-only regmap structs
      mfd: intel-m10-bmc: Constify struct regmap_config
      mfd: 88pm80x: Constify read-only regmap structs
      mfd: bd9571mwv: Constify struct regmap_irq_chip
      mfd: intel_soc_pmic_bxtwc: Constify struct regmap_irq_chip
      mfd: retu: Constify read-only regmap structs
      mfd: rk8xx-core: Constify struct regmap_irq_chip
      mfd: rohm-bd71828: Constify read-only regmap structs
      mfd: rohm-bd718x7: Constify struct regmap_irq_chip
      mfd: tps65086: Constify struct regmap_irq_chip
      mfd: tps65090: Constify struct regmap_irq_chip
      mfd: tps65218: Constify struct regmap_irq_chip
      mfd: tps65219: Constify read-only regmap structs
      mfd: tps65910: Constify struct regmap_irq_chip
      mfd: tps65912: Constify struct regmap_irq_chip
      mfd: twl6040: Constify struct regmap_irq_chip
      mfd: gateworks-gsc: Constify struct regmap_bus
      mfd: mc13xxx-spi: Constify struct regmap_bus
      mfd: sprd-sc27xx-spi: Constify struct regmap_bus

 drivers/mfd/88pm800.c              |  2 +-
 drivers/mfd/88pm805.c              |  4 ++--
 drivers/mfd/bd9571mwv.c            |  4 ++--
 drivers/mfd/da9062-core.c          | 12 ++++++------
 drivers/mfd/fsl-imx25-tsadc.c      |  2 +-
 drivers/mfd/gateworks-gsc.c        |  2 +-
 drivers/mfd/hi655x-pmic.c          |  2 +-
 drivers/mfd/intel-m10-bmc-pmci.c   |  2 +-
 drivers/mfd/intel-m10-bmc-spi.c    |  2 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c | 14 +++++++-------
 drivers/mfd/mc13xxx-spi.c          |  2 +-
 drivers/mfd/retu-mfd.c             | 12 ++++++------
 drivers/mfd/rk8xx-core.c           |  6 +++---
 drivers/mfd/rohm-bd71828.c         |  8 ++++----
 drivers/mfd/rohm-bd718x7.c         |  2 +-
 drivers/mfd/rohm-bd9576.c          |  6 +++---
 drivers/mfd/sprd-sc27xx-spi.c      |  2 +-
 drivers/mfd/tps6105x.c             |  2 +-
 drivers/mfd/tps65086.c             |  2 +-
 drivers/mfd/tps65090.c             |  2 +-
 drivers/mfd/tps65218.c             |  2 +-
 drivers/mfd/tps65219.c             |  4 ++--
 drivers/mfd/tps65910.c             |  6 +++---
 drivers/mfd/tps65912-core.c        |  2 +-
 drivers/mfd/twl6040.c              |  2 +-
 drivers/mfd/wcd934x.c              |  2 +-
 include/linux/mfd/88pm80x.h        |  2 +-
 27 files changed, 55 insertions(+), 55 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-mfd-const-regmap_config-96da5e18a85f

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

