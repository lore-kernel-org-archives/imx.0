Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794001838;
	b=IdV8ZhqxaaZBiAsxuDb4krU4/H1xhTlfg9uajH5BH4fLscDQ0EAxEyNAFqi4dV792hlO
	 ap/3Y2v5cXCf4xO32XRu+VyFNMglsH7j3hW6TGSAl4kLhLJ6xL888MdOS9sQMYG47dRGo
	 CnTPwgX4p2TKquKnF1CaHvHDigcddnXke1fNNB8mJVm63cTeC+LyCCLUjPJoX/LcIXKj8
	 NHBcrK8EX5abq0O8aUWe0D1wLupv3kPOafz5VP0yj+wXI1BstJlmbkZ7YK2fdDmaPhO1I
	 +FxULi1ANt9h+USGsHcgvI9uuYV3orDUvYeQ71jpa5q8tDypOFDrJg1wUGoON06pZ3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001838;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9VMfC8I6nKJ9wyyIhPU7jX06usQGGQZMUOUccm3Y4Kw=;
	b=F+r0OSkrKMThKFNviCvKptyGuSaK+doCneuA3eKGbWQ5mpsFSpOyeWEFieXz0f6TxGh+
	 kQQa16HRmjHT959yT3Zmk/LCZ7VEdMxAfbPGdZz+IJ46lZ/layJ8dbuVhGnW4bcnZT8uP
	 jzIfK6Y/+FJC/CKtpZW4Y4197WemYvlYKGr2Xlb+ZIlrCpc8nnWjCI73CkQsCneIJ+3LT
	 JYfmwmO5FYaET5jE2/I9EFgesqV+Ix7hKxoIi/fTeo25wZq3ASewi+0XP2I/uCQHtyIfX
	 XIETRwx8eQHcx6HK2mIduWut5DXoBKgW3Wxua/HWpsSL0mHAPJaLWCft0MgK5CjYtXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWqOb+Hq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F9F606A326
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 21:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWqOb+Hq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD53B1F008A3;
	Fri,  6 Nov 2026 21:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794001838;
	bh=9VMfC8I6nKJ9wyyIhPU7jX06usQGGQZMUOUccm3Y4Kw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SWqOb+HqTvFftvF2tNH1cRXiOuArCvPegKF3+4laNF9pNe1d2WAIoatDGVE3+QA3g
	 S4KSwhKiA2UdEWBAY2rJqp1YPK76n09aAWF/uo2lZ5YdXhE7HjJ90Ew+wAgUZE2vVF
	 MFHwusORlg4m0k8/K2TO9bImRLnAy8/34i5BMo2+fC10Cusgf+yo9KFz8G3FdwAGI8
	 4JpgebY+mHGkY18lee8tZhUs4cPaYqcivxO/UoJ4fZ/8tv8cMJrknEOqYJoFH83DhJ
	 15+Qk6gXAYHy44ABwd/96V8oBX/bcA/iXgmTCU8WIc1sdwlRUA1omfe/GU00/dosvt
	 awKkA98ht/Zgw==
Message-ID: <sashiko-outbox-202299@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] rapidio/tsi721: move dma_device from rio_mport to
 tsi721_device
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261106214132.4172049-1-Frank.Li@oss.nxp.com>
References: <20261106214132.4172049-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 21:50:37 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] rapidio/tsi721: build failure in struct tsi721_device when
  CONFIG_RAPIDIO_DMA_ENGINE=3Dn
--

commit 39ba91a98facae7b37c8dcc0ceb0e150ad9bee9a
Author: Frank Li <Frank.Li@nxp.com>

rapidio/tsi721: move dma_device from rio_mport to tsi721_device

This commit moves the embedded struct dma_device from struct rio_mport into
struct tsi721_device and replaces the mport member with a pointer.

> diff --git a/drivers/rapidio/devices/tsi721.h b/drivers/rapidio/devices/t=
si721.h
> index 4f996ce627254..2df3955581af3 100644
> --- a/drivers/rapidio/devices/tsi721.h
> +++ b/drivers/rapidio/devices/tsi721.h
> @@ -886,6 +886,7 @@ struct tsi721_device {
>  	u32		pw_discard_count;
> =20
>  	/* BDMA Engine */
> +	struct dma_device	dma;
>  	struct tsi721_bdma_maint mdma; /* Maintenance rd/wr request channel */
> =20
>  #ifdef CONFIG_RAPIDIO_DMA_ENGINE

[Severity: Medium]
Does embedding struct dma_device dma outside the #ifdef
CONFIG_RAPIDIO_DMA_ENGINE block break the build when
CONFIG_RAPIDIO_DMA_ENGINE is disabled?

include/linux/rio.h only includes linux/dmaengine.h when
CONFIG_RAPIDIO_DMA_ENGINE is enabled, and neither tsi721.c nor tsi721.h
includes it directly, so compiling drivers/rapidio/devices/tsi721.c fails
with an incomplete type error for field dma.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106214132.4172=
049-1-Frank.Li@oss.nxp.com?part=3D1
