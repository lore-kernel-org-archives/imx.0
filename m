Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBDA1C57A1
	for <imx@lists.linux.dev>; Sun, 15 Sep 2024 11:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726400642; cv=none; b=d8nzbRkYWRQVslaspkwqvsDrDSFx94iCXdWpxnN/TZCQiSvYaJq6+emyLbJIohH4toR1emCV3Gcur+pPsHLmrckB5Uh4EppI5bhuhpBIOeGp5R1FCbYv9Cl8W5wW/SfTLz8m1GBcoB9s3/Ka1HOVB6LykBj7qp4haJbINR051GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726400642; c=relaxed/simple;
	bh=H9q9CQoYEll1vyUTQ0sNcL7d6nkLtx+8/uKIZDi4t8k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pa1if6D+KTJ5K3m+BYyZTJHDyJVVQueABQGbUGPcYd2jx88hUQQG+ycFXgSJ02jqiEDe7wt8HQgoroOJbMS6/K5Mj97oMZwf3nFyeQGtBOePUiC9j+qlgRcNpk3Xcbikva0Wh6mVJSC9+mq7DiJBZZmBOn7QBJ/tkGl9u7foJKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6lkLSDi; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6lkLSDi"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so354732666b.0
        for <imx@lists.linux.dev>; Sun, 15 Sep 2024 04:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726400639; x=1727005439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4mH+l6efe7nU0WFZ7S2EM77Dno5UaL2UqZkqt5PiIGk=;
        b=E6lkLSDiMJfsdSagPwQX1L+vQo2kIc7KRG86pbLjy6Lis8acuD3Kfsh/f4B2MusDtq
         4I0B5CI9/NepqldWfiC+5t08hyShFBvLqmskcPDxPbZ9iE4FUaJHQaKR+Gh5lfWpxGz9
         gomJlKWoQ4jZ9mdL+lkx2Qr0n7LkVycUNN4Gv9KKaUfSYepIscKYJS4I5cNiUMMYjHP4
         5pc9Syr9c2y66knd3yQponXacAtQJQ6m/w8DItdrxE++PP11SaD+y4/6GIQc+kVVzdDJ
         XR/2n378+0ABl5NaPIsI9BPOWax3KVGCJGFibKivrdo1OZ9CxVYjFKEEJy3w4Z6CQV+m
         cuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726400639; x=1727005439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mH+l6efe7nU0WFZ7S2EM77Dno5UaL2UqZkqt5PiIGk=;
        b=kFst49n7VGPcEXNyqy8UJl9FGnWcaq7CJu/0gDWzP5Z+yW95nQPi4A4JZS34NhUP4R
         MHxQQG3GokrOAGR2IaQUOIejAg1BreOJSxfnr3RMpe42SoqJyn+9gVOopCOuOhBeex89
         QKhCrKE9H5VPt/XmKQ++23kApvLrH0KBe74/XGtnT3M1FnOy8xZgRkGSIQuPxpc6eC8B
         kyPup4lvpsBmzerg/DRKORTm0Qerck+hGNSiGzr0OjE1AuegQMIw6VNLz43+xvcHJM6p
         wqyxIDsk99G1bC4wBteNFglvCIkcJfnOeK5k81e+K0XT4kyN6k+Lj46+GP8aKjUK/YKY
         iNnw==
X-Forwarded-Encrypted: i=1; AJvYcCXx4nzHW+xAEXZSpAEE9h6Jx4mY59bTNEO3RcYMX5U320Fr9fCg+4ncccZgerqDQK3kKBo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmRiqpY8W4qyyp0QTeWf4z8j8y/zrLpWNKDSN4qSiNJ0wuOITf
	SlRU3WVSZQElteJQK4Ogqf2rlZ1Fe/6NTokLWQDU0oMgm+V5e4VX
X-Google-Smtp-Source: AGHT+IGpuSYUApsVlxE96RegA0p6FojKMuwIiy0j7XRDE+Uns7f4FOzDKSl5hSO6PEgMpBfIYTWuqA==
X-Received: by 2002:a17:907:3daa:b0:a86:94e2:2a47 with SMTP id a640c23a62f3a-a9047ca074bmr759433466b.15.1726400638297;
        Sun, 15 Sep 2024 04:43:58 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109676esm188778266b.33.2024.09.15.04.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 04:43:57 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
X-Google-Original-From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Add support for imx8ulp's SIM
Date: Sun, 15 Sep 2024 07:43:08 -0400
Message-Id: <20240915114311.75496-1-laurentiu.mihalcea@nxp.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i.MX8ULP's SIM (System Integration Module) allows
control and configuration of certain components
form the domain it's assigned to. Add DT node
and schema for it. Its child shall also be
included.

---
Changes in v4:
- Addressed Rob and Krzysztof's comments
- Link to v3: https://lore.kernel.org/all/20240715164514.8718-1-laurentiumihalcea111@gmail.com/

Changes in v3:
- Addressed Krzysztof's comments
- The "reset: add driver for imx8ulp SIM reset controller" patch might generate conflict when
applied to Rob and Shawn Guo's trees (for-next branch). Tested all patches with linux-next,
next-20240715 tag and no conflicts.
- Link to v2: https://lore.kernel.org/all/20240609125901.76274-1-laurentiumihalcea111@gmail.com/

Changes in v2:
- Reset controller is now also a syscon provider.
- Changed vendor prefix to nxp.
- Link to v1: https://lore.kernel.org/all/20240516204031.171920-1-laurentiumihalcea111@gmail.com/

---
Laurentiu Mihalcea (3):
  dt-bindings: reset: add schema for imx8ulp SIM reset
  reset: add driver for imx8ulp SIM reset controller
  arm64: dts: imx8ulp: add AVD-SIM node

 .../reset/nxp,imx8ulp-avd-sim-reset.yaml      |  58 ++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  13 +++
 drivers/reset/Kconfig                         |   7 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-imx8ulp-sim.c             | 106 ++++++++++++++++++
 5 files changed, 185 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml
 create mode 100644 drivers/reset/reset-imx8ulp-sim.c

-- 
2.34.1

