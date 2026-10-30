Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=176.9.212.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377851;
	b=10Kp+oIrzAQBDDCPiAdVNoVzX5dwvHNvuoNTox/YYWUWxrDBaqegI0kvtWXKQ7yqdoCV
	 iljg6phJ+l0nyA2/J4u1kpSqF/1srlwXdfKDCFborB0uneTa0NdMzLVr5fbP1Y83pVH4M
	 NmlpTztQpCmDcG0+QL3Lb6DXDCU7aqkEsBMF2ceUJh0WlsKacuvSdsbm+hTS0sTtyH4hg
	 CcrVGwffbOHIq8tZ+1NE+mvDLDC7JvVQ6LFVCOAEQtvS1iJxsIxs4/QU19rh2lKG0e7qz
	 C9BHl7/KelvhSAK8Kd+nW/dab1mB0jqKQh3hvc07BNXtof9elbvL6N53x0fwfbyQM5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377851;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Message-ID:Date:
	 MIME-Version:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ngPkicTSQqmNlFBWeMGaTVTCjHhdeKiw4JaqjSTS8/k=;
	b=rXz1CBrVkbWroKa67kOE85dENEKbbHfYBFc8xA84OdlZ8YJmnJstjj05dTq8Ky0ahadU
	 Epws4GLNpSHpYpnCJXH/KVD9pDHz7MazEVMuEaVYNP69h6zpstKdH/L3apDew7k5bsHk0
	 scEh8/0LygPoKIAiTqb3ZsAoI0atOF7rNvpRXVON9W/q3TQzqupGr1cTK29F/CXlMPt9A
	 hQA4Ugv28Rn66Ppiy3sdgt8dmr792pTJ8NuBYpR6ssThEwYcxgh/bp27+XSJ0uarW2ICc
	 zFClpMRFXM3CukTFXrPF52f1XlnLC/VUmuI2ZgQbCXR9RG/trQddb1xSgY1dnvBS0ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sysmocom.de;
	spf=pass smtp.mailfrom=sysmocom.de;
	arc=none smtp.remote-ip=176.9.212.161
Received: from mail.sysmocom.de (mail.sysmocom.de [176.9.212.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266F0606A31D
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266F0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sysmocom.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysmocom.de
Received: from localhost (localhost [127.0.0.1])
	by mail.sysmocom.de (Postfix) with ESMTP id 16A56C8021B;
	Fri, 30 Oct 2026 16:30:47 +0000 (UTC)
X-Virus-Scanned: Debian amavis at sysmocom.de
Received: from mail.sysmocom.de ([127.0.0.1])
 by localhost (mail.sysmocom.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brEJ78ZZl3By; Fri, 30 Oct 2026 16:30:46 +0000 (UTC)
Message-ID: <c4e8595b-1dcc-4fa9-9a9f-b23be2d79462@sysmocom.de>
Date: Fri, 30 Oct 2026 17:30:46 +0100
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
To: Vincent Jardin <vjardin@free.fr>, Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
References: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
 <CAOMZO5Arqfat5nO5Hi9Dq0TogvGAvmNLChE_8WrDGrNy1ha2Qg@mail.gmail.com>
 <auSrssMDb33JZVN5@L30177.local>
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
In-Reply-To: <auSrssMDb33JZVN5@L30177.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Fabio,
Hi Vincent,

thank you for the replies!

On 10/30/26 15:37, Vincent Jardin wrote:
> Le 30/10/26 11:32, Fabio Estevam a écrit :
>> Run git bisect between 6.12.101 and 6.12.113 to find the exact commit
>> that caused the regression.

Sorry, but this is not a development machine and I don't have physical
access to it, only a serial console. I can run some checks, but building
multiple kernels for bisect and booting them sounds too risky and time
intense unfortunately.

On 10/30/26 15:37, Vincent Jardin wrote:
> then, on the board, check, analyze and provide the outputs if needed of:
> 
> uname -r; cat /proc/device-tree/model; echo
> ip -br link
> dmesg | grep -i -e fsl-mc -e dpaa2 -e dpmac -e dprc
> cat /sys/kernel/debug/devices_deferred
> ls /sys/bus/fsl-mc/devices/
> busybox devmem 0x08340008 32 # or equivalent for your Debian

Old kernel:
> root@lx2-1:~# uname -r; cat /proc/device-tree/model; echo
> 6.12.101+deb13-arm64
> SolidRun LX2160A Clearfog CX
> root@lx2-1:~# ip -br link
> lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP>
> eth0             UP             d0:63:b4:03:b4:f7 <BROADCAST,MULTICAST,UP,LOWER_UP>
> br0              UP             52:a0:18:ae:7c:34 <BROADCAST,MULTICAST,UP,LOWER_UP>
> lxcbr0           DOWN           10:66:6a:00:00:00 <NO-CARRIER,BROADCAST,MULTICAST,UP>
> vethhEvvMx@if2   UP             fe:19:6b:c5:90:0e <BROADCAST,MULTICAST,UP,LOWER_UP>
> veth5HPqsX@if2   UP             fe:de:f1:c5:ae:3a <BROADCAST,MULTICAST,UP,LOWER_UP>
> vethFfnWAR@if2   UP             fe:ec:61:dc:5a:aa <BROADCAST,MULTICAST,UP,LOWER_UP>
> root@lx2-1:~# dmesg | grep -i -e fsl-mc -e dpaa2 -e dpmac -e dprc
> root@lx2-1:~# cat /sys/kernel/debug/devices_deferred
> root@lx2-1:~# ls /sys/bus/fsl-mc/devices/
> dpbp.0	  dpcon.12  dpcon.18  dpcon.23	dpcon.29  dpcon.6  dpio.10  dpio.2  dpio.8    dpmac.5  dpmcp.10  dpmcp.16  dpmcp.21  dpmcp.27  dpmcp.32  dpmcp.6  dprtc.0
> dpbp.1	  dpcon.13  dpcon.19  dpcon.24	dpcon.3   dpcon.7  dpio.11  dpio.3  dpio.9    dpmac.6  dpmcp.11  dpmcp.17  dpmcp.22  dpmcp.28  dpmcp.33  dpmcp.7  dpseci.0
> dpcon.0   dpcon.14  dpcon.2   dpcon.25	dpcon.30  dpcon.8  dpio.12  dpio.4  dpmac.10  dpmac.7  dpmcp.12  dpmcp.18  dpmcp.23  dpmcp.29  dpmcp.34  dpmcp.8
> dpcon.1   dpcon.15  dpcon.20  dpcon.26	dpcon.31  dpcon.9  dpio.13  dpio.5  dpmac.17  dpmac.8  dpmcp.13  dpmcp.19  dpmcp.24  dpmcp.3   dpmcp.35  dpmcp.9
> dpcon.10  dpcon.16  dpcon.21  dpcon.27	dpcon.4   dpio.0   dpio.14  dpio.6  dpmac.3   dpmac.9  dpmcp.14  dpmcp.2   dpmcp.25  dpmcp.30  dpmcp.4	 dpni.0
> dpcon.11  dpcon.17  dpcon.22  dpcon.28	dpcon.5   dpio.1   dpio.15  dpio.7  dpmac.4   dpmcp.1  dpmcp.15  dpmcp.20  dpmcp.26  dpmcp.31  dpmcp.5	 dprc.1
> root@lx2-1:~# busybox devmem 0x08340008 32
> 0x0000003F

New kernel:
> root@lx2-1:~# uname -r; cat /proc/device-tree/model; echo
> 6.12.113+deb13-arm64
> SolidRun LX2160A Clearfog CX
> root@lx2-1:~# ip -br link
> lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP>
> br0              UP             52:a0:18:ae:7c:34 <BROADCAST,MULTICAST,UP,LOWER_UP>
> lxcbr0           DOWN           10:66:6a:00:00:00 <NO-CARRIER,BROADCAST,MULTICAST,UP>
> vethXFQUqu@if2   UP             fe:0a:7b:88:52:cd <BROADCAST,MULTICAST,UP,LOWER_UP>
> vethUG8N9y@if2   UP             fe:ff:eb:09:16:a5 <BROADCAST,MULTICAST,UP,LOWER_UP>
> vethoesNCY@if2   UP             fe:8e:29:91:43:6b <BROADCAST,MULTICAST,UP,LOWER_UP>
> root@lx2-1:~# dmesg | grep -i -e fsl-mc -e dpaa2 -e dpmac -e dprc
> [    0.008101] fsl-mc MSI: msi-controller@6020000 domain created
> [    0.107175] fsl_mc_bus 80c000000.fsl-mc: fsl-mc: MC boot completed with error 0x3f
> [    0.114747] fsl_mc_bus 80c000000.fsl-mc: probe with driver fsl_mc_bus failed with error -22
> root@lx2-1:~# cat /sys/kernel/debug/devices_deferred
> 8000000.crypto
> root@lx2-1:~# ls /sys/bus/fsl-mc/devices/
> root@lx2-1:~# busybox devmem 0x08340008 32
> 0x0000003F

On 10/30/26 15:37, Vincent Jardin wrote:
> 
>  From U-Boot, before it boots Linux:
> 
> md.l 0x08340008 1
> printenv mcinitcmd bootcmd
> 
> 0x08340008 is the General Status Register (GSR) of the MC

uboot:
> => md.l 0x08340008 1
> 08340008: 00000001                               ....
> => printenv mcinitcmd bootcmd
> mcinitcmd=mmc dev 1; mmc read 0x80a00000 0x5000 0x1200;mmc read 0x80e00000 0x7000 0x800;env exists secureboot && mmc read 0x80640000 0x3200 0x20 && mmc read 0x80680000 0x3400 0x20 && esbc_validate 0x80640000 && esbc_validate 0x80680000 ;fsl_mc start mc 0x80a00000 0x80e00000
> bootcmd=mmc dev 1; env exists mcinitcmd && mmcinfo; mmc read 0x80d00000 0x6800 0x800; env exists mcinitcmd && env exists secureboot  && mmc read 0x806C0000 0x3600 0x20 && esbc_validate 0x806C0000;env exists mcinitcmd && fsl_mc lazyapply dpl 0x80d00000;run distro_bootcmd;run sd2_bootcmd;env exists secureboot && esbc_halt;
> =>

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

