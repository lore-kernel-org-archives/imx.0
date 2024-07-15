Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD095258
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721056708; cv=none; b=f/wIa1mn+DjjpymKXvtofX5aiUtnxDpKP+1L011CfFqzV7WZkM/aj3D/7jgo9wwkXQIGg/DGDb1Yxu3bqI/oesAjla4Dw9XBEhPe0H4K/UMDCI1Clgy0NDPi9/Xj2WxmktQV+yofrFy6Cmne3wBDbVFdZOj7qi4dYY5j6zH9bg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721056708; c=relaxed/simple;
	bh=NKRudhiuwsTQkqIaLO8AHYDOO8EPapCrBjsIDdxzWJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJMfhR8iLEHYyXeTK4k+C+MNYp5B6Y4YaEiYv1L2fVqZ3h0WdyMbtzyb2z/t7xW6uHAYhGfS/lrReTyZ1xA3aKlceq7yLKzIPSkIzlI/5obQa+pR5ZX7XJ44HXzVn63Y2aErG7VcBthjAacBc64ZiQ8ZqwWTwFlG1k1XFM4HuAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktVT90t6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktVT90t6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36796aee597so2687994f8f.1
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721056705; x=1721661505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eaxYW18928fApQX7NIAaL07nRV5h6qNSI2LYfiTcfsY=;
        b=ktVT90t6YQYaPnp+B5Wcloy1mL7rGmR9+8qaxVkhiZjbeEahuB9ehegt/p975sINfE
         3rmTEI/K0ExqAUmQClDsdilW4w5q7OdaljqLJSert2w0XzXIKNKnKKPJTJu0I93CvuEq
         weVYGamkgnAPfdCcQDzFkJIBacw3HBc3h6sAGwK2xd30IolCN8CrT6nFOdPsgdmYzdzB
         Xa64PYKVQN9RpKqabpTf9P4nAGxthFZ8IVOMeAePhYOZW9sMItPwm3AlukjJ3/gS0vRi
         OFs+ofso95TulO4rSTQ6BF50EMvPp1pzzWU6EsPxfOk4mNC4szIyPFCv0pgE7jUSCzRN
         Y+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721056705; x=1721661505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaxYW18928fApQX7NIAaL07nRV5h6qNSI2LYfiTcfsY=;
        b=MaX6L6azGdzLKqzlZvZG1P/HzGRmnk6bO0uXIwszZY0bdGipA3CbZaQ8OH0qS7mjjO
         TOH7gPSwniN4E9/XcM9iVD932aZngvRnp4Ek2BXEBtZos9s5viHMsg39Iw4Moyn6LCiO
         dbAY3auTKNsIaWzXjug8nksXI4tYT59Akfdx/lGrSE9ydDdVZ4eUGl3cgGBCGnAop29m
         Cy9YC6Cxil143hzyNkhqWt6vj4lb8ZY+T+AEAcypy9F+mqp3or3QcvE+eZM5VFPInZTo
         npq6+UwAFRlLb/rSKtS6vAY8iLF7j1QJAIejeYCBmYZutHNJaKgCVbXdoYYAwkxRwe53
         +xRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4xpaUnv/jXkhiwREf1ZPmf+13OEYxXSfGxpEzB3hXfeRjEk9iR7BMBdUe8PNWEGl2g12lCd8n+2xb+/ml6ChnLavO
X-Gm-Message-State: AOJu0YygF5RLLiRX4WrOTSWFLTKZDUAVr1vkcuwXZL2XVDU8vlVlcwY8
	RTt4y8itms0HZNl7BnCVKhNDBYybYxBxjKlfAklyrXyCYZ2+5nDz
X-Google-Smtp-Source: AGHT+IEhStM/DudKKCc45zVD28c8qJn9CETVW5rZ4uUz3HCOhvrgHcPsLwDzZKsocKkAt3opZvqtEQ==
X-Received: by 2002:a05:6000:255:b0:367:96bd:127e with SMTP id ffacd0b85a97d-368240beb76mr22926f8f.46.1721056705292;
        Mon, 15 Jul 2024 08:18:25 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:564b:c18:f4fc:19ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbb5bsm6682609f8f.80.2024.07.15.08.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 08:18:24 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	wsa+renesas@sang-engineering.com,
	francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] i2c: imx: prevent rescheduling in non-dma mode
Date: Mon, 15 Jul 2024 17:17:50 +0200
Message-ID: <20240715151824.90033-1-eichest@gmail.com>
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

Stefan Eichenberger (3):
  i2c: imx: only poll for bus busy in multi master mode
  i2c: imx: separate atomic, dma and non-dma use case
  i2c: imx: prevent rescheduling in non dma mode

 drivers/i2c/busses/i2c-imx.c | 353 ++++++++++++++++++++++++++++++-----
 1 file changed, 303 insertions(+), 50 deletions(-)

-- 
2.43.0

