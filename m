Received: from mxc.seznam.cz (mxc.seznam.cz [77.75.79.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA611CEEB6
	for <imx@lists.linux.dev>; Sat, 14 Sep 2024 11:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.79.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726313605; cv=none; b=IGoboV+42UpHe6P20DjQHqREqAUbyVG8ToEpjOFpJlFLTeex0Kwro1L4UI0r6OLEV5dl0XBUrkuEL7zSHaKcgJZb+yFr5LAL7Ry4rwY2qdX8RjbAA34x/i64jIyXjDMuYfHtEj7AxMMW3qeW5l5u0ocV9CHU9Wp7lvZzIBwQiOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726313605; c=relaxed/simple;
	bh=tfC0wjxNe5XKrSkQAza0Tqj6HlthCa21GJt+GYVR5fs=;
	h=From:To:Cc:Subject:Date:Message-Id:References:In-Reply-To:
	 Mime-Version:Content-Type; b=n1AwZHYElFDlEwG1HKT/w3l7b7LUo90zxoSgzXd5zN+Ao2rJdyTbHnCVQEFb0ak5eQChWaXTU4kCKPZw6Zp88KQ0kgWCZqS5ODLquvy7yuVD3GUIjHfthSrJAiPBcMAuk8kAR0Ijv1vR/FH5HY2vudT7ybYO8PbaOh5i170Lpxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz; spf=pass smtp.mailfrom=email.cz; dkim=pass (2048-bit key) header.d=email.cz header.i=@email.cz header.b=VAcN3xwi; arc=none smtp.client-ip=77.75.79.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=email.cz header.i=@email.cz header.b="VAcN3xwi"
Received: from email.seznam.cz
	by smtpc-mxc-58959dfbcf-mrxrj
	(smtpc-mxc-58959dfbcf-mrxrj [2a02:598:64:8a00::1000:460])
	id 47b8da75b94c68df4736546d;
	Sat, 14 Sep 2024 13:32:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1726313559;
	bh=tfC0wjxNe5XKrSkQAza0Tqj6HlthCa21GJt+GYVR5fs=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:References:
	 In-Reply-To:Mime-Version:X-Mailer:Content-Type:
	 Content-Transfer-Encoding;
	b=VAcN3xwiOAFmCHVPhhq4NUNwOrJtOAYMZuQ8Dm9Cn0Db0p48iVTQgB3dDcJMOfDD9
	 DVGVlyJxHy/8r+cyVjc2zrXvXBzNpOJApUkE88l1KQBHypL6uxF0ntlULnJNFVtmN0
	 ZleVrTEkpXntdUbKmZc/dAYZEgfKHUcoao5nZ1IimVH92WIICX1Kr0H6CvwEsYXXQi
	 IJ4kLTJRdapfZclvC63hUeGdpAnlFd4dPt5cq0QK97+4Tc+aM7jyuL8AzHUoHwsx5g
	 jOpy8E6YFvdsYr7bPZRaylx7Rdg1kJUHGeDaRui7sldRoyyZfmKdsbviP9vvu5kQuB
	 o1m/ACG0YPrYQ==
Received: from 184-143.ktuo.cz (184-143.ktuo.cz [82.144.143.184])
	by email.seznam.cz (szn-ebox-5.0.189) with HTTP;
	Sat, 14 Sep 2024 13:32:37 +0200 (CEST)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: "Herbert Xu" <herbert@gondor.apana.org.au>
Cc: <linux-crypto@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Shawn Guo" <shawnguo@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	"Fabio Estevam" <festevam@gmail.com>,
	<imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
Subject: =?utf-8?q?Re=3A_=5BPATCH=5D_crypto=3A_mxs-dcp=3A_Enable_user-spac?=
	=?utf-8?q?e_access_to_AES_with_hardware-bound_keys?=
Date: Sat, 14 Sep 2024 13:32:37 +0200 (CEST)
Message-Id: <24h.ZcXr.7FvRaSxxibG.1cvNHL@seznam.cz>
References: <1di.ZclR.6M4clePpGuH.1cv1hD@seznam.cz>
	<ZuVKtuMqiCu67hn2@gondor.apana.org.au>
In-Reply-To: <ZuVKtuMqiCu67hn2@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (szn-mime-2.1.61)
X-Mailer: szn-ebox-5.0.189
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Why not just expose it uncondtionally?

Please see the comment in the following patch: https://git.kernel.org/pub/=
scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D3d16af0b4cfac4b2c3b23=
8e2ec37b38c2f316978

The goal of this change is to allow some users to use AES with hardware-bo=
und keys from user-space without compromising others.

Best regards

Tomas
