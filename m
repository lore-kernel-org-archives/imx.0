Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793390177;
	b=WFTbRw/NMP0mnwrfWqTsEidEI6jnx4PR2zF1/RM44uGC8AbeRyyOEZkpqPh6COCW8NA7
	 H3l13GEb70A9/xb82kznbGWhRQTUGBIiidxOVfwMB9/s0jQmQc2wfpPFPIB1JY6fnqNXw
	 640hIoXsuH4FA1LJZw92m1kY7+HF2MRoBl51IeDIq6NLkephmOUHkMi+uGRu1Yqe1rAv+
	 +r9zJb5V8v6M7CrQ9ftwAxmXTXBZ6d1b43JBKcXHUYtpQi1FPoyIRiZjN7KsxH0sIT2tg
	 9v7hErYX1puh7TTKzPWLyrdX3G9XpLIXB1/o4uEF+K39UdzEd5yaLzU5deq2ACG+Ttg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793390177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qRas9v8/3jWbNz9EwG1fRKdmhMR578mC0V9cHYchAsQ=;
	b=pgpwg9NhsdKgS619mXbgnx1yhJOkOTJvnvvh5gEanTpUGAi2Sad8LSYV5T32nzQyTSof
	 xLJcx+TcxQ7ffO24lCs0S53WPpI+PmnsmZgF2F6/1HXaOnc2+Lcw6hroRIxbi7LriyC36
	 jcR87QNI9E/hHG7fBPCFbEnBs0NdY/eEzXDIZlXYpYBIrANwfLd7v/38B1g3HBm1+bQiO
	 WAH6ChUu5cCLZ9pHXq8oq1a7KamIdLvBjZKlWaK4H/igpI5aQl11YjA5dmQrWTIT92YSn
	 eM1ntgxXmw+kSzEoP2glPqtULorh2yEbhu+ecOsb59KrkRgC7rrun7FpG2fqH9SULYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fGj+iFRu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44728606A31E
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 19:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44728606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fGj+iFRu
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso1223450e87.0
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 12:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793390175; cv=none;
        d=google.com; s=arc-20260327;
        b=EK2hPZQ4wXsboFp3fflxNx3RXiPnY2y/7UVzEIb8tuEkXAvUpDJAYdAt0WVN+VpVyw
         /65T5x5GnkLjIsVFSvTfe9CJ71zEN5shNGBi3d0VoQfJeJBYD5SrDVHt4SfVbQLDOzCn
         7JIfSAOH4m7minW+o/nsukg+U8k/GuKxGwZHL0rlLEZwe15qVK9KNUOGVDbBpF+930Sz
         vlLZ++D+q9C4yYBLr1qurNIleZBg7ZzojxaczaSRClsYIrpdfi3gMqqFErCfE0XnX8Uf
         bSoq6OinCBAA+Aqbu11+wilSUqSGLhiHeZVWBn3nl+CG9/ZdOepT0NkZRSg1G7W50tBM
         igTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qRas9v8/3jWbNz9EwG1fRKdmhMR578mC0V9cHYchAsQ=;
        fh=pL+2dPWAdgvoMAnlUTsOwZ79Raw8jqnxijrVjHX1AoM=;
        b=qHifomZUNdBO80TP6XxWTYYy9Y80HdDySUiE6I6Zi0Kyx58fKAwFIwN3BGdOvjGl9f
         FDoxPVa3Wmw3Irc9/+M5XDTyrB058Ck6FEJp4b+AgEO2pKdUKtr9tz0nwG9XZ7+NEick
         vWl+lizsIZLcn+YZtF7OuvT+qslWHy/BmtMwvVf7KURUuZh3wf+mcUEY3a+OMuyCb+QX
         slSs1FmAOMzbN/X2k/SFpk1YtcoPKCFD+003npuZdhb9GQRj59u2CxtCsV4CHRo7eMOR
         Zuila/hCLdOvg115Sa3b+IBWptXaLoz83vgCXMmBZngqjR2hAWaF6EKM2jHjpHL6MG/n
         QgbA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793390175; x=1793994975; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qRas9v8/3jWbNz9EwG1fRKdmhMR578mC0V9cHYchAsQ=;
        b=fGj+iFRuXbiGsG6CpNaBOxsu7DlqtXu24+Ey0Mn7q+O6FizutfOHYbnN2b6mfWTAcj
         HjYaFiruFeamGFOZx32JeUb9tl9DCUKtZ9NAUo4kHv74U7B6JnP8JFjC1A9u2Y3x9KPs
         p/GV9FdOdgoK3iab7BdAilUOVO/CpJLRvIFFDmrmN50w7dbCBhsE1iNPFjcLirldDtHm
         a/5ppvkPveiKeky33nANm8VZ9dzWVF6oA3kH4xoTCBNFpmY1nUqblYlLTFmOKsjO90xR
         f9+P4eEap/FOLt5r5p+EEdIU9PDUeyCX26QjWqwf9tGTy2++oNZvk0sDJwbln6BXjNmn
         zsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793390175; x=1793994975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRas9v8/3jWbNz9EwG1fRKdmhMR578mC0V9cHYchAsQ=;
        b=VGi8JiTh9YKTT0IkxzMZwwAbyHZZ+x7jpApBuhTD8I7FjEr1GudkOihFFwe5DAhBya
         1Cjdf4cWPJWNCTKgsOGdjgBk/9NY0Rt6FkETwbr/8PrfGP1M/ZlJnIyJQ/QiN/GaTkGY
         53WBZuH81puUHuPDBDEByof98aCzPqMzKdAn1qIRk6EDbgXtSXZnVWrJJMwdIh4uwu8V
         J41G0wMVRv1xykLTZWm2RrUqslf0kqAxwNTKEM4mdOKFCWaPhSU8DfebUQPT0/0b2qWy
         9cLNlDoxFDE/WOZe4aoFS1McBjVkmYegtwYsg1nXC9A9jMSqKY7Pfu6v2umlg3IopcpB
         b3Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwouAlKe74N+Cg+97+OaKuHvDvyvX+/hNJWtG3bhRG7c7Sinob9Dunc/v8KfcAWC1Qo21k=@lists.linux.dev
X-Gm-Message-State: AFq9FYLQ58IMr5+Vo0A2OZFppP7l/DnL50CRMdB/eYqv7tg41Vp38sPj
	XIUiFg5yHItNMvcwSXApt4S+sbN8/6T9I9pr2qS1uzjMwRnaghNqdcN2KGenT3kJunwMqFYRNfs
	eemwOmcb4wEKeN7ssORRPY765Gl/ClMI=
X-Gm-Gg: AYBFou1pYN7dbc0PgZ/HUdCrVW+XyR7TuaAoTbfShY7pvfRFyUjsoXZUz/yvc3Z5o34
	6izna/CmbpAsbL0LtSFwJldLaNInble87yDxdJeOay9Ikidd1tNtmpCV9HQGUZoB3QZ+sU1PcD/
	JKkHTSDWZFW1eA7Or71uFZW+gFvlNzQZGXEZcq4UYwrlTkMm1wS3L6NqFgEdRJZO5nsgqOUOBUl
	XdKKVNxFz8gtug1eOtrm2GRLTYjrl58cx8COpXoi9eQzg4JBWYakTJqlv2gSYHFaPfBzjB29f1k
	GT7NfdFZanttotfrjfNLJOvEO8XmZ6v/LVT+7DoV9julcu+qqOsoD46ROWWwCgNo6uvWh2BmxJ+
	taEO1W7cHVFNnMkMlqblXd5Dh9WbetOXqi4iYb6DfFY3RWoBUpgqbzlHjAt/rWjTyYFw9LzOMAZ
	iZVOBV2DCsLd9P2CioNS7cqs1W7I/G8Iy7JhaWpUbzXp1vUBw=
X-Received: by 2002:a05:6512:1302:b0:5bf:b144:366b with SMTP id
 2adb3069b0e04-5bfd956e519mr1112091e87.35.1793390175149; Fri, 30 Oct 2026
 12:56:15 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <d074d5b8-7b86-454d-b948-83530fa82e97@sysmocom.de>
 <CAOMZO5Arqfat5nO5Hi9Dq0TogvGAvmNLChE_8WrDGrNy1ha2Qg@mail.gmail.com>
 <auSrssMDb33JZVN5@L30177.local> <c4e8595b-1dcc-4fa9-9a9f-b23be2d79462@sysmocom.de>
In-Reply-To: <c4e8595b-1dcc-4fa9-9a9f-b23be2d79462@sysmocom.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 30 Oct 2026 16:56:03 -0300
X-Gm-Features: AclHuK8nz2fhAIaA4WaEFXGs3tupeo83iMGsKYDpCxI1QexmWx2PD0AAovnBrJQ
Message-ID: <CAOMZO5CHWpAVkdP9aPAcmTKybOKWUNXB0MdKhjaE2s+osqbn0A@mail.gmail.com>
Subject: Re: No network for SolidRun LX2160A Clearfog CX with kernel 6.12.113
To: Oliver Smith <osmith@sysmocom.de>
Cc: Vincent Jardin <vjardin@free.fr>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oliver,

On Fri, Oct 30, 2026 at 1:30=E2=80=AFPM Oliver Smith <osmith@sysmocom.de> w=
rote:

> Sorry, but this is not a development machine and I don't have physical
> access to it, only a serial console. I can run some checks, but building
> multiple kernels for bisect and booting them sounds too risky and time
> intense unfortunately.

I suggest reverting the 6.12 commit below:

commit 9a884fefd537e6a54aaaaa6d180d1f03f42baa8e
Author: Ioana Ciornei <ioana.ciornei@nxp.com>
Date:   Wed Apr 1 17:45:08 2026 +0300

    bus: fsl-mc: wait for the MC firmware to complete its boot

    [ Upstream commit 208858b1b48eba83d073542372329cf8ed606526 ]

    There are use cases in which the Management Complex firmware boot
    process is started by the bootloader which does not wait for the boot t=
o
    complete. This is mainly done in order to reduce the overall boot time
    of a DPAA2 based SoC.

    In this kind of circumstance, the fsl-mc bus driver needs to make sure
    that the MC firmware boot process is finished before proceeding to the
    usual operations such as interrogating the firmware to gather all
    existent DPAA2 objects, creating the fsl-mc devices on the bus etc.

    Add this kind of check early in the boot process of the fsl-mc bus and
    defer the probe in case the firmware is still in its boot process.

    Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
    Link: https://lore.kernel.org/r/20260401144508.3062019-1-ioana.ciornei@=
nxp.com
    Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
    Signed-off-by: Sasha Levin <sashal@kernel.org>
