Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21336F43D
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117315; cv=none; b=SxxFpPeGUTBrLJGIZYEY1Hu0E9HLJ3VuVYdPVD52uLXmDEyS7GMeo1jX32j1AXQvstgCJOfaRGSBgGUsfTz7mAlmxyw53YRUi4psJK9zVdt9OBdWDXfP0BEeZlq5RDcbhHMU1m5g6c/Mv1kfe8DLsZiIMfh/n/0DSjTqDh6wtVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117315; c=relaxed/simple;
	bh=JmzVSEjedO3VO912r+fj5eVKGwTqy6TpqoCOEuoAOxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PJOlnp3tc9Bq+UM3Gw/q4NmygW3XSSiFfFfo39ebzNiBVWONFZmTGK/CChFY8jUWFUipnE8dEES00VRQcFH6kj/NRBy5k5R/El2OyyyIoT077kvFAMcsupnU5z/BeRNOdzK0yIN/kOjx9AZuvwp9YI4NJro4X/V8CRWlAH4+qWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWwo3n1k; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWwo3n1k"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ade1806c28so5722315ad.1
        for <imx@lists.linux.dev>; Thu, 26 Feb 2026 06:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117314; x=1772722114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gSsgQwZJwP3d9XrK8WyIp3GZ6Hj1uEXl0FYyD3hmvI=;
        b=AWwo3n1ksIgDxDHJf3gqGne5uBo4DBv+BkhiozRSsgK00A0JYT/V519R7HuSZb3/07
         lTvb6CO+Mlf9yPMa8FsgWavkU0+bH8LAxU7QuDSlUv9Xx1mCg18rJ82SQYVH10oglr5t
         at9dlnk0YV9SvmFhnsJ7/8swrhTyThj/YTc7SR4tv5wqQyLM04r7qWTzrIZ9vyKoDxna
         SIo2eaRMBCext72w6lSkqViUFtBxi4kmG6q1ndObnzHUGuNF9SQFvYSbP+FgCYeUdq3o
         JppWNYE1zebPl70W5V+IzCWAWmZ8YXcEd3kZ58OB39OSq9I6QCAqq5MB4wEXoz9H6RFa
         pAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117314; x=1772722114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gSsgQwZJwP3d9XrK8WyIp3GZ6Hj1uEXl0FYyD3hmvI=;
        b=qNHKqDJL3KHsnmUAszKMr2wRTZasTxlhdYr6hDnPPFdqRoEtD4TegylTy5u3YO31gR
         GHKou9BhPqP5ZZVjYfl5RTHM8dCIp6adEA7ailJs5jpaViyBua3ZiT0Q8vU3VLFtm5m3
         K+298v0J1IfJI9l8ozOi3FKR7SLmukdhT1+lFpIO7pInjHPmGvL6Cb/XYfg6F1Wx/yer
         O7yoiq0kjnbvIRD3SJotk5Bi5bGes22U/KXe1jgBrr7FvaOwHNbOdvJi5mUNonZQEJwp
         LORFTsoI6PzPMzPIcxYr3JgabgbhOX8B5SWMXy3ngTHQ42ntd4uMzLDCfdlHvoSIHDV/
         vtKw==
X-Forwarded-Encrypted: i=1; AJvYcCWmB+a9iXh+awt8fzQyey7soqbw0RzwzbNcLSYUATSXKpVStpYYrh4Q7a3PsLH+tpHujL8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9zaYdZIbipF4FMS6/HXG8p6HkyvGl4PUpig2cV2Cze0Xnn4aM
	kkfNZnASRHzOSPof51cBCq74r0zEboHyzZxyd+qUedH/6//MBkzbk1YE
X-Gm-Gg: ATEYQzxBcznQC1m6FboZfdP5MWYiks94vkqGFMhX6F88enBBKjIwfzcB6nexEcm0heG
	5m2EvekXb2FRE8KDKpjaKZ/qIWLCH/mOKLlIrJLRUyBUuMXvz0tRkFalGyZuC+iDyrlKcVc55Fv
	E3spoWBQ2kHOesJ/cP6+9bT6VwodZ5OvY5ek8GjqvVY5Ys9/pvHAE0QR153cQ+crBbdA7muGF2q
	b93uN5kHD5vz0N+2svhY/TARksx+DrGviTKZCS204PAi7bDgbUmoyjazUjg32J/FVOjvjMcGmYY
	96ocAXm4T2XmT+33KYm4masfITnQ2rAlKnfJTKsZJcyUd+zeQt66qqkIzJVAaDub6CpmRv3rDB9
	YsqVcTFJh8SYKCP6jveXCfSmTqidT+bdJYrRRhNJxD6xzC2NZzH82CmLcWZ8NN/AGZJu/dpAxPQ
	qxHqpEiGjGi8s9y7an+sR8U9+lXI3JpevarehcSJbRbeMJLmr7uo5rjXoRRxaxh3hJj9+ZdlVG+
	Lawyw==
X-Received: by 2002:a17:903:1b6d:b0:2aa:d61d:b6b3 with SMTP id d9443c01a7336-2ae0349484cmr25894555ad.41.1772117313599;
        Thu, 26 Feb 2026 06:48:33 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa65sm27871825ad.58.2026.02.26.06.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:48:33 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v5 0/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Thu, 26 Feb 2026 22:48:18 +0800
Message-ID: <20260226144819.3428730-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v5:
- Use 1MHz spi-max-frequency to comply with binding schema

Changes in v4:
- Drop invalid property

Changes in v3:
- Misunderstood reviewer's feedback in v1, improved commit message description

Changes in v2:
- Fix Makefile alphabetical ordering
- Move vendor property before status in device tree
- Simplify commit message as suggested by reviewer

Wig Cheng (1):
  arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM

 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 50 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

-- 
2.43.0

