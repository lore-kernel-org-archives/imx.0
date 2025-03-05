Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675FB24EA87
	for <imx@lists.linux.dev>; Wed,  5 Mar 2025 14:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741185847; cv=none; b=J38svTwADOeAeXfpxX4KduF7be7CYZ1dZEv0Ef9vk5c6l/oK2W2zEx4JJMIkD34pL8g3h6je1fSLnQnJJuQPduLYA8gE6keoCgUre64XCCh+GrNkH/6NVdRCUUA1GzyLPFMte91tUuBhy4nda1gjh8nyeJ9S4B8oaBWtAZzCSP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741185847; c=relaxed/simple;
	bh=khTfYbS7TTRK0cngWDGo3k7vxdXzMUP1uxbMhY3ktDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=saxkrVinWXylPNeMN5VhBDjlT6HG5YWg3NDRmxCWq36oH42aPLlbt0dutX+eAgQZ6ci5c99OIRL/OziuRc3OHyDJR1oifIvVJuAH4ZRZCxqF2NOm0HmCwUIyk455H7MmeFP4lgh5eM8wmxEKY6aqv5byP8N3rl9pk6RWGIaUbNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWJDFqAL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWJDFqAL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43bd87f7c2eso2447205e9.3
        for <imx@lists.linux.dev>; Wed, 05 Mar 2025 06:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741185842; x=1741790642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cTXHQ//nEUi07Uq1rIglvGA2poPkXrtAOXEjlPFl8vo=;
        b=LWJDFqALMR/3lzjruI3ysJiyFPBS5S7tHwxy93Vl1VOhh4gvnwqI0Erbzf6qnGVwL4
         x0aHDFTSfFdK1C0cuu+svLRi9ijW19EeGWF5dvtDvqt/1gqV3tG4Vzf03qFE2ZBa/NEa
         L4H/ITW14LtP/cS6wSuz2KDoIKM0zJdxy2bhns9lRvGOAP10B3AfeCelG8CPxeq2GrUa
         NuTfr7BVxFBpMKZQnsUJa2gKcigZcyaFkFVi9qltgM737wCsCWEwCYLYE6z907Bp1e2r
         4nswAKGNdeGpoUMCZ9PVr3t++Ca6nsPj7OvrvKSB+n/OLnKwV11zPp0AYqv4hf2HQKSm
         zoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741185842; x=1741790642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTXHQ//nEUi07Uq1rIglvGA2poPkXrtAOXEjlPFl8vo=;
        b=eftGg+Mep1YgOHgb3/gs0rWc63ncgJQ72K3DkgHBkQlubLAKmSr0mfzvSsMHpse7vV
         sQwooCSYDP7qKyfsfvNIvbIcvBbMhpUynNKb5qZYv+xKW61COq1r31WWEIPnXg/W8Kez
         hv16rngqixX8tvk+4h7Y6V1XmMk0CO9uNCZeu6vaCbdgtRSebMkfxQOBoKGCHg57e1xj
         jIvKX1TBLIrXXQHMKaap8NT9DSjEWIUaRZiclG2n4vKFbndpETIx1adOjgfmlt7s6m9r
         vYL3tgIn4hzKzC2EO/M6xy2xD7Rh6r+eUccHH9ZqYhK+4BJhkbqMxupXmFQaj7MB2IVj
         XoAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrDjUZSkEoIEW47MqyAdD/W0tprVj7/Gh3wqBHPzs2gPe0J/Ro/koX0G9FKbVRGbGH+og=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiukKSB7PBpT/aqWiP4bNNpgj0ayBGSCgwTYheOrvACnUsv6ow
	GakMeOuP8iiwiT5DNi0ah01vn0D19GVS8pymW8h06BV2s0ayoaoY
X-Gm-Gg: ASbGncvJPjcmjys9LvV3MiMgg7Gp4F0V1cIgkeXdxIB6CvUCvPdZwPoDYk2d43mkPL+
	44bhtUR/HR3QYo1CY1vJKJSJSODYBIDZWM2bNT+2wZMBRYP2Xnn6ZPS57/nUMCleYjKcmXs6eBC
	m6pxAyXrvvmQSP0vjwOFjk1ovQL8pkcmeLyZLFvv2Z4XrtVDKrOkOz41YKH9l6rDGnsBjSH3hNx
	s1akrCv5FOyl7SgIc6mMLkB/IgbdBGIBF3lBAf5TNtgBHdhHshIU9u1zfIXN5ODEhPsdA0FYPFa
	DtojrkFrWSqDC1hhUN2aLrpvv/XawXP0ENtDwhf1T309X0xs
X-Google-Smtp-Source: AGHT+IFGQUVETDs+aLlL7dxjD2415mCZr3U/Vg5NUkmwRGmaxQKvyXyLdfnVx5+BM6nipcBQc1kDzw==
X-Received: by 2002:a05:600c:190c:b0:43b:cf29:b577 with SMTP id 5b1f17b1804b1-43bd2891d64mr30345195e9.0.1741185842329;
        Wed, 05 Mar 2025 06:44:02 -0800 (PST)
Received: from eichest-laptop.. ([178.197.169.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435cd8csm19314375e9.40.2025.03.05.06.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:44:02 -0800 (PST)
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
Subject: [PATCH v2 0/2] phy: freescale: imx8m-pcie: fix and cleanup phy
Date: Wed,  5 Mar 2025 15:43:14 +0100
Message-ID: <20250305144355.20364-1-eichest@gmail.com>
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

Changes in v2:
- Remove unnecessary check if perst is not null (Philipp)

Stefan Eichenberger (2):
  phy: freescale: imx8m-pcie: cleanup reset logic
  phy: freescale: imx8m-pcie: assert phy reset and perst in power off

 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 23 +++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

-- 
2.45.2

