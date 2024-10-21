Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B1A19DF8C
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525981; cv=none; b=HlT8dtmLqd2HVyXTSjrBWmT0zfcm9QXRNmiSsxFoYAHSAwR1NawcPekRD+kiHzvgNHJhxALPs7i4xp7yJmkGV2g7o+H0hTnFVMQX9lRp07ns4xWU6c8j4Y2QKsa9Lsa2MIrwtDeuBGVkIF//BIlZr62GPAihatxVHgNSecTWozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525981; c=relaxed/simple;
	bh=wmxVX9fcZuDtfkzm0ip9rDTLU/O3snfpBq3znQ/y7PY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VecVE64KT3bwZ69cthHDDFVbesGtVayf9QBqsGftOT2jmqJeW0y15dxYNlUX/KS9uptc8GJZ4Ou4SjjK4uQ1aXy0hrAuRj6uSTPfMkIhU94jArmzgPBj9w2Vcc9Lj2WTA8B7qm8UzGxOFJjLVm2qhDmczz3HaJgrnVkntFB6PpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3kG8i8t; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3kG8i8t"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so2248126a12.0
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 08:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729525978; x=1730130778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3O214AEf+5QWb64FzF1gmY40U1SdIzfACVup4P8JOMY=;
        b=D3kG8i8tkn6c4SW1ZvNgX37AuhAFVAArq6OqUu4kG/2aA2etnCsIJplngLskJkG6+3
         k0FcgrA+//3kvoIYicm3yooaWYR4KWasRPL3XyzraApH0RCtfCankhnH1kRXuJywgt9L
         n9/QXLMfcrKDOb2K+dpp4Vmk2UDA+JdZxVvnndrIM2PR2uqEhIBBTtna3y24VNqcA3Y6
         lTiQD6j9CIfQBXiTaHhIjo1lPYhAM3m0r3DLDqL/9ynvp/mmXAo6/UuDjI26J4WPaxCG
         fW6DIYW3ylD7lwgQpeFzaZfA2R3mkGSdzm05WbDVAwTvIQb1Vqr0YMvsCZSDzxM68iTM
         LDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525978; x=1730130778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3O214AEf+5QWb64FzF1gmY40U1SdIzfACVup4P8JOMY=;
        b=q5qjtRqVT/dF96wSa4TvQUSWz9Rg7xKm0HGOWKfFyQPdsv6HB5fl6P1qEdmmZGS8pd
         eR/wFJmr/9L2pCGTErHpjhgrzNjgWDWoUXI+zIT0ckvdISglT40HU01oaJLzcUvoUKhc
         Q4a3Vw9nEdmDlwdlVD84FrpJMLzyw7Js19fRfzVSnD+QB/+E9W3cuc2nkTUNmMuRC2tc
         LHLuSXkY0xz+bsYqnXCMTxuNPiVrAVyu+zP3nDk7jjtf0Meq03GCUhsI9QbAJ+DZbNnu
         QVJW/rvqcF9jEsKFHLmeM/watNcuLmH5iBDzDfBOA0LUkJAtVBVc4wZ18OLHzdk7ZT9C
         ZdMg==
X-Forwarded-Encrypted: i=1; AJvYcCWhdbXQIgwmKaz45bbv7RB+miniAZBVvVe6ak3BjFdFbg13k4a+ldCJcet6NYUkxu6hSKM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxtgJaRQ7JWZkJMpoeCapl8628DTZ/LXRIeN/yHRcx4SrSEiVt
	hYnPGXXrzATV16ElQBifOx+4jYZad8p4SImBbk2UbdYleO/8J2ot
X-Google-Smtp-Source: AGHT+IHtQDbhUtozFKhbPGAeSjBWR702lhB9UgQf3G3sRaGWb7ObgCxPw9zhhC5M7xJ1P/JX6p1l/Q==
X-Received: by 2002:a17:907:1a50:b0:a9a:673f:4dcc with SMTP id a640c23a62f3a-a9a69a7b277mr754959866b.22.1729525977697;
        Mon, 21 Oct 2024 08:52:57 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912edfd0sm218614366b.67.2024.10.21.08.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 08:52:57 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/6] configure imx8 dsp DT node for rproc usage
Date: Mon, 21 Oct 2024 11:52:15 -0400
Message-Id: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
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
Additionally, fix number of power domains from the fsl,dsp.yaml binding.

---
Changes in v4:
- Added Krzysztof's and Frank's R-b's.

- Wrapped DT commit messages to 75 chars.

- Placed 'mbox-names' after 'mboxes' property in 'vpu_dsp' DT node.

- Link to v3: https://lore.kernel.org/lkml/20241011150439.4027-1-laurentiumihalcea111@gmail.com/

Changes in v3:
- Moved handling of IRQSTR_DSP PD to fiwmare side. Now QXP has 2
mandatory PDs, while QM has 4.

- Dropped the optional PDs. All PDs are now mandatory.

- Dropped Linux implementation details from the binding's commit
message.

- Renamed reserved memory nodes to generic "memory".

- Split QXP board and soc DT changes into dif. patches.

- Dropped comments about SOF and rewrote the commit message of the
patch that modifies the 'dsp' node from 'imx8-ss-audio.dtsi'. Hopefully,
should be more clear why the change is done.

- Squashed arm,mhuv2 binding changes.

- Link to v2: https://lore.kernel.org/lkml/20240925232008.205802-1-laurentiumihalcea111@gmail.com/

Changes in v2:
- Modify subject of commit changing fsl,dsp.yaml to state that the change
is for fsl,dsp.yaml

- Fix issue with arm,mhuv2 binding found by Rob's bot caused by the
changes to fsl,dsp binding

- Improve formatting of commit messages

- Link to v1: https://lore.kernel.org/lkml/20240918182117.86221-1-laurentiumihalcea111@gmail.com
---

Laurentiu Mihalcea (6):
  dt-bindings: dsp: fsl,dsp: fix power domain count
  arm64: dts: imx8-ss-audio: configure dsp node for rproc usage
  arm64: dts: imx8qxp-mek: add dsp rproc-related mem regions
  arm64: dts: imx8qm: drop dsp node from audio_subsys bus
  arm64: dts: imx8qm: add node for VPU dsp
  arm64: dts: imx8qm-mek: enable dsp node for rproc usage

 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 31 +++++++++++++++----
 .../bindings/mailbox/arm,mhuv2.yaml           |  2 +-
 .../boot/dts/freescale/imx8-ss-audio.dtsi     | 19 +++++-------
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 27 ++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi     | 28 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 21 ++++++++++++-
 6 files changed, 109 insertions(+), 19 deletions(-)

-- 
2.34.1

