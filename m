Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=176.9.212.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360887;
	b=o5BjWeopWuyXNcoJrB6pUEJjBb0ScKCHQJR+55fGk2P0QUt11a+8P3DMzscTFOspnwIZ
	 891KiO0xR2CUz8OmgjUjFkFX4Zd/O2QkSyGQ3JRGBv35OcUYZk0y1gqREDyStziWjNWHH
	 HcwdmrhDgA/nyaxkun/qkNv6l3bBx1xoc80F9nr/36glm1OEl0Pe3aJlKaUEb/fz2M7fZ
	 RQH8TnjH0GTlwc3kI/pq6t4BIsBWybQmJkaEo7OzM/5qU6k4w9TBTPuQ3ti3QVE4UMxr3
	 ybuaivXygxNxEaM9i4ZuHILemLZTnuHpr5gJjlKVW8AJz40HPsNsVC5szBCOFtfd8+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360887;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Message-ID:Date:
	 MIME-Version:Content-Language:From:Subject:Autocrypt:To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8JhgM8ReUdejLoA6KQHu+FkOYiFGViMMJk5RGaaJGYk=;
	b=zU2z56BTOKJMd738jRkPRL3GBKt02WFu18yQjcYExpi2NaEqC0Tjtq5CQwgMJMDBVzLS
	 duXre6YKvw72B1aRmIlv/jKXzYHiMQMNCRIC7cU9UQgN6AGc+H3+arDNP+USEmJUdcjv9
	 8IeQo6beLpaXm+ZQqC8UAC7IHb3Q4hZ/iSrxhye83Ix5e7wXorhgS9wveQmfDzwPC2HbD
	 Zo1SEdOmkIstZF5F6t43q0TfLF94Y22QFmb0rrZrXXbwc/sBWICKm7NZ5XcblK5yK4Pbk
	 6sg7Y4A8rsU6wUId0b71v8dE7Go215iVWdmRk46MXamz0mazf6DrfEGFL1WbYywYX7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sysmocom.de;
	spf=pass smtp.mailfrom=sysmocom.de;
	arc=none smtp.remote-ip=176.9.212.161
Received: from mail.sysmocom.de (mail.sysmocom.de [176.9.212.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2E5606A31D
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 11:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C2E5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sysmocom.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysmocom.de
Received: from localhost (localhost [127.0.0.1])
	by mail.sysmocom.de (Postfix) with ESMTP id CFC08C80326;
	Fri, 30 Oct 2026 11:47:57 +0000 (UTC)
X-Virus-Scanned: Debian amavis at sysmocom.de
Received: from mail.sysmocom.de ([127.0.0.1])
 by localhost (mail.sysmocom.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEn4AEE_n3DL; Fri, 30 Oct 2026 11:47:57 +0000 (UTC)
Message-ID: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
Date: Fri, 30 Oct 2026 12:47:56 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Language: en-US
From: Oliver Smith <osmith@sysmocom.de>
Subject: No network for SolidRun LX2160A Clearfog CX with kernel 6.12.113
Autocrypt: addr=osmith@sysmocom.de; keydata=
 xjMEXqaMvBYJKwYBBAHaRw8BAQdAKlLfpb/UKvlUjGFwzzkDBT1fXdlqg+MaEG2+hTXDYUrN
 IU9saXZlciBTbWl0aCA8b3NtaXRoQHN5c21vY29tLmRlPsKWBBMWCAA+AhsDBQsJCAcCBhUK
 CQgLAgQWAgMBAh4BAheAFiEECfuANpg5IsWyQFcH6+DRJFm2BMUFAmDG9VIFCRTsa5YACgkQ
 6+DRJFm2BMUJ0wD+L0gpHABtBfkNQ7i0/qtMs5thoqt2yldxao6q31BBLAAA/iXUDIEYjQ0L
 wsZRtiSdXNjbBfdT9boLdh4CY+TKwuYPzjgEXqaMvBIKKwYBBAGXVQEFAQEHQPGmG2/uQrDy
 xalQoBnT1zdIbeg/xWLjl1AnOYGITnpEAwEIB8J4BBgWCAAgFiEECfuANpg5IsWyQFcH6+DR
 JFm2BMUFAl6mjLwCGwwACgkQ6+DRJFm2BMXSRgD/f8twzpyQfpE+viVjtlOxsq0HCavXZqbW
 VvIuvbyfSWQBAJhEIFF/fxmksu9r3FzixNQMOLc3EJgSwqvEYA28Db8O
To: imx@lists.linux.dev, Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

on a SolidRun LX2160A Clearfog CX machine I've upgraded from 6.12.101 to
6.12.113 in Debian 13, and with that kernel there is no eth0 after boot.
When downgrading to 6.12.101, it is there again.

I suspect this is a regression from dts changes in
arch/arm64/boot/dts/freescale as there were a few for lx2160a:

* 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/arch/arm64/boot/dts/freescale?h=v6.12.113
* 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/arch/arm64/boot/dts/freescale?h=v6.12.101

imx@lists.linux.dev is listed in MAINTAINERS for that path and Vincent
authored the related patches, therefore sending this to you. If this is
the wrong place then let me know where to report this instead.

Thank you!

Best regards,
Oliver

-- 
- Oliver Smith <osmith@sysmocom.de>            https://www.sysmocom.de/
=======================================================================
* sysmocom - systems for mobile communications GmbH
* Siemensstr. 26a
* 10551 Berlin, Germany
* Sitz / Registered office: Berlin, HRB 134158 B
* Geschaeftsfuehrer / Managing Director: Harald Welte

