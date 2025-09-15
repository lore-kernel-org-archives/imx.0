Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790E12874F0
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 19:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757966035; cv=none; b=sTFJRuxD1fDt731KymEoH58eF8yaiUb3oH2wccd4aCmY5M80+BCGOT5C0LNJoZGPH7Slp6FOxMsQM0ZMJroitr6YoYpXmqp1fB5TZbwaWLNQMKvl9QbR2qz1iaGTNg4+sKlfuPeJnLDdRl0VPO4o5IKAJFRq5CjY8R2JOzlvI0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757966035; c=relaxed/simple;
	bh=4+yxs60OAVC+egyNAJiQPoNAhkAmxqsLILpbkalQphk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L3M3ssC8E98jN5sNfkG8ZXMmPcjcn7Eqw/NfWrSWto6ZWP1oHBdQ8/lQYCJju3SHk9H4eKQam/XYzGmNRKpSsjVbbn7zQn0eUMN27lVWl+uHzNgVk2vjECOfxh9JJ1/cQox1eEy8V6UxFwnfsZYOM5zxwHpuzOfA3MwWrw4i4fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=JtF0JSPf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JtF0JSPf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45f2c9799a3so10222205e9.0
        for <imx@lists.linux.dev>; Mon, 15 Sep 2025 12:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966031; x=1758570831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJhLIV1mYQqcST1oL+DWVlUO1Mmv/0wElK+MzmN2lAU=;
        b=JtF0JSPfxBJm0j95TYTLhnwillqKLLRg3nfjWuHNLnoNrZj0TMD9r0PBQyq/nOrwQr
         m/3GWkGcUf+1TkMxaeu65Tv53xJztp26K+IoJf0G2QrlhCwd+fn3ouoyQqkKBO8+qjIH
         iubgQpqga2mzY940D0dDBwBc/9Y+BCjAEQlS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966031; x=1758570831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJhLIV1mYQqcST1oL+DWVlUO1Mmv/0wElK+MzmN2lAU=;
        b=Badywb4ta9pOFBvjcLCq84sN6HMaM96tmePKZIzu4Vrj0s+haOT/eTroIOEJ4Yb8oD
         WEwL+kY68kjMvoFG9TlsDID+zquTkeEGyanRX5WhBadhswmlgHH4gI+Gv0r7aFUSQQf3
         lsRBpZBE7C2pI7Qkuo+e6IYbqwPnNgpibbdzx5S8DBZJ9yhtoNq0KaL0DH2+p0uB3q5D
         xPM3DNehalJg6td471weyOlLWk2N1NEWm4tbr5r0/j4lJ580g0L3kdbbfydUMygZVKZ6
         a6nmVkNoCEGl1xm4OPS4QZk2vfGehJcf54FAmV01yJwW3bngP6JMXU6vVXC+AJNHK0nq
         LPBw==
X-Forwarded-Encrypted: i=1; AJvYcCXggFfW0LWlAR/TU3tMf7SH/b5gZrKbhDjWIRuTuaoFaaTjHxeHD/izYsr2Km7htlfbRec=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhRfY3l8AeIthFpxcxF5zRXR17I8PwEoVRb6FFT+lg27y/wBM6
	XeRRyrqgUt/fcgZL5VmDailZa1PUXmza51RxXH3v7MyXr3AuqtLte8CeihS5mv43l5A=
X-Gm-Gg: ASbGncsMGJ82RA4hR0ZafMtWCYVLvNkx3EG2urCVl5TUsL2aJY2I8mpl1tGwXQxJ60E
	CDmcHxxXIJXLzKyHHLQsbDdH4AACfxfIhZCnJiDZVN1I6B3Us0qrUR4NbbGPwFHVL2E5tkbpywG
	F1ZLW7E5F1hhr/33Il3ifZdwIVLMdxMOikWvqwfgW5y3GUFXCutOYG5/u35aeuBtg7076YIxOuI
	hVog1+pmEhnxiNKtgo+SktjvkJhNBRbUVdJ97dlkYc70wfjGYgd+CONWXf2WxjNSY1RNf1se+qL
	79Mb5Qcg8nOFd3ogmMpUxBqWDUrQhzZQFEI3Qr6hvObvOA/9G3lL7FFSM5AJCSe6LgIHRTNIZm6
	jjIvB90wOHK0pXd5nY/tk7l6fAwNPleuxrxUV6ognkBrsfsyJYezDG+kzT9e+uMs=
X-Google-Smtp-Source: AGHT+IG7qHwPsEqR9IHaKIK+gqJMIa/E+Jy05PFsgkH/KUwCOfGsFJPue2mRPxnFFVk+CO6qHeKm9w==
X-Received: by 2002:a7b:c44b:0:b0:45c:b5f7:c6e4 with SMTP id 5b1f17b1804b1-45f21202a1amr79796525e9.35.1757966030718;
        Mon, 15 Sep 2025 12:53:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:50 -0700 (PDT)
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
Subject: [PATCH v3 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Mon, 15 Sep 2025 21:53:02 +0200
Message-ID: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
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

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  12 ++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 122 +++++++++++-------
 4 files changed, 95 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
branch: tsc_de_glitch
