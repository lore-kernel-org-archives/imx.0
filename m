Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5E4D9EA
	for <imx@lists.linux.dev>; Thu, 11 Apr 2024 23:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712879788; cv=none; b=cbhsI0hFbQQT049OaWVclHChPWBcdPLnvvJ44yikLqpu3Via/AWiwMoYBj1iK+7ujW3D4wjMNJz1jLEo63QK6+ccStPgVvgo1DkO/d4c2Ob6TlYqMCL66Wqxwsj1l/1kr+Dw6lwaZsrOTRlq1zhy5afO1H0WjUC0qpcwip7E2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712879788; c=relaxed/simple;
	bh=MioIrT4usEvNVbA3gUwhZR5hWnkV5a7eD0MVoAZp/Hg=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=bn6mR2/u7WW47ebxSIH0U8ignJuHJxdWk0SgFseiKqz7mVKCG3qRjxZaCJlr2DY6TWe2+i/zMJ1hArWAQ5Bh8SYvx64YY/hO9kXta199R52H6Ku36KylQ72yjHkeYo3CQhxrwn+eq9RKtzWx39doRQ1RYEQWr2T0HRQpDrtET4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a5PAJ3Al; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--saravanak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a5PAJ3Al"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-615372710c4so5606377b3.1
        for <imx@lists.linux.dev>; Thu, 11 Apr 2024 16:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712879786; x=1713484586; darn=lists.linux.dev;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O0iRscBO4bdcIhUu420mbq2doNMaDlIpBi8l/p1zhKs=;
        b=a5PAJ3AlshfPaFzToeS5jYcsaut6+/moqrN6aZ5825FrVlZozRej9yatFM8aKnIY1S
         MhV20f3l5/p4JLpzVBEuNEjpEUU9lIX+LwUTWBIpVTSesK3WYqXu9vXeeBFp0L0pDj6H
         YmWfU+HQ+Be+OxS5PQymozKuyXD7nInYlo7MyZ0vVwjIK+o4HdNoUUrmW+rl5U0diCRt
         SqwNKC4z2AITjJMLD+u0U8zMcJMJ7avTtE7yBjY/tPPIqrC6uJo/MAB3dbA/vKnArzVi
         vKPWF5MkXq2ukxpRy0PVsAI8ftEGSjEjdFURmQ+dvYEFkOC8txo31814HOLLV+9aatr0
         80bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712879786; x=1713484586;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0iRscBO4bdcIhUu420mbq2doNMaDlIpBi8l/p1zhKs=;
        b=C2mSaMJmXIIDlg4eGRpKqKcR2TBlqy1zwbSgVLTIGN7MVqBwowLq5UHPa+WFrGZHaS
         UAHgAP+6EYsHgtVK+XUqQqatFL59onEzJb++1YESft3Ytzb89a/kwisGq+YMVmjXcP0o
         DJKd9ntl97/Q7C3mTTIHFZz92oQE03CMYO111nFfnTD5OjgsQjIq2aqFtit+Wh7aBfFB
         eQi7PpzRtqobyualTPL+/CkZqYAiILXwvMWLroQm+FzSzlOXAVxj5EDl+baWebYcfwPy
         UX11KkN8oLtxxjXRZwsd+J7IOHIhgTNBzyCtsrin5e0A8ym1VzJn8DcaQNqxlJgeJt2+
         UmBA==
X-Forwarded-Encrypted: i=1; AJvYcCWCdws++KyzjlpGr3ybdfpJdcwU7rO3TOmMbVh0fBWk+1xtJ9Z9XhH4To2P9u2dNyXFbTM3rq6TsRwNmM6iQKKng2Uq
X-Gm-Message-State: AOJu0Yw2Zys+4PAUyTv6ZMhMN6N1O/sAv+GXbs4Y7FnKY2nDchb+xvCe
	Muv1xKs1sxRcO34ub/uUfb6VOF+BjpnS5mw9Xm8FD5aqNvY4QB3BiIU/7bpe/2sDPYCY0gMxLx0
	hi+I+LRqCde9++A==
X-Google-Smtp-Source: AGHT+IFosAoa851C7hPGmSTJhtx34QZTzAQeM/iXE6mN4LYGNHAkSwi0R89BgZ48h/lVqrxY4bUEsjpXIA52Xog=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:a472:f40c:d4ba:c29])
 (user=saravanak job=sendgmr) by 2002:a0d:ea90:0:b0:615:2ae1:6cd3 with SMTP id
 t138-20020a0dea90000000b006152ae16cd3mr215649ywe.3.1712879786349; Thu, 11 Apr
 2024 16:56:26 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:56:20 -0700
Message-Id: <20240411235623.1260061-1-saravanak@google.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v3 0/2] fw_devlink overlay fix
From: Saravana Kannan <saravanak@google.com>
To: Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: kernel-team@android.com, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Overlays don't work correctly with fw_devlink. This patch series fixes
it. This series is now ready for review and merging once Geert and Herve
give they Tested-by.

Geert and Herve,

This patch series should hopefully fix both of your use cases [1][2][3].
Can you please check to make sure the device links created to/from the
overlay devices are to/from the right ones?

Thanks,
Saravana

Saravana Kannan (2):
  Revert "treewide: Fix probing of devices in DT overlays"
  of: dynamic: Fix overlayed devices not probing because of fw_devlink

 drivers/base/core.c       | 76 ++++++++++++++++++++++++++++++++++-----
 drivers/bus/imx-weim.c    |  6 ----
 drivers/i2c/i2c-core-of.c |  5 ---
 drivers/of/dynamic.c      |  1 -
 drivers/of/overlay.c      | 15 ++++++++
 drivers/of/platform.c     |  5 ---
 drivers/spi/spi.c         |  5 ---
 include/linux/fwnode.h    |  1 +
 8 files changed, 83 insertions(+), 31 deletions(-)

-- 
2.44.0.683.g7961c838ac-goog

