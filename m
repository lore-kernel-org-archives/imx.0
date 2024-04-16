Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36C113473F;
	Tue, 16 Apr 2024 19:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294492; cv=none; b=lEopwy8A5gEw+sEF+MH842y8mwaBiibg8TI2Nmj99gHFvDwVn1FZ2vrPwD/Cqx7iK31tVGFY145f9LJHNGFlLp/bFdIjcyGcHxBFNdgb6zUfq8MkxwcWiX24CIv3cgx1arSR3EetwHd7B6WlDT/dner79DbXDq9h9uT/zuseG74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294492; c=relaxed/simple;
	bh=xoV/0NX+5XnKVIk3GmXGamNW0qmhi5b+KDk5yMo4UwE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UoD5XQ8ih9g9ve/TDhm2YenUlcR705Z1Kw3TqKg/HVqIHygYNBl5eX72PkFuRd9qddKQR529QeYWo/WSM67sqMj3yPnKeyfIy6BkenOjVn9RkwiaIFN1Qbu+OBSLp4vU/eNtAYwDR/W58D7BGE2F/gpwmFB2P6+Yd+XItep18Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ckF5F8tx; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ckF5F8tx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713294452; x=1713899252; i=wahrenst@gmx.net;
	bh=/h/viIiUYkLhfi7uF/NbFRpHXMV676+PkfpqOe2XJxY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ckF5F8txHsSKptrqjnFSy4QXy6ztZXkXdExc4O/hL+j5YZ8/aJed4Bm93Dy1kliC
	 oRModu2nLvN5vpz4OoGxyjREyAasDaHL/qHK+VJUi8OjQ6VerOSqRl0GgByQFq1BR
	 WwcBQ1XdyZk56PS0ZV3bRJATd5UJQWEQTBGy86KJ6zJfj0c3HRHlr7eCAkolPNuju
	 2o15qdlLDN4LIpb3gqYzntl1xCUk0h9TM0d/7MXXrrHOK6mlrTOXapR/e6Nj0qqB/
	 N4j08xmv3zWByU7wiaQArf2IuOByELRLew3LWCf6I9H7Ol2oKhutVhRovemW81YQy
	 rgkHAFKeaY0u0b2c3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYvY2-1sImyB4BMG-00Uqma; Tue, 16
 Apr 2024 21:07:32 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: kernel@pengutronix.de,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 0/2] ARM: dts: imx6ull-tarragon: Minor changes
Date: Tue, 16 Apr 2024 21:06:57 +0200
Message-Id: <20240416190659.15430-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fBkg5eaKfA6ZRVcYjQEJD49r1pZnTgbDGdv9gnbQ4meJyCA7cDK
 BGsZVXz1uQxb7/AzORSAh9rEIUoJ8SYuaZHX56nTVtyqzj6M7alKOxSeePIg6xsu+93d+ID
 gCqJhbFc80/xaxMjOaB5ddHQAntZPXd/1Y58iSY9ACLLzKEC0Sq86z8VQddLmX2a+/Wtte7
 nVobOegnqZLqoK6482DhA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jBjl7F7v9aY=;v2OdQfFgilenzuqsSV3A7ueY69k
 6M4tvdSpwU1+O+xArl+2D/sTe0KrCDiQyXBMFLtT/WlS3qwFuN34zoYng2d7GBDfis6tXyyqa
 w1M1Int8DZJu5+5mg51bziKRt1unZmaSipr0me8MLezBdo2lMNg9A81+qsIWlvOJVfVA8/7aM
 Gz6f5xzEVScmqRQQhMWfv4iQ8xdutNQjOF3Qu7jB40++5PJ6D57PQ0Re6fhHngspMWiWzzM3u
 txU4L/DMGCa8q/S4pu+H8BsGaLJ33silQOkgRODJ6i0dixlvZAtZ5qk+VRu3oZ+4BSOyboEGr
 LbQD95Tjy4hR2uAt3R9gkfqRng0byb2cHKD40XK/G1QAd7qRf6KwlWK83YxLnMrZ7sAN8LGxK
 tDwXNoIU2zKvKYJ4Haim/eirY4HMThJ6v8ovdxJxsMJuMRIssTS9FiY06S/HY6U04Ep84Oqv9
 F8eyxdAF7Jd1gqcH0EdZ4maJ78t2R/sg9Vvol0fb1+eNef0TRSdCsiEPfbllY4y00hp/Az9Sb
 Vz5iNlXM09fV7YGIH/WUPxJIZWl2L5saxHJhwVNFL4Zv4+aF5gSj5SpzXyb2Af4uKB6MrtGJy
 LWEwcZgldesNgX56wlwEytDmuYAfIkPx6PtaUI0eevOCmltWcK6uaQNMeflB+PNKQBaJkzWzK
 Vzul1OdCTrkrKsJ9iOfLPohZegIIwiB6UerPoyh0A7DxpxRGlzdUJE1UA0kpoem4IoiasJg+w
 uek1ah6fk9yjmIBxRVGfm1cIN7sY5j2HDNklWxfCu6KDnuFrojEXxl5TFVhANfBvfmQhgxs5X
 6g3Vr6Yk1Br9kB6x87j0eJbREmLOrXF4enE/fScQe2ujE=

This small series contains 2 changes for the chargebyte Tarragon
boards.

Michael Heimpold (1):
  ARM: dts: imx6ull-tarragon: fix USB over-current polarity

Stefan Wahren (1):
  ARM: dts: imx6ull-tarragon: Reduce SPI clock for QCA7000

 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi | 1 +
 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-master.dts  | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slave.dts   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-slavext.dts | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

=2D-
2.34.1

