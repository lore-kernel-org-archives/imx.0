Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270B71C174A
	for <imx@lists.linux.dev>; Tue,  1 Oct 2024 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727786734; cv=none; b=RsYbicTb2cvGJLBNOL4bY4ChTp9MOr/gYHbNWKpWOF0tf0LJM0ofDkt5aV31R4bnIdYv0bNHhmuEagTNIRs4u6Gk0n22NUUFSxal3OpJm5htXNtOAlKnPzBzAsczIkxS1LxBxQq0peLBrTwrHDUc1hb0NkufSDVxHWRTmYnPCrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727786734; c=relaxed/simple;
	bh=vZ3+CMDw1EvumqOoU7sILf5b8Z/DmzRjPDWTg7aufTo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=UqtmlMayXHjp9EKu7RbmRjqBJgh8tOH6gTEMwnUP3ToyTB1uLqn6o47SEHdn66Wn1MeWvbXuMf8C2smWsKAeLHSNt51lIfq27XRciXTSxzraN4ikou1JIUbg18yee2gw8sxbSdC7KgyFppfd91yY1eP7koPIK9rxWQAE8OGX7pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZDTNUsK; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZDTNUsK"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7d50a42ce97so2326961a12.0
        for <imx@lists.linux.dev>; Tue, 01 Oct 2024 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727786732; x=1728391532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hg7gGeL9N4ekrc2dLXOxIsLr5323K9FY89aAbEnDGQ=;
        b=cZDTNUsKHZN8WKSJJ15Jt0fAIfmRZW+uRsoAs1UHfOjy2VATc6Nn8bwK97C+UuxBjL
         EkA0DHLWQI8pChLwXCJPACuN/C6+nIZ3DnB7JcoixtMMJox/zRq8w7FUo+1WSf8e3Xc6
         uoOTET99P5aVGazwF5dP5lAXzP86FiR4LVZucV6benMMTqHWFl1NQm3W3Dds1UvzKBEL
         BTHLtmY6KIISUaUJosn7ZlJ5xHlXJOl8ehJZRSKJ+S1pLnCu1aifjKtWddVcXp1lSosR
         NFjIGN7lwS/9DzZ/Tg304SFiug+4tH1OlOUhzFMYMiZhI/tuh2MU8d9Gcqyi/jT2LZ5S
         mvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786732; x=1728391532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hg7gGeL9N4ekrc2dLXOxIsLr5323K9FY89aAbEnDGQ=;
        b=hsmzmtHGjOVnx7FJea88+Pv5buHGcPcQxcJ9tHzoWmhzd+j3ckAODS3ijcH0RJFLar
         qgV+eRvi1fQ6TLy9EBwOC5o/YLkwT3srMwTExxnAtZFF/HHu9F7v07vAWmUB965xX7er
         ufHBaBR+0/LadqCfmL2ThjWjAOwDgl41jNpqbIcUsQ2mtG8El0Enc5xnqlaqn0n1aR+h
         SsUihwQToP9BZMwwMAzKFqw8310wQOPJge20cw8ruAqLGs0jHXfvBE9LAtxIN3mJtQVA
         vYolKJSybBAECRLVePKJiQNv1amo3zETZT7qlbxUkgSAf1AhP04EcesIsOFdjncoRnts
         Vw5g==
X-Forwarded-Encrypted: i=1; AJvYcCVlH9baBH+pti8Vj6CJriCF4yfTgJ3g0QjWfYuxM+ysMQfoYdv7p/CJzH58SQLj5czp+Eo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk22KmYNShbA6pGppbEHOugDb2VE41fURbo8Htzxs1DDuLOb5F
	qITjbIlVzF6Bk0LunhOxS1PyM69zY3ZZr9Qy2Lzc2x8zz9XcAMN0
X-Google-Smtp-Source: AGHT+IH/SAm0KdyL1ow9WB9rN2zIwlZz+oqrDSyo3TYfpxV6u0L5k2aW13Vn2k7GTlVkaxXpezGbRA==
X-Received: by 2002:a17:90a:4b86:b0:2e0:b741:cdbe with SMTP id 98e67ed59e1d1-2e0b8ebe8d1mr18202134a91.26.1727786732344;
        Tue, 01 Oct 2024 05:45:32 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1704bdsm13629171a91.5.2024.10.01.05.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 05:45:31 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: freescale: verdin: Update tla2024 adc compatible
Date: Tue,  1 Oct 2024 09:45:02 -0300
Message-Id: <20241001124505.73857-1-jpaulo.silvagoncalves@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

This patch series updates the compatible string to the correct one for
the TLA2024 ADC found on the Toradex Verdin iMX8MM and iMX8MP devices.

João Paulo Gonçalves (2):
  arm64: dts: imx8mp-verdin: Update tla2024 adc compatible
  arm64: dts: imx8mm-verdin: Update tla2024 adc compatible

 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.34.1
