Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793457762;
	b=AYWvnvBHfmFel6dk+wqOycjwYyiQp7XIzHGVbeBQsYhwc758FoL4H4lJ/l5bCB7tAJX/
	 hF0YMNqqzud1+dh25EEv8eqNbQSAE9vTcGJIlBUBXE3H6gJ0uRXsA7qj9v1XQX+gC/VwT
	 DdozyVRJpBGtF94yg0jXqddsK62ObFrWb1/ncEA4FrKzjBIDeda95ePT9bLySsO7HhEcJ
	 +GEQmxcpZQJq+1P2+nJIOfCKtzvh0NYwSMqIvzK2jzidjqGjNcuPyFzpbGk4BH3N9IQhs
	 Vxo/wAWUdBkJaE5M/UKi9XWIuA4tH1TegpLYAX3QT303x3rHmHJyuUs864Nj6M55WRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793457762;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=G8wl0bFiv+qpKt3DidADu58l6XmgZ8jqd8AVPjfetJc=;
	b=FSYWxB+tC3NOD32LW1Gppun9qJdbp722lfMgH59ZWOoaejZlqGIbkzetkhSF9y0TWb/2
	 79l0JveudJsjAbmscWZ+C0F2i/99sTO71pxPxrWOttRFrnZYYY0OcbcIkvewfzTNqKhFr
	 ZV2s5Ao0OLtfvUXlgBlsvoTjlrsOpVtYCuwMrnlE068iuFiUfMQ1R1U09RCE8iEH7LVry
	 kL3YK3Tj08tI/yChrxzPoNabiphmKe+Q8vKuKBTHU+/i8BpNoqFp22O/6WHmoAOA4HeGg
	 G0B5Um7phCHkGfJ2eHIyWUXsQLXOTF3zDMlq89AQGyW19+MJQHqVAVypzTZDKmAc6rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=TtaCviMG;
	arc=none smtp.remote-ip=212.27.42.2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D040C606A31F
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 14:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D040C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=TtaCviMG
Received: from L30177.local (unknown [46.193.67.97])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id D7D8B2003D0;
	Sat, 31 Oct 2026 15:42:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1793457753;
	bh=GtdHu5fdYsm0j827x4d0XoKkcDLbvULptWjyjcPmcIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TtaCviMGRRqyY3UwxHoLtLyJiyrC/kBWKIFktkC+rovw19gMv0mI8yjnQbE47AFPb
	 VF6Joi4hYM4qxJucRPhO9SjF+mwWrCJ7W1uBLYP3Q0TuE77eFBJPXhEKu/CLJrHLrX
	 EV5MqCQoFa0k8NGgtdwWBL5sDeO20YL18gJV2CP0YNHxmiScJpHaKTJQjhR9llcZ6K
	 QO+JpUBT0eRngdIJEiD3q8VRf0cOXk2UjQsW9Yk2ZEbIrogg4lGI47Am98ZvnQu15a
	 dyJTZ7R3QCeMjxgQJh9v8qwxh8drnwmk/7I7T326oi3vhKqVSBEbSZRYIsIRusm8md
	 w+svya14wJsNg==
Date: Sat, 31 Oct 2026 15:42:28 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Oliver Smith <osmith@sysmocom.de>,
	Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
Subject: Re: No network for SolidRun LX2160A Clearfog CX with kernel 6.12.113
Message-ID: <auX-VA8xlqSwLYGj@L30177.local>
References: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
 <CAOMZO5Arqfat5nO5Hi9Dq0TogvGAvmNLChE_8WrDGrNy1ha2Qg@mail.gmail.com>
 <auSrssMDb33JZVN5@L30177.local>
 <c4e8595b-1dcc-4fa9-9a9f-b23be2d79462@sysmocom.de>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4e8595b-1dcc-4fa9-9a9f-b23be2d79462@sysmocom.de>

Hi Ioana,

Can you have a look ? 

It seems to be related to the backport of:
  https://lore.kernel.org/all/20260401144508.3062019-1-ioana.ciornei@nxp.com/

I do not understand the backport flow of the kernel: it was not flagged as a
fix so I do not understand how it landed into Oliver's 6.12 kernel.

best regards,
  Vincent

Le 30/10/26 17:30, Oliver Smith a écrit :
> Hi Fabio,
> Hi Vincent,
> 
> thank you for the replies!
> 
> On 10/30/26 15:37, Vincent Jardin wrote:
> > Le 30/10/26 11:32, Fabio Estevam a écrit :
> > > Run git bisect between 6.12.101 and 6.12.113 to find the exact commit
> > > that caused the regression.
> 
> Sorry, but this is not a development machine and I don't have physical
> access to it, only a serial console. I can run some checks, but building
> multiple kernels for bisect and booting them sounds too risky and time
> intense unfortunately.
> 
> On 10/30/26 15:37, Vincent Jardin wrote:
> > then, on the board, check, analyze and provide the outputs if needed of:
> > 
> > uname -r; cat /proc/device-tree/model; echo
> > ip -br link
> > dmesg | grep -i -e fsl-mc -e dpaa2 -e dpmac -e dprc
> > cat /sys/kernel/debug/devices_deferred
> > ls /sys/bus/fsl-mc/devices/
> > busybox devmem 0x08340008 32 # or equivalent for your Debian
> 
> Old kernel:
> > root@lx2-1:~# uname -r; cat /proc/device-tree/model; echo
> > 6.12.101+deb13-arm64
> > SolidRun LX2160A Clearfog CX
> > root@lx2-1:~# ip -br link
> > lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP>
> > eth0             UP             d0:63:b4:03:b4:f7 <BROADCAST,MULTICAST,UP,LOWER_UP>
> > br0              UP             52:a0:18:ae:7c:34 <BROADCAST,MULTICAST,UP,LOWER_UP>
> > lxcbr0           DOWN           10:66:6a:00:00:00 <NO-CARRIER,BROADCAST,MULTICAST,UP>
> > vethhEvvMx@if2   UP             fe:19:6b:c5:90:0e <BROADCAST,MULTICAST,UP,LOWER_UP>
> > veth5HPqsX@if2   UP             fe:de:f1:c5:ae:3a <BROADCAST,MULTICAST,UP,LOWER_UP>
> > vethFfnWAR@if2   UP             fe:ec:61:dc:5a:aa <BROADCAST,MULTICAST,UP,LOWER_UP>
> > root@lx2-1:~# dmesg | grep -i -e fsl-mc -e dpaa2 -e dpmac -e dprc
> > root@lx2-1:~# cat /sys/kernel/debug/devices_deferred
> > root@lx2-1:~# ls /sys/bus/fsl-mc/devices/
> > dpbp.0	  dpcon.12  dpcon.18  dpcon.23	dpcon.29  dpcon.6  dpio.10  dpio.2  dpio.8    dpmac.5  dpmcp.10  dpmcp.16  dpmcp.21  dpmcp.27  dpmcp.32  dpmcp.6  dprtc.0
> > dpbp.1	  dpcon.13  dpcon.19  dpcon.24	dpcon.3   dpcon.7  dpio.11  dpio.3  dpio.9    dpmac.6  dpmcp.11  dpmcp.17  dpmcp.22  dpmcp.28  dpmcp.33  dpmcp.7  dpseci.0
> > dpcon.0   dpcon.14  dpcon.2   dpcon.25	dpcon.30  dpcon.8  dpio.12  dpio.4  dpmac.10  dpmac.7  dpmcp.12  dpmcp.18  dpmcp.23  dpmcp.29  dpmcp.34  dpmcp.8
> > dpcon.1   dpcon.15  dpcon.20  dpcon.26	dpcon.31  dpcon.9  dpio.13  dpio.5  dpmac.17  dpmac.8  dpmcp.13  dpmcp.19  dpmcp.24  dpmcp.3   dpmcp.35  dpmcp.9
> > dpcon.10  dpcon.16  dpcon.21  dpcon.27	dpcon.4   dpio.0   dpio.14  dpio.6  dpmac.3   dpmac.9  dpmcp.14  dpmcp.2   dpmcp.25  dpmcp.30  dpmcp.4	 dpni.0
> > dpcon.11  dpcon.17  dpcon.22  dpcon.28	dpcon.5   dpio.1   dpio.15  dpio.7  dpmac.4   dpmcp.1  dpmcp.15  dpmcp.20  dpmcp.26  dpmcp.31  dpmcp.5	 dprc.1
> > root@lx2-1:~# busybox devmem 0x08340008 32
> > 0x0000003F
> 
> New kernel:
> > root@lx2-1:~# uname -r; cat /proc/device-tree/model; echo
> > 6.12.113+deb13-arm64
> > SolidRun LX2160A Clearfog CX
> > root@lx2-1:~# ip -br link
> > lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP>
> > br0              UP             52:a0:18:ae:7c:34 <BROADCAST,MULTICAST,UP,LOWER_UP>
> > lxcbr0           DOWN           10:66:6a:00:00:00 <NO-CARRIER,BROADCAST,MULTICAST,UP>
> > vethXFQUqu@if2   UP             fe:0a:7b:88:52:cd <BROADCAST,MULTICAST,UP,LOWER_UP>
> > vethUG8N9y@if2   UP             fe:ff:eb:09:16:a5 <BROADCAST,MULTICAST,UP,LOWER_UP>
> > vethoesNCY@if2   UP             fe:8e:29:91:43:6b <BROADCAST,MULTICAST,UP,LOWER_UP>
> > root@lx2-1:~# dmesg | grep -i -e fsl-mc -e dpaa2 -e dpmac -e dprc
> > [    0.008101] fsl-mc MSI: msi-controller@6020000 domain created
> > [    0.107175] fsl_mc_bus 80c000000.fsl-mc: fsl-mc: MC boot completed with error 0x3f
> > [    0.114747] fsl_mc_bus 80c000000.fsl-mc: probe with driver fsl_mc_bus failed with error -22
> > root@lx2-1:~# cat /sys/kernel/debug/devices_deferred
> > 8000000.crypto
> > root@lx2-1:~# ls /sys/bus/fsl-mc/devices/
> > root@lx2-1:~# busybox devmem 0x08340008 32
> > 0x0000003F
> 
> On 10/30/26 15:37, Vincent Jardin wrote:
> > 
> >  From U-Boot, before it boots Linux:
> > 
> > md.l 0x08340008 1
> > printenv mcinitcmd bootcmd
> > 
> > 0x08340008 is the General Status Register (GSR) of the MC
> 
> uboot:
> > => md.l 0x08340008 1
> > 08340008: 00000001                               ....
> > => printenv mcinitcmd bootcmd
> > mcinitcmd=mmc dev 1; mmc read 0x80a00000 0x5000 0x1200;mmc read 0x80e00000 0x7000 0x800;env exists secureboot && mmc read 0x80640000 0x3200 0x20 && mmc read 0x80680000 0x3400 0x20 && esbc_validate 0x80640000 && esbc_validate 0x80680000 ;fsl_mc start mc 0x80a00000 0x80e00000
> > bootcmd=mmc dev 1; env exists mcinitcmd && mmcinfo; mmc read 0x80d00000 0x6800 0x800; env exists mcinitcmd && env exists secureboot  && mmc read 0x806C0000 0x3600 0x20 && esbc_validate 0x806C0000;env exists mcinitcmd && fsl_mc lazyapply dpl 0x80d00000;run distro_bootcmd;run sd2_bootcmd;env exists secureboot && esbc_halt;
> > =>
> 
> Best regards,
> Oliver
> 
> -- 
> - Oliver Smith <osmith@sysmocom.de>            https://www.sysmocom.de/
> =======================================================================
> * sysmocom - systems for mobile communications GmbH
> * Siemensstr. 26a
> * 10551 Berlin, Germany
> * Sitz / Registered office: Berlin, HRB 134158 B
> * Geschaeftsfuehrer / Managing Director: Harald Welte
> 
