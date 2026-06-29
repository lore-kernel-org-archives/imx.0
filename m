Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9669C373BF2
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 02:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782700721; cv=none; b=IuHFA139yJWgJpekCn4smjvla4ptjJGNriv4XxETBhsbKlhrE2wkMzQlg6q+W9IFHrFP1MUp6Qalajmcql4bqT7xaZD7dQ2nic5qZdDXNzoKcAVT34Ca2VOPpKJYgKDyxRHgxWDOknt9LceyXjTbyqIBbk1Vvc72Lka2XJ/mNu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782700721; c=relaxed/simple;
	bh=DkX9vTSiFgNjVTUlOQE2kuUmogz0cH5iWuiWCqbkZpc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t5MZA4TUbsi0mTMfBbTvILvl91mmUgZgKV3qYvi0kYZK2Ykxwh6qEvkEHXCXpPLec+Zd+wmI+Pv+88K/XsdB8W/EvIOUeWUMJqcAIHx+Obc4tqeWkfxxvxEvJDH02+hcMmU+iBqCWpHoB4BFK6eS8yaG5TAR3PIF2YFrU3Flo7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CctaxSVO; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CctaxSVO"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37fa53bc22dso1723213a91.3
        for <imx@lists.linux.dev>; Sun, 28 Jun 2026 19:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782700719; x=1783305519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rm7QBZ2TRjajMaYCqvf/rtcGfIdt/uUAyLjjoINRG/E=;
        b=CctaxSVOAmHUgZVVxC3KZ4V1CVwXZ9+Dp3NPiBz65Acw7DMi3SlizOH6KhHdJiMSOs
         mHsLlcrMfYlZmnrIe9ehE9UWacE2Pq5w9J+ENUb3kkwHcM9vfGh/qAh9bfR6Oo37IBce
         5dD8VEXz/fmWTdrUTgVjnd+JhdD+KuIRr3WZH3GNaTVeleP57Omb5p9nDNPQmA4R/9Vh
         xqYR6jpMqMf7N89Ro6JfN20oROPny3pqQCr7AxGndSRlNZ7yNwUn0qsmHk8Rym8ORUxg
         Hvn+A/DI88OGDDRPUNyQftwevqtyFYkrQP/ON37aLh/36Qre7zH9seOisbUPQNKlEWlI
         VXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782700719; x=1783305519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rm7QBZ2TRjajMaYCqvf/rtcGfIdt/uUAyLjjoINRG/E=;
        b=fQhoW3Rc+siD43nfDL4YCN5ljvJQAE3lxZu5pHFVLjm3eDukKl6FZizQp0QflwBVjC
         xCgtY2711/0/4+fKxbxkOA+Jl5MmvFlfXI12AjQ59+exz1gaa1k/CRM3SfcdfXiMCMPV
         1CmXN/lySz8OFoCaU5De+PEnTuds6fqaZuIg86G0Czj0QxgRgOcdrRoAkA6djdPWuI0E
         tCcmNSrj4Zc+gcQh7YoXBeQz852Y00XenrwwjRP2fcf2bvZd1x6vIygWWBNcOF/rydtR
         ErxAv7kfVWWMA07/cZ1vo3pguX46oplvT311YSXdevreyf/AiuF8nxaQ84AI707s+fnC
         3smA==
X-Forwarded-Encrypted: i=1; AFNElJ+1MAoQxEWy4cCWxjbXtO+HZaHQ90MMrZJ2F9T7Gb49Cg34rpxedRH4L1qxllzFYaDqVxo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBIGhD4wPVssJ+DJ4LINEPDwepeietr4XrvYy8/+kVoZh0X2l1
	lpM7yhVpNMcT4fDIniCjRS+setDhofsxVMJ10pVjRN7NDFLq+HKgSTKB
X-Gm-Gg: AfdE7cm7WfW09LKDzh+ztQ4KAEGgdDK8Eed1veZDrOPD4rlAJQ8E2SOuJfLTAw4vCZG
	Rg9swy7OmMHI5c3ttuJwHxu6XbEwP1WsKvcAMTXvVBsJWzoCwWDNw6t42dhz3BP9Iew48eRdPs2
	m8/70BtF4H9nbFKUOFbKqDJ81o5//8J8mFkAb34Iwaauk7cnmUTuzjwoY+2kAzk+uoo3nZ2lZUN
	OX7KBoiJ7z5p7iWLbI5vz/2dH1tUcBV9UezX8o1kqI/AA4vAozQPWLCDNQ4R6aINzWJwS501E3J
	1rrsDMU1zVsjW6oMD97CBT6S57CfEIyHb5NP0MwFAoegPVKgDKCzGG+neJ4l6UHSWBdGfXOXZIy
	iaRNjYgDXu8EPB1l2s3YtJ83twpmqKgY0HmomlEjxldgb0m815gJbiY0pe8ho/EGnp0mrtIZyCv
	TraPQ6V9YcC2Q=
X-Received: by 2002:a05:6a20:a107:b0:3bf:6c08:fb9f with SMTP id adf61e73a8af0-3bf6c091423mr8265130637.51.1782700718910;
        Sun, 28 Jun 2026 19:38:38 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b9dc216csm6914869a12.9.2026.06.28.19.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 19:38:38 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: carlos.song@oss.nxp.com
Cc: andi.shyti@kernel.org,
	biwen.li@nxp.com,
	festevam@gmail.com,
	frank.li@nxp.com,
	frank.li@oss.nxp.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	liem16213@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	stable@vger.kernel.org,
	wsa@kernel.org
Subject: [PATCH v4 0/2] i2c: imx: Fix slave mode corner issues
Date: Mon, 29 Jun 2026 10:38:27 +0800
Message-Id: <20260629023829.152651-1-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
References: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two issues in the i2c-imx target mode.

Patch 1 defers slave pointer assignment to after a successful resume
and protects it with the slave_lock to prevent races with the shared
IRQ handler.

Patch 2 cancels the hrtimer before clearing the slave pointer during
unregistration, preventing a potential use-after-free.

Changes in v4:
- Patch 1: reworked to avoid race with shared IRQ handler, as
  suggested by Sashiko.
- Patch 2: unchanged.

Changes in v3:
- Split the original patch into two separate patches as suggested by
  Frank Li.
- v2: https://lore.kernel.org/imx/
  20260625160219.55116-1-liem16213@gmail.com/

Liem (2):
  i2c: imx: Fix slave registration race and error handling
  i2c: imx: Cancel hrtimer before clearing slave pointer

 drivers/i2c/busses/i2c-imx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.34.1

