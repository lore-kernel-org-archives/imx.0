Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973C19E819
	for <imx@lists.linux.dev>; Sat, 31 Jan 2026 08:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847102; cv=none; b=B0Vjd/dLWYuPJYC9eBYqjbrAkgH5f0XRR+Yq1bMcTTm+CDNBJVpyBjo1e3Fu3n5hmZXYL2tk5liGSjblGx78noVA1KeXAzj7kJTyFkmplvE5tDPYc+VimQd3y8ujJ36DEvC8b5ZMlBAOJDQ8yGtlrgvwZeFwybb5KibVvGFRb5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847102; c=relaxed/simple;
	bh=EC+hbL4fy1RDBuD3ijyTuRjK7ngIuSwyzpe6h6ynI2w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lf5MCS6USY+Tn8YlwHbgBMqBuys5gPWPIecRr3vM1lek154XT45785OWbp7MGAKSIYQ0yAlyTqe7cofm1uIqwy9uYb/bl6RGXW2Joluh3Gvv+dhGKaG3YpPsM/iN/zoVVjy6xdMGeyv2Aof388J5athy+TYEAkRG1rGo1VRcp+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OD7MHmoH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OD7MHmoH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0a95200e8so18656735ad.0
        for <imx@lists.linux.dev>; Sat, 31 Jan 2026 00:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769847101; x=1770451901; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orvFoFtsARH+IScJ7lixNcwmtmfCsu6c1Jr0HIMXzBI=;
        b=OD7MHmoHtOGWh27T6ETzSGb+C8X2FNWjY/QM4o0syXUgqssEtmlbMd7GiwCZ+ouzLl
         cDQfvynZ8IJdrjHiE1waJcDvVqGQBPTBMeZ2lzQ9QYFtMZexHMg2R9Hi/SLPc8OiZtrU
         TopY54upF/yD1ibfva8giAY1KBdzGutnyyZftbpPDghh77IEArQ2QjwbV2nJZteCdKDz
         lT+yQrdw19iK4+TaZc9x4TU84KeOF/HhBqNYoUq5ouvUD0Op69jU/98RtmHvGdR5Damf
         RZJsYvsqccodcShgzQmIHATWNHvzvo4mF6ywo3+IbmBWxG+6gBExqV98XcvU7in2HVeS
         wmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847101; x=1770451901;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orvFoFtsARH+IScJ7lixNcwmtmfCsu6c1Jr0HIMXzBI=;
        b=BAuXHiJUg95235IOqUa4bAi9cPUy4H2aRwLiIVPmI3OR8gDDRBiv5xWlEJq68uFCkg
         JadiYFyvrnR1yOFONuBsHVUL43eAwf+h+czQyXQVhYI1DIePXLfBbciRyXGWRvX9fqnM
         MSAUKxwOK78BFTnlALrM/CWq4Zxjj8opNKP3iERCvbcnPaDOsPF+DgFmKFf2a5EuH4HM
         XwHSElN1F0NR4WuRO4XsLaTgQsIXDXplkFMq50pSpt+omOxnrdiJEuU3U1lB77nVP/2/
         PdyPwT3PgrR+S42uGQMn5Gx7vzFz4QivWh+quAz5YzTYFAzng9DQ+vyQ/7tRqsrAOyQp
         lX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVW1bSuNsUI3zM8bwCIX95ba+SyCa9lJ3PNYuVjqttTAprm+7emZ9s4QZB3tg5rkdsNKDg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk7guRQ7yV10i6/+ltVdDjupCAeQ6hvJDecfgcAaEojDUyU80q
	D3Way6m5GeDXL8dMV1vlbwsm9McKgdR6xjU4bvq/X1BJuZib59D3ifPm
X-Gm-Gg: AZuq6aLJibVoqeD++tu9Hr0nJYNT6V7GeQ6+E49AVS7tJkW2sdG6OILtMo1+mt0RpNY
	h0QiMOC9ouobIS75hc58+Py9q3z+B2mdWb73O9bUO3cZFZM7ZEvO63XGE7IxPDToUa/rK3A1fGv
	lQPahzBdRxbTuqvWtgWNYOObCCwP7pSvN0vs7kQyZpXM8skZggd2EBp/5NKDPcFgzRat0P97rf1
	yPU2QiFIS4+VtoDrn+hUYUKuTYiFCyt4wxprKbT2/i9IL1lGnhSWYxCZ0ySjEIXzFpTT6cgFHnj
	bcXVe35vFGVkx1O1bK4fW7NyQ0Q7MQSauTIOzOpN7lNIdjJw5qV9YCbcideQ7asAtVQGG7DNRDc
	6cFNNoebv4te/jt9J7rKap55Gex5thrJmeKw43B4X2Gsgx9Rt/P5MpXzj9F6vrGEB4+etZx6oKZ
	jrVnWanO8=
X-Received: by 2002:a17:902:f689:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a8d81503famr59926225ad.32.1769847101113;
        Sat, 31 Jan 2026 00:11:41 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm92115125ad.69.2026.01.31.00.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:11:40 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v2 0/2] clk: imx: imx6q: Fix device node reference leaks
Date: Sat, 31 Jan 2026 16:11:33 +0800
Message-Id: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADW5fWkC/23MSw7CIBSF4a00dywGaCHoyH2YDiiP9sa2KBhS0
 7B3sWOH/8nJt0NyEV2Ca7NDdBkThrUGPzVgJr2OjqCtDZxySVlLiZkfBJdNvsjFdINSrfCGS6j
 /Z3Qet8O697UnTO8QPwed2W/9p2RGGOFed1YLqwclbuOicT6bsEBfSvkCEr9ATaIAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769847097; l=644;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=EC+hbL4fy1RDBuD3ijyTuRjK7ngIuSwyzpe6h6ynI2w=;
 b=SF5MP4ZPO/jYldFRUAkmUvBShoXhgUIO110zw5ChaX4rFg9vK1NmvPTMYmkhIUqBssqF3N9R1
 kUY3rQpu1bPAR0kzx1bLdy4lfZEHnRa4s6C51KwS5qLjnZPNVls/JRW
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Fix device node reference leak in of_assigned_ldb_sels()
- Link to v1: https://lore.kernel.org/r/20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com

---
Felix Gu (2):
      clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
      clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()

 drivers/clk/imx/clk-imx6q.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260130-clk-imx6q-9c4b8835fc26

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

