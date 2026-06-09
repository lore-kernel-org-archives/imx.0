Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9167B3AB5DA
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 22:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781044656; cv=none; b=HnneoT/QO8Vfv735ATgMWCHP+u/b8mK43EiFekVzP1vEGHJfB2Vv+SYPke4JCKZE2szY+OMFmarFA94NoNTpgPyhsVlg1aYxO9ihCjGSJ4Jt3G1X0FeJNh6QU1Pm5Tcdb95278c323EfXj6h99AsKDgzq7PoSdQ+BcMY0UmmydA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781044656; c=relaxed/simple;
	bh=v1YU80TyDjrf/JHPL91vspsLFYxHtHImDi2ezqOw4BM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ryWn7TFNmS7sGauBy1eBaW5j24OlwAKlJDZ75tMgBRpGCEFGTCbJe0avoe2nd+B7xOVJ9j8Yzk/OYE8rctC5HifSL3faPj60O5j9lhsiiOgGwwYKJkoRc73OKEV/sl3OdHGsJ+HRHLxU/e/doMbAoJeA3BQ3yV6R7XxqXWusYmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Znxos4T9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Znxos4T9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf22d29dabso40856245ad.2
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 15:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781044655; x=1781649455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kO2t5PyjdfFMvsUWeszR7GAdmLCj2iCqR/ekO1AQQMc=;
        b=Znxos4T9+4ux/2NQHmHagOBrAUS3cvU9BcS2rUrazjcsUbuKJvmgaGdMbtaa4iQXag
         Yg7bEPlMt5Y4XcjXkPH4w83X1BmwPugNXVTlxUeVvOT+rUg9mMZilueneVjlukRiZKES
         v8TLivug772NtjA/LesMEd8GbBpHsOwWa9BYJ4DXka2cettM6xuwAMz64oLwrJHUVqVd
         7Y5vbuhOu/GDcNeQg8vRcv4XEhoBDkuyLpDfOLFHGSZjkIi3WFnPxRzVjVjJ3OaDCMjG
         Z+Z5V4NyisvAa1c1R0Q8AvgVL117dsnlfqrEoiFonxhFIB1YcEO/GEMxWaBG6rH7txYA
         hS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044655; x=1781649455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kO2t5PyjdfFMvsUWeszR7GAdmLCj2iCqR/ekO1AQQMc=;
        b=h9BLGcHBpaXU9FjUPZciOEROhHJS11Ctz0HqpmP/Wkfa0KTLy1NH0gbetwXp11IhTv
         IohYUH6HAbP67+cIlOFb/6s4RmjIEkUoqNzt7Ou3q7tETx5lK5JdGOtOXnh8q6R6wpie
         9wDoWzp2wAX8pKpybgF/Xklp1vF3MTZlSkVuO+906x5AatjycZhicceM/Qgn0BvDa8G6
         a6U2LcBQX5k9w2Lqrg6QbZcLTnkpuBKLjZOLvJ1MEvCscQvztMePhXwLJwxJiWLoBZKL
         xzc2+junxkBZL0FhYaJLSB6DDJIeQykugxQxdHybCwdTvi5WxbD917Fe6zjTWmWN9AEN
         h0Ng==
X-Forwarded-Encrypted: i=1; AFNElJ936QamJK3gMeMGwz/UrL+RN81Q2c6g9bDq78GJShhFLNKBWGlx36QfqCONUYDdFXhHo08=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkzEq+epfYiLETpwVlwbMNsPSHEKkQPZJZXALVsNVTnK9WirZm
	ZpUUW+S+9mia5CgPItOhEzldPps20QwtA+kfahjzRy7vkk8D0KB1JkBr
X-Gm-Gg: Acq92OFVbA6xXmSaOJn3zjt+kRZgxk/KNigAC4KQAddqV3JjTc4+AE92Q5uo5oJqciq
	IQpxBD+n1nSauuB0Iibyigzsm1ypkIQpwg5X7YadWRi19MvcERUdYvWNVSMdXc6zy8hrYC03bUo
	L0EMXCe0wWf6K8n2z7quXYd74YrzCofK9tE6PEqIC4sCudRy8XTZx+PLaldLo/fgiY5GDtpfcDo
	BrQI216JeuSAlbAzu0KPIZjGly+t96PqzlN0srRms8beaI2ixZVerfQ+9vfDyFQ88HW0/Ky9/ug
	06wevOrTWScO8fo978ADuueZjU08xY+qwNjBwqsM7GTGciLTmX4FON8gHjCfc96SI4It/6eMbsn
	Ogd+Nlbk1KgxR0gZ8wdAWpxmPHWYKG1AIYa1xKHB9MdokQWC3HlVHkF6vIw7/qegQHribDfKRvw
	Xc0542SFdIQa45SaWq1K6EfHxcQRu9iM0Ru6aTE5RAQgTuogysVSpM/lUuZ5jcOuORIS16sAM4E
	X/PfU/h5E+KiKrIsbUsB1YJusExj1g7CBLQNVAUN75ckw==
X-Received: by 2002:a17:902:cecc:b0:2c2:9254:4c22 with SMTP id d9443c01a7336-2c2a1c66cbcmr59800935ad.17.1781044654694;
        Tue, 09 Jun 2026 15:37:34 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm293750655ad.9.2026.06.09.15.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:37:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv2 0/4] serial: mxs-auart: devm conversion, clock rework, and IRQ ordering fixes
Date: Tue,  9 Jun 2026 15:37:13 -0700
Message-ID: <20260609223717.41670-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the mxs-auart driver by converting to devm-managed
resources, fixing clock prepare/enable ordering, and addressing IRQ
registration races.

Patch 1 fixes compilation on 64-bit build with W=1

Patch 2 reworks the clock handling to use devm_clk_get_enabled and
reorders clk_prepare_enable after clk_set_rate to avoid
CLK_SET_RATE_GATE failures.

Patch 3 converts iomem mapping and GPIO IRQ requests to devm,
removing the manual cleanup paths.

Patch 4 moves the main UART IRQ registration after uart_add_one_port
so the port state is initialized before the handler can run, and
manages the module clock for console vs non-console ports correctly.

v2: split off of_device_get_match_data change.

Rosen Penev (4):
  serial: mxs-auart: fix cast type for of_device_get_match_data
  serial: mxs-auart: rework clock handling in mxs_get_clks and probe
  serial: mxs-auart: use devm resources for iomem and GPIO IRQs
  serial: mxs-auart: fix IRQ registration ordering and manage console
    clock

 drivers/tty/serial/mxs-auart.c | 141 +++++++++++++++------------------
 1 file changed, 63 insertions(+), 78 deletions(-)

--
2.54.0

