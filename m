Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E918EFDE
	for <imx@lists.linux.dev>; Fri, 11 Oct 2024 15:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728659145; cv=none; b=h18vJxuBrdxUG7bvOVu+aycnjYLuaaBKivgn7k6OLh0OgDy35JMaZ0jPRMC1aoQm5cdDfkkcwj1TcOP60G9d+kQ4Lb0Xvssk7NA9lZHZIwpMns+HZkOsrSJ3Y20g6DwwO2aghF4zY8iZBtSJG0llCxtbPoWdnyn508dCMFJZfC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728659145; c=relaxed/simple;
	bh=S7hC2uywjAi3J2LiD/sEewm3zShuQTHXN6TAUI1rcwM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c3FSFKNECJmImzT2rA+VVAkUjxHMymrS14YCdRVZPgYJkSTsSwNbFWCuKg5ENhxgf8xnK2YilFfd+JT+uyDDp9gQTiduABAijnnpcCOLTsbmilQXJqqDuDXUbBGH1Lmuj0cP25CutOn+NBjceUQJRi01G894xr/QRogTsBokWJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGVw4o3n; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGVw4o3n"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c8af23a4fcso2778374a12.0
        for <imx@lists.linux.dev>; Fri, 11 Oct 2024 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728659142; x=1729263942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JLi2DAw+2fMekfQEPfo5D7B5LkOQMf8QQR4y0YqqiDg=;
        b=FGVw4o3n/a3KJh+hV6whpW++CWQUZm6ryOOMOek0X1iHKm9JrxDQfkY9NDmBhNcudt
         8vEjTrO+AlxNQ7Vr6fKaFfaRdClV9v+8CyRA6zSAMgJz0fNlTFKZ1UPFnaXRCJuuMura
         LPMcRi+LiV9E+SZ3oUBJY7n9uzyr7bavsBmkxpVtmbbMWj48J/t5rb8n+2GMxm3Wi6/H
         Z0M40isVXymnyHVtCOge5YRN/r/hKbO0Ojy1B0h12wML9alPesCPouutqzEN68WjG5x+
         QqX69Qi/khBbGiOTdKXwHZMttK3uTxubRYcsfMjmr9WDXEOCKp5j1YhFPOVBbM6st64e
         jFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728659142; x=1729263942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLi2DAw+2fMekfQEPfo5D7B5LkOQMf8QQR4y0YqqiDg=;
        b=mGFgWyyWoytqb9AQM0SH7q/6D6bNACnfNZxCj6X2Qm4+x3hAy8OUH70jfy//c9PCxa
         yk3R9la4AWheYIIhugNmsLWkYiEQrs3N9bBV6DtsGgPpebDoKxlMhcMpdfz2+b78Hhmq
         GtLCDQFaLhVsHpR4Y1AVjxB6Ce0wPHav/kVgXyfAO4y6WO5Kran+uQhrxbbkJAjLrAVX
         s1zLjmUsd+dLJlmhjHr52oqW6SI4nL2aqYbWjvwr9nITKK4VEHWCfjJpy9P8mxJTSrdy
         FZ5Fe2l6Hjwej8XfD2GXjLXqNca9D5AUnKD0/jUCUuYbHVO7hc1XbixvHQMG7yUkJ63N
         BZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr7QAwYHlrXHxo108l8qLvr4bPtE9RjDUHV2LEzLR3WQ5Ku5uTUFtw9KbNvOr51xcga/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIpdhaugqaMPUOSjZQQtqgi9F1Cu89Cpgxetb85wFl5q22MCyx
	DXmfokmYsvuXVi+lznMTkDR4A6GrAIuqVbFWFvLgF6DKrIHQ+gXQxpOVLbmp
X-Google-Smtp-Source: AGHT+IHR8U61EsX5VMeZ4KH4278MjiC8lHiSwSBRd4SFpOrYz9cno9dfpAt6fts9S5Z6KeqeIRXxaQ==
X-Received: by 2002:a17:907:1c81:b0:a99:374e:f3cb with SMTP id a640c23a62f3a-a99b95bc034mr235078566b.46.1728659141728;
        Fri, 11 Oct 2024 08:05:41 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5b0b5sm220879366b.94.2024.10.11.08.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 08:05:41 -0700 (PDT)
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
Subject: [PATCH v3 0/6] configure imx8 dsp DT node for rproc usage
Date: Fri, 11 Oct 2024 11:04:33 -0400
Message-Id: <20241011150439.4027-1-laurentiumihalcea111@gmail.com>
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

