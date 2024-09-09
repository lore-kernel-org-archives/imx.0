Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB961B5EAA
	for <imx@lists.linux.dev>; Mon,  9 Sep 2024 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882583; cv=none; b=bBp+85DsqpJO0vuvLsXB93+arTyyZTSRnf/c7O28+xECpafNmRyM7pcoyL813YdZVglYt1YgwmEAWqUNJAidp/F11WlPL6YJx3gCFFFv2J56WAkn7CBO3ts+bi3mSCzqoGPV1vVZvkAHBeXl/iPy/FxLyCJ68dahYEW2mB9Zl48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882583; c=relaxed/simple;
	bh=arZ/aRCI8RjVbmd/qQaYYhDM2KAsOdFW80sGTMcqzcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nzvYbUjRb2jIPoCA4SkiJHkqCCUtwW1knnV2+P3T1w43E/Ffcamx11+cmlk7A+I9DO9MvUzlzt8kAttvJKWSL05wpGInmwRiecVCBko95skBiRQ5gO0thquwqmGzCuoQ9mSJJu3PSdF4CLQOmy66s/GE9qBW7LllPGf/UFINgiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HENlBwQb; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HENlBwQb"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so397931566b.3
        for <imx@lists.linux.dev>; Mon, 09 Sep 2024 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725882580; x=1726487380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7yMHWrL9ZEdbzgv4FiEIqUx9jdhIAG5hzUCNs4jhJA=;
        b=HENlBwQbr423YoXmb/fsmCphc1Y/E9tqUiXwiYqEvwaPtlt4Pcfq2bkARVbliBnCRi
         zEiZC6SvguCHQkvLm+izzc/1+nOKxpjKySVZCqHm6372Fi0D3AbUZVLzqg6gJDB/z0dG
         hrtf2BmoDBTodR/+/I1hpODpFwx1UnfCB5cohPAyh4JtmW1aNYRDSRLyHYPo981fhcls
         qvBoEk1tT3CR77y+cmeYTV3POVj8xv04+f1W9wp1glGCyXV6RGDCazKGuRQn6KmRddtH
         c75akkadE4McsG375rfVsJYMKR53BmfNbPVeVt8Y9jMxaE+Ht/XnK1IXp7JRm+BrFPLs
         IHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882580; x=1726487380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7yMHWrL9ZEdbzgv4FiEIqUx9jdhIAG5hzUCNs4jhJA=;
        b=dlqNRAFDLypz45+QGlHXzP2ZfFgAhPCCOxxPxLosssZFavIwl9C2P9l0LlAv8mUhV0
         T7DZjj1sjDlblLyz9vweESUdMJ/p/LMCjsGSyLsAhpwhN/mc5KrCAZngQrCY1yaVqBM1
         dAbPP1HEnq6+Fdm/FR/TABZ48VGKcrGp00RC55IsRNk+y5i4f+KUQ9U5Oa7b+hu2oaGb
         zhIJb+b7voEoMLQV/50IMaV2q+p/h9Ba53ovTy/SszOC/rySBtT0rSWbKsw+tdM0kZMi
         5d12p02AIGFhlgpmdG9aRsmQDjLQcVzreITq7GUiTSxh3mDTzDrx4f/wNNq9fwOoZV0G
         B8UA==
X-Forwarded-Encrypted: i=1; AJvYcCVHzt713GvHCkX3hW1ivjzYvG3mdQlqYu/qVNWp116EMI7/rAQA1HRRW3O4cws/jsknTs0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoC9RBQgSZGOUYbVYfDibTgRkZjbZ1cdOujUqc6xC/BZ17qppt
	C6BQPxsHcx8FtcMPvD6swIkgsh0gtBnS4b59ttqz5V/1xyE85y3Q
X-Google-Smtp-Source: AGHT+IExHM2D+8remfomSplOB/lDJJ6KJihVaFo+uM/owHuKgHa7QeZaxVcJWFthdNg6+D0At/ulMg==
X-Received: by 2002:a17:907:72c8:b0:a86:af10:6a47 with SMTP id a640c23a62f3a-a8d2494be05mr550365566b.60.1725882578731;
        Mon, 09 Sep 2024 04:49:38 -0700 (PDT)
Received: from hiago-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835697sm333258566b.16.2024.09.09.04.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:49:37 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH 0/3]  ARM: dts: imx[6qdl|7]-[apalis|colibri]: Update audio card names
Date: Mon,  9 Sep 2024 13:48:59 +0200
Message-Id: <20240909114902.82380-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

This patch series update the audio card names for Apalis and Colibri
iMX6/7 to match their specific SoM names, making it shorter (less than
15 characters, as shown in [1]) to fix warnings related to ALSA in
Apalis iMX6 and Colibri iMX6. For Colibri iMX7, also do the change to
make it compliant with the other card names.

[1] Documentation/sound/alsa-configuration.rst

Hiago De Franco (3):
  ARM: dts: imx6qdl-apalis: Update audio card name
  ARM: dts: imx6qdl-colibri: Update audio card name
  ARM: dts: imx7-colibri: Update audio card name

 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.39.2

