Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5441A76C9
	for <imx@lists.linux.dev>; Tue, 30 Jul 2024 17:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722361655; cv=none; b=KYUpZhSrwOh59JD7KSOjyR3MKKb7N5nlFl+GjrORIrA4BlJ/WYcMhqcPAHDIag7ASdB+FlVhZvpohaeL7IT3TSXPT6EanDQgOlyXcBMcNp+akS8n8mNxbc4cvmK7yLJL2i1wo8Gy0e2QKVHkQ/JN7UA1e/s0Z/OJoY3DoM1pLck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722361655; c=relaxed/simple;
	bh=VMOf7yDS1ve5N8z058oJ++LYu2tPK6pGSiRvIYPQ5fk=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=pP3a5AJ9mYeobXljaxxaabWiumxWQBI94kcKg+NucF9ap2+10I5vz9uc4QcjNEH2Kt7hSY5lcTPCk9k0jglI3BOYYZQ9H2y17driH68Y1yLB3sqVAvMrIvvcm4GxeChv1geNd43MYKaRE1DGVn5T+5qG2S3P/Q2IH2Od2z8RQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=g/vqCh3T; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="g/vqCh3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722361638; x=1722966438; i=wahrenst@gmx.net;
	bh=VMOf7yDS1ve5N8z058oJ++LYu2tPK6pGSiRvIYPQ5fk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:To:Cc:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=g/vqCh3THj61pylsuU5ijECaxzl8i8SWz6/iI3gNNgo8uIUKWuyUGtLak7csPXZU
	 tnYe9/pxRNjH60NnfFb2b+9y1dgvjZ1K4ckZcBNJqOia4Dlr0Sr6GXGaFWZcItbCn
	 0+yQEnKsIzysbvsFMMkAg6i6gAdmQBU3c8rVMUp0AzzmNrtQ4R6mejigz+qKHZLvl
	 DzgJv7wF9yQGirvVF29+QYDuw3ZPx2TCVLr6XJYIgqlmx99UzBitrMGa/gIIQHiNJ
	 ZpV/aeUteHqXjP3x9TjJG5cqdVsETzTUf/y5GnekFl2QPVly1T99Zyj1MSCRvhopb
	 G5DEh6ylIDhI9Q3daw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw7f-1rrENp0qih-00agrr; Tue, 30
 Jul 2024 19:47:18 +0200
Message-ID: <0848d006-092a-45fe-a1fb-949b55a3177a@gmx.net>
Date: Tue, 30 Jul 2024 19:47:17 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
To: Fabio Estevam <festevam@gmail.com>, Clark Wang <xiaoning.wang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: spi-fsl-lpspi: No effective_speed_hz support yet
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PVpfFJGwOizDRSDokGh/lWXBeDNOJWj5dYljNLcYNQvWVJMwkJx
 zVveLPkIJUls2ofhIa/uX/QALUP2TZjmFzTj3QB2pUJZruEv1s+tCTXK6BNamE9cWCJNbLW
 jOt6CtmjX0rGpeLsUHLyP6/TNkIDYkjYHogB8domUHa3M725QVCec8cJyoiKH9wAYCWVZXE
 /Dqbj2jcgeH5d/j7lbUXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Kc4wkDL7niA=;Hd2m7LfcWVIvHm68uUiIV6Yi6ve
 nsW69xAa+UB9wx2ZpGYnmwlYxJF3jV5UMWUKJXVtmelWu1WZHeunoMC6S5QQajRbQwJ01X6fr
 Q9p1BO+xkPXcShFkJKybavMl2L7mFwlFqnOWYk9ymq+9htuqY3qc9Fl9RXIrj4c+Q+2REPhS9
 nyhxujjsbB8qQJAP8bqk4eEmVhvCDIsHjyFpjRVekxJ6/0SnfnSpZXCnoQ3VhU3HAcgBTbxrA
 mCxGgIQy/Rf5p5qeLaDHSYiMaReff9NLRuWksLYiY1VYqwKRNOybSc9VbGYximuvONktxuFd1
 dSb/DDEXz82PJBFI24MLew8z0GHxjx0SNnWFL0GIxnmHIBkDA/781yi9Hudfme+zwQGvJ17Kx
 /KvJi3m9zBXibr0RiT6VkH/k3nxufpif4KcRfZfkhAy9mTi5NFWgvVaJbPFMACG9pSC+Ns6X/
 F4hQtGpsSSQQxO/UlkiQrxN2tEXMit+TMEVciLGrpzsL0Yce+95w7uTXWit3FFL9uQNtcjiaF
 uCQIucpN+IMPuCcp5Smsf8OUW+A1qr+JJTDG5H74JTf0FLj4hlTRL2hFr8Bqq0anHweIYMYOK
 ZqA8amAsfVNulvkd0MPkK1JBpw2os9zyNTmZ99iDeO1wJGEgsPtvS2nIKtQOerwAbVNlNjo+5
 fi9IElatrthKmK6tv8D6p4AN29xbeKwMHCpPQu23IxvM+caSK5E0c4oTmVjA0m1rKJgYHDLmS
 D6xE9KBe17QlrzBp89fp4rICopvtNxPZddmkqAJaRGImXKdG3hqry1JYLiEcGf+TyTeKU206K
 5m3085XzFUxDkWwUlBLxbGDQ==

Hi,

I want to use a Vertexcom MSE1021 SPI device with the i.MX93. This chip
is a little bit special, because it must be operated within the range of
6 and 7 MHz. That's why the mse102x driver provides debugfs output of
effective_speed_hz. But I noticed that the spi-fsl-lpspi driver doesn't
support the calculation of this, that's why effective_speed_hz is always 0=
.

Are there plans to implement this?
