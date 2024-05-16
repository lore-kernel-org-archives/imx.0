Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607E157483
	for <imx@lists.linux.dev>; Thu, 16 May 2024 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715892086; cv=none; b=qwVyFh8f0uBXF/7LLfSuRu1qfkeGbRRJS1th7AbTcwDCCxA8sgIZmVDXNTUeIcvGlNR7nTs7g1SJTyFlit7ZvFdMzejGL1VQroMMadO+cqrCs8VXxsb9YjXNKG4oNQn84rpT6H31qg7bg645mkBvFab5UNimWIRUNDYIZBFYmhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715892086; c=relaxed/simple;
	bh=qRyVDG9XREkfXRtKtAq1+qOIBN+sICTKn2RdcjtLrms=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lhAho3Gn+xHhNRnThkIA7GJFrJHaMTr5ECoUiThb7kMVMxX7m7SkIcG9AJXSOiVOFCYZ/tfgrOl0J3p7kw4c2U9zL46BklIA/3B4KmAZM4cYELjSIjbG9R4+UFTHjGpUwRG2tq0VS57jvj5uBUXmHfThqrMfJcpMp5DCpQ95jxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBXkjZKS; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBXkjZKS"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57342829409so5490436a12.1
        for <imx@lists.linux.dev>; Thu, 16 May 2024 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715892083; x=1716496883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hfEGtxZOwWbYAEnG2Y0hgMrgm7NoPpGTjppO5Go7vv8=;
        b=DBXkjZKSnjAjBfh5t3TrvPxBmRU65Xo1aXuQd/XNTppDLhWMJcBpx2sQCk3MUT8ZeU
         ZAGyQNoRjARfvvM0Rqye9Uk05f5shKaE28Hsy1H3kypw7fVulnXFPR/kkFhApfp8B3aQ
         fs3lWgPYbiFDDForODLU8ZSbwMdqxWCH/aRhPtTrTP+BgLTJ0JpYQ6ug0SR09sPZDWY5
         9Yx46dUkNTjdP2scuI7T6L3qxWrRuTwL7TA9K7xAr6XEm3x025A3hyxr/H8C/3QyLTd1
         mLJQ+4xdpNAQujqeHavW1LKLbWWut7cDRso6CEcW6Rq/EsRmKHqTiLzkSUArKjmEIxMD
         f+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715892083; x=1716496883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfEGtxZOwWbYAEnG2Y0hgMrgm7NoPpGTjppO5Go7vv8=;
        b=bJNIOkidYP2lNMV87QS4DXOK4MXSNkJL7AIHUbb2yWajZhrhKuhGx82KyHR16d0uNC
         QnWxx5mTncijH05Ssts+xYjV/pyQuzeRz4mV2t2N+B7arpDdGRw+U26yzKheQSnTp3Gn
         RSKVcrwpNWFOwh6D/q3ihzUsXCwx03DNgn6ABtzrFSojVrT2JlRYwEJR+kegohP0m3Yp
         hrHVvpXkc6B0mEtRrob+i2Rfy1gXvkbmslSAhL5uiU6zWIuYbU43fXXwXcsxlmq4oYVs
         uLJ5Ix+dkAGVkx2Vw3orqSxYw4M+M99VaMG5fBcNd7gsqlBFjon+KFFUQvqvZ965qX/U
         uCNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT6bQL+TwROuZqpIUxh9M33Gs9qVbiEkSkWVVYP1l0OYhanFLZb5oX2Io9gshvOUVEKdvQB21DgsvEt/EXnykqzJ/M
X-Gm-Message-State: AOJu0YwpXJwwewwUpJAVpqyCa06ASPrcPl1mvhRadtGOoyFoY8pHDeeL
	Arb5jO543KTaJGebdY/UQWoE74Wnu7OT5niChwMHlFzjPSBrFvoQ
X-Google-Smtp-Source: AGHT+IFjova7aUv21pnribbviNXI9uhtkJ+qKzW6NfePPjfYjxJ1ILWWZ0Ax5zrU68mh6c4a6ARE2g==
X-Received: by 2002:a50:c18a:0:b0:571:bf62:81ce with SMTP id 4fb4d7f45d1cf-5734d5e35c5mr17006879a12.9.1715892082576;
        Thu, 16 May 2024 13:41:22 -0700 (PDT)
Received: from localhost.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2b8f7fsm10859828a12.66.2024.05.16.13.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 13:41:21 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: laurentiu.mihalcea@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add support for imx8ulp's SIM
Date: Thu, 16 May 2024 23:40:27 +0300
Message-Id: <20240516204031.171920-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

i.MX8ULP's SIM (System Integration Module) allows
control and configuration of certain components
from the domain it's assigned to. Add DT node
and schema for it. The children shall also be
included. For the reset controller child, this
also includes a schema and a driver.

Laurentiu Mihalcea (4):
  dt-bindings: reset: add schema for imx8ulp SIM reset
  reset: add driver for imx8ulp SIM reset controller
  dt-bindings: mfd: add schema for 8ulp's SIM
  arm64: dts: imx8ulp: add AVD-SIM node

 .../bindings/mfd/nxp,imx8ulp-sim.yaml         | 71 ++++++++++++++
 .../bindings/reset/nxp,imx8ulp-sim-reset.yaml | 43 ++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 17 ++++
 drivers/reset/Kconfig                         |  7 ++
 drivers/reset/Makefile                        |  1 +
 drivers/reset/reset-imx8ulp-sim.c             | 98 +++++++++++++++++++
 include/dt-bindings/reset/imx8ulp-sim-reset.h | 16 +++
 7 files changed, 253 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nxp,imx8ulp-sim.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml
 create mode 100644 drivers/reset/reset-imx8ulp-sim.c
 create mode 100644 include/dt-bindings/reset/imx8ulp-sim-reset.h

-- 
2.34.1

