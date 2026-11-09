Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=176.9.212.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233014;
	b=dZgzgZr4oqDDF8CBpDNjS0c20D7nBgy36Hiaq3dZYen4DxSV5Kr7wCf4CI6cEwuE2gW+
	 qa/tj7yLbcHEKANZBXsfVDlAqqSezzikv/AHbkuApr4k85jMvuPdZmDykjZl8JQDOhhj0
	 NcAqpt9PWFzT2d8ZzrHGyG6Ip3LVL1/eMYwCrQBYxWyme/yNNmmzsjs073Jc5o3ALPHBa
	 5E0/L13GRyRY5jq9wNRig0kXBSoNGbWp+YyTd1h1GQyXkQihyqSOL1mKqVgUCMPzfhSp5
	 Hr9UdrCRXsXoCpLZVZXAzo76y9fJYM4w2pVh/Q36hXkHKZRJUuwfZ9Az/97QRbjDRLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233014;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Message-ID:Date:
	 MIME-Version:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=YmMTVWpdq8xyF0utBKBMNMsTNhVUSn4oKM3y6/m6tWE=;
	b=c0JxPnyVPmaJ75i7retQd+ZIxUA4jdvw3oo28a4BESlTBMb1JCmYkIY4gc201QmAMpV4
	 8erEoUHHq/19nZsTp9y9ztztqxEa+/FOIzluPwi6Wc31RKPP2YTXZfh/atFtqnAbDd6Dr
	 oK9kPyzcGe2yrlllpue/pi/m0KexXdz45K0I6vyL1+JlHuZEUVRlmPLGGGnsQY1CQu6u6
	 JqsiGuNIPLSpsik8z8ghT4aU8SFey1Y69QBRFX9PUbJ0fTS76D3MAfOQzU+yeM3q1mdJY
	 6ZGOGAkF4s8fJ/89RqV2dxtcPHbXRQHTZ8Wb5eQRaMQC9/XWQjZwsV2JF2m7cY+fPvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sysmocom.de;
	spf=pass smtp.mailfrom=sysmocom.de;
	arc=none smtp.remote-ip=176.9.212.161
Received: from mail.sysmocom.de (mail.sysmocom.de [176.9.212.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F6606A325
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 14:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 103F6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sysmocom.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysmocom.de
Received: from localhost (localhost [127.0.0.1])
	by mail.sysmocom.de (Postfix) with ESMTP id 76048C80320;
	Mon, 09 Nov 2026 14:03:25 +0000 (UTC)
X-Virus-Scanned: Debian amavis at sysmocom.de
Received: from mail.sysmocom.de ([127.0.0.1])
 by localhost (mail.sysmocom.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xvv-bClX57C; Mon,  9 Nov 2026 14:03:25 +0000 (UTC)
Message-ID: <f7a51ade-18f9-4733-87e1-dfe885d93492@sysmocom.de>
Date: Mon, 9 Nov 2026 15:03:24 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Subject: Re: No network for SolidRun LX2160A Clearfog CX with kernel 6.12.113
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Vincent Jardin <vjardin@free.fr>, Fabio Estevam <festevam@gmail.com>,
 imx@lists.linux.dev
References: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
 <CAOMZO5Arqfat5nO5Hi9Dq0TogvGAvmNLChE_8WrDGrNy1ha2Qg@mail.gmail.com>
 <auSrssMDb33JZVN5@L30177.local>
 <c4e8595b-1dcc-4fa9-9a9f-b23be2d79462@sysmocom.de>
 <auX-VA8xlqSwLYGj@L30177.local>
 <z2q7u34spdhyiqhrkem4b64fvdwnnbodgwzj4rynuepqyrym5q@nuy2zhhlqgpu>
 <ab9967d8-0d44-4457-9cba-6d2913e17977@sysmocom.de>
 <ia74kefmqtcuvk6zvtbtxkxeqtfonm6alfqngincebps7l4vcy@b3ljfyzoedxj>
Content-Language: en-US
From: Oliver Smith <osmith@sysmocom.de>
Autocrypt: addr=osmith@sysmocom.de; keydata=
 xjMEXqaMvBYJKwYBBAHaRw8BAQdAKlLfpb/UKvlUjGFwzzkDBT1fXdlqg+MaEG2+hTXDYUrN
 IU9saXZlciBTbWl0aCA8b3NtaXRoQHN5c21vY29tLmRlPsKWBBMWCAA+AhsDBQsJCAcCBhUK
 CQgLAgQWAgMBAh4BAheAFiEECfuANpg5IsWyQFcH6+DRJFm2BMUFAmDG9VIFCRTsa5YACgkQ
 6+DRJFm2BMUJ0wD+L0gpHABtBfkNQ7i0/qtMs5thoqt2yldxao6q31BBLAAA/iXUDIEYjQ0L
 wsZRtiSdXNjbBfdT9boLdh4CY+TKwuYPzjgEXqaMvBIKKwYBBAGXVQEFAQEHQPGmG2/uQrDy
 xalQoBnT1zdIbeg/xWLjl1AnOYGITnpEAwEIB8J4BBgWCAAgFiEECfuANpg5IsWyQFcH6+DR
 JFm2BMUFAl6mjLwCGwwACgkQ6+DRJFm2BMXSRgD/f8twzpyQfpE+viVjtlOxsq0HCavXZqbW
 VvIuvbyfSWQBAJhEIFF/fxmksu9r3FzixNQMOLc3EJgSwqvEYA28Db8O
In-Reply-To: <ia74kefmqtcuvk6zvtbtxkxeqtfonm6alfqngincebps7l4vcy@b3ljfyzoedxj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ioana,

On 11/9/26 10:39, Ioana Ciornei wrote:
> I need to have a look at the DPL file used on your board. Have you built
> it using Solidrun's lx2160a_build project (https://github.com/SolidRun/lx2160a_build)?
> Can you get me a link to the source file?

This image was used in 2022:
https://solid-run-images.sos-de-fra-1.exo.io/LX2k/lx2160a_build/lx2160acex7_2000_700_3200_8_5_2-f57e117.img.xz

It is now a dead link, but from the commit hash in the file, apparently
it has been built from:

https://github.com/SolidRun/lx2160a_build/tree/f57e11707eb4aa5df1908ff64ba52b9f6141ab1f

> Otherwise you can dump it from u-boot by using fdt print before the
> fsl_mc lazyapply command:
> 
> 	=> fdt addr <addr> && fdt print && fsl_mc lazyapply dpl <addr>;

If the above is not useful: What address would I need to use here?

> It would also help to know the RCW and the SerDes protocol combination
> that you are using. You can find those in the u-boot log. I pasted an
> example below:
Reset Configuration Word (RCW):
        00000000: 50838338 24500050 00000000 00000000
        00000010: 00000000 0e010000 00000000 00000000
        00000020: 10c001a0 00002580 00000000 00000000
        00000030: 09240000 00000000 00000000 00000000
        00000040: 00000000 00000000 00000000 00000000
        00000050: 00000000 00000000 00000000 00000000
        00000060: 00000000 00000000 00027000 00000000
        00000070: 08a80001 00151020
Model: SolidRun LX2160ACEX7 COM express type 7 based board
Board: LX2160ACE Rev2.0-CEX7, eMMC
SERDES1 Reference: Clock1 = 161.13MHz Clock2 = 100MHz
SERDES2 Reference: Clock1 = 100MHz Clock2 = 100MHz
SERDES3 Reference: Clock1 = 100MHz Clock2 = 100Hz
DRAM:  63.9 GiB
DDR    63.9 GiB (DDR4, 64-bit, CL=22, ECC off)
        DDR Controller Interleaving Mode: 256B
        DDR Chip-Select Interleaving Mode: CS0+CS1
dev_get_priv: null device
dev_get_priv: null device
Using SERDES1 Protocol: 8 (0x8)
Using SERDES2 Protocol: 5 (0x5)
Using SERDES3 Protocol: 2 (0x2)

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

