Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ADB77104
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753970520; cv=none; b=La9CzkzMpasQpWNuB5G85CPzepVv5zK4nga9n/ouBJdMMAPeeCykn0YNkNySKzKuqVv9YUr9Qe6/jg/Skj+F8B52Xs4dGu5ZgyM0i/Jiz5jqnzw5jenpGoQGOOe0ZwjbnRifaTf67IM95Sl7f1PHiyQVcTcFX602DOTbwzW/cTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753970520; c=relaxed/simple;
	bh=vtDoBOhDgvfsTUyaaPcWyqShvPac5U3nE2ogLxWYfzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZeYX/L3QYRsMKK3ZJNl/pjymez71FIKK2oBpFb5eyQgDZAxgg9zV9HmvEcdhoiM+bs7N48bkBb8XEe/ttO/2d4r3w2QnvKhLcNAPBPnWt3DmFd9JqIH0BUPG3U98fcjhrbadfiRQjm+PIciJaw23EtOmEJ4dx2NFlsG7dLiZWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GP0nCcCF; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GP0nCcCF"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so665714f8f.3
        for <imx@lists.linux.dev>; Thu, 31 Jul 2025 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970517; x=1754575317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GV5s6FOxWw6F5tawQDBpDciMQ1YhmYggnl1ycVHKgck=;
        b=GP0nCcCFlc+L03D5g62/v9a/dUeBOsMulXc9Of3q4uLFJEFVZBWOYiRWTGshnwMEAl
         tNMwMfaf6HMyNs4oVP1AJhDm94XNrwzyzVEQR13oztqVefYBzIgvoGre2m3T+jYG5Q5e
         E+PiUzJqQRywkNsrxWJDfdaKsIt06EeOM//m7/rBKFElODvheDuoIboCEKESIwBFs4ap
         dVikjxvZC3+mgO/tKMbMxpbSEVxn6+ALdj9a4WIqWJbH3EVGf31rez9QN6+XsgERkkQL
         6BXeEmCogj6u3L319KbctHtzPhTw/vT9LYX12wMUrhjg3XFu280dMSpQDrYCxdWRzTyT
         Y+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970517; x=1754575317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV5s6FOxWw6F5tawQDBpDciMQ1YhmYggnl1ycVHKgck=;
        b=oHg+vU5A7bSM/+LVUVZa390jQf9UPW9Z3vVljGpa2IQksNduTQ7xNRwfnQwiLtO2GJ
         mcltg3mFKhMdugDt4cRg5B2IXE12mBMWflP5SOxI5cXKzsEO3AdVDU6u0YnclEAS2+gG
         98XenT44fMl/QP+v9nSpvIw/qIxjAV0BUnuwGwho+vcmVlDWgdNUZDUUqPaGNGtxgEs7
         x5/dKu1df6gQ6UvSYkRnru4bAPNnxpMdMkot63b6KVJr6FKljUAaPN9lFwwAOONl2S6N
         cQyAIKf9/GZ2CMKY4tAmr4L2oSLDg4eSqUCLJiW48sMQafaODDwP9OyV0XBfqyi684wU
         BkSg==
X-Forwarded-Encrypted: i=1; AJvYcCWtN/KY6xecB5fUC9PlFVJjmKlaU0XzjoaCLogfKs6tLC1ov4EDnrzHFtn9L6/HzspCSyU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8YNlfAtel1FpLcnY1l3BL6bbpS8M1AhjNiAL7oimMXMsL9z1M
	IHpveToJu+hFw2q6RdARdi81sVfKmtpwruPYCTvnO8YUQnBv5QkEO9uo9iI/Wp1AtRg=
X-Gm-Gg: ASbGnctBv+l9VwR1kGBpWRkLmIq/ZrO1fNEgK8OnrHlBSExYfsgJ7iJQ5FFAS0Wkkp9
	ZlGdN/NEgcrCKTL87KjQT+zk8XRhhD4pen4ffI8qHv19qRV8+8dYHfSmQ2OChPXb1qe6C9dHAIJ
	dALbOClmUVZxjL5Zgxtia713o01na7aVWSG6gxTUXuIFou+eOWXbhk6henD8O1VdqUyUDbXS7R3
	1IXCW9mAVL2t6mpnFP0sNY1rvi4Ux+HDoBFSw2I8KFmygxwTiR4BrRfZAO+ggcrUgikx6PlQSUS
	bPHSnisirilLAA2OQncTk+89eaDQkAk200Syp/gwDR6sa81aO7NzKAS6Kh/0Jf+oO0rquzVfObS
	OxacPdWSOy8QoGriPCwoz/AZq74NSdPfGWypaTjHw2QqlDgxFtygG4+Vi/PA=
X-Google-Smtp-Source: AGHT+IELpYq0cfUwdhdal+guuoengtu4ASva2Hzj0xykx429WqgpGqubTQ/jYn7p47HzHjuQsPyogw==
X-Received: by 2002:a05:6000:41d3:b0:3b7:974d:5359 with SMTP id ffacd0b85a97d-3b7974d597dmr5098700f8f.32.1753970516376;
        Thu, 31 Jul 2025 07:01:56 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:01:55 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] Add the STM and the SWT nodes for the s32g2 and s32g3
Date: Thu, 31 Jul 2025 16:01:33 +0200
Message-ID: <20250731140146.62960-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NXP S32 SoC family includes timers and watchdogs that can be
dedicated to the CPUs present in the system. The documentation refers
to them as the System Timer Module (STM) and the Software Watchdog
Timer (SWT).  This design originates from the automotive domain, where
the SoC can be partitioned, and a group of CPUs may run different
operating systems or firmware.

On the S32G2, we found 8 timers and 7 watchdogs. On the S32G3, there
are 12 timers and 12 watchdogs.  Please note that the 8th timer
(STM_07) is not described here, as it is coupled with a specific STM
instance used for timestamping. This makes it somewhat special and
requires custom handling in the driver. It will be added later.

All timers and watchdogs are disabled by default, and are selectively
enabled depending on the platform configuration, which may include
different combinations of Cortex-M7 and Cortex-A53 cores.

This patch series introduces support for the SoC and enables both the
s32g274a-rdb2 and s32g399a-rdb3 platforms.

Testing was done only on the s32g274a-rdb2, as I do not have access to
a s32g399a-rdb3 board.

Changelog:
  v2:
    - Replace the 'description' word usage by 'node
    - Reordered the nodes in DT regarding the address ranges
    - Modified the change description to leave the ambiguity regarding
      the architected timers

Daniel Lezcano (8):
  arm64: dts: s32g2: Add the System Timer Module nodes
  arm64: dts: s32g274-rd2: Enable the STM timers
  arm64: dts: s32g3: Add the System Timer Module nodes
  arm64: dts: s32g399a-rdb3: Enable the STM timers
  arm64: dts: s32g2: Add the Software Timer Watchdog (SWT) nodes
  arm64: dts: s32g274-rd2: Enable the SWT watchdog
  arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes
  arm64: dts: s32g399a-rdb3: Enable the SWT watchdog

 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 119 +++++++++++
 .../boot/dts/freescale/s32g274a-rdb2.dts      |  20 ++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 195 ++++++++++++++++++
 .../boot/dts/freescale/s32g399a-rdb3.dts      |  36 ++++
 4 files changed, 370 insertions(+)

-- 
2.43.0

