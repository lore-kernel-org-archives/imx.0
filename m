Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637683F9FB
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210767; cv=none; b=DIX6Jzc2k8R5o3UnVfczPn7cxa6KLK/xWIFycz6RCe45dkrZAoTnvUwbR6gdxNIH2682yT15qwfe2NxIH4FmLaj0+iaoijNB9sGRcm7Vum/hzNyO/nG1n5QOcr14bDtjrft46v6W/zqa8AnVxzh/UAPnvr/2cq8LjgS+vIiWM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210767; c=relaxed/simple;
	bh=XEbVT5cHI/ZnCfuYl88356BThxY6qeHy1joKNaxu4iE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mfdPUKv3x3kGKlXK8kT5ULJa8odcAErbsT8KQcHjOzZF6SENk041m5bphQK6Dwiedj6Q0ynS/fk0s5znenbrlMcx4IgRIwkm/RmFGtt2pK/P3omO5EHgumZt7JymlYsnuFeG/nox1BsmAkNXAmNdYvUbICKkG5RgiZWviAtrg4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XpzDz74d; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XpzDz74d"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b0473327e70so203565066b.3
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 08:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210763; x=1758815563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAYxgB8lIv1DHNu4xD8U3kG1jVIbjN/0r1y6HPZ0wc4=;
        b=XpzDz74djaB+UfATZnE9g5cz1RpCtOfffxWxURWoToRo6s6QyTu/dAYxZWX55xX6G6
         GR1jxinlE39oDWXoJbnMT1VKN99JOYOBK/BVzTU0dwtSC4hkaDoIPmz8nPNo8O6idLdZ
         9zhcmgjpvi8BBo4uk22h5EO1OobkWW2tVarqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210763; x=1758815563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAYxgB8lIv1DHNu4xD8U3kG1jVIbjN/0r1y6HPZ0wc4=;
        b=fd/4JIJb+XPJSl2EqWp9CBJXG9OP7aftLDJ1GXRcaZqUWzFdb3nL0Pmlt3Ff0kuxma
         rgENqtHXR+pi2sPiJxNVPQk11uuMottkhSwzNeJtMDHYaLRFQ/QZbYr0tLtlFznm1hmb
         d4OhTESFqteDdIFeX9T4YNFHaWE7YV169gdtZUQHVXwtH9cuFJLaplwT5D1NMlG3LgLc
         THhHP2PlmTJIC/2maVA0IDMvVWllWgxckKdE33pSkitDgtUZrb2PQPLUrJMDCtSXq/8F
         sR641UmsdgWBhfj1l+d9RzmqpHLXL5MaBzIYNXcHxu9drVW4b1Ydh50xe2HaVY5PWAfG
         bm0g==
X-Forwarded-Encrypted: i=1; AJvYcCWau2EVDiGPNqgN/qNCYCN7ZaBled9qs5QQ2y2z+GejAmK47ozMhVfoLxvfzVIdL1V0dOw=@lists.linux.dev
X-Gm-Message-State: AOJu0YytzwdkgjCt6IZi5fRPYBawnicv2d96sE8Y8+JHl0X0MgNtazES
	/EZC7Xf89IGYVUTIA5NYEexzyvXZlrosXBlwhIjgYnNJKz4QrwN1FD1zOoqb0xHpeIk=
X-Gm-Gg: ASbGncvcB3RD3+tKFQfTDxtgSxMDWaghxw6dWeSq3hKaixjp+wxf3kucBs+qSIWsKe3
	32hKR53hOSmkYcpE38JAFvpY0JFL1HjEG/eHBDlQc1jRekKvVf6C5tf6FKD8yrnWC0Fj49Ufi6/
	5q5xAJ2qN10JgxPt9MMCE2hOYGB2GaPL9UEykZ2CkUBpjTOc5ZmKRq5HLcDf5ILoadnvfg011h+
	2fkRT4owMnBSZmXb5E2oe+jcHeKp3iCtmYvJlxy6Rn6DCVRmQRO0qrmF2fRLuQQXWecfbMcGgkq
	tqyx3QE3VBvB4BDW4gCQnB1fe5ET3u8tOeeh7m8YCcrM2RQxUPlr24VDUTV/QmhzZYoOnrGUnHW
	77FPF2zntnesrKSpjHfMpqXpW3LnceTVqdW4UyDITqLyTE0rjofnyibzmtAQwDaOuJn9/m/pD8u
	xUWp31xmVInX8j8CjGnhKcW/I0l9QtWGNH9Q++4VyYUtXaOwZIwieb4iEqEFhalOVaq//swy7EN
	uOp69FzkpU=
X-Google-Smtp-Source: AGHT+IGEnllZKc46D2GPpX8tp6qlYesswGm+zRYFM4v7XWzLwEmIplTDvSQ6hbelWc77fsdE9AoPPA==
X-Received: by 2002:a17:906:d145:b0:b1d:285d:185d with SMTP id a640c23a62f3a-b1d285d2b12mr512201366b.0.1758210763485;
        Thu, 18 Sep 2025 08:52:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:43 -0700 (PDT)
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
Subject: [PATCH v5 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Thu, 18 Sep 2025 17:52:28 +0200
Message-ID: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
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
  dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
  dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
  ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch
    threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  14 ++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 122 +++++++++++-------
 4 files changed, 97 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
branch: tsc_de_glitch
