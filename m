Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C5F2571DA
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638273; cv=none; b=O57tBSCuoTpM7O1uywyrL1e+UA3KFA/uA7Zst5VqvQ4TxFEQbrVibEGTmOtx98cmCREp8EvEqAkLtGgDwvYzXxDX6+HsMrO6B3QMeed+EVyL83BhgYKtWC5a8R+Gkt5b5kua8uzdBMyac2GdXvVyl/byzyMt/WOUbsWImimtW2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638273; c=relaxed/simple;
	bh=6I8cNrAL5aASSx+Mq693VRQEuVTbmLc4kgQcskbdlXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XXoMsjXQHSNw0VcWz9C1KgF+lUmdGe41BZInciwacaaMpHn1M6DCNlAls7d1eZgHw8qTys1+En0Fz/uQs1plf52WCRt1oGa5kXBLRlA6UbOBp6zmsEMUrV+w/Z/CR0feXh00jLIhFtQtgBAZU33eMyla67G9sxRTjdhMHQtrjfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=JQc4OGgx; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JQc4OGgx"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b30ead58e0cso106460466b.0
        for <imx@lists.linux.dev>; Tue, 23 Sep 2025 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638270; x=1759243070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGN9wOEKVu6Y0MkI62rSbl1+YeaRDVK+dO7uXaWW+zY=;
        b=JQc4OGgx/m2vgCWbou45kf7smrKgkityVUflUUfvh6Uij6LR+6hQd6SdotehHhVjJM
         wFA1rOqG1W5q0kpcpQfk78+PssFTg55g2xSZNVYHhMt1/jYcQb5bQP0o6IGP55E37c/M
         KAWA5i0foyDayQmGGM5/hErqe4iJCweF9gnKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638270; x=1759243070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGN9wOEKVu6Y0MkI62rSbl1+YeaRDVK+dO7uXaWW+zY=;
        b=KmcGhUGebLmFwbvViSTt/58cYinLliIWRoDIn3YdrMO2jkhELAJyzck9L6OgXLz0Tj
         b19Y/VSNL6BfNTISqlOHyGML7wMm9pfoIa/+JRowOMuR64aYk7dydGFybmoxtxc8TofS
         7m4Rt5LPGeP/LXqnoQ/EzNoVeF/7TswIXOpAIXu6TOjnWt1Yg0bLdOiYG/UObE8CGCOE
         zAiOzZ6Pv8e/Da6Ws8tZVwGVciWw6UpQic96J9gIm5i53svbk1OcBssjt3hwdw8BWSif
         BYDXLVTuR/JKYO1S8mkWj189mfmckBbGJVSj6wmTunKDVgkoGf89/9fj5E1t5PWlWZ2o
         SnWg==
X-Forwarded-Encrypted: i=1; AJvYcCWffAdeTp07kSzd3C4vuNCU+wzzvXwnp/fdncKTaPxl7iQnkXXv6waV94+06odfYPln9do=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGiukNxBaz/0SvA/ojs4zddGowiy2T81aH3+XI/z93zDOYEFvx
	GpyGWQj2QvKTx7KOGBghjS4lCA1i+FykWb79+bIgzxxaDNOlr/GsltMLB6aZVKDUaNw=
X-Gm-Gg: ASbGncsxCgRFAHGR57KtbZws8leBjbPviRcA8PhdfgIy+lsTAcFjI1V4ux+2XnqJsKf
	arY99gUgiVndWwxqJLBQvRFWe1rSJSQAPvT1x/aZbSxh1QGmnsa8+NSLWM1Lk65CFfJdOMAz79b
	JT1FoERd6MCucwc+NPyqzXRCIiAMWvL7GpTcWaxmgy9oL1wyca6Z/fYuqJQonYbDiBaUz4+PUCm
	zX/MTLisXijVO65cekvNw+NGwnSBdTwUrk8nK3i2mhbsdyPI+eX6FfoMBpdtZ+NgOkxaw9nrP9p
	G/hNuMwr/XIMZsDv0I1c+D3aD5Hoi4pO4gLkRdMiXGSncZNPylYDgaR8bFwjdBScGMm02uVK5Nv
	eG4OcG4C7dbLl5WUEhFzfAmALn7LWCFZycNqXJKXwSXTfLwgf4rtUVKDQrH0OeRHMPnwtujjEN1
	NVmpigs6wu87WzFUnw1Bu3M8mXEW6dAqdrD+dXyOART/3ogOKChdMgFiKgwZy8OSEtip96uLYkK
	Qboi/WfUvjtZFKnEgRWQg==
X-Google-Smtp-Source: AGHT+IFwttb50sZUcwgmSz2G3CQLQR5bfVABRjQhUNlQEOt6l2vdv9KmhVHV1IgxO1W1paqY4PecbQ==
X-Received: by 2002:a17:907:2d11:b0:b04:a1a4:4bec with SMTP id a640c23a62f3a-b302bd129eamr273054866b.58.1758638269935;
        Tue, 23 Sep 2025 07:37:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v6 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Tue, 23 Sep 2025 16:37:31 +0200
Message-ID: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
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

I didn’t remove patches:
 - 2/6 Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
 - 1/6 Input: imx6ul_tsc - fix typo in register name
even though they were accepted, to avoid generating conflicts detected
by the kernel test robot.

Changes in v6:
- Rename the deglitch property from touchscreen-glitch-threshold-ns to
  debounce-delay-us.

Changes in v5:
- I didn’t remove patches:
   - 2/6 Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
   - 1/6 Input: imx6ul_tsc - fix typo in register name
  even though they were accepted, to avoid generating conflicts detected
  by the kernel test robot.

Changes in v4:
- Adjust property description fsl,imx6ul-tsc.yaml following the
  suggestions of Conor Dooley and Frank Li.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details in fsl,imx6ul-tsc.yaml.

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
  dt-bindings: touchscreen: add debounce-delay-us property
  dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
  ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch
    threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  14 ++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 121 +++++++++++-------
 4 files changed, 96 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
branch: tsc_de_glitch
