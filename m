Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8D63D9020
	for <imx@lists.linux.dev>; Mon, 11 May 2026 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496164; cv=none; b=RmXTJEvnzJiZT5dOoMum7xqxUh9rEU+zxISkf/VmzomhRtFvO2OwXEwh7g6NNf/O9jp75XGq5WdQZv2HRwrlPh7GlOZYNPn7kkHO6vCyg8/8naQbud2opjf1ReOEfoLEjKQV0qR5kFdUOVToK6LP98ReQt3x5gMI7OByHwL6EgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496164; c=relaxed/simple;
	bh=b8V2d8vMGlSXXImGlEiiDODYal1zQ7OVkhB6nLGI39U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KRUVJ5eC3AwIoT2l38bAi01NDXObFd174fdIF3+B/JPxPRHL2vRaekH5atb2lsiCUM+4BUlfd1/mbxuxqvrC49OQqyFmwdXZ5KDAPLIHOpe0Tn6giBsq3LO3WJkuHsnubrF0QlScfKujIesmlzUETgo2Rr+pQzP6IfjiSUzyUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7Ai8jAM; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7Ai8jAM"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-362e50b4641so2304765a91.0
        for <imx@lists.linux.dev>; Mon, 11 May 2026 03:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496163; x=1779100963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8pJwksc69T29ge6PeayWoiQnaXWns9TCiOF+acY213w=;
        b=S7Ai8jAMBNiX9YfQDa2G83M+TSq2fX/4PwY4dvSsoKbCMXiQH4KVro8P3RMOdXOKJl
         IuOX/H9MWEikc7LGvXYnV4TIu/x7WRHhB0lnYh4xuG9uapnzkACWmg3Hyx8o1zWE7b7O
         HSe+dCerf1OTn+sa2qjKrYAgQZ8eiHtejsqYd64scCr4ncdfuVwFgTSQ/QzSyL9ETHlr
         lwGmf++1gayWtWVdH9g2+1h6wjMEVwlE0tlWAAWHETrCZeXQfjFuRTcp6nOQtybI5D2R
         RkGcem/Yw9RsdvANF/gMRn9zmMCV71cNRVmmroQM8Q7gd6Cl9kP/Ic2YwS+ugdrUxvMD
         E7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496163; x=1779100963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pJwksc69T29ge6PeayWoiQnaXWns9TCiOF+acY213w=;
        b=QXM6iUjcNqa2f53RWw7UFykmVgvtJK2ZrmsfmX8D7ykhHk4B/6T6pH4x354BJ9STh6
         nEteN9JdWxp7cRMU9CLUierzflfABwo2GfQvc2n1Rvpc+/MRbyjNH5vqYpHm7IuhpNKk
         yZR0/CXc55beEntEudsFQ5yc0Y/7M1hz61TwMoOTFn9+5ggr587KpBsmmi5wTY4alLSf
         zJgSxXJjISqSjLOSu05Uy0C5ar/fnXt8pMRDDEd49cqvzP57+qMslvMMdZ23qUM+1jAd
         I28XIIwfmiqb2HGtCCU8tUAJlc99O1+Kf6C/FJ7NbeedM2lcUrE2FNRhnxTb8B1TfRbJ
         +6nQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dweQlYVYUBm1nzSJEul2mlNYnK/HQw9s0XnGEguxOUlNNHldYccCilkoFy03u07Zb6gg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYHp5f1pIXGAJJZHD0mQdjvCCQZqemzjHHCgSqZZf7c+8NLXmH
	ptNrxO9aKZZFJ5N3DtK9Fc+Gy5Kd9MQr15ZBWCwlyF7zUhu8USpD6hHq
X-Gm-Gg: Acq92OGXSJftfzN/8tzjK0TMsfsSZNVpVheHoahhLdbhZrbPwhP9CYkZiF2qBfGyj0S
	+wu80WMexxvMCYvuLv1qoXtDkQWiE8WIzgQyoIFmdRJkMJu8LpD8pRDpJ7qQGsGmfpM1IH2Q8Gi
	w6VmTObtfN0shfbXAaqHiCWP1f900v6EkwZhtHflt4wnCkicBtlLTlWnizOsieTjzHlrT7AzRGc
	oc0FWtH9KuIEzCAHfSliK3uQorUiVjo1z9oe4KnmfEYLp1i5E2YA5O7P1o6DcWT2pv1ct0d+1+2
	+89C+jnHXkhRTxtF8ht91FgNPgofZhJg2pDtU/PwAynKUaOM1BEKTxGCvhxMGx/8+Uoc5Fq+gAc
	foZR7M/jJk/ePZQfsf84YBiKvaWZNNMgznLKwnG20SDSYKkYU70NXR0rokK+CfBq1qOnvv9/ebd
	MjKG5Vxb3PDl+QpYLa5Q==
X-Received: by 2002:a17:90b:1b12:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-367d3c75385mr8912429a91.0.1778496162532;
        Mon, 11 May 2026 03:42:42 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:42:42 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 0/5] fix and improve for Hi846
Date: Mon, 11 May 2026 18:39:22 +0800
Message-ID: <20260511103927.279550-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v4:
- correct default lane cfg in commit for 'fix link frequency handling'
- fix messed header (the Media CI robot)
- move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- fix modes handling for different lane cases (Sebastian)
- fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- remove uncessary `else` (Sakari)
- fix link frequency (Sakari)
- correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com


Pengyu Luo (5):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: fix link frequency handling
  media: hi846: fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 251 +++++++++++++++---
 2 files changed, 210 insertions(+), 43 deletions(-)

-- 
2.54.0

