Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBF314F104
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263015; cv=none; b=HlLSDvBvUqlB3ACOQemPWFxSdWzadJFiaTaeRBFVEQkjICKLIaHYFN1m6+OoutbsRfloTzjmM9Js5nAO0v+GXKAIiSN0HY7Ipxn74aDI9VDRQ/0S5+QiTen59S/o9VMRDUI1sewWxjgtwsZ7qmLQvSFJyQ0P394TRTgf/gYr6WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263015; c=relaxed/simple;
	bh=Gj18F3f1TSAoQRVNCsyV1gI11tP5LM9Rqa64rGsdmQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UIwFacpvgYQxwPGeC+5/GQ+J78mscDjGn6EdxLJvzClEPwuPqlyWryWDGV0dihGoPAp+KpJcRTvHrQiC5l6gokl1aFhwGDb1q83C8Dg/2cbbczO7FjDLNdTyxJDkGU7siLZk1P2lwTb/ZKfs+10Kk8HXIScDzSc+Cwhp0QrImHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhDDnB7m; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhDDnB7m"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5334879ba28so5468154e87.3
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 00:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725263012; x=1725867812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uNCVUDNX1Tv+YX7UT89aRJAFgOTdoz7usQFFO/n4QDo=;
        b=jhDDnB7mmYfxiwczqnCDnaVrHV9beURsyZ8o68cMrqUfbsvh7n0sXQBDuacmJtOkHJ
         tjz+/Er1IYe+pNNZJvPJQmuOpY9vvZXxIFpDCIJXj9cvUlElUFgBsDCjldxvBE9ECPT1
         TVQEZe3hokwPGkqGOY5lqE5a5aV8LTInW2UaHt1kRy92RA8nqP3Beg1pt8NQLVjPPVvF
         CSfIH5UsIBQUen1kDhyRKDQ/KwJ4iheJ3UcxDXS0ipZwEbauGJoM9gijg6eQfMzxIr4l
         lyiPxzqNw7ATH8+jbFBOW5GtMinqJexpEm79soNGyCA2DQywfnYPoIqc/akGSokHeMu9
         3wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263012; x=1725867812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNCVUDNX1Tv+YX7UT89aRJAFgOTdoz7usQFFO/n4QDo=;
        b=vJ5eDn6ybyaRJGB/RN+y6DZqCi7YdQn8gs170zUymWFA8etTZa8n2TrUVg32XLvcl0
         zXrnydCRbr6VWDEWN8DRth+7XIEgjOtDFRYAbl5oPKDAzn0YuLxWRKGcvdogWHn6FEcv
         9yQRP+UkDjYs6Pta+XvWAJI/Fii5Q8MxgEK9wl0PjHTNleeJ/FQBb4RxS/jCn49vZyyX
         BhfQN6kArTBzk5lD1pZdivRJ3cm3g1uJYiq1zLhktCI47BgRQUR6v/jKxzv9kkQqT4OW
         jaYT2flplw3rSye6h6dLy5QLJQultn/QlUOSxJi0sqcOMgTuXl1SOiyukjsif026lo/O
         Aizw==
X-Forwarded-Encrypted: i=1; AJvYcCWfmBwnz0qtw1E1REAqaB8iA0bejuVfoEcbbII0eDb7hZN8Zeiiq7v+0tTV0czNe0WIASs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8NECZ60E/B5uHKrgABTa2n+2ft3XjrspUZmZWH80wNPnb3gaL
	4r/0K7ldwPdN6LUbLhXu5kjN4OtloPvWhKhl0RD33Wow4ymQCM7t
X-Google-Smtp-Source: AGHT+IHcXHMp2hddblg4Vie5l/V96lceR8sJACnCm6U91yljC/ORh+PPtQsZlU7/5QfIZ9YAggRkWQ==
X-Received: by 2002:a05:6512:10d6:b0:52e:d0f8:2d30 with SMTP id 2adb3069b0e04-53546bb8cdbmr6772043e87.59.1725263011378;
        Mon, 02 Sep 2024 00:43:31 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:3786:cf07:4865:dc9f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24ff04551sm1975931a12.35.2024.09.02.00.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:43:31 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] i2c: imx: prevent rescheduling in non-dma mode
Date: Mon,  2 Sep 2024 09:42:00 +0200
Message-ID: <20240902074330.6349-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While running tests on an i.MX8M Mini connected to a TI ADS1015 ADC, we
found that the ADC would stop responding to i2c requests because it
would timeout after the bus was idle for 25ms. This timeout could be
traced back to the rescheduling events in the i2c-imx driver. The
problem is that if the system is under heavy load, the schedule call and
the wait_event_timeout may be rescheduled too late to reach the 25ms
timeout. The same problem may occur with other SMBus devices. Therefore,
this patchset removes the scheduling calls for non-DMA mode by handling
the interrupt events directly in the ISR instead of scheduling a task to
handle the events.

This patch will introduce some bigger changes because the logic for
handling events in the ISR had to be rewritten. Therefore we have tested
the following combinations:
- i.MX8M Mini with dma
- i.MX8M Mini without dma
- i.MX8M Plus with dma
- i.MX8M Plus without dma
- i.MX7D with dma
- i.MX7D without dma
- i.MX7D atomic mode

Because we do not have any devices that use the SMBus block transfer
mode, we were not able to test it. 

The ideas are based on the RFC:
https://lore.kernel.org/all/20240531142437.74831-1-eichest@gmail.com/
However, the handling of events in the ISR is new, because further
testing showed that it was not enough to simply remove the schedule
call.

Changes since v2:
- Add Acked-by tags from Oleksij
- Renamed i2c_imx_start_read to i2c_imx_prepare_read
- I did not add a Fixes tag because the issues from Flavio have a
  different root cause and are not fixed by this patchset

Changes since v1:
- Add Reviewed-by tags from Frank
- Add new patch to use readb_relaxed and writeb_relaxed (Frank)
- Update commit message for patch 1 with some clarifications (Frank)

Stefan Eichenberger (4):
  i2c: imx: only poll for bus busy in multi master mode
  i2c: imx: separate atomic, dma and non-dma use case
  i2c: imx: use readb_relaxed and writeb_relaxed
  i2c: imx: prevent rescheduling in non dma mode

 drivers/i2c/busses/i2c-imx.c | 357 ++++++++++++++++++++++++++++++-----
 1 file changed, 305 insertions(+), 52 deletions(-)

-- 
2.43.0

