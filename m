Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=176.9.212.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979658;
	b=dsGIy1rT2s7SOOdFi5qBDlXKwdmyny7Xz2XQrWEyHoY0wTuCatrEK8pDSZj56NZJ3q8G
	 QJVa/7o9y8gEXmbijliZ+uDjwNht9T+efO73QSnO48QFCGp92pxbN1TIqbulTnWgCVzmy
	 A5ZgD48F3EDzqtQPPAOcSExY1kmzdBwtGP+dn2d1A09C93z+54asg8tR+thDcOtraBPdK
	 /G2Ujk8l1Ncl/EHtX0/+8CnupS8Fu3uzn+aNL15ALUtJOAGiDk3h2WIX9KBG8GQxMdxMx
	 peDw2yxAWSgBuNYa1W3A0oUenk0ed4FGLWuFGVQGnSahIe5vNcM6f1nT7N24mY2O2bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979658;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Message-ID:Date:
	 MIME-Version:From:Subject:To:Cc:References:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JOcKtDdKrrrqnffrtBgnIbOUJXZ/mc0mCRVoyD/pkfU=;
	b=h08mrPb3a0QO4VAnZV+JluHehzFYDyTFQZ38faRjeSCc9d6EJfEOPokziHWHS5jxGGFl
	 k7dPi4oiUeGOSPF52awfzIN/H1k/jiESa1e2jx5297nq8l0GeohcGW88STsrcqMyk0jFH
	 e6izNPwMBtvhV2u88j1t9GUkN/rx+LJRshiJwxMveuv0t4dY430t7i+SnQ0AElp20QJ+u
	 ANs9k+5QwdM+U7E6tOyig/yheAP7b3ZxqkrTaPmcjiGH/g+fXcPOH6s16AQPJ5esHMgRw
	 oXFZZeyJzpiJxQawbIGzMN+pmTvpFkS0Dcg8g0TVIYGGQGBfjBhQ2XuV4z9cw5rs9aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sysmocom.de;
	spf=pass smtp.mailfrom=sysmocom.de;
	arc=none smtp.remote-ip=176.9.212.161
Received: from mail.sysmocom.de (mail.sysmocom.de [176.9.212.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A9606A329
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 15:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B4A9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sysmocom.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sysmocom.de
Received: from localhost (localhost [127.0.0.1])
	by mail.sysmocom.de (Postfix) with ESMTP id E56BDC89EDC;
	Fri, 06 Nov 2026 15:40:47 +0000 (UTC)
X-Virus-Scanned: Debian amavis at sysmocom.de
Received: from mail.sysmocom.de ([127.0.0.1])
 by localhost (mail.sysmocom.de [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUcLqndlVV2m; Fri,  6 Nov 2026 15:40:47 +0000 (UTC)
Message-ID: <ab9967d8-0d44-4457-9cba-6d2913e17977@sysmocom.de>
Date: Fri, 6 Nov 2026 16:40:46 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Oliver Smith <osmith@sysmocom.de>
Subject: Re: No network for SolidRun LX2160A Clearfog CX with kernel 6.12.113
To: Ioana Ciornei <ioana.ciornei@nxp.com>, Vincent Jardin <vjardin@free.fr>
Cc: Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev
References: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
 <CAOMZO5Arqfat5nO5Hi9Dq0TogvGAvmNLChE_8WrDGrNy1ha2Qg@mail.gmail.com>
 <auSrssMDb33JZVN5@L30177.local>
 <c4e8595b-1dcc-4fa9-9a9f-b23be2d79462@sysmocom.de>
 <auX-VA8xlqSwLYGj@L30177.local>
 <z2q7u34spdhyiqhrkem4b64fvdwnnbodgwzj4rynuepqyrym5q@nuy2zhhlqgpu>
Content-Language: en-US
Autocrypt: addr=osmith@sysmocom.de; keydata=
 xjMEXqaMvBYJKwYBBAHaRw8BAQdAKlLfpb/UKvlUjGFwzzkDBT1fXdlqg+MaEG2+hTXDYUrN
 IU9saXZlciBTbWl0aCA8b3NtaXRoQHN5c21vY29tLmRlPsKWBBMWCAA+AhsDBQsJCAcCBhUK
 CQgLAgQWAgMBAh4BAheAFiEECfuANpg5IsWyQFcH6+DRJFm2BMUFAmDG9VIFCRTsa5YACgkQ
 6+DRJFm2BMUJ0wD+L0gpHABtBfkNQ7i0/qtMs5thoqt2yldxao6q31BBLAAA/iXUDIEYjQ0L
 wsZRtiSdXNjbBfdT9boLdh4CY+TKwuYPzjgEXqaMvBIKKwYBBAGXVQEFAQEHQPGmG2/uQrDy
 xalQoBnT1zdIbeg/xWLjl1AnOYGITnpEAwEIB8J4BBgWCAAgFiEECfuANpg5IsWyQFcH6+DR
 JFm2BMUFAl6mjLwCGwwACgkQ6+DRJFm2BMXSRgD/f8twzpyQfpE+viVjtlOxsq0HCavXZqbW
 VvIuvbyfSWQBAJhEIFF/fxmksu9r3FzixNQMOLc3EJgSwqvEYA28Db8O
In-Reply-To: <z2q7u34spdhyiqhrkem4b64fvdwnnbodgwzj4rynuepqyrym5q@nuy2zhhlqgpu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Iona,
Hi Vincent,

On 11/2/26 15:20, Ioana Ciornei wrote:
> On Sat, Oct 31, 2026 at 03:42:28PM +0100, Vincent Jardin wrote:
  > […]
>> It seems to be related to the backport of:
>>    https://lore.kernel.org/all/20260401144508.3062019-1-ioana.ciornei@nxp.com/
  > […]> The 0x3F value means "MC layout process error".
> 
> Please look into the MC firmware's log. It should help in determining
> what exactly is not ok in the DPL file processing.
> 
> 	$ cat /dev/dpaa2_mc_console

With both the old and the new kernel I get the exact same log:
> root@lx2-1:~# cat /dev/dpaa2_mc_console
> [W, PLATFORM]  UART print failed, all debug data will be printed to buffer.
> [E, open_device:2371, DPMAC]  no device
> [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0001
> [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> [E, open_device:2371, DPMAC]  no device
> [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0002
> [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> [E, open_device:2371, DPMAC]  no device
> [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0003
> [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> [E, open_device:2371, DPMAC]  no device
> [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0004
> [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> [E, open_device:2371, DPMAC]  no device
> [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0005
> [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> [E, open_device:2371, DPMAC]  no device
> [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0006
> [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> [E, open_device:2371, DPMAC]  no device
> [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0007
> [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> [E, open_device:2371, DPMAC]  no device
> [E, dpni_probe_cb_v1:4704, DPNI]  Can't create DPNI 0008
> [E, subnode_process:155]  Probing module 'dpni' return error code -19. Continue dpl processing...
> [E, open_device:2371, DPMAC]  no device
> [E, dpmac_probe_cb:766, DPMAC]  Can't create DPMAC 0002
> [E, subnode_process:155]  Probing module 'dpmac' return error code -19. Continue dpl processing...
> [E, open_device:2371, DPMAC]  no device
> [E, dpmac_probe_cb:766, DPMAC]  Can't create DPMAC 0012
> [E, subnode_process:155]  Probing module 'dpmac' return error code -19. Continue dpl processing...
> [E, dpl_process:527]  Error while parsing 'connections'. Skip processing the rest of DPL.
> [E, main:186]  DPL processing failed; continuing...
> Running MC app, waiting for events ...

I'm not familiar with the MC firmware, but all this explains what
happens, there's the firmware error and then because of the mentioned
patch, fsl_mc_bus_probe() aborts early and then I get no ethernet
device.

As mentioned earlier, dmesg also has:
>> [    0.107175] fsl_mc_bus 80c000000.fsl-mc: fsl-mc: MC boot completed with error 0x3f
>> [    0.114747] fsl_mc_bus 80c000000.fsl-mc: probe with driver fsl_mc_bus failed with error -22

Could you give me a pointer for getting rid of the firmware errors?

(And I do wonder how many other people may run into the same problem,
maybe it would be better to just print a warning instead of aborting
there...?)

Thanks for all the help everybody!

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


