Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445B13B637A
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093815; cv=none; b=Im0X0qYh6LEgDkHqwGWZwQJcDNopPFDeiS0Rgs2io8qavgeOg4AIhgMfb851CiQylOfS5yYhJlpCutD2/VioNOqE3IZ3U6vS0CGCMW8SiO+eqEopbR3YvQGXU2dZoVkB9e/L51aE++HTvU6UUOcn8lTnhRk+7HoYOuXYU+9OyP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093815; c=relaxed/simple;
	bh=g8Pd3hLWXKDO1TxCxTibVOhcinoabj6frf5OHE6N6r4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbN+XF05wmSldxBfwzK8QRQdxQIfazDAdKxYLBI5QUC1QlLr+2z+RPIBy58ILzxoG5sBQsn0OQsxoWFnAEYAM2xY2JTGOkr4DZSk1fmUMHiibYbtNZEf95WPSfNSw4cKqz+bY5YQZdfn4AWiIAAUfthROE6G7Y0v8ihfGkB/hw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqV+Iz4d; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqV+Iz4d"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so3737991b3a.3
        for <imx@lists.linux.dev>; Fri, 07 Aug 2026 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093813; x=1786698613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ff2PqEjwL9/E48n/LYtyoRX7V3j9un3+kJnzZ64yyh8=;
        b=MqV+Iz4d3pNfGPXDsoKn8PCmyiImreErOGoZdD40Tou4t/wb0g0z7lxTuObgZEBwky
         Sk4vH1+5iqc7eCJ2hwgJG1Sz2uGfsIDXorYqgh4OtgWUb4AUqWnjUVknLE/A1LhqZLnz
         DFmr1at+g+ozloWTcLFU2oSLrAck428IXVqPlZJCR6SoXwFMwzqivNXEQHbEmokrVkH4
         vEM/niFUSOosVKulaOyOs+LBT9Gvl8B34DBkb6Bd3lUIT3X0G2YeISrAWypQeG4FkQ8q
         dHlUbma33hgAVTNuasB2Oulmhib7DqNL+hzbnh99AOCI9ATjLx+iyEYoTI172f0WYxOO
         a3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093813; x=1786698613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ff2PqEjwL9/E48n/LYtyoRX7V3j9un3+kJnzZ64yyh8=;
        b=Cg80b+Z6gADGvwNl+vKUzYJ8wgBtTobtDtviKOEm9Ktut+I+caZ+AZgY1jh/7vRoFc
         gnxIQzgkF2AUAxBEkijEnd5gspsgfwxSaTZsOxcm4g03bAObspF3aNA4AtgLsga5fDG1
         2WP0NN8hVeXHX4iMHn2DBCgBpwhPcm3o3ATqlP7/1NS1hx0i3uXH2Bq6+JN9hxC9AmOh
         wNKUYoMlFullNiL5sMoW34VTM36s9VLlD/aNSoXD5e+k0dqGKrg96v8gQ5nOsADz8LI5
         Q9C3wuZfmPHCVts89Qp+ea0jdzy0OpkMLH5MLfHodugEad0wviXGg8kHYueL3DdoOxdL
         q85A==
X-Forwarded-Encrypted: i=1; AHgh+RqclvwIHRhcACQsrt2cbT9gw1X/B6e0xMChedHgLS2HGVinnqmCF3vOVPni7S0CHQCNlTo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3d4yqvRKw7ZygZhRnsQUekgGZS3eEHfZBOU0Mo9SIAVtPaf55
	OD0J2q+oPHK2m2Gc6an+/f71OcYiEqRKS6gq2y5Uhk3a83FxDTgRSJ8X
X-Gm-Gg: AR+sD10UT0I6AARAmlHLyJgwfONdCaLNMoZZAnw78c290JAlZKAmmxIsVgIiDQ9I39H
	XghwSGkPT517vm2V19Hr8LHR6kqA+/yctnMVaHDZQxhUcTeMDDiTp/lshjWRqMD18nyMVsmQGfH
	q7HTGEgQMjRes1vI9Jg6M/lbmrQIskuP7679rebfhFwaEP9ZAyw2CsdXFKrHzRQ97IP7AxcABxg
	8hinyiCrpTayA+onAtjifloCAB1jOI/Kkw+plF6zgaXrvxtgh9veU1HBGOyC9qWAeyUluI67LjI
	Z4oUrUlz5DmCUjJRKejh0YED83phGcwtkLiNup2p10UecguAjlEiha/WKbAoueqymI3lkcZjNsn
	/ArV3gVCViE/dIHsTjb+6fgbsvBH7+3VIQhL6L4wikRCDKFhn2N8eUh/ofKPJ255DQXRK3WiKs+
	BdTbiSTk/e0Qv0PYBkpibRJsFhWigS1oVafX7g60ToCfkfHG0pwXXBzH7INrad1+sIh1BEN9qU8
	EZfooRRuUB9k3IW83D43k8HaB1aa1ov5mimPljtWsxrOn/AyZTp3kT2r0lmsTTlGYS1LOi2pfiU
	7x7fA1Jj3+uYvL8=
X-Received: by 2002:a05:6a00:420e:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84f2dff7c61mr26343835b3a.9.1786093813505;
        Fri, 07 Aug 2026 02:10:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm715908b3a.42.2026.08.07.02.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yenchia Chen <yenchia.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Zong Jiang <quic_zongjian@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aniket Randive <aniket.randive@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] tty: serial: imx: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 16:09:44 +0700
Message-ID: <20260807090945.41690-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807090945.41690-1-phucduc.bui@gmail.com>
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/tty/serial/imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 251a50c8aa38..4224454d360e 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2463,7 +2463,11 @@ static int imx_uart_probe(struct platform_device *pdev)
 	if (rxirq < 0)
 		return rxirq;
 	txirq = platform_get_irq_optional(pdev, 1);
+	if (txirq < 0 && txirq != -ENXIO)
+		return txirq;
 	rtsirq = platform_get_irq_optional(pdev, 2);
+	if (rtsirq < 0 && rtsirq != -ENXIO)
+		return rtsirq;
 
 	sport->port.dev = &pdev->dev;
 	sport->port.mapbase = res->start;
-- 
2.43.0

