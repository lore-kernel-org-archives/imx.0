Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8236A227E87
	for <imx@lists.linux.dev>; Mon, 10 Mar 2025 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741609678; cv=none; b=FEY+j//8huS3P+cMHmpWWd+zl+2ACs8T6Msl6ZSb412Q613xfX1hqgiA2LjEbx4xyUgNifIlB7I5vSVtzbf66MqiPskxzmSv315tSlfl8J7e84D3dhi4uQkrtcM+aFiSohHqnjeDyjutrIRrrtt6oUXEkMfzgxteRrfBsxK65vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741609678; c=relaxed/simple;
	bh=nfghLeOpazL62fRqIJWQz1MP6JIaYaoFaN69gx/8b4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XahLDA/wJ/8JYBlGM3pd+8oWFCdoKioq1AnXgNXCfYidC6MSwZmjXYE6KrvZ9McSIH88V6PllltXIJAzrQwDPmvkX0PCparB3Y96JRvagIqh1SNiM/wEKgR1cWMvHyvyQlrdgAbpv3XlMYusEztvMDvqRt69EKn23ilTWLDHegQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG0dDBhM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG0dDBhM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so2729075e9.2
        for <imx@lists.linux.dev>; Mon, 10 Mar 2025 05:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741609675; x=1742214475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y07tVQtayKingIMzHvY+mUqyx0BK9tRXRpx87DXqL0Y=;
        b=OG0dDBhMRSIRhYOdGWbIh09IZ1ew2XTDmIToVgYP4RCMNkCE66zuyV8YeYZfdwXRYm
         fEq/9/odeIBI24yKhpBuAobQWRVBPCAOMnL8W76TXffyYyFi+NBSlaUOJQKmEGhXrLn4
         atCtCtUqYfGdNNXRzFaEkKu8UmHxfhzXE8C8ZPKc1VVUTVztjaNt+YLI8lcsJ2l9EBAU
         4o4VgY3axZ81bPjdu62UdQFr6DMTrBiOmqZ/Seydx0a3k0Zn9gIg8KmBGDQDqeX7SLBi
         gGZ0SwnJtpW5wJnAX5Q26HtkzrizqjMzBZKKarebIGtjauC6zCFrPFDwkQM851BLG4se
         7fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741609675; x=1742214475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y07tVQtayKingIMzHvY+mUqyx0BK9tRXRpx87DXqL0Y=;
        b=aXEfeHaUUUOkfOh7ksLrAr3ijU5FAVYYmE3sCKtSaC+IeCvYQEVW1edEkZLwYWlg+u
         YRMqaZnvKc0DJ6tsxSigX9HsYE0xtZwdaMGcGeiZVT0H85A3X/hYxlieTPTyJQrMlZkh
         61+hvx7Ok+GLXGrh2Axf6txN2WORQsOchGm/V+eiK6qe8aKrdAPbw/0ocN8QhnED7dlO
         2lT+QV4VQa6UjVJsMWYn/lv/hBXYOGSc73UJohHvOHbz9p6bLpP8mpJAYd3ITN+4ltz3
         ut3Flt8745khNdizLNTamCLJQzBk9s0LWgdUcQgb9NTU63DLfLajfsPYX+nXuqhxpRo6
         LVsg==
X-Forwarded-Encrypted: i=1; AJvYcCVllHYvQys60P7Ker02FmRiOxe4eilgmRFrmVfs/vfuyUMuKXfAf0ZD2BtiofhIsXH7A5A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtQ3GsyR+oHBAVaoYuq/KxHmf+QFOM0m9Gzrfy+1EIn7CntJUf
	fFigT/78NY4KMQ1LQjHaub5PU4L0HHy59KojKnXxCHTlZLSitNmj
X-Gm-Gg: ASbGnctq1Awxfvl9J7GVxXAP472JAKspg6L9b86JpQ79odPrbruLUibtq2iMtI+SV5T
	mVi0g/g/15bKfOwjrdi9Zj+tcVV/WlWjoIYrVAXcU7h6XY9kul2nSEmAWmhHqIAdU23z2ZGQOpB
	ezHCFXwrgaO44pdQdKUlCzJdGS6zvGyLM4UJ63mnTrkFErLn14VgJK/vcL5CwQVDjQF3nVI3fQX
	LFEtvarn8GbDCqtDwR+9ZAVy0LEXz+b8RKmoNKD+cs1nhAlO4saJuoXR542lnl2m/VVxBY/ZpNb
	SpDm5uCM0Yn9ewEgWykpntZm5jUIJUy7bMIIGwYT4VGyUamKJGZq/coW7r6LGTRZg3WnISJ37k6
	rhiYkHgLP0uNPrzfv
X-Google-Smtp-Source: AGHT+IHyEEGGzhCMZxMwRjQ82ccOJZrD+gnc4+NfGxz62Tu6AF+ZAKBbTzzBzG5J8FJd1mZ+MeHucw==
X-Received: by 2002:a05:600c:4f41:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43cec28d3c2mr31513105e9.26.1741609674640;
        Mon, 10 Mar 2025 05:27:54 -0700 (PDT)
Received: from eichest-laptop.toradex.int (85-195-230-40.fiber7.init7.net. [85.195.230.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd6530f26sm171963245e9.4.2025.03.10.05.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:27:53 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] phy: freescale: imx8m-pcie: assert phy reset and perst in power off
Date: Mon, 10 Mar 2025 13:27:04 +0100
Message-ID: <20250310122745.34947-3-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250310122745.34947-1-eichest@gmail.com>
References: <20250310122745.34947-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Ensure the PHY reset and perst is asserted during power-off to
guarantee it is in a reset state upon repeated power-on calls. This
resolves an issue where the PHY may not properly initialize during
subsequent power-on cycles. Power-on will deassert the reset at the
appropriate time after tuning the PHY parameters.

During suspend/resume cycles, we observed that the PHY PLL failed to
lock during resume when the CPU temperature increased from 65C to 75C.
The observed errors were:
  phy phy-32f00000.pcie-phy.3: phy poweron failed --> -110
  imx6q-pcie 33800000.pcie: waiting for PHY ready timeout!
  imx6q-pcie 33800000.pcie: PM: dpm_run_callback(): genpd_resume_noirq+0x0/0x80 returns -110
  imx6q-pcie 33800000.pcie: PM: failed to resume noirq: error -110

This resulted in a complete CPU freeze, which is resolved by ensuring
the PHY is in reset during power-on, thus preventing PHY PLL failures.

Cc: stable@vger.kernel.org
Fixes: 1aa97b002258 ("phy: freescale: pcie: Initialize the imx8 pcie standalone phy driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index 5b505e34ca364..7355d9921b646 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -156,6 +156,16 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
 	return ret;
 }
 
+static int imx8_pcie_phy_power_off(struct phy *phy)
+{
+	struct imx8_pcie_phy *imx8_phy = phy_get_drvdata(phy);
+
+	reset_control_assert(imx8_phy->reset);
+	reset_control_assert(imx8_phy->perst);
+
+	return 0;
+}
+
 static int imx8_pcie_phy_init(struct phy *phy)
 {
 	struct imx8_pcie_phy *imx8_phy = phy_get_drvdata(phy);
@@ -176,6 +186,7 @@ static const struct phy_ops imx8_pcie_phy_ops = {
 	.init		= imx8_pcie_phy_init,
 	.exit		= imx8_pcie_phy_exit,
 	.power_on	= imx8_pcie_phy_power_on,
+	.power_off	= imx8_pcie_phy_power_off,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.45.2

