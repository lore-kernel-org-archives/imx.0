Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939421;
	b=Agy2lmj9B8M8kM+U3xwRlPZdR3k8Cl9wNbLsX8K63uyLfp/mh6ruJMwdI2dr7uFvZ/yd
	 Y3BJYpkJn0UM/GBikZR8gnHL1sfqh3td2fFTjS/3bPsiMXTCoPAKc06uVttt5uEP4SyIh
	 Rtiy7zdUV510VAJNTWkE8/7VeFc8Vbh0m/g+YcVRizHh3xjyKtYqL8XCaIsqs42l9goPs
	 AnW6gKkJlUuTP24y58ySDDfWkgCDqhvSEZDRFllXaAVFOb5YAy3TbDZSMWcgy/Vma1SXU
	 YC7x9i53cjYFS37yKUUUNiPL50IOwP1BofYzsejm58K+rh2TLJHQly0/c6InyrpyUrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=;
	b=TW8noGDPLzK3XsbGMohstwDu2AuOA6kQcMfPcQayEHZLTBVxwmh7HS77Z1NdUsCFq3X/
	 UmQx+JWmZEQVh6TuxSwxUQiMmN7ZCf08DLGdo/ei7khPOBl9aVliE9j0OPkmQ11VCAtXt
	 ktsg58EyhamOhD2WrhqXtAwXHJE+h6tpcQse0CcKRA+G04vHnnil7Weu6aRuV0CJisHhN
	 0Cfo2xrvRin+qoCT2hqQAo4yNZp3P+GcsJaV55XEHu01ji/Ey6Oe3sgj6QLdFsPj1ofaG
	 Df3dJTCqNSTfIxu945gIS8moVAKfVYwgUAiPPua5+Tni6RjWY+RA3IvKLbd3FXRdzmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=IUFNsDeS;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24AE606A338
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 18:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24AE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=IUFNsDeS
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5364042eecfso1033661cf.2
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 10:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794939420; x=1795544220; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=;
        b=IUFNsDeSXqEXUtvv5J1fX+vK8nIjcBpw7etJ0QeiB5XKb88W76inRuv3k2Jko+IWBz
         SCvMe6AeV6KP/00dmG7biJ2o1WTLkD5jsiJnvG+1lNJjXcCmeddcSNT4pqHuYSvRMiC+
         NlNd3SiElxKVb3lukcRc0UQvAQLOY/sNneYWg37UM01ap5KmMJeYYApN4cSDpxDYZa4H
         93llk9TzQ/25jVxrktfENERHm7hFNlbjcTKrlE7iAeqEkY2ry5EsBWP6frf1tlz2zRa7
         Xtu7/ZPGa6QOMjGyCuj+a7XBs7F2+gTgstsBuWebfGaIiMGooWL1SXZVU+t1AY453bq9
         ndiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939420; x=1795544220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pepFJC4WupF41wk+cSidNw5vmFTw1POO1gRenleZ+aQ=;
        b=Q61uyERjqYsocbrWNEGMdmomJMlx3/8yuux2sfBAcKZY8Vt/4Dd/OOeYh7AiIU4978
         sOBGvllVzsZI8Mmnq15CfKCKRbK8C9ECQAAhR35AECNkaddAq7iPmNj7jWwHZmiIkdyG
         R+AwHKZrRl4y4QQ/NYjMpl/yH8yma8F/YqiUQWUtRB2IG1+VK18tF4XJmX5tokCWkMNf
         VXGqw0x48RPbflwvzZ6eYVxHEZcBPCS44ul8emiyoeLb3FCftUxCEB+b7yMfT2n3oGDp
         jWUrDU+quxfaabJYsi+xozspvYXd+sfFt1zzrq4iDiJ+eLXhx/+QW2Tc4P6A+vXK5q92
         lzHw==
X-Forwarded-Encrypted: i=1; AL+hErGAVBmbeutY69R1ni/uCPNVe1t3beh2viQFlubhWdKA/x3DilzCFNlbOIECM6qSl34+6Ho=@lists.linux.dev
X-Gm-Message-State: APuU4Z+rvCCN6kONnjXFOMOS1a9gLTtDhviJ7DlZDL9l+omgOFcMIonr
	4WV1kklhzE5qQSiADLHG2A+2XdqucfS6tTfgv/os+WZDtjyVlMcVxpa7aiq5hjYPIgE=
X-Gm-Gg: AYBFou0qypD1L0CXKkmIxp2jRGP/ZebUZm4FGgRxwjp4m1Db3wUj9ot01pTsPKVDvKP
	0kuED0ya/F2QPgS14h7m2pXS8fBk5RmUng9iSjk4bJm55Grj07H2fr79UO16Jaoehk/WujED8hA
	dU9fAO53fPzQf1YFVj5ICRFlCMgZYM0pZPzjLDtgBklVhgkKbzt0E5GsO6tyGpZb8e2bLGSBW3c
	472gVFwQvCqy9ICxyUDGa2NpstQf3+PsXpGfaJ6lOpXeKvGu+d5G31uFtBdUPf1Fn8LKEWCJmIR
	4VBlqu46B4EOQPR9r49wG1KYHQ/Jur6JBP0HPk6jvpawskyYvc/3IFfDfV4A5LplZ7bgrwN2stt
	CzI8IkWxK15BLtRW8/gtej0eLKrQXo5NzJ0Oh7xK6pwARhiMGLQs5CLYvcOJPkPmIWDaoKi9H08
	asMZDkXN3tGC9bzbxSB3rf+i6CzUb4f1tG+97QEqtUnQ4gjfB84KyN38cAqPsoFj1PS5BZ8l4Ak
	xafMaon0bwTZlxqAEQZ1EAtFLf2Cb9WAFtgMREwrg9SpLBY/OkdFou8yt/AmyPeCovNO6/oU8//
	6ByDoA==
X-Received: by 2002:a05:622a:1b10:b0:55c:3b4b:45 with SMTP id d75a77b69052e-55d5a538613mr1980541cf.24.1794939419724;
        Tue, 17 Nov 2026 10:16:59 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d5907ee6dsm2590361cf.19.2026.11.17.10.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:16:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTNjm-0000000D0qg-02mP;
	Tue, 17 Nov 2026 14:16:58 -0400
Date: Tue, 17 Nov 2026 14:16:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@linux.dev>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@kernel.org>,
	Larisa IIeana Grigore <larisa.grigore@nxp.com>, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/9] dmaengine: add DMA channel bus and fsl-edma
 per-channel IOMMU support
Message-ID: <20261117181657.GF2606445@ziepe.ca>
References: <20261112-edma-iommu-v3-v6-0-b038edb8ce6f@nxp.com>
 <20261116193021.GB2452510@ziepe.ca>
 <avwQl18smAW4R6ec@fedora>
 <20261117130005.GC2606445@ziepe.ca>
 <avxs_TU6FHn7MMx8@fedora>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avxs_TU6FHn7MMx8@fedora>

On Tue, Nov 17, 2026 at 11:04:29PM +0800, Peng Fan wrote:

> - Keep the DMA controller as one device and describe its channel Stream
>   IDs in the controller node (ordered list, no per-channel child nodes and
>   no requester-ID map).
> - Add a generic dmaengine/IOMMU mechanism that assigns one of those
>   Stream IDs to each dma_chan_dev, so the channel gets its own IOMMU
>   context/domain without inventing a DT device.

IMHO what you really need here is some way to get the DMA API for a
"PASID" combined with some way to convert SIDs in an iommus property
into a "PASID".

How exactly that looks, I'm, not sure, but you probably do need a
struct device to do DMA with as that is integral to how the DMA API
works.

If that is a real struct device or some proxy, I don't know. Long ago
there was some work on this topic and struct device per PASID seemed
to be the direction people were interested in.

> - Use the SMMUv3 shared-SID support (still under reviewing) for channels that
>   must share a SID.

If you get struct device handles for the SID then you don't need this
at all since you'd have exactly N handles with no overlap.

You don't need to force the struct devices you want to use in the DMA
channel's model to be exactly used as the DMA device..
 
> This keeps DT describing real hardware (the controller's SIDs) and moves
> the Linux-specific unbundling into the core instead of a per-driver
> binding. Each channel occupies 64KB MMIO region and works independently.
> With separate DT node, it will be easy for us to do channel device passthrough
> when using Xen hypervisor. Now moving away from this, the remaining question is
> how to expose a channel for Xen/per-channel passthrough without a per-channel
> DT node, seems I need to add some code in Xen hypervisor to support channel
> passthrough.

Normally you'd make a VFIO driver for this, especially if you have a
"PASID". You really care about Xen? It is so weird in this area?

> >Again, since this is the 3rd - 4th case like this, it seems like a
> >popular hardware choice and we should try to do better to make Linux
> >support if we can.
> 
> Yeah, I saw QCOM VPU case and thought child node usage was agreed from
> Krzysztof's reply. So I use same idea here.

It was but at that point it was the only one. Now there are two QCOM
ones, this and maybe another I forget.

Also, IIRC, it wasn't quite like this, the DT was supposed to create
real platform devices. This kernel creates struct devices and attaches
them to DT was the first idea that was pushed back on when it became
too complicated.

Jason
