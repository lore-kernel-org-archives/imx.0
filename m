Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B825F973
	for <imx@lists.linux.dev>; Sun, 14 Sep 2025 17:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757870180; cv=none; b=lW06zyhKP1Qsq+G4g/4NzBk0yxP0J/LEy63YhXBRBiCr9+/RVE7eQi8CzVez/E1OIZ3UFe0j7DUMQLVDa1RA5cI0XjKRXZ03Wvq2T3ZxBhddcjqjKomFvlK2yBcuMkxAT5aYOIjQqt9F0SvAm/pDcIhddfVVTZ/DV26o0ULrTbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757870180; c=relaxed/simple;
	bh=nftBCL6M74z8HHTn4ctuVWkq8xVvp0KWzD6g/yIisLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rx+Vl/cZRktTmMyjjW1C4cMElS7xVITOe9LEmeLf+AsnjuPT2XXShb+9l+mHsttJXPOjaTYAt2hcSVW+MRhSwKjWp1g5X3gMK+o7PGlW2Ic7prMYO28y4TNkgieJQrd4yI3hSWHytMBLFgMwDa4St6HI/lb9wty5sEgZ2Db1ttk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XD8IZDQY; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XD8IZDQY"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b07c2908f3eso369117766b.1
        for <imx@lists.linux.dev>; Sun, 14 Sep 2025 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870176; x=1758474976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0BZMewSeCcTTiC1gUbhDF3UKkouTbS+YRMuO2NhSHUs=;
        b=XD8IZDQY07kfsA9SXe0d1wttjdMSO1rdo+QOWC1MpYl10XlYAClTa0ESQJmtJFwdFY
         tj23UNl2VmRwE8qXFofw0KBa+nH5fnBDKRvSASm3RNxZZIzlQ+EzOkdM0G/sFuMNZIR5
         J2TmR9JCJmKHPS9j78v5qG4s813Bh1Z44mSmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870176; x=1758474976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BZMewSeCcTTiC1gUbhDF3UKkouTbS+YRMuO2NhSHUs=;
        b=rKRGHMh0PMzNdeS7dhIQWjcjSQ+X9gh7Oi+5asT/PNXS5CTqns2eKVhK/uNH+i4I1B
         6PmkwIm4QZFClNOZe9TpcZlLmxpaad928Udv240bkdjr5MGcl//BjosZZpwMx9EMeWpN
         b1Rz7r1QCXyVltCoTmBVLMhG0xGrqm2SGBM7aslz0hR/tHzLxcI5jdgHpr1flaR8MZNz
         kYzhHjtYw8fhcW9rjc7SHAdS5j8gVlxdMEs8WL6NTv/A3zwEVwWXQicaMAgB8NKo/F3h
         v3ql3wvUV32krLTl9lQ7A8JpMqAlndAv9ePYxe3jn7fX+RtYSTm9dkBWnyq5hc5cBZwu
         eoqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlTJlLz9pxATGGi40yriCUAfkLdpvDsxJCx/YaZPgsfx9ZrGGegjG3VKR6LZ0MRQH9GHs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyU/fGK6cfe7kn44gmYrKKMrNWAn612gy+45g6hByYg6FvRKT9m
	sKCaFCoF92NptTDyDM/VcRCHwpNhUL80xkeTcSqBTaPnZu8pBPLXMO5+Kk7ujya3lcc=
X-Gm-Gg: ASbGncvuZcTjrJkaL7pYuDx35pvBx1Sdrq7JgbjPqoetRDNfHXQXGm0/N8l9UKbTstZ
	BITZGz8BTAaTpxjq0SC3X/rnZdO4mdsiD6nTzli6RUch8OrxahAXwM6yl/DCaaqJ0qYIW/c1FVu
	MYNkElMKR5Ip0hq9rUNWXRhJry9z3JPS0kVfxYAeJGgoEdfvXe87n+G7cuIibSGO+QPrHS8tPtT
	nrMHKJVMZp0a5ctqiyyyyl1TVL51h8UDZQxQucwQ4P2Lb2ET8MPVe9Pfwl+geJ8qlRmFiwLRL5O
	8+ii/VjNTX9iFYmK+dClToDdyboL81SxJyjtmsXi1O5xOop28/pfGSsddH11dm7f206BVYeOpo7
	0ucV+7Ctfk8FCHvJY6G2KZjJm8CDdlxvIgv3q7vnADAWdoxom5Y5Bx5PZ/T2FSvq6H1en415RpU
	KNi2mf7x08uccsegbrC069Zb2pJUixEFlugiqp1bfGZphkR1fXSlkc45eKSnqXMhcsNPOx/r+Z0
	mw=
X-Google-Smtp-Source: AGHT+IFNtfhow60LKf3kFnxnyjXUZ4Oc4lyoGvrn1vqt8LXeEwCDevETYH1mO/LwuhCnJBRIxMl4VA==
X-Received: by 2002:a17:907:1b08:b0:b04:5b0a:5850 with SMTP id a640c23a62f3a-b07c35fb999mr990822466b.40.1757870175496;
        Sun, 14 Sep 2025 10:16:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v2 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Sun, 14 Sep 2025 19:15:57 +0200
Message-ID: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The series allows setting the glitch threshold for the detected signal
from a DTS property instead of a hardcoded value.
In addition, I applied a patch that replaces opencoded masking and
shifting, with BIT(), GENMASK(), FIELD_GET() and FIELD_PREP() macros.

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.

Dario Binacchi (5):
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
  dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
  dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
  ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch
    threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  15 +++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 122 +++++++++++-------
 4 files changed, 98 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: df86f912b45c20e236060321c85fe35437e9325d
branch: tsc_de_glitch
