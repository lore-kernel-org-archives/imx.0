Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F071CACF8
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700510; cv=none; b=nkiGSr72teGtXZrW79MH2Tjh+j9FgPoifI+ilZGAB9JYq5cphz3WSgzwwgCre8C2cUQVcCtPdI7wuX0esxevFzgUHE1g0ht0Q2Kig1qFVFm0w5GxUYJU4DVUrzz3rqzwFE4j5EjknXJfpcQbgGu8/x5xCzDJ3dgN296dzr7GazY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700510; c=relaxed/simple;
	bh=R+e4WFKWlC6L8M0QO4g4MlFjlqMZvvy+JyHKMgMJLPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ozUe0+k5JL1l4wpq7DR9+qB0i7fsi73Rx62Wai9PQYMI1YUUCCOfoCBdmSVLTs0Cp7o/2oNzoN/niFGgt5UwVzNgm94XzdZrhHddHdXMfvlGg31Fk1aMGQ820yu1pSGhRJO+xT5Hc0lbLR9HwdB3qyQra16CbgIpBwhsnAeTFZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQFDujXa; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQFDujXa"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c96df52c52so8873220a12.1
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700507; x=1730305307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Vf40W6Eua7BzKpxAO9YSg+KzSm2KmjF6yDdNRZz/fU=;
        b=ZQFDujXaf6nigvXfCLAwLt/ZBZ0Dd1UZZ0/b38VmfqnBvnCW3ITv52EhSSIoWSBBrP
         vlQ/v2N0LGqn4xseeApk9sc2OkPNax0mtEAXWMW3W7yUJYrtoO6IoxyFVl+mh499N+60
         /lqJMBKMxV2EDiIKikRBzz3CAsju7xEFkCllLGjGzVaVme/QV//IXBEp60uVm7eXlecX
         zwt1DpuSG5QVDlnXRRwxfG0e4kYVyYsmILbtTbWWmEGKoSjgz0PdnyfRHWmYwxFitLDo
         dRCBDZDiy7Kmc7PTg7FHAllRqaKgjWi2eVqJbC0pGfBnSZCQxcVrpkBWAcSVFw4Hqi5t
         6vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700507; x=1730305307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Vf40W6Eua7BzKpxAO9YSg+KzSm2KmjF6yDdNRZz/fU=;
        b=HJosyyX83JOLNSJumItXCsaZ7eDPA2pQFAfOkUyGLCeRlzKDePQaKGrBWp3wKMsZ5z
         DRsSmE9cf0RjWnUyT721Hwln4EK/50Qj4a+MAw9PtxYeiqe1/gEHSnEwRFLtkcfenN+g
         e0UpgczVqhIprwdwcKn9fAXMcjxBkULPYIYPpTlpvTeQ9KNzh0vAfU+8z3MkPqDwEB2h
         fUbr1+YKKdqnGCmJqN+mBBo37yQXe9VQezO4rFpEEXHWuk6xiLhPzrV4V1cFuJTY5nNc
         nUMCJfDfF8hgg2WvMRKniqJypRL4mMFjU4gx/wBPSjQI+K3QwZSpDgTq0zmTFe2Bav2n
         b8oA==
X-Forwarded-Encrypted: i=1; AJvYcCV16Y/kMKH3HL/EdTw2YvngI2uI4kj3EwA4GRrweAo84zQE6GWQcpupsKWILJ9gT3BG5Q0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJcgsvpirU7dkrlDyMsWAsalge1WnsaTNOtcUZ34hNeNwxrxpM
	XFqZwldRZpO+1+KWxyEJpVM5Ot8UP+DSQmXiq/1iHD40EFamcRtg
X-Google-Smtp-Source: AGHT+IForx6JPsSbHDkt5X0lZS/onUnpIaCr/eo5xEqs96eIQlISvbsCKmy4d2uWYSjBJfz4rft5SQ==
X-Received: by 2002:a05:6402:2706:b0:5cb:666e:a3be with SMTP id 4fb4d7f45d1cf-5cb8b09884bmr2230032a12.9.1729700507289;
        Wed, 23 Oct 2024 09:21:47 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:46 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] add sof support on imx95
Date: Wed, 23 Oct 2024 12:21:10 -0400
Message-Id: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add sof support on imx95. This series also includes some changes to
the audio-graph-card2 binding required for the support.

Laurentiu Mihalcea (4):
  dt-bindings: remoteproc: fsl,imx-rproc: add new compatible
  ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
    support
  ASoC: SOF: imx: add driver for imx95
  arm64: dts: imx: add imx95 dts for sof

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  58 ++-
 .../bindings/sound/audio-graph-card2.yaml     |   9 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     |  86 ++++
 sound/soc/sof/imx/Kconfig                     |   8 +
 sound/soc/sof/imx/Makefile                    |   2 +
 sound/soc/sof/imx/imx95.c                     | 383 ++++++++++++++++++
 7 files changed, 542 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
 create mode 100644 sound/soc/sof/imx/imx95.c

-- 
2.34.1

