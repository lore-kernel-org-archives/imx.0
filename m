Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A516F1A4F3F
	for <imx@lists.linux.dev>; Fri, 16 Aug 2024 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723816330; cv=none; b=mbvOGXH0+QDBdfispPcC+lU1nj9Q9ACi0ioUVDGcVaM/0Dd39vWVusrSsmx39G6GcHT1xWlghPGrpmSGVad0DAnuM0ALn0Kmue/sayVkTLQlVSoeXB8+jejhiRH3QjUB368s1t/1t4EQ4AdPiqhUrNyKsc+zmRq2jYv5x5lMRlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723816330; c=relaxed/simple;
	bh=/KU9ZRN+QxoHISXlHX5+Z3Gbs2y592aecpSiGKfJS40=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=MlgHKtu9EeJvJ+kBwtmL0GVRoNm9la2nEtjwxIG4fsxD3riwrFssGVojr+Qqpl767Ik4zH8TUNgKmosOsO5814H+UTYmfVg90M9NYBnfYVvvczhepnQ+KI3oONAr61KTVOB7PjZ03Y27+MALz0uK96deAmlmqfKXVHCij0rRVJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=cDUfWHLn; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="cDUfWHLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1723816310; x=1724421110; i=wahrenst@gmx.net;
	bh=/KU9ZRN+QxoHISXlHX5+Z3Gbs2y592aecpSiGKfJS40=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cDUfWHLnuVW25RmS1ULMIbD+iP0qMH+P8L5Fy+EEshOvRt4gG4h0QCxC27NO5G+a
	 UqgZLm3wbbfKE1q2N35S3b2XkSxzCPftQY5rRlx1gWRWizwj/DZtzoWrHPlAZhX2v
	 QJoGMl3Ve9R902XqoT02GXzQnlOtMxgMpdv1t7RtIbdtuWwHxWF95ODxD++lseroG
	 NTKwT7I8EdYqPcrhD1pfwbfu9wd5/CcrJpkjjzXbH+yHOVipPBvdO9p6zMzabeSVS
	 MERQyAea4cMzuxX/AJe8/QXMVw9I6TaxMuKhd22grflsvAjHmi75nWhni7/Y6z+WX
	 n5VuaVqNBnNvygErWw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhhX-1sUGuo3vxH-00FzkD; Fri, 16
 Aug 2024 15:51:50 +0200
Message-ID: <fdd11a93-b9f5-4742-8b39-56e6897b8281@gmx.net>
Date: Fri, 16 Aug 2024 15:51:49 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, Clark Wang <xiaoning.wang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
From: Stefan Wahren <wahrenst@gmx.net>
Subject: spi-fsl-lpspi: i.MX93 ERR051608
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fwRXWXLEcnLDCb/SzRSLO7JzsSCS17WYArH0YybX/gSSpwL8YJb
 UT88A5Ah15QMKGkzXItiUDGsYWOg9PJJReiCvZAiddLXaIXdnlfn4rpvqY5y0s2RIayN2ih
 AKgbl6Hy7aSDslKdLFN2UhM3M1Et8VaOD0YAcMeras7ugD/VA3XAKvW+P/sv5zVM9OZrB7Y
 9+JItQroKOT/rjyBMwpBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:B6EHdIpb02M=;URJ04MujB/pDokL92n4rYPY6UP9
 3KpzGzsIJrPzcHw5AXfD625Rvf99kGptSce2XEpRyCk0S93I6yuswY4SqJaTWjwdJPtYGSM7Z
 twBWZjTqMgczWikHj5obzLw6hO78+E/xbXA4nclYx3TSrqHFv4cu1t7L1pw7+bFE9iGrAuRKi
 Qv0Dx3uzH2mET0O6Uos0ZNLjiW9E+Wu3GyDeLaJ5VGVbDNFrzoDI5JSZTUkmrbWcp97VDxT62
 uYPblBRVl/b7Miz1IwZ+bp/y+tdeZa/PUr4Q830tyJMm759ps2ARPtI+8wzrUp+vVuecTbi6m
 mT/rd8M2Nu/Xm90XIw8BR6ps35yuj0rN64RgOb5jMbbvYjvX29TzYKegwFDfA/GbYZf7KzEOZ
 4reA7lAandk/DtxXrvZEnGrLSexvsY5JDHZPfZg9jgyHB2dvhh7bz6tuM1/mg/GNcYZuEaZdO
 IvSd+XJT6dhqh3lgt3T73gLXp2pG8b+tR7l91rbQYIzM398XiWKXPXD8HTgP4Bozcqp8UCRdR
 4xAwXQrm1MyJGtKrOhNUhhSgzN3P7BXmMWHVkjEnD9H7iapW+JKDJI+ZbsChd8GX6wfGgBcUm
 yR9WOZXK0fyhexjjzOaq1HVX8784MM6KsmR/L7d6JDXhtgMpwBKaqV1TJmwZQ3afHsynmipIJ
 z2OAia7trtgGh1WeBPVDD2o1bL/KVY7misC/wWicYfcnUiAh3Iygfwmbi6GpVi115/g8qKOGH
 mbouJmR8xnhV4Xs7qiSYcNWeoCDtuAW0/YADX3Syc5xsrrosEl1Iz4pVZeEjpHNirkRa3PnvY
 FB/KTt4Iz8T5Qim27JKnPVng7U+EPxca0VVm9DVTVtDEw=

Hi,

according to the latest i.MX93 errata [1] the prescale bits in TCR
register are limit to 0 or 1 (ERR051608). The workaround paragraph
states that there is a software workaround in imx_5.15 (vendor tree).

Looking at the mainline driver [2] doesn't look like this
limitation/errata has been addressed.

Can someone point me to the vendor workaround, because i cannot find it
in the linux-imx repo?
Or do i miss something?

Best regards

[1] - https://www.nxp.com/docs/en/errata/i.MX93_1P87f.pdf
[2] -
https://elixir.bootlin.com/linux/v6.11-rc3/source/drivers/spi/spi-fsl-lpsp=
i.c#L318
