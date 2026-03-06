Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEF936C5A0
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 04:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772770517; cv=pass; b=ZL12Mxf2wflxX0DrYAkkgNQ7hu/44DMsUFoh3oYVnWslJ5Se7AFeIfGl9vsvfBqGKIsXpwZBXq+3wPMV1ZpuZ0uFHGJT2d271iVHkQea20uNb2CS3eK5Br0WWX5fNj4Eh8t4eTf52D3kSR2wZ5DRsmA5VWz0eYDGfCksEvmY/Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772770517; c=relaxed/simple;
	bh=nFIzFCEGdHvUoDkDKio798vd3KSOQ+BKfInvObQxhB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FooNf9ZsvBXdUyYI0dUxUk1HwpdOfgVeCpdnJSkNZYMI7fkyybcKLX32hWXsq5++3P9CLntKRTLyYYpyIDh4BvLN1p3Q23ce7XzGhuWouVhVIpwrOsg5Zn1sF7p3he5alzkBr2Py6XTKxLhcVRt1ffTaL8ODnwn0jNJWk+JEII4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQcnkjI3; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQcnkjI3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9431300833so13450766b.0
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 20:15:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772770510; cv=none;
        d=google.com; s=arc-20240605;
        b=Ndp3CpHhDER35hpGYLKJiTP0Z62oNHhyIw3Hc+RAQCJankQoSLsqEvLmNkDW93eG9L
         n8cT+b7JCbpYG+oHEuGiVUkufluVOu/jZwEbhc8ONw4RzTRHhkNou+6erDpqQkaSb93m
         KRxyEh2LEgsoygPlPILhCffliLtKZD6XuBvQNmbGCQXbH06pxJBpDDJFO2dAOd0CCGmz
         XFL/JkuGm7anHPv5iZ7Uzl+ylN7Ic9y5IBbG0pGyCvHYsOeTtXF85Bw47wfOIUVKGt67
         Go78W2dDsYhALYLXKao+gNYpJr1k9FBI0uSVmBYAMKqpzCBxfExOxc78StNwzXTm9x9X
         pHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        fh=KbL635/G7lMOCwU/6xtMo0AIf4/P+LdGgfc8K+IIZXQ=;
        b=a15aLCT3VDHfRUY1PE6j5iLipylEeobog2p7hv6MchsbIjKTtwpfsidBCBXGvOUk+I
         Et2avDzuqAvv8spVMO33lt3dZZLfQaGbUCHl8btcdOjDWbxnvcE+aBNGDjsoi9ozmfyB
         HhldptzV0NkcsaLudgGLFoixc4iwJD1alwHLytVJcjOogKWkW33SMx9u5k7sfLsxjCFw
         7uoYNZxW8klgSFrzXRM5vota7i882Xqi3FoUxMBw9Fj0ZiB98D2D2Gh6/xEBOsu+jNFh
         nzws+6UYDCjjHtmFrZ3s2alaN6BNq27/kGM4Fr3uud75COiIqnMe6D+UgBlbr4KIZgFQ
         49Dw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772770510; x=1773375310; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=aQcnkjI3rpyman3+SFK5yhwOKKSfv8MSmiSGq5viBXP7/TR2nS89ImGedzd4T5TyQR
         WXSsh+UstN/Uu9B+raI2bDulo50p9SpdShO9W0CMRafn3yBk76txWe4DD9dyEcW4/pUB
         kQfjAtRbMGfVXiQm39JX5aEH30O7ugNZtoUmLOB8zdnmu4cwkHMEVs9DNfVK5wjJSs6M
         zMVIpja0hUDcJu7Amqpmbmy+XNN0UpfbLr0sKOPLftV17WYP3omFFT4QHMj0QaEa7t70
         9iqcY5246erBdkAlZL2TaT4V58I2z8RslP7nkkyjWG3Bu+rowutp6zMebuKYTfi+DLJY
         g2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772770510; x=1773375310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caYlw5uZFtDTjdpuJpoLZkB8qzJjrGN/QTXEgHQCJYY=;
        b=FJc8jVUK/UqykRSaqPoPojLjhfJPN1sQiSzgcnieAPodsOLr4ApxuIlhNz5b+95fkN
         l+rvMPQhSz+OBNAkVajKAqXMHko9w92awoqpnPAGdD/+L4elQhYIowYB+6r2jtOSBXgs
         covVNdO97ZueOLevJGlWJdrKgAaKLXj9TE/vOoZmmOMZLi7k2dAhw6CEdXHrgvWERQGh
         +Pc7sAfCxVFd1d1o64cepfEV+QhAt7XBvGqZ71JAGNQmvlsNc7gG3zh+CRtaRrqIfrBL
         LmnbezPhEElUvdzy7kZvkI9t/BYmzMiie3+54W0H8M8q2rdEU6C9OEqY87v/OT5naWQW
         4tAw==
X-Forwarded-Encrypted: i=1; AJvYcCV7bc0MDO0BzCQegBvnYgvEv28ogxSMXrVHzQzY/BLfJkpc1kZuyUnGQyUhjt5OgaBs9ts=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7J2AGs7Trf1fYs9noz/Ms8XHb4ohgcog2W63pS6CQbkfoirfA
	PcWx1eWo4XK5IArMHfONGEfJImhXj7TTtF/KpezEBwY5lMydAdg/CLS8a6DEMg6vbsJlR9Q+b3r
	8sYH+CLbKHXJN4mfW4WipNzDnPtuGCQs=
X-Gm-Gg: ATEYQzzBLmNtEBUF5Gwl5vUOLRTD3UGnzvvjF6QRNVRAcqABULiO7IUgULKFJhrDlYy
	R8uNpVQfHBrEq1C+VwjL63nI7blLc3y7x4/8V8/2vq0BQx2G9gp+X4M6FHlCk/dPl9SK8imsN7l
	420JNDuigX5U4N/AFqbbYkAGHWBTgkPNJeJcfak0kvlAgLmlgBN4eplGJSdvpLM/gKb1WwAVYIc
	4m4b/xBoGDkYZlCEpTclIj7i97C/uLXvaPI4G2zHnjpktZEZhhjyLQxbKzeJihVwoh5/uxQN3Rr
	qVnSug==
X-Received: by 2002:a17:907:6d02:b0:b93:6bfe:d556 with SMTP id
 a640c23a62f3a-b942db8682dmr33539966b.7.1772770510037; Thu, 05 Mar 2026
 20:15:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260304140329.7089-1-linux.amoon@gmail.com> <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA5PR01MB125008C876FC8461A80514DE8FE7DA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 6 Mar 2026 09:44:53 +0530
X-Gm-Features: AaiRm51D8WbPwjbtXZGUsnsbSyyBH4WmUaM2xaSBTKwsUjOwhQr-zWi1-hyOtG4
Message-ID: <CANAwSgQ8eKV4jyxGeva_2aT98sPW=44Q9J5PxMgJ-bs3XdwrkA@mail.gmail.com>
Subject: Re: [RFC v1 00/18] PCI: Enable async probe by default
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Chocron <jonnyc@amazon.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Paul Walmsley <pjw@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Xiaowei Song <songxiaowei@hisilicon.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Niklas Cassel <cassel@kernel.org>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>, 
	Koichiro Den <den@valinux.co.jp>, Hans Zhang <18255117159@163.com>, 
	Sai Krishna Musham <sai.krishna.musham@amd.com>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, Vidya Sagar <vidyas@nvidia.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:PCI DRIVER FOR SAMSUNG EXYNOS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <imx@lists.linux.dev>, 
	"open list:PCIE DRIVER FOR AMLOGIC MESON" <linux-amlogic@lists.infradead.org>, 
	"open list:PCIE DRIVER FOR AXIS ARTPEC" <linux-arm-kernel@axis.com>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:SIFIVE DRIVERS:Keyword:fu [57] 40" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Chen,

On Thu, 5 Mar 2026 at 05:57, Chen Wang <unicorn_wang@outlook.com> wrote:
>
> Hello Anand,
>
> On 3/4/2026 9:51 PM, Anand Moon wrote:
> > Following recent asynchronous probing updates to the Rockchip PCIe
> > controller, this change enables default async probe functionality for
> > all DesignWare Core (DWC) based controllers to optimize boot times [0].
> >
> > [0] https://lore.kernel.org/all/20260226101032.1042-1-linux.amoon@gmail.com/
> >
> > This PROBE_PREFER_ASYNCHRONOUS flag help to parallelize device initialization.
> >
> > Thanks
> > -Anand
> >
> > Anand Moon (18):
> >    PCI: al: Allow asynchronous probing for background link training
> >    PCI: amd-mdb: Allow asynchronous probing for background link training
> >    PCI: armada8x: Allow asynchronous probing for background link training
> >    PCI: artpec6: Allow asynchronous probing for background link training
> >    PCI: bt1: Allow asynchronous probing for background link training
> >    PCI: dra7xx: Allow asynchronous probing for background link training
> >    PCI: exynos: Allow asynchronous probing for background link training
> >    PCI: fu740: Allow asynchronous probing for background link training
> >    PCI: intel-gw: Allow asynchronous probing for background link training
> >    PCI: keystone: Allow asynchronous probing for background link training
> >    PCI: keembay: Allow asynchronous probing for background link training
> >    PCI: kirin: Allow asynchronous probing for background link training
> >    PCI: layerscape: Allow asynchronous probing for background link
> >      training
> >    PCI: meson: Allow asynchronous probing for background link training
> >    PCI: sophgo: Allow asynchronous probing for background link training
> >    PCI: tegra194: Allow asynchronous probing for background link training
> >    PCI: uniphier: Allow asynchronous probing for background link training
> >    PCI: visconti: Allow asynchronous probing for background link training
> >
> >   drivers/pci/controller/dwc/pci-dra7xx.c     | 1 +
> >   drivers/pci/controller/dwc/pci-exynos.c     | 1 +
> >   drivers/pci/controller/dwc/pci-keystone.c   | 1 +
> >   drivers/pci/controller/dwc/pci-layerscape.c | 1 +
> >   drivers/pci/controller/dwc/pci-meson.c      | 1 +
> >   drivers/pci/controller/dwc/pcie-al.c        | 1 +
> >   drivers/pci/controller/dwc/pcie-amd-mdb.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-armada8k.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-artpec6.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-bt1.c       | 1 +
> >   drivers/pci/controller/dwc/pcie-fu740.c     | 7 ++++---
> >   drivers/pci/controller/dwc/pcie-intel-gw.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-keembay.c   | 1 +
> >   drivers/pci/controller/dwc/pcie-kirin.c     | 1 +
> >   drivers/pci/controller/dwc/pcie-sophgo.c    | 1 +
> >   drivers/pci/controller/dwc/pcie-tegra194.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-uniphier.c  | 1 +
> >   drivers/pci/controller/dwc/pcie-visconti.c  | 1 +
> >   18 files changed, 21 insertions(+), 3 deletions(-)
> >
> >
> > base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
>
> Suggest you indicate in the title of the cover letter for the next patch
> that this patchset is only related to dwc.
>
Thanks, If I get positive feedback I will append dwc in the $subject.
> Thanks,
>
> Chen
>
Thanks
-Anand
