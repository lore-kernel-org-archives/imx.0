Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD81378D85
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 08:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255699; cv=none; b=XsCLrFD1yZ4w5/lT+NDIETfOypSyshXP2BgASZZV5uxcJRC+X6ezOxaZaanleZ/PfEuoTEGHvUtqVlI4Ow7QK5DyrTOriVZcLaaZCAUQQnwL6S5cnalg74R3yVQDmyguADNrMTsBCFGUR+gnrYTef8g6fCTdByzrsQKSzs2a35I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255699; c=relaxed/simple;
	bh=W6NG9xgcfT4Z2dlu3OJuwD9rFp6apPLQJbr7qjrqp84=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=LZhaPX9VnwKGn2RBL4bTQ7sGfp+SGFrZV0yCEBWpQ3cpkA2K2MD6+Wut9aShSaRwXBGP4cch3CuhUAw16oQ8jyKlntyJ7lxQuftN6pW3wgkBliR9QoNHszMOxbZqgi/y7Z/4ts0kXhNg84rkwwzCN36wuVKGi6x59PELx1PzU5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONRBsrsa; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONRBsrsa"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fb112c09so22418975e9.1
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774255697; x=1774860497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDc+ycXXu9BZBpDDnQjC6JghUL48eeZBnExRMHFl6tc=;
        b=ONRBsrsapIBkLZrz5gR6qBl3qf31LvDWGXyzMt3/ufeJ4l5oqYQsZ+MzI9P8bD98Cj
         o6ebppg2wwb04s8bIcidN7NJHpLMLIMdGSdzZNzZ6kqSIfiLRM0BNnkzs+zVd9dEp55H
         bPToGxnbOU2qyrLF7p8k0iFdBe7dMcB8PMxYuNNwYgAbK3HX2lOnCQS93khNt2W8VtRK
         tP9oZ6iQ7iDKaAi7xggiEDTRosHxJypUl8FXAIYtMBuiIh8qthrj8QOw6Ct0WfrtoF56
         o939ULZUrHyFKCQF8x0/pKmM9ftZBWR8phsCeW52m1HwVMAroEHTPyjqyOvHcOApQULE
         /bIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255697; x=1774860497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDc+ycXXu9BZBpDDnQjC6JghUL48eeZBnExRMHFl6tc=;
        b=EqY0/y+UaLKKeCgqt2LK/uMzzv31U8EE/6pEdoCzbhI+Y+7UY5w5Os3OLaO8RmhwgH
         6H4r+hVBhq+o9lg0IVdhoEJY6z3Cseum1HTtU98LIgEVvRCbAn8f1e2oQtYn1gDynURA
         eNCBOOFM3e4Dn3IhKggc3uIEHIy2zA2DG4oZIB9WG6TzgQvs1tDUGLtW/DjiyBm+VzJn
         9e5VSvAJa4n12Dk1f0+PM9/m6sWRTC9Nvil9ZJrU/z/JfuIuUGQybaK5EY4GI3j++J2k
         QWq4BtvXQQpgBrsP0/v4ki1exKPheck3SUw5OEa4nGi42qf3cXTwH5mhsucUkpd0a5TD
         0k2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNgjlUIVeobHrLqdPkGWiZ6RwL3JB6ioeOUs82l8gr6O2kk66tAf8ACoEBhPfnQqS6Ig4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/C/RZ71E9zJTTtdBIcWIXYZPbpUvTTUJtgww4gy4SqyC2SUwO
	9jGDzWoYXdCfPgf3AeqMQnSXoN3qYUDlqmg8uT98/DCbwskO87OQBysa
X-Gm-Gg: ATEYQzzdBgU9253WqDCmAS7etVI/0Fo9F7WDpLme6KR93VYZiPmXAaw1ZSJAbqcdU9c
	Uou3YsFR5jOhfifPne1LF4O8rcVahzKRJct1vRSNCVYe2EFYqMoVARYMtz5D7sj9r6QXx3IdeLI
	yBewiRCTb1D2IKLldlw4FPgq6JOs5GialAGOi/VaLgFRhNIGiwix3SudOHk6UHvSAW4g/x1VwkT
	zJBSQ8ONNvwLwCfqC+DpfCyLMYzgK30ZrkZXCyuqvFXvRnYFgEtPLDF2VmOYSWKXkcbiqhX3ywM
	QpRpeKZLTC6QYjLVP7z7QS0azdlI6q2sIGQpT30AwF01qtrNgTv/5NQ18FtDkYzS1eJRDuHTKbT
	tEvHmmaUpjalfkoj5KaaZ6XaQNgKOYwLV0ecTR6TPkCdEiXuTRRUuEf0rkBus8F/9PlItSyFz3F
	srTgtTpq33Rdm+
X-Received: by 2002:a05:600c:5250:b0:485:9a50:338d with SMTP id 5b1f17b1804b1-486fedab419mr176165215e9.3.1774255696490;
        Mon, 23 Mar 2026 01:48:16 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486fe8367d8sm316822715e9.14.2026.03.23.01.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:48:16 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Date: Mon, 23 Mar 2026 10:46:11 +0200
Message-ID: <20260323084616.10469-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series converts the Technologic Systems TS-4800 Watchdog timer
bindings to DT schema and fixes the active hardware node in the iMX51
device tree.

Eduard Bostina (2):
  dt-bindings: watchdog: Convert TS-4800 to DT schema
  ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog

 .../watchdog/technologic,ts4800-wdt.yaml      | 46 +++++++++++++++++++
 .../bindings/watchdog/ts4800-wdt.txt          | 25 ----------
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts    |  2 +-
 3 files changed, 47 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt

-- 
2.53.0

