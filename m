Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EE53218B8
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512764; cv=none; b=ja2upPl7rAfjwloclPcdEfugMzvb1gMDXD7DnbhuW1afpBP7wT6N+sSgQhDR8LZib8f44zerb3CMKDNRUXgwnp7p5lTksB4p8BhRKQ3MSlB9Q2pHalx53vfi+NuZ5faTgeHdLpgEdpAkV+mwVzjW4Op/vhr0KG47Fv7vU8Z6/GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512764; c=relaxed/simple;
	bh=AWJAwvgvveAZl1A50d2qJ+nKO1wYxvt7+BQ4m1FIVUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h6uGeF/kT8ln5FJTGu0UX8k7LYu6PoKuAMAsCF022p3NPh5+Sci+3S7bPuYksTG0xP19rFpe5Z1teytVGB5ejJjfkbBjHCuMDCOgUGPxeiUEO7ZKvrE0Y/vsTFOJ5wFEABEbDpb9e41V8LWl+TcMtHaEDRrAG1ZvltWkjdGOyAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bofoMgex; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bofoMgex"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b045d56e181so1022161766b.2
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512759; x=1758117559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3o5U5m9O7nE0eZDTkvDCuOBdIrzGojz2eY5IrxD0WOo=;
        b=bofoMgexVKZBJzBef1pHIS64GsO7wfl5d8mVJKsThwPYVOc93T6Y8YkoBmrydS7SEq
         2n2Qop+EeDZFBD7Hm0G9k5XD/2cG5gH3YtaT3FbRFwAPgx3kQWWT58o4ZDba0qnI7x3B
         m4Iq7XKIz15VjJIgaDVw17FCtvY4w/PAciyQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512759; x=1758117559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3o5U5m9O7nE0eZDTkvDCuOBdIrzGojz2eY5IrxD0WOo=;
        b=q2NIK+II5vyZN0mjJTDJSX0vSkD576FIcgiHCKQUaJlYsnCodw9ysVEDUz7RRIW83w
         WEXP2m5JE2sN/vg9sTcTlo7PAlJ/tDe/NHNjiarYwRtwAslhaUYrbzlXKGzoj+eoWT9s
         o5CCHkm5q1k4Zpepjg4k0iNwoqPQYKFLrRgZWjETelNNKq32N7AYWTLJVbIPyZp2Wrq8
         TkO/BUpfot7PiPye65IlRqPL148Iblg1oQIO/QBbW2zVKi5anWGk3i6yXK4ygHZf50L9
         kwJbDYNpyi/NS0x7CJppRBLb6gAMMn807bH2+f45RJmX32EG7pmiIBTjFmmDSvXgjCai
         aX3w==
X-Forwarded-Encrypted: i=1; AJvYcCVXhqPKgwpqv6PtSdUSeFSe5VtmzGDPe9njMoA4qKtTxxh/Jem2ql/VDJSIoMujC/0iirc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVpDaNjlMq0eNXlHoTf0Ic7V5H+Dst8GxiliNtD3um670+9qHJ
	JO55qJ3uerCyJ3r5WF/HhEMEo48bYw6gunp7mz59/rmd4lSyIBAmNfq3V2CORjdIWgk=
X-Gm-Gg: ASbGnctYPZl+vlW0F+NjPZt/CS8sOfJTDhlW7WOUFYPLaBCTg4dOtXxCYPuMm1c0pPQ
	sNPfMkyTMcl/P6UqNdmrrglZrYGpiMhAY4ljsUChIAoCd1jBgnicG3u4cK+TVkQLEjxNwiZyAFD
	frCQv0vBWGIFa50BO05W2njvbyiat3hogF5+A/59ZYnxwA0Vdg0fFuUogE0w7Qm5zTXTTAIA2eA
	61RwuG/XyAHNkQNTlSjVFsABafvtVTIGOZyyJPgI4ResE2NImzdzv7NILy7A2v8pxr08guQilBa
	ThMbWmeKP+GnDdECsFKBdSd+9A+e49NokYgQIP2gA967NSkTyP7OW2aPR/mXt+Qfd5RCehFprDP
	wjd/u5pTJAUsFyWWeXj96NQbgEc2t7siea55bzizmayCkfze56xEN4n/4y4BJBrAkqjk8SPnK5Y
	892YUqUxb7GBNogH7+kas4Ibhn4xQtqVzvRwtsSHRdKBKu4GWTyhNopwPnXTAR2980tn9kHvNPb
	tw=
X-Google-Smtp-Source: AGHT+IEM5i1cMh4aLi1EphlUfiAbqmiYBmZm0lNR7FL1Faw8bxW5JsLRVOWS0WjIXeABAYnQD9GwCQ==
X-Received: by 2002:a17:907:3ea2:b0:b04:1b90:8d7a with SMTP id a640c23a62f3a-b04b1463381mr1739025766b.27.1757512759136;
        Wed, 10 Sep 2025 06:59:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
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
Subject: [RESEND PATCH 0/4] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Wed, 10 Sep 2025 15:58:34 +0200
Message-ID: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series allows setting the glitch threshold for the detected signal
from a DTS property instead of a hardcoded value.
In addition, I applied a patch that replaces opencoded masking and
shifting, with BIT(), GENMASK(), FIELD_GET() and FIELD_PREP() macros.


Dario Binacchi (3):
  dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
    fsl,glitch-threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  18 +++
 drivers/input/touchscreen/imx6ul_tsc.c        | 112 +++++++++++-------
 2 files changed, 86 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: 9dd1835ecda5b96ac88c166f4a87386f3e727bd9
branch: tsc_de_glitch
