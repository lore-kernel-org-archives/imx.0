Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F0812F399
	for <imx@lists.linux.dev>; Mon, 16 Dec 2024 14:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734360675; cv=none; b=LxXyhb4P5RLD95eLSvpFFPaCIL/sQK+o/1kWT+f0lg5CpJB8N/Tw3ZPBzzcJOzSUHTByk4Pr0Ti8fxOCPnyMus2UqtvpGc9uPkQ/zev/L+84n8xBKIbF321WAjrsFQ+S2YDvQMHijzTKSlR2vgwaejX6iodqCBQJXA6bistTi8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734360675; c=relaxed/simple;
	bh=ysrKQp2ttkXFu3hKElJL5pFgXA5DQVf+fUlliXUM1FA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TMJ0jFQRsT4swYeD6DT0LcwxvFoy+ScgSn5ICDcqSILJ4jFkFmqKaWMxFKrFPEP7aq2DRHpH7+k0wsRa75pVLCmXhoBlJw6/ETDJhRtDFPOEJ57sUGGsdzfoxcofwQ2lRlRgMX6vse+HxbPXCsgOo6uiOdiMeOv7JvF8jcErXtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLJRtwN0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLJRtwN0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43622354a3eso29049645e9.1
        for <imx@lists.linux.dev>; Mon, 16 Dec 2024 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734360672; x=1734965472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAsk9ZjNjG2Xsz4F0kxEND8XevJ5WxVcer/d+hZes7Q=;
        b=HLJRtwN0pUQAmGPh+Ed7FyUsTtSx3dlfYBMzd4n0t9vk/B9TPGkmJJBHUuj4hhamkA
         EyuVwc0rs1uvz+kkDwdWeY+stLBfjZibJqfBbr3xlzKQReaEa6YGDrntCx+YJpk6TyHl
         rnZQ1CpMiXx6d+Nt3JRqfrHJ41WJhTjSZxEBcmFbTo6tcSyUFZMFaxOgNYsPMoA14EAB
         jnRLDdCYavtDj0LuwpXD5CbR/a68pEREg+Bu/U8Vyr7eN5C1LBOlZdqAkvbhk/uEApVd
         Zik7DPKk1s3l8P1XswMrrPWliZv9NwWQMhbdL47hw/KaxSDnGA+Q2b+2WbcEa44FWFWO
         XduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360672; x=1734965472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAsk9ZjNjG2Xsz4F0kxEND8XevJ5WxVcer/d+hZes7Q=;
        b=Z/WoXZuUlL/kgeSYOiSqV0Vjh/YebTYmSISQxMrSQd2LQTJgru4+zg9NGIrftEZAJl
         NGxMkGHN/NqfpBJgixiZOFFhLA0TjABBL8EXZDFkOuVwnsQnh1yogBmSfgw9tC6Wv1Jl
         a4+iZ9ATfVmiB8Vkfmg06jxYzJi6GBJ/7fklPMRaK/SrbmPMUykUTW89U0V2ENHOlBO+
         liA20fkFQFueYijWPDsj3eeG/lWLvFavKbXrhuNrZWAvi/R/bfC6YPqynhLrBtUfR11/
         hfcMLgDHzxwKvUcclRgV5kWCk0MAVtY9qBv6k/80JISb/VNp6ep4ZsrDAYbygXZircVR
         0EfQ==
X-Forwarded-Encrypted: i=1; AJvYcCURA9uRlRciJQPHZ/Lt+ykbzna5VLkaHzdQFFajDnICxFy7Ktj9KOvh64U6NON0YTmVGCQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0uJUGQFuVq1WHzeAHwVHFaod2lvo/A2ay66gG3EtiQFnjnFTP
	rbnCVJsLbfQxf2qIVLg6fHikJny5tVTbAxw1yqQ889qa6sCTQhi4
X-Gm-Gg: ASbGnctf6fnFUrswadsTdMI88XQCztmLIngQLJPK36fPxXO8ql0L3yZvNhElrAmtujn
	NY5beJI05l2ZIese5rJWmAe4UkQa9TlDWIOPKR78tjkmMyITGEiNmfOofrk4t2J+g52C3QSgL+v
	CZm+9fU8XVztIfBC2fohtyKAl9PrzEZ8J6BcaDAILn+OfFqsOkoWAmCqFp+UEz5BJZajpnmQJtM
	QnhRf89lizwXfimFJjFNNEjylJ1QP3r0dPpmllcieOcU9xKaWUbut0W3ZP/jRb+BO+qjc07yFuQ
	Q/cx6QoMz5mek4Hp
X-Google-Smtp-Source: AGHT+IEEdMUhmjBce9trMWEaZmzDbJkRmOJV4eeE4OPNHba9b9GfzehogBrTvU3TQeHPPyjiEdm+kg==
X-Received: by 2002:a05:600c:4ed4:b0:434:a734:d268 with SMTP id 5b1f17b1804b1-4362aa589f0mr119266575e9.14.1734360671467;
        Mon, 16 Dec 2024 06:51:11 -0800 (PST)
Received: from playground.localdomain ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ed6csm141616455e9.24.2024.12.16.06.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:51:10 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] add sof support on imx95
Date: Mon, 16 Dec 2024 09:50:34 -0500
Message-Id: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
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

---
Changes in v3:
- Ordered DT nodes alphabetically
- Removed 'cpu' and 'cpu_ep' labels from binding example
- Some small changes to the binding commit messages/titles.
- Link to v2: https://lore.kernel.org/lkml/20241113195240.3699-1-laurentiumihalcea111@gmail.com/

Changes in v2:
- Added new binding for 95's CM7 core with SOF. fsl,dsp.yaml is no longer used.
- "hp-det-gpios" and "widgets" properties now reference the definitions from audio-graph.yaml
- Removed extra empty spaces from DTS as suggested by Frank
- Ordered 'edma2', 'sai3', 'wm8962' DT nodes alphabetically. The order of the nodes
placed inside / is kept the same for readability
- Ordered driver header files includes alphabetically as suggested by Frank
- Removed "reg-names" and changed the maximum size of the "reg" property to 1 to align
with the other NXP CPUs sharing the same programming model (i.e: audio processing with SOF).
The region described in the DTS is the SRAM and the mailbox region is now hardcoded in the
driver as an offset to the start of the SRAM region.
- Added new binding with properties required by all NXP CPUs sharing the same programming
model (i.e: audio processing with SOF).
- Various driver adjustments made to accomodate the DT changes + some bug fixing related
to the mboxes not being requested/free'd on resume/suspend.
- Fixed value passed to "dma-channel-mask". A set bit means the channel is masked, not the
other way around.
- Link to v1: https://lore.kernel.org/lkml/20241023162114.3354-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (5):
  ASoC: dt-bindings: add common binding for NXP audio processors
  ASoC: dt-bindings: support imx95's CM7 core
  ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
    support
  ASoC: SOF: imx: add driver for imx95
  arm64: dts: imx: add imx95 dts for sof

 .../bindings/sound/audio-graph-card2.yaml     |   4 +
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     |  44 ++
 .../bindings/sound/fsl,sof-cpu.yaml           |  35 ++
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     |  75 ++++
 sound/soc/sof/imx/Kconfig                     |   8 +
 sound/soc/sof/imx/Makefile                    |   2 +
 sound/soc/sof/imx/imx95.c                     | 401 ++++++++++++++++++
 8 files changed, 570 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
 create mode 100644 sound/soc/sof/imx/imx95.c

-- 
2.34.1

