Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40B157A67
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052057; cv=none; b=ozyYVxK5fElI0nIxb9B4jCB5rL0DYgGK1EvV3wWPHYQm5YHQHUn95eRI6MyVLpH7dOwAVzXF/UDABvKT/ZYSPxNfnFkUdapfFWzCtdYMV9o9J+13ahCPE+7WvSbqhAtW2fEIg4VXE7gtynM64igC6E3o9qSiHF4tBcsQcYNtsyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052057; c=relaxed/simple;
	bh=/eNdDVOVDYiWGkkSl9pird/Ta/uKb5lEJFwZikWN/Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hBJ8rJ5sXwgEUwHk4jZlmlicxI7ywkPFyquzhrnMNDWFSNBdDMSW7CBa7xMnPH10a/fwdXqKYV3l/BfjhD9QZ2O437cDq3cP9p6Qx1UF+3j2oyhN9hZKMB/T5lJ6znlPKR7/X06kVwq7HdUj//+w3D4ZqwnOIOBKbnoxwJOT4vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kk+gjO1n; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kk+gjO1n"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3718706cf8aso2546215f8f.3
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724052054; x=1724656854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QBJBMpVP1Qqp6dsvradH2JN9txbqE2dyspVTQ3WIhME=;
        b=Kk+gjO1nEf7yv/2VENW1u7vdj9fe5h2OfjIvqH2WlaSu9Gh459mdgOYxigCwvqaqJR
         w94bKrJUZsPA1MDpEyT6myk+Wxr8yolypJ0bGSUbYWRY2cri5D88X3+fge7+SVAWFhRy
         OmFcwTaXkaizXv1O5MG58L39WWrl5bt8VLuyDD9rO02hC4LKQ2jOAU6sVwY1Beh8+CDT
         2ElaGlkSbo7TeyPd+xkxVF8oKeZ2AeeNdbgF0okR6Nj9lDaZy6q751tLuBoFfknI3QZJ
         eHjIOqKWras1nYJWv42NAc8Wb72hnTLGRfXyXJZk1HDOGvmzJB9xe60RBucbfY4adP27
         0yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052054; x=1724656854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBJBMpVP1Qqp6dsvradH2JN9txbqE2dyspVTQ3WIhME=;
        b=YQUWWOMfmRbRjkJWAUy7MKi4R6ViLxWdJW+9X5rr7OixWDXYOAq2kxdIzD+wRRH1mQ
         FF2tb8bc6zdX9617sBtvUziyyecqPtYnpzvB48RcX0WodHa89qw/OxzJjTFi3RYkDyst
         ZXIoFkkiGtnP9LDniAG3q88zQDZXshMhE3cBgyUb3R8OlWQFXZa+5dxZTP6pkRBNrxrt
         ppYzfqZgkftseWVS0EJuzPREPlEX7lFLJG3sMfxvuQuMAUpbrlOHzatF1hWTcqk1znmn
         mrNBHAq2UhzWgTvqLYpSE0x8VRUkPwepT6C0+mrrJqzsVRxp4Hxb4OnlXEZNbZCrcrgk
         lXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX38zOyNwaeNld4W9wGHiibBEbkgOQpGfc2UqgEThjMwRZ8AC6xvdK/3y3XW0ThiFbadApJ4JjDEnpgcKcCApZDt5m7
X-Gm-Message-State: AOJu0YyZ221JAyF4Ht7uz65zRLEh5v1Q3UtSI6cPtmPqXBqvieA4oQJr
	l7QIJPkp12CI5o+nFDmKsVaQDc5hSg0sXWbAH35ZrZvABr9h7fSk
X-Google-Smtp-Source: AGHT+IGxcSb67STOheDAxoW59TY02P8MKyR07H01z1D1mGbC+c92uKM/LcrctGwWt4LjNXGv3QUZUQ==
X-Received: by 2002:adf:c00d:0:b0:367:4e05:bb7b with SMTP id ffacd0b85a97d-371946c309bmr5852163f8f.53.1724052053868;
        Mon, 19 Aug 2024 00:20:53 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a64c:8731:e4fb:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189896a9csm9683734f8f.79.2024.08.19.00.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 00:20:53 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] i2c: imx: prevent rescheduling in non-dma mode
Date: Mon, 19 Aug 2024 09:19:06 +0200
Message-ID: <20240819072052.8722-1-eichest@gmail.com>
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

