Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5BB1C28E
	for <imx@lists.linux.dev>; Wed, 14 May 2025 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211116; cv=none; b=nh91Q7KeHFE1WU7AEyoGgaNTzg/vfCk0MlyUfGl61cVVt+qcwCduDmHzvpJVym9r0cyYfUWBUOQ7RnBXhXoup/okTCaKtfc3wpr8jUP/faV9SDvLHgVAx61wuFzPUrzUAUOZPGWFJYUB3KhNiS2rakPtY6YV1sjRGC/zBfFnzGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211116; c=relaxed/simple;
	bh=qc/nsUTYkyuzCMF1Z93QgX0RM9mLg6+yezxc1YMOKms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GZ7ummomHP3TXiqGzoK4XdRXG23qeJZIYhPcCQ64KYnTZcgASQnmW7JBXRndTwobL+VXcrEhmsbywaKE+1yINATzghF8bLavqS8A41ROu9dCEprDB6O2KExE21LvBJBTDMlJ6bVp/PdJvvbtc3DnuMSc6BizBRYWa6qdajnTafU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OGQ7A77f; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OGQ7A77f"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so1939505e9.1
        for <imx@lists.linux.dev>; Wed, 14 May 2025 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211111; x=1747815911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Klj8NdPC9rX4nFDMdyr+gujv99cd2TFqTsaOoeEged4=;
        b=OGQ7A77fVjlsTJTZhM3ZLZABzqeVNZaR9jpdJsnCPRqNPJx444tSE9DUaF9NWDLaLP
         tvOhs34i5NbCG6Y8IvS8bnl8FunU+Fc7Cd0srAEmkqeQ9j27RkpRjNjEEILlVloUXhs3
         DKzikEfBclnYtWtoaPryBw7dFcl/2CDwIIOVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211111; x=1747815911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Klj8NdPC9rX4nFDMdyr+gujv99cd2TFqTsaOoeEged4=;
        b=cCSUAovH2+4XHqd13Dsa8RyUhgwsbMo5IY+PM0inbWHi+jEQXW5/phv+qhqztTyKfG
         42Bne50TiQNpJqeVK0AY36RGONMgdopaf838UCjKexGSdGP9+v8IFatIHLRczqCJlAO8
         kPVgxKISGjlT15RbmGb12X/HgY1tnOy2H0uWWc/xIrgGfRPkr0q5N1EjpWqOJkpMVrPs
         xbDg6zpBIw3kB2EvmqDANPhXbgTUZJ7lY1BlF/NEYsKObOoK1M+GCQ+3etcDiULUKmdq
         nZvE4yd+Yuvaj8LHUA+mNLoeiKgKi5hEpXZK2CwsMONO+3Q/R5yWRYlEMEmLhHys+vxQ
         owFA==
X-Forwarded-Encrypted: i=1; AJvYcCVbzpXaPVOsNuJ/sL5dxcjdHOjEt7kPMaUw/rKVNqd3+55FyjrYIJ5/69uSqCrLjxmV7bk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwALFRbQclxzcNLOLZiOM5kmc7NyHkh+Ve/C1/1Vp7+pJe37M2F
	q9LpWbPU/B9Hx3pU0M415Q9KK0SAMyhHwB5BhZVsfa1s+E+/w4Fdbe5FLiq0A5M=
X-Gm-Gg: ASbGncvpZevJ8mFu3baWJQwvVqdph5P9Gc0IpHV3yeIkebVjvea3V8SILURygYZiny0
	aupbRnyY1NV+5buj16EVoxCDju/Xl1fXnmOfLx9XGRDwoxvmUZrEAJEsQqNdNcazGndohW9sRUv
	UCyJTJKw8j+q2m3wOKdsQoC72uO5rYgzS0c+h0xm2bfzND8rzDb06e5fvQyFti90ufH0mpbq8kK
	cpSTNMeMDd72eunnTcFNOGrbNlPIX8GzMeUtTfbrE7ToeUA6gc3YDDcSwo79567M18BFzOPlFC2
	Hb3RNAnoNhudR7uK61hs03601R7UeCq9sI+9Qcf7TIveSq5MS4b8Tl7ImgzB/6CdWWiDJfz96IH
	BhkjvkhJrIGVDhPdjPemBQTxTicVpm/vcH419YLRwz5M=
X-Google-Smtp-Source: AGHT+IGa+UmxR661YRcC1N4UAkW8IE0iPci8H8/AjxxIIiISRrbp1i8SREEO2kqtiAg1FYOJKvF4RA==
X-Received: by 2002:a05:600c:1c14:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-442f210f6f4mr22958705e9.17.1747211111376;
        Wed, 14 May 2025 01:25:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/9] DTS updates for BSH SMM S2[PRO] boards
Date: Wed, 14 May 2025 10:24:54 +0200
Message-ID: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series aims to upstream some parts of the DTS that are currently found
in the kernel used in the field. This is the first in a series of
activities intended to eventually lead to the use of an official kernel.


Karthikdatt Anantharamrao (1):
  arm64: dts: imx8mn-bsh-smm-s2-common: Enable GPU for smms2 and
    smms2pro

Michael Trimarchi (3):
  arm64: dts: imx8mn-bsh-smm-s2-common: Define suspend voltage threshold
  arm64: dts: imx8mn-bsh-smm-s2-common: Leave regulator under hw state
    machine
  arm64: dts: imx8mn-bsh-smm-s2-common: Keep wifi enable during suspend

Simon Holesch (1):
  arm64: dts: imx8mn-bsh-smm-s2-common: Pull Up Console UART pins

Wolfgang Birkner (4):
  arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for
    VDD_DRAM_VPU_GPU
  arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for VDD_3V3
  arm64: dts: imx8mn-bsh-smm-s2-common: Increase drive strength of pmic
    irq
  arm64: dts: imx8mn-bsh-smm-s2-common: Disable PMIC SNVS reset target
    state

 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

-- 
2.43.0

