Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3372BAEF
	for <imx@lists.linux.dev>; Sun, 29 Sep 2024 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727630869; cv=none; b=aAWDsVsS4po+uaWPvgdKORdCTuDxWsdBvdHYIaaIu0Pd4C0AwQGja7oFpmYXPydUsM8Tb13Br7ys8/d1MUMtbzeMJv3WW8lGNdofoZ3o/VHuVMb2c5/q9DfsSYkFpdnoZM0FyGVbK5Eme25gzbd27jWWPCkDeBseDO4FxNe6JE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727630869; c=relaxed/simple;
	bh=WUERIKhk0ysr6XjanYIBJIslPRVSyrgdwPzHbxGARM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oz8Pt3YP6nqGIBmU1JOR14JED5AWNptXuZy1Bho4Q5MPuCZ8QRDag6HgsIKZOGjUljQXWmE0+dIWiCh45/lB2DAU41VLdQop9BJi3UEkG6bQGNt7NAqF6HRt7MTl9N5R9tkfSjq656YHlAji7kGsveK7ZzGY94xa2xoiKoNv/r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=WyuyQVtL; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WyuyQVtL"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c87ab540b3so5189916a12.1
        for <imx@lists.linux.dev>; Sun, 29 Sep 2024 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727630866; x=1728235666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N1af6m0P26utxo00AsF/VQkLQHLRIxDCh3EYFZpR7sY=;
        b=WyuyQVtLS6Db6piuZmfbACjbEShCPXX0O4+9hvyZOZLD3LDKnvQMppp34B191zDEJ4
         2GdiClc9GCGGcjRlVvS4vxfCIHy5xChoWFpYmntZ7AnopTYxSedFabFzQOKOU7SfYN2/
         jKCAeVqfMlpllQoxzDOoz8z/ecuTxiM/HyJTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727630866; x=1728235666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1af6m0P26utxo00AsF/VQkLQHLRIxDCh3EYFZpR7sY=;
        b=eb9KbaX56bJKm4dXuuKPsAWoBmWrBthDubklNwEe7Rd5vZwQenQOOLIUExuJcMs72a
         7GqlBuzH44SvRBoisWjH1jv/YeTeUWJBgrv9Rr8SulsRqTiAJMBTyghbRXtalqf8+cH/
         lC5ZCdTWJZS/euFSAJg7XFfHQcs+dU9+2IlkUkkQY7XLoriDP/VKGCXruCiLQf558loH
         D9F1SiPQwOVgQSpohTPydQKwYKkIudbNMegTR3V/O3uEmxY1dQkvMrI7ck5ZIytNLsh4
         7OsVDu4lrAr6h/XxGJwz5vHrEHjDhjQgGlW32k3Lo3FlA98tvxXqzmXxMFi8ATtJXicZ
         n9WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTstP3s55/+f9iKTJMTiGzoMxF2E3f+B2RdhRHn/JXgL11+v/ExTShpng/h50UhPgSKSg=@lists.linux.dev
X-Gm-Message-State: AOJu0YySASMn6C3bC/WW+7o9HFsL8rvy7qoshuJAnBwP+0mVg0cUC1ni
	rdKG0HeNU+kbBoNGKUcwVO6HXPCdfklj+tWbX+jFjZtnifZmUkX9/59ARSt2ehg=
X-Google-Smtp-Source: AGHT+IHeQSLDDGaGM06C3DmT6DPfJ9OxZZEG7iZ3wShlX9PB2tTp0g7klku7UD5UU2zkoa72aIzLJg==
X-Received: by 2002:a17:907:7f26:b0:a75:7a8:d70c with SMTP id a640c23a62f3a-a93c3098a87mr1230197566b.4.1727630866257;
        Sun, 29 Sep 2024 10:27:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776a1sm403176866b.8.2024.09.29.10.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 10:27:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/6] Support spread spectrum clocking for i.MX8{M,N,P} PLLs
Date: Sun, 29 Sep 2024 19:27:10 +0200
Message-ID: <20240929172743.1758292-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds support for spread spectrum clocking for i.MX8M{N,M,P}
PLLs (audio, video and DRAM). It has been tested for the video PLL on
a board using the i.MX8MP.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (6):
  dt-bindings: clock: imx8m-anatop: support spread spectrum clocking
  clk: imx: pll14xx: support spread spectrum clock generation
  clk: imx8mm: support spread spectrum clock generation
  clk: imx8mn: support spread spectrum clock generation
  clk: imx8mp: don't lose the anatop device node
  clk: imx8mp: support spread spectrum clock generation

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  45 ++++++++
 drivers/clk/imx/clk-imx8mm.c                  |  13 ++-
 drivers/clk/imx/clk-imx8mn.c                  |  13 ++-
 drivers/clk/imx/clk-imx8mp-audiomix.c         |   2 +-
 drivers/clk/imx/clk-imx8mp.c                  |  21 ++--
 drivers/clk/imx/clk-pll14xx.c                 | 102 +++++++++++++++++-
 drivers/clk/imx/clk.h                         |  24 ++++-
 7 files changed, 200 insertions(+), 20 deletions(-)

-- 
2.43.0

