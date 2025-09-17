Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF4305E0A
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096341; cv=none; b=gODIsV+6wMnrHqSmzToYK9IhcUyOITxAK2MpDE5CR2GyEvmEJk63paz3Lbv6aty+gSnqnTuaYx17esYsVw5yTEG5XNFo+oAt3qB1RPhS6be7U22zHcVSvHN51OnYg2W58fi0ErtULHgQ+MZa1YJtQINOxi9eR1fKTXzY5fCQgzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096341; c=relaxed/simple;
	bh=gDFOJLDzxUDcqovn2642JdV5yxcGbUHiv+uQIwqON84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RHnSuPsJdqDbASNlS9Kg9yQk2ZxgPLhLhymrvQeA6Clt4TqknizkO1c9M4eMtd8wwtcjzBSSAaA+g4RMM8o/GdL79u14p71yqVllJX+C+ZT7wdLNm7GFd8Y+mfynSIclLrfgX0zOkiOPk1UnYXj4Ka+OPO0xkieZU9EPevEWNvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Xp+R6oQs; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Xp+R6oQs"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b07d01fd4fbso720636666b.0
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 01:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096338; x=1758701138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NPuegdZHn6x7l8oR57Kwdwve5Qd3dUF765nGwdELATA=;
        b=Xp+R6oQsgHEWEOOw49W72ZfkpII10HcG6otSG1dAJIkrQgVEAal6Jc6pqExDLjxiDr
         0mVfKAv+iQs8yMi68FarhOL6GkkFRbUiA7S55l0MrN0E1AUCSMia5WbceDY5kboMxWtW
         V2/MpeoB/E8kDV+6fqbU12EZNDOXD/wWGR1aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096338; x=1758701138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPuegdZHn6x7l8oR57Kwdwve5Qd3dUF765nGwdELATA=;
        b=rltGqKV1WQTY9QDhu2lrvHMmMxqbpHimbLE6rBTTmL9zpUUgJ0jkja7TJJ5kE+cZkh
         H7W5Ap/KhA7w7wBEdMCCF/+lz8OEUnDY9RbHFb+IX6G4VfoQskBnqUO8QHOx3bRFdJ3e
         Rh/k2bDEZrh33autv3jUIeaQQGdznjuRd2yz/5InYqHfxZNJGlzBOW09BmnX2k8RXN5d
         6Vs6QLtx3bcyvOSIayhddBbDXRVOlWljCBPAKhDXIk97rAfwvhaeBZdCr6Vd14AzUeVF
         U505Ab7tjJR+bAgAAipm3VoHgKbbGmSE26z44rjIXvwkoUVXVT+KwvtCPa5Zxn9ZCB12
         klww==
X-Forwarded-Encrypted: i=1; AJvYcCWjBJ+gOWIww/VBs+8nVKm1aPU3N9Ebf+LH2agvvzUb1bBwB01GzIwc/k4P+Fga+uVAj9k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgou+vDCQrIaWIuk1xz1/3ge6nGR9lwUdma38zSPGyzOQpGzmW
	IJyYH+BUYtfbdoyI0For47Dd4UjpjOQXQx4oAExPqsuJC6CBIM8wZgcKaIxolDunoBs=
X-Gm-Gg: ASbGncvzwoaU0yb3ffxMJCZL0FJ4xDaRHk+tNyHTL+IwMHqAlauFzZc1uqig0izaPMQ
	7R0ghAjIQhKgqPNKPGDRt5RmYiYFlq6sIToJTTDF9byAEl9ytYHoIjcZQuv1UUU2iSxDVBBPmSe
	78NtvcYBH4qHnyQiwCQeP76A31RNmUChLTDXnWbUs0Jo4J9HJAGNOqn6kKy/nnVNeMYVlrhcUr3
	MCL9BwAUwfXkO1dQB8bQG5PURn3nvrxMl0/OHtma3gruil6pS7MOo0x4bN2vd02o9vVUwusdnwf
	Emn8fvnuvAyiwBjDbyK+Q+9f/Q3yNVQxITA8M8oEu4kSeWX2PVW1Fe47GWqwlf0lVdVZ5eg7z/0
	bhx2hSyy1SwgRFAoyOg+qZgkIK6rwRVl0BA49ujlp+nInizZI0n6Gvpexqwt8l45f83zT0w==
X-Google-Smtp-Source: AGHT+IHVO4VaMS/G12IQZgMNriTBY++2CzCi4uYICi3wwhLDtof1MCwW7/7vKBLZtIfrjjavAGmS1g==
X-Received: by 2002:a17:906:d54e:b0:afe:6c9b:c828 with SMTP id a640c23a62f3a-b1bbebbb0famr156412566b.61.1758096337795;
        Wed, 17 Sep 2025 01:05:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:37 -0700 (PDT)
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
Subject: [PATCH v4 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Wed, 17 Sep 2025 10:05:05 +0200
Message-ID: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
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

base-commit: 5aca7966d2a7255ba92fd5e63268dd767b223aa5
branch: tsc_de_glitch
