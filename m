Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA511799F
	for <imx@lists.linux.dev>; Wed, 31 Jul 2024 16:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722443154; cv=none; b=MbBeAfmlHL+kiErasba4wgPQR/yNUxgalIenEYr96g3aud2RGzCdeKMHWQwUzrWYmUQFin9sDzjaNY7Lgk+POIRR5h92OwWceKlvr1bvveqJOZa1igjtOpgijG6jrCiAwFz6cScEgRQzIM+YDshXJ2IJ9dNOMa22k1QQWPe2NUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722443154; c=relaxed/simple;
	bh=tACdBeumR8aeFEqxrNUZdDDLlMW1iReAdOZAh7/uOA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBGUDlBspC1eCwh6X2XmZ/hoeEgdzLIPgzTrau7UpR4yOtu1FOiZU7M0g/mRCDLpDA7xX1xjy5RgxBn08tk70V/yxQ/qPvWgf4fK1PUt854D93z0/Si03Avbu2rTUBf8mDgR+GTGQEKrxEwl4+7wvzfaH+y7BA2uf68Px8WYTBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=JfRq5Nk0; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JfRq5Nk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1722443128; x=1723047928; i=wahrenst@gmx.net;
	bh=tACdBeumR8aeFEqxrNUZdDDLlMW1iReAdOZAh7/uOA8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JfRq5Nk0L1/un2pxqsp236OR6FaGgMLcNoaG+cutF6eryMPDtxHb1w7oKDeqKa5X
	 6zEVQPt7ULKJOfA4chk5efPEt54NRfkuV034rVZAZ6MQ7QJtQ5Yw/s+PHl2S10Sff
	 qENavAvgIh7+mWxC3J70OksYXhvZyUE8aGZa2gpaJWc6dQI9bfOra3PFgUbgVtZA+
	 u51fVTa6dIMJ6l1qOJemJ3LG7degmgivu3tzlT+ULMx0/IV/fyzFXr57BUsXOLvm8
	 1tsjYC8Kc7M8s7IMqw19hd3rXLADI6flwDswu9WoZPlCf9EqOKe7vdTviDCwRsOwN
	 wasmnVQmXCM3q/bGKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKhs-1ssP0k2iqY-00WNOV; Wed, 31
 Jul 2024 18:25:28 +0200
Message-ID: <4223ca8b-c9bf-411e-8052-5b6ef5be6420@gmx.net>
Date: Wed, 31 Jul 2024 18:25:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spi-fsl-lpspi: No effective_speed_hz support yet
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>, Clark Wang <xiaoning.wang@nxp.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <0848d006-092a-45fe-a1fb-949b55a3177a@gmx.net>
 <20240731-vigorous-kagu-of-masquerade-45655d-mkl@pengutronix.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240731-vigorous-kagu-of-masquerade-45655d-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BsQLK5TyJ/MZ5YzXjFvD7zOkSkOsuyyaEIZnfrYpDosaz6kWV19
 qwZlLnSrC0EH2EU1prz5sX3S4AKWUki/nPPHZc9yw7zu1kNvcwwHH/kzW2N6CjIQJoyTkAp
 Nx/w7y9GdeklxlDpj7/qxQ4gW0xAJYUeaUK3xZljZWwTgljuar8yDmaifuyOiG10Q8zae/n
 RKqz65ql8KJT8Qy+1iLxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YvQiV0fT0CM=;u4ddNZo//JDynvGM4Y1QPJDECrC
 SifOp3vRj3H0SjC4qILGX/EPNcXQHyvd4V/lu3lDBuyErLTGHlZPjYcTsAwyL3byIDsM1cz+S
 +tk+UjB5Z3WojV0fNHhwZyv2dvHDM2UAWvGfw3QQRJQgEihSkfGF9OzvOAnnV47n/5mZSYy5D
 +GMpiARJ18O4n50p2dvzj4emfuH6bJi0gm0yc554WHvg7C7vvyZpMYsJS2YmM86t4wBuAtQZt
 RuJvS+7tLCJ1jiOHfoZ8yAYhZZWPqhDSWKF6PJwvA1OdRFK3XvwjnB3vjfAfTJdXOTRj/tfYN
 VxUMEYuNzEcMBWgpEfRAq0/Xao2CW9hIGjeunL/AyEDUyEPSu59dGpTFGiZkT/Cpq1ZAB5h//
 oHV6fhP7ng7+KRVuDcIIaHN1Y130rca5byAfc526mIeR+a6lPC4j+axV2oiYrS59nEILLio8s
 ju0GiC6S5mUw0Ir/ECErKoC7j/TFJzFPMCewt3I+Ou418v74U+kvY1mwMbzW76TmruqM7cbNs
 dFV86XFU2jvKbqcfwb229x+WbsBqxXrLpziDNI33LF7+70iCsIxPk325czGOOLt152wenOm93
 EEH8uN/6XBR2+MaQ/jNangKO3uPRWnzJN/+kWyBgiFjoy5llvevMm8YXorTgf3hm1JsLo7bxn
 pJwxr/0jt+wKqDNjITfbXUsMw7VKE6vJfffd/UF69NzR3F/cedij8ubbwtFWvD2N3jaCUMKbC
 JKDvmOreIDWb9LKid27HqnZVSqUsUV8Wrwz4MAPccRYf088HWJV9+bUjbTX9FJWu0R3NJ1NaH
 SghS14zBU8+itulX0hd0F6Xg==

Hi Marc,

Am 31.07.24 um 08:11 schrieb Marc Kleine-Budde:
> On 30.07.2024 19:47:17, Stefan Wahren wrote:
>> I want to use a Vertexcom MSE1021 SPI device with the i.MX93. This chip
>> is a little bit special, because it must be operated within the range o=
f
>> 6 and 7 MHz. That's why the mse102x driver provides debugfs output of
>> effective_speed_hz. But I noticed that the spi-fsl-lpspi driver doesn't
>> support the calculation of this, that's why effective_speed_hz is alway=
s 0.
>>
>> Are there plans to implement this?
> At least from my side not. At least for the spi-imx the change was not
> that complicated: bf253e6bf6b8 ("spi: spi-imx: spi_imx_transfer(): add
> support for effective_speed_hz").
okay, i will send it beside some bugfixes for the spi-fsl-lpspi. But i
cannot promise when this will be :-(

Regards
>
> regards,
> Marc
>

