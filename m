Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27CA25F7AF
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 10:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739204; cv=none; b=Y/5Dyxg2gC1XIqPRCnR+oKrQgM0QTSL/4pbWel0mU/nUqRf6L5Vc5b6y03640axWiuYDd2F89W3+tL90gCLvYls94ieejoFICrs4jvvbQyXpxj7cNT/q1ASrCZ0BKgGaBCcvJZ9eAHXC84qS3lTFy43w4GXEKFbNCWMSKLgzenk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739204; c=relaxed/simple;
	bh=dfgjmv5F5JE7raR5i3ywX4SocyL6xGBj4+cj0iwFjgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oaZCqZ8e823Ili4IGGG2vq6Y677plFhCFM367bFS+NtZcJlEwkoW+DN4nBR+EYNVyql4+1hnB5ATpgScnvHbYMoMp6XM1hlIpnJ3XJcSpMS2So+46vsUcWmVLgdw96rm2UHu7ufwtVOsyYPn9/YmDPP/gE+/EPBD+intSK+3BSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdGjoec9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdGjoec9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439a4fc2d65so20029935e9.3
        for <imx@lists.linux.dev>; Fri, 28 Feb 2025 02:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740739201; x=1741344001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi80ttWsp61rFaPMRzcRoSBsD+icdSl9C9Rjx5VP+3M=;
        b=bdGjoec96haIcdFvH+cKK+fEit9NKig+mPfjkYSYYcCXUuG7MDWrBXhDOkoKFlzxnD
         akOfKS1wH0oAgdFFL+aEUlVJHRYCp7E5TLbsPqca4e0KLPOBVIwsX2xtsvGUh56Uj8Nr
         UvEg9VB+YOa7fjECTJgTLdU6uBNp/Sso1exU5PdAEBsqPK3r/TPeQGMkc+Ub7vxWfjBz
         nrb7fHvWtiQYD8xNZeGvvCsmaqM3bqYU/5eO7CGOu4spX9KNROocD+LmMRCAzo1Qqfx9
         l3zCuQdw6yFDr2iZXNrXFNfqNoUKSYINW2X6P4e1WVkd+ryFJ28GsFkmVM5Hn+2tmJzQ
         oyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740739201; x=1741344001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fi80ttWsp61rFaPMRzcRoSBsD+icdSl9C9Rjx5VP+3M=;
        b=lHuAd81tb/LJF4pYARawXMCriZvMwQGfuHtMfaaPCziKv/ulUmEXSrITTAUwT9WkMl
         FImcgGzkbpJ87T4XSnFNKJHjZ6LuoNJ4BQ8rM2JUrQc1vuU97eaa2Y+RBte1SCsV7dRK
         JcMftHytFQwFVwD3d8mHQHMDouJNhc9FekyZYWeiqJ4/pbkWz8rwm12189TGj17ksp30
         sHmheSWhUFDI55OdGpUOJ/bKJcrl4DuqpqAD18i+wKoLveVWW2zG0XhWfxLful5CgBHW
         yzylGJ5aJQYOuPA8k7RVcF2eSgX5u49L9uBe6vgs8coDe106HCpoR7UJSl+ozuJ6aNiL
         K7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXXwkmfNDM6ZaIkM6cGrlah6rDHgAVfrgfyCifpEnsHs2f95XsAy32Iuimv5ppqoBIjgwA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPdbcpsi+s0+OH9eQBQtzhWzJpzanYis3k6vyT/zauvZTydBL1
	PWqLtZ1dVBLfp259+0yBXFBaL0Sbza0gPI3qGNnL+Htdh+Bc1j0y
X-Gm-Gg: ASbGnctGMyQS1ABbYg/jqts4fozMh2eYFJiIQ5AZNaeSdx18o+9VSY07rnpNZTsy4r8
	Cng8KfN4Ofwf41zaPZHZjWgbKL/o2SX7+DtlN36+vcfPyu7jHRRX3RZwhXapfRLTsfzQX/gwso7
	UbIZdSi9SJGFlF/9qDtVSVnz2CGzCwTVpZ45UP7/7p2R0dVikuR2zP9LBXLwczc6cFg7tZpKlbW
	UAmcuElCZ37m4djl+YYKFDCOwKatL8Vf0CPzr9RxMhGnfRmpq3dZXAZOeaM1ckuIUurNHMTag0y
	XMeWLQAgnwKApSPhTj7ZtpuHwKHj2Vms7FJdOiWYjg==
X-Google-Smtp-Source: AGHT+IFZ+9Q0/YRqcF3z6Eyi5tLIR/2s8CMepw/0ILneK1BAb1xfCwMbUhjYYRJlgvj6BOKAvv7DEg==
X-Received: by 2002:a05:600c:154f:b0:439:86c4:a8ec with SMTP id 5b1f17b1804b1-43ba6704456mr27891215e9.15.1740739200632;
        Fri, 28 Feb 2025 02:40:00 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:31d5:4145:8035:cb68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b73703caesm52078855e9.12.2025.02.28.02.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:40:00 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	tharvey@gateworks.com,
	hongxing.zhu@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] phy: freescale: imx8m-pcie: fix and cleanup phy
Date: Fri, 28 Feb 2025 11:38:32 +0100
Message-ID: <20250228103959.47419-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imx8m-pcie PHY PLL fails to lock under certain conditions when
returning from suspend. This is resolved by asserting the PHY reset when
powering off the PHY during suspend. This ensures that the PHY is
properly reset when powering on again in resume.

Stefan Eichenberger (2):
  phy: freescale: imx8m-pcie: cleanup reset logic
  phy: freescale: imx8m-pcie: assert phy reset and perst in power off

 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 24 ++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

-- 
2.45.2

