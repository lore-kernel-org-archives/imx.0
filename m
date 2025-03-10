Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B65422A4DB
	for <imx@lists.linux.dev>; Mon, 10 Mar 2025 12:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741609670; cv=none; b=YlRfYyQ0/cZaA1vcBslLhnC3hvcsGDRZ7Wl9AGVWlmumwAm+XlYTKpNe37UFSA5lxkmYH3/JOBpHoXuZ5uVyLyhPabs6yHTWohe2FgekpgX7oF388AUgajhX7lqLgF3dDIsscis5fbqhBB6CwfyLLJ5pIQtgTTuqHz1z4Pb16MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741609670; c=relaxed/simple;
	bh=/GglX1v0AV4sIr5Y7bGG0tbMg9+k7e9ag9LwxmbYDCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EqBZlscGt87SSt0pydWMI8+bAIs8tM7WXeHLo0sGQx10TxQ0DWGrt3qf1tSprlirciAvEFmXsulDfSGp8TjfHkhcnjI9FmKUqKgHdxP/6SycPZYzH59lwlukpclbAYxwqOdCr01ETbiQlCbsG0ADc1oyyhvg32dI8LX3NUt+ajE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcGoEdIG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcGoEdIG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso44136245e9.1
        for <imx@lists.linux.dev>; Mon, 10 Mar 2025 05:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741609667; x=1742214467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0gVa+47vgpIskiaBk5o99cR3lWwJb6rgWAQDG1BpiA=;
        b=dcGoEdIGcGeVhjCocWjJ00iF8R5YpKGXfqgp+c+/2OaKamiHwkfkJzvUL2FbvPUT+Y
         Tzz6EvTt0ELW4B+fOlwpfaP4WMG/K6HCL1EMJuj1rvkZshburkzdVORStMwv1sHLUNmI
         f6qRgct1TaDozNnPX3nqSMq1jUvnIviDGvzkBryYAVLJ7HKxcz+ZoPqkGcGsoMCZ1F9r
         G1RmgeW6A/OSHx4IJ4ozBcb3Rpvac86ipb5cJrb5CwjrVu46yxETMDwE87ADQ4bHl3TZ
         UJBMuWzHcxS/6GNvPtIU4DeDAqHc9MV94eBB54ZHTORc3XfYMsMmn0pasw+Mb2BWkQRP
         8B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741609667; x=1742214467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0gVa+47vgpIskiaBk5o99cR3lWwJb6rgWAQDG1BpiA=;
        b=kafujCSsy3Sz0p2DuihYdSNijIBlcTJeg9knOFIjAoGX8jYkKTOovZ4Rb06JOVxAMj
         pZ3MUNTFIEhpsvNqOc4EqGNHBF2D9IkajX7M6zUEnaxHemOYh04JAgbJUkkV3Ahj9bcd
         FT96RunN4ok4FEsLD0TbW1inyTc8ZGCXtjs86v+4dnKN4LpWg4WepBVjlX9dNn1uf4W8
         +yqBwwggP2MMzS9d5wCtL8FWdlc6t2mfJsqdWMmXIUJk3SC8NjuMpCR+Ed4QqExhN89+
         DgswQRINqmOzYNTv4RGNtP260pb3EORaFJuz24PB1FCxyV5dmwDOOmqxV81W+1OKut65
         jzaw==
X-Forwarded-Encrypted: i=1; AJvYcCX2m6eFXoCt1nP6KqAHTYyIDgx2wuQKFx8G0o0DnctU4+eQMoreAGhzG8Y4OnW9+EVw1rc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlqCoPNlOu+nc1omoREVZFm19jCHXF8QUVJVbvgvDCch04JDx5
	yRIBkcszI5WiDHupRgipnpdzEXaoNS9yMPfgvTusvtN7Meb2obgC
X-Gm-Gg: ASbGncuT+0/sCOmbhl9IIjC/aWBqjfEDD67SRCg4yaE24lQouQ2hwCprlU4N68JbQbg
	Y5/ca8UXXS4TWSrbTJfjalsaq4Azi2AwOtF3DqCkSVEATPAQAuaF5lE64+Q8T1gbWzhjJ6U71pS
	bfzJ34pkEZrbw49Q11Na/APSaIDPylwlnGqSA8Jy3rSVNetzkGmGWF9M6yCaj6jrhLHDpqNrg7/
	4Gp6wiZbj5+MaQ8qIODpSos8KxlvPXiGHxAQWpkOsu2f7WJkSPBJW3u07qKQnTfAWagOa/h1jEe
	3BxaZY8Dxbr5gjCN1B/thzK437FRpUKU2Fy07UkLKVOE8sa3cgRbDa+tkoFL2Oy2pTC1g8YuyVa
	Jd92wyPQ6pF7TWn3Y8T0AYkkjQQg=
X-Google-Smtp-Source: AGHT+IHnfkFyUH7zwhO3UJXB4ON9kY20gf9Xj9a8RVVLTh0OxFR3WRoI6eW5/kVQ7doqUEWryYXkVw==
X-Received: by 2002:a05:600c:4e91:b0:43b:d116:6483 with SMTP id 5b1f17b1804b1-43c6021f13cmr85331995e9.27.1741609667099;
        Mon, 10 Mar 2025 05:27:47 -0700 (PDT)
Received: from eichest-laptop.toradex.int (85-195-230-40.fiber7.init7.net. [85.195.230.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd6530f26sm171963245e9.4.2025.03.10.05.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:27:46 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	hongxing.zhu@nxp.com,
	tharvey@gateworks.com,
	Frank.Li@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] phy: freescale: imx8m-pcie: fix and cleanup phy
Date: Mon, 10 Mar 2025 13:27:02 +0100
Message-ID: <20250310122745.34947-1-eichest@gmail.com>
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

Changes in v3:
- Update commit message of cleanup patch (Frank)
- Add Reviewd-by and Acked-by (Frank and Richard)

Changes in v2:
- Remove unnecessary check if perst is not null (Philipp)

Stefan Eichenberger (2):
  phy: freescale: imx8m-pcie: cleanup reset logic
  phy: freescale: imx8m-pcie: assert phy reset and perst in power off

 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 23 +++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

-- 
2.45.2

