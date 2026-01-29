Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A45137E2F7
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680429; cv=pass; b=PJtdhzwIzePpMgtcz/V6nv5oE83dtV5tW3Mt6kk2KXcZ/kv5uQ9T5d3x/j7HBdgVgniOFQs5FmBPXtMSicCnswySvJ3XwT+hWmgB4fm4OKZc21G93D+AaMkLPxZSk1ueiU2DxcJhuWgO4QvPn8fZ2NXCwlZh8usILXLaqVoapJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680429; c=relaxed/simple;
	bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRwN8Oxx1t+XJW6UZmVaf08vA5ZmVVVR2whrvSIKEJOuDxUo1m8gB+guRzO9kR+aKfx5HtO90GDOyZpFDhnnUXG4hFOqJ3KaXtE8q96VMqCNrwtUXigoo6cStFrsz/Auht+VhpwiBXVZzB6l7diYSN4PCWCmVDMhEKzP8kwfcYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ignc/o4Z; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ignc/o4Z"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so7131335ad.2
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 01:53:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769680427; cv=none;
        d=google.com; s=arc-20240605;
        b=YbH3FtzcuRT2/01DtaNMR29jzoZq4MO7/YaKmna7lT9gkQg6+gozNfWa0c/QQAUsxF
         5BNjgzMTWOV6X2k1ZMa6tyxnGOcCaFdPrT9xot02Xq3GgYRn60ZjxT+ExexnP+EeeniM
         OTd5DBHGejrJV/3/w6p8fPifKDZWVducJlm5pzz+qbBd0R2leC3ZamcYreQOo6i1MgUI
         fs+TxeOxbIhseeXJ5QxnLXeZFcg3z8dNxbxyE/SDx3CWLksdH3Rs6z5RaY9UYPSBQxJl
         UujWtdwl42/N/B3G7BZkOQTCSOvvW7PZ/0mxe1+HSEnSsKQOr/fK20n9cjq3Xej+L04g
         Af0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        fh=UHr6/B09/cjYChNhHUePUe7c1qEk6AAPPxm03ctVcso=;
        b=SijCQw78vS//nJ9PkYaKwhnCwDqBoFxfmMdf9O6D6RuqIWWYl85fwcfPwlPa6GX9kC
         yJtj5vKKfPzJ+ok+kgXdCa6ALVGnMTqS2Uxrz3YNf3xW0YPNV69UhAKH9L5CojJGAkOY
         +NhAqFSPUV6i+XvtUM17HHPOvXjXujeJoI2HXiM0QXWSAc3skuWkA0SzbLhsUliPbc32
         pcHY5ajniKUXHEmghN3Z6phwZq4MXtUkiZSk5sfdrex84b46mKd0v4np9gYUeMa3pm5M
         sxZLv4NdAdQXRimD3kaj4w49nYYTi8xbaALNVWVS9BXfBcGD6klpfKmTCaYGe6hsqg68
         VsbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769680427; x=1770285227; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        b=Ignc/o4ZYHCA3DPUkyCC+iSlB84Tq1j6u0Eif+Tbvq2L2e1ebs0zslZhjAJUldVrTC
         xjP/d3hb9/1rLQCbvfaCLjvRdG9Cf+uc+ftXEWCJwADWotC4Bt2bJFDGKCbtxQ+ge/PA
         I8/cP7Kgsd4I0e8wU0IY3PkK2rl9owFiOJPZaVA4f8R1z1kKQARkmIyk2G7q8Hw0vrdr
         E23/QLWVLvdOtSVtRkkq01FPvJ8Nwyik2bp+kCK5ptYIigsZyy/TMmJMLCyeZJgkSzXC
         UucNigdDgplG8feCSvfnWnwVNHU0wDe+uOchz8cBQfIH9ObgKb/nSFFuqKiIH9Q7D9Ls
         UGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769680427; x=1770285227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        b=qOOv6re9k6z3yWt1TiMeTw85IoQIMbmjSngImt4M9j8D2kmbEw3i0Y2duFyILijU9s
         XmvBB/PwSWy4b6pC5z/OpeuSXOk5rohCgBMQi9UBgFIR86xTI3IJIavxf04eSRlI2LOP
         VSfwpM7mzGRp9Lgv5hjly9tIXkFM0WhAVx5ESE+3AkLIAfS50cvfNt/7cDEfMZRwiLX6
         6rEYZzjPj5gzKjNXYjDHxn4U0PiN/sGOepe0PVOb20H0f5ee+VxuHRkmPZkAjg+Qb7HD
         GkQvEHujEqjclpGXiIcQyEYm5Va6L7XWQ9b0slzmbZItfxOSDgChRs+L+e0z54AyBeeQ
         05oA==
X-Forwarded-Encrypted: i=1; AJvYcCXWpPu2K8cTYCZn+1SE40+g96ANqTvVttz18on1cwa/qyS1bCk4d6yP2jvepi3EZ/tNP9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaoVSti4wDkZ45uUiMc/61STOCmZ+p2NXt1Dk3yAuttUqGOR9N
	XoMmnP2w4VWb+jlJMQp8VKs9AXMH6j5D+J6+3xPn7g0E4onmWSU7Ect2IouD1yIdiPqUCuSZRkn
	9RkCYzDgMWv7YtBMjvFF9J75rfYYDeQI=
X-Gm-Gg: AZuq6aLRWBcr184Z9Po8cewC2923u6bc3x++TMzhQyoFOhdpiMx64gdx+54ychXmKaF
	zLSR+W4bhbYjt83s2Dy9H9m2ZiAX7zdYn7D/Nkb9qZItr3fY4W4HfTcw+LBFf0i8nv1NvFTK38B
	jJnHl/GpKCMowIoq0m3IRVYGdVAlVyR11o13LpncKOVN0sXH7voM3s1U9iv+AxoknykQ8aQTSsU
	5zSeQTMPU2ZDeoSLjSi9rJfh6AMempfkdaK34uhwa7/Ipxo48UQPYpRIPeo63GHadfrUk8=
X-Received: by 2002:a17:903:40ca:b0:2a1:5d2:2e45 with SMTP id
 d9443c01a7336-2a870e7dbf0mr74134655ad.59.1769680426799; Thu, 29 Jan 2026
 01:53:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-3-shengjiu.wang@nxp.com> <36309f30-8b83-4eaa-842e-c663edd8a439@oss.nxp.com>
In-Reply-To: <36309f30-8b83-4eaa-842e-c663edd8a439@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 17:53:34 +0800
X-Gm-Features: AZwV_QhJaxBDlnFwwTXJVH6oDtpo891knd-s55tPdoqjkrrPNspPNZy-5Dfzq3s
Message-ID: <CAA+D8AP==mteo7ucx=R4eyPw+DpBUtzC7H1++_iZBMN1kkPJsA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 5:17=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 1/28/26 09:18, Shengjiu Wang wrote:
>
> Add a compatible string and clock mapping table to support ASRC on the
> i.MX952 platform.
>
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> So need to trigger asrc before dma on i.MX952, and add delay to wait
> output data is generated then start the EDMA for output, otherwise the
> m2m function has noise issues.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> This patch does more than one logical change.
>
> I would split in two patches:
>
> - 1) introduce functionality to start ASRC before DMA.
>
> - 2) add imx952 support including clk_map and introduce fsl_asrc_imx952_d=
ata

Ok, will separate them.

best regards
Shengjiu Wang
>
> Thanks,
>
> Daniel.
>
>
