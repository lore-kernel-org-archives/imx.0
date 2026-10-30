Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371065;
	b=aeMCOt4Q36ksdG7R2PRMF4ME+eW06oHuwoig6eNOzWGdjFvxdsWCgrLp7/PtV+MKfj0x
	 ropmz7H4ViFaOdQqFB1h5BOM3qkVggoya8tM8STFlcfgonhyRrwiUoVM4JNBwm5kVnm5S
	 OywzbwVK75QtasIaq3h7fVgU/hElHDdsgJbEgLBSFXF20BCRULPx60uyxe+ZAFISEeqnt
	 o+CnFo+MuLFlLTFMgYWb4BDxNHHRz/MiXQYdtb9kmB5w59n3QhRBFu6xQBDmsH1YvSiQv
	 YA6aD+43qrNeItzNFn0ft6r3BfEoWa+6QQcXmRJ0BOcdW1l96LwH5eZm4LlPe1p+CGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371065;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Gxk9FaYi5qmAS1KQfl+B8zYj8Q5KDzzl2J626CJRtao=;
	b=xKyLR9GlA3zB+r/7/zQ7c4a+6AQQe1u/73l9iv0BmrWuundRqJv2OboQm8PuSv7hal36
	 LS2gkVzKcoNYFNGRqdaCOz+sNEre87aEEpNn7lofkjQIeyILb47ZzSWW26aYlGofHrepJ
	 sgDjGx8eMLnUsiF8hSi+2A1wOULDypoME77mNNaxhmHDQqCgAQa3Ex+yqJIy5px7RcPM8
	 ipmbqEdOdtqB+X/P+6d14ijyHyn1kAywJ62KhyaEDa2poouW7FIGCioH31KIj7pFXTIDi
	 +fgZv86vHSopgrDvii71ZoD5TjzwB3lmdvp5aLVEBmWMEzi2iKbiiwujtfH23X9/Ldw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZqialmvW;
	arc=none smtp.remote-ip=212.27.42.6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E25606A31A
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 14:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E25606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZqialmvW
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id EB491780506;
	Fri, 30 Oct 2026 15:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1793371062;
	bh=l/2bSm2q3d05v6Hr+rxkbCfH3jqnNp0tHda3qShfe3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZqialmvWUGHBvrTEEHhylF+H7LG/HUQ7uWISKx+et067blVqeD5iM+K+HMGVYnUOQ
	 AnrYWhrRl+sjiE/BHIivH2JOikehDHHfXMBuc91HHaIyjtO5Lpfff0ISEwENufNSaG
	 b0pumB5tdFe8AapOHLTShUnYd6fclnwF1/LbY8DYT5Nz5QhFAOtV+Y/CUihK2Hkd37
	 Q5E2WSGwyBZXmNk7L0l1LI1srw6lMJabYAwNtZAvNVi+/0wOYPBqx2hwITgn+kNibL
	 R0ek0lZe97027cLl0GUPL7KqryeS7jQzboRKm98b2QnDJVae8T+h9kfCaBc1lZ8AjD
	 UkEk074hRD7gA==
Date: Fri, 30 Oct 2026 15:37:38 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Cc: Oliver Smith <osmith@sysmocom.de>, imx@lists.linux.dev
Subject: Re: No network for SolidRun LX2160A Clearfog CX with kernel 6.12.113
Message-ID: <auSrssMDb33JZVN5@L30177.local>
References: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
 <CAOMZO5Arqfat5nO5Hi9Dq0TogvGAvmNLChE_8WrDGrNy1ha2Qg@mail.gmail.com>
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
In-Reply-To: <CAOMZO5Arqfat5nO5Hi9Dq0TogvGAvmNLChE_8WrDGrNy1ha2Qg@mail.gmail.com>

Hi Oliver,

Le 30/10/26 11:32, Fabio Estevam a écrit :
> Hi Oliver,
> 
> On Fri, Oct 30, 2026 at 8:48 AM Oliver Smith <osmith@sysmocom.de> wrote:
> >
> > Hi,
> >
> > on a SolidRun LX2160A Clearfog CX machine I've upgraded from 6.12.101 to
> > 6.12.113 in Debian 13, and with that kernel there is no eth0 after boot.
> > When downgrading to 6.12.101, it is there again.
> >
> > I suspect this is a regression from dts changes in
> > arch/arm64/boot/dts/freescale as there were a few for lx2160a:
> 
> Run git bisect between 6.12.101 and 6.12.113 to find the exact commit
> that caused the regression.

then, on the board, check, analyze and provide the outputs if needed of:

uname -r; cat /proc/device-tree/model; echo
ip -br link
dmesg | grep -i -e fsl-mc -e dpaa2 -e dpmac -e dprc
cat /sys/kernel/debug/devices_deferred
ls /sys/bus/fsl-mc/devices/
busybox devmem 0x08340008 32 # or equivalent for your Debian

From U-Boot, before it boots Linux:

md.l 0x08340008 1
printenv mcinitcmd bootcmd

0x08340008 is the General Status Register (GSR) of the MC

my 2 cents,
  Vincent
