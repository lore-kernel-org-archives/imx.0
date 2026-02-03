Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A722DB7AE
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770134842; cv=none; b=TEtqdRo59MEjGKxOtufPZwDE2k5pojvJVnHgCkNhRFiRhb5ijGcRhJWnZnZGyTMgvNubSWQ5u+oAHCYW5YC4OjvAFnZUvg1NT/XJYCEmRR//1qdbF8vTpZOdCIVJxgpKdQPFKHwhRY71WfOErEud1zzYiRkPyCrvdffMt/X9E4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770134842; c=relaxed/simple;
	bh=XcqnFlVFb+q5pUp+ILYhKu8XvgoxFm9HCTOCAqQXxGs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fBENEUAVTq4n89xpc421pNtH+vCc6lUpUCRCzR9E4XAoAFS6ucdY/PXQmJBgarEyAl/DWVhH3vGN+7T2ESwwRUgwgZ8qdPWevDAafpsZJUYh3daleUySldh57ksn7RGxC6ZevzRHGiQDNnqQkoXRm3R6Uia6Hgy8lEi3ANShAcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAfKdG1w; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAfKdG1w"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d195166b2cso4657370a34.3
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 08:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770134840; x=1770739640; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtQMwL+gjxGfGoTNzWyOYhGjyrQbkqCiIsEn6qxeGvQ=;
        b=AAfKdG1weTE4hfZtC86wh4d8Nju3nDE5I3FtNu3gT2nexZwBTurJ4GFuxyY6PoZ7QC
         LWJK77SvYCgavmz8i49rwBNx8KhMQf5Oulenshp14RQvmk/ct+UfDDcBqP8YApl7fbKF
         3myYtI9YFrhxgO2+otxPk7hxFD0tg01noR6TMD8KVYHnIj0E5EKnbx4AA57X5nlijbf9
         ZGQzYbJyp6Id5NNElmEjR+5S6NBZgXr/98MZjHf7DBqteNtmXNOl2HGFqp51l6Rq6aE8
         QnBkqnxlFO9bkQBuWxaiQ/Jcwm2q7cpXN2lDNboUc4AeY7hcDW7NjHNu+rzgE7FtlXZR
         7EMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770134840; x=1770739640;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtQMwL+gjxGfGoTNzWyOYhGjyrQbkqCiIsEn6qxeGvQ=;
        b=WRv7xU6kYM63ceu2VANwOS6jhZpQ7bgUqjMS9tX2x3ZAkFMXQ4w4xjaBiD3Ef5VY74
         xQUAYw78SGf6N6VQLie9JJjGsA4Cnlxj2E0EcR7hr0ihz7kj7q2yHdzgSD3gSQFYXKAA
         kpcR1w9LLJkzJzxVsjcmOwBJ2SsLc94zM2kTnKkH2OvY770fD+Wy8erhPo2w/n020WUG
         eFzRZOETo6p0dGoqecMLssIDhwxRehE1vkURQyViRLg93UZ7jlDu/7bUljwLq3RH9xRT
         pe2Tf1Jtha2GqhftD0eC5TM0xhfrY2fr+oy0NfZCBotFvK9iFTQJwOiU0MSGt7UHNZ/U
         aSww==
X-Forwarded-Encrypted: i=1; AJvYcCVXtEmzPiwn9k/ssckqEvek8x4kmYFxxv0ZUpB5X4USVNFcH6f7nSBm+5y4YHHW0qY18AQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws/YE1Pr8hm2ZionHDsQBt3TYqeWzPgHF9oxtNGpyOUS7tsS1q
	RcLIids5ZIYR7wDxRNw9lPrv4K9l2V6yckdA2Un/GysHqYgDHrsi98lJZNjxqrlT
X-Gm-Gg: AZuq6aJsPT7VhQmBz7h6UPB6qmBBtjDdc7fbkdgb9vMj8AWGSwgesWhAX9x9109F/Xy
	jndlC0CqOsphXal2r0vCRtirr9aop61C7bIuwTVvv6o85/g5NWxumTMXaBdQWMxlTJyMBkImPtT
	AnbDGfcyzD/frsj2oFF9ulNtTS/rORhYxcRKpCCEe/k0AR5HvOi7f4+UjOGkgkosX0r9ulAy/xO
	l59zVggFQIKwRffVoE+Pop+i6RtyJYlqWr5c19aBnFuEUksA7FRwiP7spR1yMw9VM601/Pxicy9
	XKnXd11I50I3Bx7u4DBjhQxd3Kqn15FD3G5zuIl6n/8FzNIRZ3jowoaOqxsknb1Tkx5fiNW4yvJ
	YjIok0HFf2LMQAhCv/7fCjfQKs2WpIdh+je6iIv6ZeLzbjKXYE3+eJNKqdfeBIG9u8jWAt53Dx1
	D8UXRoY7VdqKw6dhcrgawNSzfnpQ==
X-Received: by 2002:a17:902:d2c5:b0:2a9:410:23f6 with SMTP id d9443c01a7336-2a9041026f0mr92040735ad.41.1770127689433;
        Tue, 03 Feb 2026 06:08:09 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:f091:7dff:927e:f788])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm7694684a91.4.2026.02.03.06.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:08:08 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v3 0/2] clk: imx: imx6q: Fix device node reference leaks
Date: Tue, 03 Feb 2026 22:07:56 +0800
Message-Id: <20260203-clk-imx6q-v3-0-6cd2696bb371@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADwBgmkC/22MOw6DMBAFr4K2zka2+VPlHlEKYxtYBXBiRxYR4
 u4xVBQp5+nNrOCNI+OhSVZwJpAnO0dILwmoQc69QdKRQTBRMJ4yVOMTaVqKN9Yqa6sqzTslCoj
 /lzMdLUfr/og8kP9Y9z3Sge/rv0rgyFF0MtMy17Kt8ls/SRqvyk6wV4I4m/xsCmRYsqzkWqu6N
 uxsbtv2A/dBS6rcAAAA
X-Change-ID: 20260130-clk-imx6q-9c4b8835fc26
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770127681; l=776;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=XcqnFlVFb+q5pUp+ILYhKu8XvgoxFm9HCTOCAqQXxGs=;
 b=9FwXxjEanYN+X2SsRmYYg5nYD3FjoF7puIvCUqknvObRBF9hSGgd5rmBb+yfTfG4X77VFQCXa
 zUXyP8e/jRKAvZ/07IQQn4uKCxHEPJrH5u1qmIMtlPHyQ2Mph+MdV9L
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v3:
- Fix Frank's comment
- Link to v2: https://lore.kernel.org/r/20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com

Changes in v2:
- Fix device node reference leak in of_assigned_ldb_sels()
- Link to v1: https://lore.kernel.org/r/20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com

---
Felix Gu (2):
      clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
      clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()

 drivers/clk/imx/clk-imx6q.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)
---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260130-clk-imx6q-9c4b8835fc26

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

