Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068FB5B5D6
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052986; cv=none; b=SIojs6Xp/k5W4xOMslR2CkqlV6+ZQ1NhNG2kvDlrzAmMSE/skF/BReP/UYTPgyeAu4vkqrO6/0MGZUFXeIITDeRuOGI6+AyCLAZtE4tICvkH3VjpqX+Hipa4qPfFvS3uRawtEnQt0ct/dG2kOmkwPYzkrJiiieURyzUTfqobl7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052986; c=relaxed/simple;
	bh=uzac7wtIrnnrBvtOLPs8xaD+ikoHcCxqEerEJoMcBFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jSgveFIfu9orp9RXXglTwqFeqfCO3WFyHK2guOMwc9VrEf/jkpGY1A8Muiq7ST+QLPLuccUdpVvTaoWWN2Mwg8my+l8qiq+E94vmWH1aszsXeOBxxNYRezoDjtenIIzzh9rXA38G5uNb+Ul6vvdRGs1wJWHDIvf25fiiC/ZWLGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZiiZAHRh; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZiiZAHRh"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso4576658276.3
        for <imx@lists.linux.dev>; Tue, 02 Apr 2024 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712052982; x=1712657782; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uzac7wtIrnnrBvtOLPs8xaD+ikoHcCxqEerEJoMcBFs=;
        b=ZiiZAHRhwtcSgxTB/tXxP7iw5yibr8flu2COZgBYM3CWmjlxlmqdzsB3AHcWetOtFy
         Eu+zYIPGbjl2ulJH+BVje7SE8+M4PTXYHnKaC7SAtF1wEtnYMOwe+/bdFHm758kpMSxM
         BVlZnKOU8m8/CY0nNgbyXMCx8Rn80sBbWJa5YzqyWeqGJu5NWuK3eVYYOnQ1yLeRaNyC
         b9cxS+Bn18PVgyv0QM+bP3HdU0gdR9r58C2pcJRTAbn8BoQPb4RIXwFFTC/h2wLN69yH
         Xm5CiHVyjWEpjfZ5XCsiCW0vHeBtLwuErmG11jm3OjQIEAI8PCJGThmR6hDXidw5+EJV
         PY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052982; x=1712657782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzac7wtIrnnrBvtOLPs8xaD+ikoHcCxqEerEJoMcBFs=;
        b=msj49F8FF2uEie3LNTxcpfinyrDWEy1lu7A/xqLyM7eLMXtMT/PS3lN0na0WE3aJjs
         XaMp4DPpB3gJ/lwJ2B4EZD7ZY6I8VplVq1nPptsj9aJ/APS/YVQIv6wfoaidi7TCSxrZ
         c4L1nVPLe3/ZOLl25Og+ROLkCqpLMGsIoruK3Om3YJQsbUAQUjzakgfJD8A3z0IM8HiZ
         bmqI1xZ42O1Bsu7YFFtbWQkr2Wb7a1Eqy8H6qe/Y4t8vtR0k3rUZT38allkNwNIYJUx0
         /kHJU0rD1iEEqSKazt56Ea6as/nELBCgdDG8C9CHWQkvtyuyOLp/lD0hsQ5oDb2S29ka
         qDSw==
X-Forwarded-Encrypted: i=1; AJvYcCWNjGbJftmV0Mhf/tLuArVE7tDxVkIiSpyhTJ6cG42Q5TqNfHDEG0iWBe+kAeXhW+4b//3U8ayMqvtdKHX7WAZ9uSAk
X-Gm-Message-State: AOJu0YzXYzaPftnUxC302coMfTL/Rf2+iVAOz4VO156RA0YpBcCroB05
	X5/+N8P8tVAMfBgIKlolFrkmYWjNFvTCCnbpAhDJJec1gzWPeGmdyPEzv4CiwlcubEe4ZFE2C0M
	r2d/UDfjE6/0YAqoXJahLkbFmnLNWg/FKFpXPqg==
X-Google-Smtp-Source: AGHT+IHzjYx5u+Am4EzQhN6aMsFTdxF/7ehGqP9AXe12JTbN0HclFOy9oE6Q1Tva+ZRKMaaQSSepEoCeBcfLH2AuW+A=
X-Received: by 2002:a25:b191:0:b0:dcd:b034:b504 with SMTP id
 h17-20020a25b191000000b00dcdb034b504mr9487652ybj.27.1712052982018; Tue, 02
 Apr 2024 03:16:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com> <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
 <ZgWZDtNU4tCwqyeu@slm.duckdns.org>
In-Reply-To: <ZgWZDtNU4tCwqyeu@slm.duckdns.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Apr 2024 12:15:45 +0200
Message-ID: <CAPDyKFp5KET0HR+8MwO4cf0O6W2kyFqHoKcVf5jbgBuLuQUcFA@mail.gmail.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Tejun Heo <tj@kernel.org>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, 
	jh80.chung@samsung.com, oakad@yahoo.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, brucechang@via.com.tw, HaraldWelte@viatech.com, 
	pierre@ossman.eu, duncan.sands@free.fr, stern@rowland.harvard.edu, 
	oneukum@suse.com, openipmi-developer@lists.sourceforge.net, 
	dmaengine@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 17:21, Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Thu, Mar 28, 2024 at 01:53:25PM +0100, Ulf Hansson wrote:
> > At this point we have suggested to drivers to switch to use threaded
> > irq handlers (and regular work queues if needed too). That said,
> > what's the benefit of using the BH work queue?
>
> BH workqueues should behave about the same as tasklets which have more
> limited interface and is subtly broken in an expensive-to-fix way (around
> freeing in-flight work item), so the plan is to replace tasklets with BH
> workqueues and remove tasklets from the kernel.

Seems like a good approach!

>
> The [dis]advantages of BH workqueues over threaded IRQs or regular threaded
> workqueues are the same as when you compare them to tasklets. No thread
> switching overhead, so latencies will be a bit tighter. Wheteher that
> actually matters really depends on the use case. Here, the biggest advantage
> is that it's mostly interchangeable with tasklets and can thus be swapped
> easily.

Right, thanks for clarifying!

However, the main question is then - if/when it makes sense to use the
BH workqueue for an mmc host driver. Unless there are some HW
limitations, a threaded irq handler should be sufficient, I think.

That said, moving to threaded irq handlers is a different topic and
doesn't prevent us from moving to BH workqueues as it seems like a
step in the right direction.

Kind regards
Uffe
