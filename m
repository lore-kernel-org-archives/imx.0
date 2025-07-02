Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A54C24C06A
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 23:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751497493; cv=none; b=sqFgwDvZ4sJv1TNbMhGfwZGKwrVVIKAZVrwUxKkBRuS42wHJAeH0OrWSXMbWYusuojcChufPsHoNWTVRIN4WH443eKUXobbDo5TqCk4Sl4OXDs2guy23YKest5cZI7L1CPgxRq5tnyqOk6LWphIikru6uKsBUI+cjDOj07Y9ecs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751497493; c=relaxed/simple;
	bh=IMv4Ezb5f0WY6OCORhW7j27W9GPItKLfM5PXJBnfnLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkwRH8OM8PcpbrzV53ZdpSlHvj3u723jR/AmWB2plGU7QDI8h7Z2ZaKw2nvecyyGUHFOV/wyRT5+rbZ0+zQQ8n9AO1X5LyTzaJoCjsks4t2mDLmiVzEP49XyA/ZatHsvnjRv4de7f9ASKgB/hXBBjz6qSv8UDk/WTGxfZGYSSkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OjZ6hR8U; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OjZ6hR8U"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b3226307787so3793664a12.1
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751497492; x=1752102292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bx4WaXEvD5xkEryT7lxX9d80zSIO5EP0Y+0rVZMvvko=;
        b=OjZ6hR8ULcoeP/ybF63aIlPA428XcxiG8XIGhTM1ZQHYFEdIc7lcic67LV/nNo8hPi
         QhfSkkWoN2NKnp7Bgz8+r/TxI7yzQDZ77P74vFMrXrvcWb1InXe1J0Kam93dujwi//ue
         ZTFD0mY4a0wMG8os6ATVeocwCwttxz7XR2F0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751497492; x=1752102292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx4WaXEvD5xkEryT7lxX9d80zSIO5EP0Y+0rVZMvvko=;
        b=TTqLdr+A02XO6lzdNCy8FmF5XA6fzTzluujwZYuJ1zOnak7hFDhpJ9GavRB1hMAuba
         fyyn3CQt1IPC7UqbhhmtMUBxb769Ylna+B9bdBQM3CnXG4Biodp3BEozOHAkyKUd8BtJ
         lUT7u2v5g4mr4i4aGLB50yrk0HH4Frg1mC1Wj5aG7dPTE/Uu7gQcWG126/XkQ18lWklE
         JySw4gHiCqj8gSq1kU3kWN1Ue+yfzjhY6l5j8pgqbrVrkU6yeaZgv6Zfyb7+JfjQ3ea3
         oF2CmObs9NNrdfgMDyNwSwhRRDmPg3dt8NwQ/rQuqcNuRcADd8SKJ9OyCRl6GylN0ab0
         32xw==
X-Forwarded-Encrypted: i=1; AJvYcCWzp0YAmIr+nsQRxoLyQV1ax1rASUCRTeWbp2e8F/XwrNFoM61+QeQrSR3471gIwjYm71g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoAQZI8vTb1my8DVJ+sgLFXkNjk526eS2MsBLgU8slkE4y6+Fs
	HFPyyaaMyext1gbyy7HKww6orgWr/IwoUW8QYkGi0cpbyjqGC0cSMjk1X+SJOz85gA==
X-Gm-Gg: ASbGncunwZ1ugmNCbhripPrzsAQi2yUXJrek/uejjqPnC4IGe4751E/AF4ndaPB67C/
	pk4Px0qYOyTSuwaRRY2KCNAMgH+ZRv03KenPP3dXoMODG9zgS5O2Ljh6FDBjnlsKx6rbewQT05u
	eZKm8Np/mh10DTJVFSUcmClCoqqk+biigFTi5npEJj6DnU/jHhHYU8AOkYHi1woZgSBZAn6QnDa
	KAI71jcoXZc0Q2B9qH0vt0VqUVww77hjs+WjnW88xZRBVPCj2veyNCluvTx2XLIe+gFKwIjF4/c
	h1e+j/5EtP1mRnRYvSDPOxlEXLZ0pKlltWbjTpkENCC228EIBWaBLFrPzpsNTai8bfBt7uEa/ft
	VvO6w0wv/egPMuUMWPjP5t68=
X-Google-Smtp-Source: AGHT+IFhH3mmXTu0dRC1SKOttV24IRzD6AP2asUl8wAduYaCcQfRJ9VxViud0WL82yyv30ah36Lt1w==
X-Received: by 2002:a17:90b:264a:b0:313:dcf4:37bc with SMTP id 98e67ed59e1d1-31a90c17cd6mr6040506a91.34.1751497491705;
        Wed, 02 Jul 2025 16:04:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:a88f:fae1:55b0:d25])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31a9ccf8711sm694817a91.27.2025.07.02.16.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 16:04:50 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:04:46 -0700
From: Brian Norris <briannorris@chromium.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Rob Herring <robh+dt@kernel.org>, imx@lists.linux.dev,
	linux-pci@vger.kernel.org
Subject: Re: Does dwc/pci-layerscape.c support AER?
Message-ID: <aGW7DgTwQwgZayQW@google.com>
References: <20250702223841.GA1905230@bhelgaas>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702223841.GA1905230@bhelgaas>

Hi Bjorn,

I'm not so familiar with layerscape, but I'm familiar with parts of
this:

On Wed, Jul 02, 2025 at 05:38:41PM -0500, Bjorn Helgaas wrote:
> I see "aer" mentioned in layerscape DT 'interrupt-names':
> 
>   $ git grep "interrupt-names.*aer" Documentation/devicetree/bindings/pci/ arch
>   Documentation/devicetree/bindings/pci/fsl,layerscape-pcie.yaml: interrupt-names = "aer";
>   arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi: interrupt-names = "pme", "aer";
>   arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi: interrupt-names = "pme", "aer";
>   arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi: interrupt-names = "pme", "aer";
>   ...

NB: in fsl-ls1012a.dtsi at least, the &pcie1 node has 'msi-parent =
<&msi>' that points at a 'fsl,ls1012a-msi'-compatible irqchip. I expect
that's how MSIs are getting resolved, and so that's likely how portdrv
gets its PME IRQ to enable AER among other things.

I think the other SoCs you point at above do something similar, or with
GIC ITS.

> 
> But I don't know whether or how these are connected to the AER driver
> (drivers/pci/pcie/aer.c).
> 
> Does the AER driver actually work on these platforms?
> 
> Is there some magic that connects the 'interrupt-names'/'interrupts'
> DT properties to the pcie_device.irq that aer_probe() requests and
> hooks up with the aer_irq() handler?

I think you're right to notice the disconnect. I believe a typical DWC
implementation does not actually route the root port's PME/AER through
its MSI line, so many SoCs will have a dedicated platform IRQ for them
instead -- but I also don't know of any that actually hook those
platform IRQs up to the AER driver properly [1]. If they want AER, they
do something like commit ("9c4cd0aef259 arm64: dts: qcom: x1e80100:
enable GICv3 ITS for PCIe").

Brian

[1] Although I've seen some try to abuse interrupt-map to pretend that
    their platform-AER interrupt is actually an INTx source... But that
    breaks actually INTx support.
