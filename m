Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F0A1C9EA7
	for <imx@lists.linux.dev>; Wed, 18 Sep 2024 18:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726683729; cv=none; b=CqHS9MNJcgkoEpVP19O1mcjnJcurNvVabSxQFc9iQsA9EHTnK8T+ubZLY1QmVL8fAennmAjt64ruvp8rSEZfbII+T8c9lyUtqaka436W+fE6q1PSrc2194sYt5tUrhiUELClLnc093cJ624J10zmAPy3sxTX50/i3OKMGAGJS5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726683729; c=relaxed/simple;
	bh=ZCEvC14dHvRX3SiUMZUkZsBt1TWr1h40Lkd4LFAyjDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WWL5yZvnMU3TICRnUtRxwP6YwliAMqsTDcF6UMlM5/85E6d+MG2GFgcBT5Gaah0vCfSfUhtnC3oD297XiP+CowlLnkwHPyOoJ48lJqVbQRAjjNppVFAj7joE4T3/M1PFck2k9mpXj3xsxGIlVTUV0eE7YBgqFp8HSqkrIq+Tm8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSdnxn8j; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSdnxn8j"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8a706236bfso396362666b.0
        for <imx@lists.linux.dev>; Wed, 18 Sep 2024 11:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726683726; x=1727288526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u0St+mf41FzHYmfPmGgZlICoo2J/GNAjbeqG7W+7glo=;
        b=YSdnxn8jLIZNvX/U8SMqQK/z9eOiX9Vhw3q23/HQNWJUZN1+tIXmOaY+TUwTsN+dzX
         xECT/IV/UDuXuxo+UT8bWqzF5/edo6b7Qwv5/wx4hdV0OM7/3F9vWYVxKwqIBASPb7DQ
         5gfPs19keo+tAKRBt+8XVRChNb3vE1Mq+Yqjt1eD0RaEvMP/Jza2us+gSiR7J0sURtvq
         FJ9lgIO9a0stoZlz+QSD5t3WNFDswkgyEjl4dzKPClIlPAKOMRW441gLcLM/+mXIuutw
         lO4hmH2ZNKydsWoQYqZzDbt0hJhEH9Jdf0TyzlTK+kepL28fmzXZjd4Uy1z8YYhHoaQL
         zr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726683726; x=1727288526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u0St+mf41FzHYmfPmGgZlICoo2J/GNAjbeqG7W+7glo=;
        b=tbamPF98NIUY3yuqvTw9SntwcZYjV8+zUiWj5dsPvQc3g3DIbmI8tyyl3T0q1+mDNu
         JBPm284kKYpJm+xToY5C8wqv1pWcKPqu31LkPzcFpG/NfHqXHXw3SJr2NR02FIJ/7qrH
         URZ2ybYNtsnxi7UlHGp4w+Wz7FzcKI+MynyUxddU5o+PAkZhPBOVdv5x73tY3tEejB9B
         wWJLWWdNwUL4wvB7xqorbnSotpNfpz2HW7WMhkQ5hh1MFtRMKbZbTHpe9NqQjPrPq9qf
         Dsty6ruwrhvLGGTYw+EZBQolE5+E/Fp78ltPwJ/oFdExLpqk21tAuRnnHOdv8xdIU8LE
         LJjg==
X-Forwarded-Encrypted: i=1; AJvYcCVeWnKa+zXAFQEbZZjvusC9A6C9Do1OzB5TUfXrjV+bWv2XWKgxNAYea3a7Af8UR8R69YY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyomKbL8y2BtHq3GKY2TmJLPSw5gj52IYipHF6utkhQka5A8v7s
	rS2UAb6uYMu4d82qdyiMh92uT5ta3jLGia7aQIzRQAntWW6/qDgt
X-Google-Smtp-Source: AGHT+IFcsPhxvDQ2x+qawg1vcMGzEqmsNX+WtUVNw78yM/hR/+LRU17B4sTsN9bo4xFMqBwOF2WrKA==
X-Received: by 2002:a05:6402:51c6:b0:5c2:5df4:5a4c with SMTP id 4fb4d7f45d1cf-5c41e2af39dmr27187758a12.33.1726683726085;
        Wed, 18 Sep 2024 11:22:06 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb5312dsm5200146a12.23.2024.09.18.11.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 11:22:05 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] configure imx8 dsp DT node for rproc usage
Date: Wed, 18 Sep 2024 14:21:12 -0400
Message-Id: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Configure/add imx8 dsp DT node for rproc usage.
Additionally, fix number of power domains from the
fsl,dsp.yaml binding.

Laurentiu Mihalcea (5):
  dt-bindings: dsp: fix power domain count
  arm64: dts: imx8qxp: configure dsp node for rproc usage
  arm64: dts: imx8qm: drop dsp node from audio_subsys bus
  arm64: dts: imx8qm: add node for VPU dsp
  arm64: dts: imx8qm: enable dsp node for rproc usage

 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 62 +++++++++++++++----
 .../boot/dts/freescale/imx8-ss-audio.dtsi     | 20 +++---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 27 ++++++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi     | 29 +++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 15 ++++-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 19 ++++++
 6 files changed, 147 insertions(+), 25 deletions(-)

-- 
2.34.1

