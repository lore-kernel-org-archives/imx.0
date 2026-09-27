Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646673E63A2
	for <imx@lists.linux.dev>; Sun, 27 Sep 2026 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513200; cv=none; b=hjp9wnZLfGCFKkWik8zRWU5fGCk2dFDImgjjvxWUfOffqlMO3CsD56X57M6fnUWgDTbqjXeERGZNcaCJDvjvF+U8XIYiBrHYiK8WASHQYuKF1dXzg39n++KUmNh1/+l9yQhZojm8ajCxdiAzayLvaYms0ikwxdTU9qFXDDW4Ggg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513200; c=relaxed/simple;
	bh=xG8fQs+Nv8hzYaB47vBOWqr+MR+BJEmuFuZwRxqnET0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YCPl7U31x0Tvay3k9LIlxcGjrl2bgVg3LZj4e/Lgsyj+pFRtMNacwZSDxNMlJ+QsI1qFvyT18Gy6zp1VXQaQEECOvXETVhhBS2ZYlQFLQ/l+s7+rxi787oeyUJfd2ElFH0wE/hzXUdfi9jj15Pd23+irdmPYAsE4WjrsQcexlRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntbeLXBy; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntbeLXBy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so16093135e9.2
        for <imx@lists.linux.dev>; Sun, 27 Sep 2026 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513195; x=1791117995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=;
        b=ntbeLXByxcZdVeQCPrBeEAD2nEMfrIc9rOKArkkU8cXnj3pUVPQw6PiwLLP5bTAQ9+
         4YIyKiTmcWyCykuyItComjibZg2uuqlfgBzA8ryPC8HxHR8WyqKygEifjrpKvnxQ9tTf
         HZ1aOPvW7HMojx96Q6D0/eO45A8aycm8RFwpk4Qw9Dw18axPpHMBvXHtYFa9FwRAwHTI
         xGpmYTBneUMt74F0TrOS915f7TVUNOVkVoAnXpJ7laU+/YO3JGNdC0WhqV/h6tqA07qY
         QOLQiqUUzGmta3gQuHcl1FpkJ5Vw4pKRNTPvhVAxixVyxee/ALyn0vXypV25/6GHjxC9
         Ij3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513195; x=1791117995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=;
        b=whVQ8Jk83Ya9brqdcaypCou+eyOMnsxywm4IZdZev3DrYeHfsQd+pfWhJ0aY9YWx16
         Sw+JPdzNysAP3TjP19iHSJijgYxpkRRiUTp8xneaXSasgY7jK17b50CGF9kjTluwyYaf
         6Rjm04a1M+Jc1Tse9eMamkiTMOf2bDvEFDxO2A27J2U2p+4JK8JP8qjSeB5jK89K7jhH
         6oMZf9R5YDEli9ZDSpajzxiB0GrBxl/XQa4ru6e8cJ7I+v7A59XJMXviWT12UtbmYFHH
         RAkEsSNUACsluQj1MTgpMRXnTkkDUUKZbPYT0GuvMosrrVeGgwmf6Ts1nxoLzXHoSZAl
         qtjg==
X-Forwarded-Encrypted: i=1; AKwUvBwY1AEcbKRI8YE7EaJphOKrOcJ7Rl7PJyfvVO0OZYSVyKp8BP9DG+pgEAJNFdXukexURAA=@lists.linux.dev
X-Gm-Message-State: AFuF++nA4Gu8NS+4E2VrQ06vDO5gzFXvpAQfvocuBSEuMl3R5J5OtrP+
	ztZiTG5yV4YaIk808Hu5T4c3wrqFi8g8WfBaBXso/uYAV+uXleV5CiQX
X-Gm-Gg: AYBFou2/YjYy3UiMDEujz/EaKw+BAg4MeL7sPuXSpOHxpx28x+h+yfsvow5fmXs3rQC
	BuEYm6+z2ymuFrOZFD0uMrx8AFkNd2eZDfbKKr09ARBfar3M8J4j/BLB03lR6mi//3CniqAavGN
	C0+PktU1bH4TLYv8vBFTr5Bb17dzChZT0abGebxI3fQdXbjTrmqvYq9pScUzeri7OJCEO6+clBd
	JD4Ooi6Hm3S2is6CKZFPFSjACjsqP0H8rUOy6ZGZmTaL/ioXCyh4Vu0O+NyUtysW/HpYCwo7PwF
	Sya05BCz9GRlHvqsFbUdgOt8SoxhBEF5/o20F+7cjocJISfbRFU+c3lSinsSSt66DctMmwtB/hl
	jqYu86OTCWNrbf1D1n+gRNHUdVYfXYn2TjXLEnKyv/ipu6WDj4SZfEbJqYLfmmwhtufprdBzWP2
	WaVc+PFNld26uH4AbQEyFNWIRNvZUm4xlL9i5EicOSfq6Gb64/SGN85cBpjvgDXZeQArvLR40io
	tqz9mdwLPZ7nSLUd7M2DAkB4AgfihC6FSw5/JmhAEG4VzT3iJSJzep8VsYiAZjFrfGxe81ABkzJ
	9CrouJlfuHU4v0REPH1d1/B20NfvkRiw
X-Received: by 2002:a05:600c:8b34:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a000b647f1mr30425705e9.0.1790513195410;
        Sun, 27 Sep 2026 05:46:35 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:34 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v3 02/12] net: phy: micrel: Check RMII clock select property presence
Date: Sun, 27 Sep 2026 14:46:17 +0200
Message-ID: <095af7bdb3b28e7776bac12bb4f3f661d057216f.1790512621.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The micrel,rmii-reference-clock-select-25-mhz property is tested
for presence, but of_property_read_bool() warns when the property
has a value. Encoding it as <1> to satisfy the DT schema unit check
would therefore produce a warning at PHY probe.

Use of_property_present() for the presence test. It accepts both
existing empty properties and the new numeric form without changing
the RMII clock selection.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - New patch: use of_property_present() for the RMII clock select
   property so its numeric form does not warn during PHY probe.

 drivers/net/phy/micrel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index ae830781824b..acb481a29c25 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2791,7 +2791,7 @@ static int kszphy_probe(struct phy_device *phydev)
 
 		if (type)
 			priv->rmii_ref_clk_sel = type->has_rmii_ref_clk_sel;
-		rmii_ref_clk_sel_25_mhz = of_property_read_bool(np,
+		rmii_ref_clk_sel_25_mhz = of_property_present(np,
 				"micrel,rmii-reference-clock-select-25-mhz");
 
 		if (rate > 24500000 && rate < 25500000) {
-- 
2.47.3
