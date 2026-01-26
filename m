Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD823EAB3
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439391; cv=none; b=OGyPKKaTvR9FIzCOpIOe7xl9eYDYn86dvOL9F9f1tA85xb4jbtJegr0lDQXtkqqavLMrkZ3cwzkEiFxlwHho/2EyfQZLPpsc5zD7PHAG33mA8+lyG/N6hl4MiKlPIrmULtlZ39oNCKk+U4TcBsEyIqtTf0FEivPO9t7BS46hKWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439391; c=relaxed/simple;
	bh=04Q1GPam45voSeBnPGR/U1/CMfY6oCgIxm079aOElp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=da6cZzYzG/zucNlCQudLN6YyFVoSTXuN08EzPVQbYpNOiNktX8LlGhQLobzilc+jzbd5xOgLjxmFZGD2odT2gTz8SF3Rkfcg8UtUsR+TZksj29p+ZE4fL51Nnr5e8HYx4LoOT2jnKy9z3bVxkEaHZt59duxL6/C00x7aGSSZ05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBDB+9Vz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBDB+9Vz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso46457085e9.2
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 06:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439388; x=1770044188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knPUlB2owHnkNVv4SE4pV1/cSooTAZY2IewxcUnkdP4=;
        b=iBDB+9VzKjc7Ubbfy7sDDHuvBSETyz99WRMY+Y5UcES6gyjcWS5XlFnzdrQUQPBsH0
         bTGNv3u1wXr660OqZe7mY0cKOFENF1CwId6btvYsy+foRtpD6ErQ89Q/duyXrpsQqyTU
         y/zPGX/v9JX4iJ55/1+HXeQAhYG72Tl6hplhEjyuMhIDiGT0EyvWfsYslZsB8u1hwVHD
         stzbo64BXmZQp0cykR0iiWiYnBXOGNLpM33B+d2l9y64/RRvRY66kqFEKUtxoMpO3az/
         sJsqPu6/6SzKJxQ+VRBzOJ2iFStzcGVpaM1wIQoQqYiv8k7cGds8dbkTrMZCgYmLNZkG
         +Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439388; x=1770044188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knPUlB2owHnkNVv4SE4pV1/cSooTAZY2IewxcUnkdP4=;
        b=ECuo38yGybATlBFBE40K8GUg2kQaF6+fVv5WeQfMQ35trQ+jPuGXf4MzZILauOpi7N
         x/AYcRz9NQZAwqHlM22bhKEvhvm74yeTF0fZd7gl2hq9LeEQ5N6UYAaIWqJlmfcAla0y
         m3Bp55Q4VvKqcL+P6+R1ruAvzohevn3IK3hIT/9sCf1UdFM5hejpG0iIvuWcMNBPwbLC
         cpYZSXGTzeyei9T63B35fd02/9Uah25Q1jiTuUEb9n6Joc+qtEa5Q6f+A/S11fIUCCoe
         tj1ZdZdioU9PNX9HiMSQKi0uJAa06Ewq2L2oix3tp/l96Ysv28rGRAu6CVwVFApJ5RaD
         EsSw==
X-Forwarded-Encrypted: i=1; AJvYcCUCf1R2fQjDum3uFCDlUc8IVuoHGmu4FhTTfQK/R2ZnmNzWVCbvs34pQuiu9K8KqNEZyB0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA94gMxU5EEcuNps9paK3QKiUY5XnBP1ntDuUoQ7w8/beg4lc7
	mH2GNFWKiCMwnHKHETQ1qbTlL5At6yYNOrkm5xqMqknsPN2OdlRdPG4Z
X-Gm-Gg: AZuq6aJLxsuH9eRZnwXoZ030ySqqcUnPQmttoiQcSCPagFlvYfIp1cUWO+KLbAXk0LR
	0Si+nWFtCVxeZTet4iHA8r9mm/967SPllUzzNxs/uaNpksgkVAeV8N4tzS1IyHylKCRQUHhF0Kp
	nE9IC5+/fzwhZPUd2dauDLaxqA/P4O2FgD1br1NrvLYinVYks7cvU/O9nzcq74lsuTk9coAu16B
	SiPBV9NYgkG6myYjDmL4sTjQXHJad5Mvnm4iks1oaTKcBTlKz6R8/v2P2T9IN8++39klMwpF/fY
	krQBYjUZsDZXMIgLxdOncVGlUyAeJPt5sxzNj5RIYQdY932PTYCaTTIo9hVlwjGoPB/0AqhFRud
	rY6HjYoldAOCDrOMqDOpNKgHhhrp9lzt2d7JrDnVubIdyAq9Qy/xsq72v5MCs6idi2gSmhzb2uY
	FfQaF/GActjeUZIEawTxCpYNRIqi73JqZGV2N3HQ==
X-Received: by 2002:a05:600c:674a:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-4805cf5e6admr76087785e9.23.1769439387866;
        Mon, 26 Jan 2026 06:56:27 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8c0aebsm278448735e9.15.2026.01.26.06.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:56:27 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 0/2] Enable AONMIX MQS for IMX95-15x15-FRDM board
Date: Mon, 26 Jan 2026 06:55:35 -0800
Message-ID: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series enables AONMIX MQS (i.e. MQS1) for the IMX95-15x15-FRDM board.

---
Changes in v2:
- adjust binding commit message as suggested by Frank
- replace whitespaces with tabs in MQS pinctrl definition
- link to v1: https://lore.kernel.org/lkml/20260120150329.1486-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (2):
  ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
  arm64: dts: imx95-15x15-frdm: support AONMIX MQS

 .../devicetree/bindings/sound/fsl,mqs.yaml    | 12 ++-
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
 3 files changed, 88 insertions(+), 2 deletions(-)

-- 
2.43.0

