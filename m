Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1BA3009E2
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 03:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149156; cv=none; b=WfPE+IRZNeQdDm0UCfvrokXnrosE27T6Cea2ZwDdOHMgVkmfsjWWu4JcSrhSZestU7bV8nvobj1WEvLe7YG+Npfe40S2SeG5ilGvWBK+ZjmPgJ+RH2pTSz+LbWUmkjL7GH0iZLL57hvy1HXJjOhA47BxajuyhstgKFuoUaAP6Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149156; c=relaxed/simple;
	bh=5idmto1kQjWZRSxLHpCehDOoykYdwe6Ve3kdEE0kCRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aAHWbzTHFQnEIZ+KWQkM+XIYhCXFXwN9t05ZYp1lD4dZDZmPdL37/UwlRBh9MDCm0FNANs5T8RWO2DkwcZY95IQzRGXHrPO1RBaMPxcNCK/gemHEP7PeTZw38z9hTwWVP4sfhs2FISPXMAh2+K4JVVHGm1S7j9F61hHmDnVRFtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ehzo1d33; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ehzo1d33"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c8584bbbf2cso4937809a12.3
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 20:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149154; x=1781753954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VRuVCbEtc0C7t5RgetDXysYNFKdENiHIcQZQ71JcPw=;
        b=Ehzo1d33k0fTnpOvhceJ+GgmYv1VtVCVoBX2/lgh2NQjb4K4HbqmUUNsCImPiBMeRl
         8DhYpbcXdZ3jbky4scP9rz6ztNT5CThSItXHoLC03EjX4+yBk/hIXtaZatGK9E/wZSV2
         zBJBLpB431Z9Q2UZ2BJg3EqFfecIc4Js9BfIQHTjNFYwKAP2Lgx+AFVuzI1wgZ2FeoX3
         hFVSc/sSXVs2CBATRL0Lnm5BYNiZjar773mb01UlvVOkV9MZtDLf/63qQ0MMiS3KZgje
         DywceHbCbl31k0w+Bun/KYXO3cPGRZWQJPutRdHgHcyWKatDzhHXGRxInywUtwqjPRLi
         OiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149154; x=1781753954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VRuVCbEtc0C7t5RgetDXysYNFKdENiHIcQZQ71JcPw=;
        b=Eg46p2ucqYQUkhvxbRs0mvzy/UgcD3LX7NWfU9Xp7DDesJK3EM5oIkbKRggYCMZ4ar
         f7i49V4GBDIdNDkHvk90QtWzP7ef+fBFYhkVW1sgNljTR7oiYGFrPqoDbgQHwVM0V9kG
         apj0qDmfaEG1TbX5eTJo5rKaDiM2vFK8RTRYGELW1H/o7zu6IlsU4CjXtl9lc8F6MrIm
         b+DvDBDi6sZN71m68KJbOPBVVwlaRgCKl16eGuKzR8XkPua51tIV5rTROonOiOt7Fc0q
         S5ixKaG/yvaU05znCA2NI9pv1AkHLVmncyMoo3dUmRiVMkoGyFIbFhZBFAl+Er9Pi42v
         /19g==
X-Forwarded-Encrypted: i=1; AFNElJ99qA8OE/bIWA7snboXkqOsJjdxPz/bKITWlXYaTKh9N6ZrQ6nDtWPoPKsWD99RK8N2l7c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzmUZHR0j/C/5JgJhK5+btlwoF6GMd4r9a4f7NSbO5voQQHPpr
	z9F/C5b5Dn9/oV41e+HVshdte//3NBbgpiU+tGZeJNaJKLDx0yFg+NhK
X-Gm-Gg: Acq92OFyzE467xzkyc8R+XW9BWET2eJ5SqN7uo8Lt+C18oZM4LoOizG5Y/gLuuXKH9d
	5tRSC6lSVxN3pQl4G7kGTsOdk6nFM7pGCYm1HVBW7NQWjN+KgwKcKHZFlyQc4nwsKZHeWjWO677
	jToQ51xbX7nqlFuX+xHvkJDv9LrF+zpLCH6DpeMra0TkSSnAv2JB6xLIyy40K2rYXM91u4lFbkC
	j7StK8+lCLYGZUelyP6f5c+V9uXsqHm1jVkbl3D1Ep7lYIJpunmyQy1RZzrHvVjnsDJMnJk/3Yf
	uY44KAlOGsbFCn98j16g29jCLcCCaPm5arJj1MrMYu+bkvVAktQ9MBm0ng/pKRXmNG5/E8PAkFM
	1gLQyBAw+6zmhsbRGRwbY9up/qfK/ygquqcUqoev3t0IqSvUoXgGd9glFeh/1WNd/zta8zkdagY
	vl6+l6B5B3SP2iDALKpH5UDpG0igtwcvf1XiB5wwDfi/YuKVZOKzY8l9dVOBNjkvua9WAEFKu9W
	POqoeapakB9ENu/S/dVJk/zqlpt5YF3S/S8IWX/NkZn5w==
X-Received: by 2002:a05:6a00:2e93:b0:842:57e8:1bdb with SMTP id d2e1a72fcca58-843368fc321mr1004033b3a.20.1781149153985;
        Wed, 10 Jun 2026 20:39:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:13 -0700 (PDT)
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
Subject: [PATCHv3 0/6] serial: mxs-auart: devm conversion, clock rework, and IRQ ordering fixes
Date: Wed, 10 Jun 2026 20:38:50 -0700
Message-ID: <20260611033856.6476-1-rosenp@gmail.com>
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

v3: two more sashiko fixes
v2: split off of_device_get_match_data change.

Rosen Penev (6):
  serial: mxs-auart: fix cast type for of_device_get_match_data
  serial: mxs-auart: rework clock handling in mxs_get_clks and probe
  serial: mxs-auart: use devm resources for iomem and GPIO IRQs
  serial: mxs-auart: fix IRQ registration ordering and manage console
    clock
  serial: mxs-auart: clamp RX DMA count to buffer size
  serial: mxs-auart: terminate DMA before releasing channels in exit

 drivers/tty/serial/mxs-auart.c | 145 +++++++++++++++------------------
 1 file changed, 66 insertions(+), 79 deletions(-)

--
2.54.0

