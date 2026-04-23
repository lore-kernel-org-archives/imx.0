Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B431DDBF
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776957645; cv=none; b=YKPGN9XfEz+LwJ+icnjqQvjHCrT7gRdLsNu0NSRnHMuK3QEgDALm/EtK+3E1oNzbBq2y49u9fdlHVJMvVQEmNHGoRqCYU29Kqjf/EU37J3Vf0qqMs8IDP4atn5oree+Okhnb6UUVJzGTbl44UID2OVmjWsyeAV+ytIKqBdZcayY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776957645; c=relaxed/simple;
	bh=Braew1XveMAGlyFC2s/mzZ41yr7jUS4QWkO2xuBRjyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=D8n/TsXsVBDLskPMKNZcxwKasalEDD8tak4hK36coRmzW2m8ZlanjY+tLbLNXau6lJbiXLso3bwgJic80O445/tNa8v9G7vFfLXeFFUebyUQyUIU2hjzLC1FQGhkRZBVpIWdz8tTB2BA7h8xTcp7AX3k509CihuH8gOjmJi1qWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iw84djJy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iw84djJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776957643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iQf/P7hvHt9A1fs4c4DenfrxwjfBH28w3+BhoS4FuwU=;
	b=Iw84djJymNIk6+G3cRW7Q4xhD4jtMzvt0YeI6KS8xVLizLZD257++7PxemfwsDwWCcDOp3
	ekWT8agTwTndycj68bNsCm9AVjXs+qZaomvtoimiZT0o8UoawQ6YopeM/xC4A/FWSGqvp9
	e2d7cyHXkBzVjwAmqSHWf8Y43rvXVv4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-UOrtja1ZPpaSRy7wN1Jy3g-1; Thu, 23 Apr 2026 11:20:42 -0400
X-MC-Unique: UOrtja1ZPpaSRy7wN1Jy3g-1
X-Mimecast-MFC-AGG-ID: UOrtja1ZPpaSRy7wN1Jy3g_1776957641
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fcdd579e1so12990581cf.1
        for <imx@lists.linux.dev>; Thu, 23 Apr 2026 08:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957641; x=1777562441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQf/P7hvHt9A1fs4c4DenfrxwjfBH28w3+BhoS4FuwU=;
        b=cekMyNWXJBo1v40C0p1xHdXc2559JBgPb7DzsUTrlH3ldRI2jEHuT2NxFYvLPbP9Ex
         cqDOYVQy/sb5ZPHJXjwbFuDYCjDVPAvsv5ev+3YTYF83LOExPdTmYKznDN/MLS22U2O7
         9yG05jGxapjeFJ8ZGnAwFsIvmmTgAHgHDBDATpN+3ZPyFaliQk03OzLZgpiAcSz0cmj0
         uCpMzGSjM7RzsYx6A/w9a4yvvXqY0OUzUq4CcGvTo12xB/CwzyA+NE+99+pKEdMxs6wU
         mFYqnBgXNWEJDgA+c58EyyOo7EfxHsf7W5VgjlzxmQliRjoPhSyIcCUOKQJsIsrmocZb
         EfwQ==
X-Forwarded-Encrypted: i=1; AFNElJ91V9thDcOpoyTv6SUk2nv1aEjFjg6uzYs72FEnf0AqnORlptIZWQGOy8mgZ7qV+7ZHTzU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoEI6orqKWY1TcT0EGN9xoiG1FnrtFdRabcUfKaNW1B8hxsGQm
	nAE329P93C8EbMCpcow4rVmoJ/e6xDp2zenqf2beO4Qx39iCn+NxTXmpjx1xPeqYjmsrcB8EQpa
	MWoEmYA1v3JCRh53OZLcgfPT/dIqBgtPyMgl/3hj0GSn69baE8vcbkQ==
X-Gm-Gg: AeBDiesOM3S2Sz0UPAd2NMBs8umTIwJjVFpNG85GS3oVARLF97brezEg9eFn99i/ajH
	aLKg775YvE/QRm7NW2T43aok4zj2l3M0l24EX3LOPGS2bszvpBq37lLi2WhIOi20/afDouarW7C
	VFz4cDZ3QakpPbEhxQjIwZzmN0KFDTy4qtD7Jiv+DAnS7tOeF79t3QwiqQIsXM2aAFvlbcdnqKl
	LZ+NVJ+RwH3dP5m/2rGl6vlBSnsLz6UbDWbc0ts6fSJTk1kbDrvkbdOHwOMk+tw18X15rFPeGft
	aoMIfB6F2OUwDp6vvaTUWD7LQzta9dAptyeHsCTv/HgA5QEcacWxaGHLPlBYI3NG/23fnjBWBB4
	YJPfPZbBLb2lgnM3ZfK2f00YYdOBtIRpjmdSTvn/T8A==
X-Received: by 2002:a05:622a:1390:b0:50f:b076:43dd with SMTP id d75a77b69052e-50fb0764918mr197598111cf.36.1776957640955;
        Thu, 23 Apr 2026 08:20:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1390:b0:50f:b076:43dd with SMTP id d75a77b69052e-50fb0764918mr197597111cf.36.1776957640401;
        Thu, 23 Apr 2026 08:20:40 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e5f5cc439sm105170541cf.17.2026.04.23.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:20:39 -0700 (PDT)
Date: Thu, 23 Apr 2026 08:20:34 -0700
From: Jared Kangas <jkangas@redhat.com>
To: jan.petrous@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, vladimir.oltean@nxp.com,
	boon.khai.ng@altera.com
Subject: Re: [PATCH net-next v12 2/4] arm64: dts: s32: set Ethernet channel
 irqs
Message-ID: <aeo4wlrSinKUsdrZ@rh-jkangas-kernel>
References: <20260313-dwmac_multi_irq-v12-0-b5c9d0aa13d6@oss.nxp.com>
 <20260313-dwmac_multi_irq-v12-2-b5c9d0aa13d6@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260313-dwmac_multi_irq-v12-2-b5c9d0aa13d6@oss.nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NfktGVJVCUgUMMseqftdm_R7xZwKfZITMwTgJAGEYRw_1776957641
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 08:13:33AM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The GMAC Ethernet controller found on S32G2/S32G3 and S32R45
> contains up to 5 RX and 5 TX channels.
> It can operate in two interrupt modes:
> 
>   1) Sharing IRQ mode: only MAC IRQ line is used
>      for all channels.
> 
>   2) Multiple IRQ mode: every channel uses two IRQ lines,
>      one for RX and second for TX.
> 
> Specify all IRQ twins for all channels.
> 
> Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---

I missed that there was a net-next rebase and ended up sending a T-b to
v11 instead of here ([1], [2]), sorry about that.

To give more details on my testing around this specific patch since the
driver patch was merged: I configured RX queues 1-4 with
'snps,route-multi-broad' across several different boots and verified
that interrupts showed for all TX/RX channels in /proc/interrupts.

Tested-by: Jared Kangas <jkangas@redhat.com>

[1]: https://lore.kernel.org/all/aefX7Ajltzt5EqIR@rh-jkangas-kernel/
[2]: https://lore.kernel.org/all/aefY8WGCuNr4BQG4@rh-jkangas-kernel/

