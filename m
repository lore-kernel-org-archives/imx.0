Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DAE30C34E
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769758062; cv=pass; b=XCCtBrhSUcqRfu9DUrGZs9J5TsyJMYS+48P/HdKvLr2I9+fS2tL9HzTgnUtr8NhDvFHRShyvM3PLspoReEDDXnf8qwnql2vV0xHllxD689bPU7n5BFCEdpRPUijXqP98CUJLYppuLCYoehNvCyllUDq9HvNf3AwPFto4OLfUWf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769758062; c=relaxed/simple;
	bh=phbd8D5r3XvJehy2gum6zA4CTU/Osysv5H5RyZZe9gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TwLdzFKHCd/9S3+tKbhvCxWxx+QA72dzDVVbd0JbPl3VlPIc+8WHMqT/rB9u3O1JoPeGq2kHqMkhnUWiATOuyM2zVBYWc08eQDAjcyOSD64vmJCaqfsiKChRCKtjvqhV1GTB/2UbouoBNHxfyPOubA7Pwh808o3dkcwBLr14dHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fh5gs2mO; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fh5gs2mO"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2712894eec.1
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 23:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769758061; cv=none;
        d=google.com; s=arc-20240605;
        b=DVxzSfyWuT42qaI8hZMoz63oy1QiZBHoO8/OZgeJREjbAxOmPlFL5ybrr0cEdN/JVs
         c4Y/bf6nJKske6ZnsweDOQW8b7H+ARzS3loqXbyf1mT1bEGwejMvmCNlXtXLaJh7RtYL
         9+VuNQ1GdcmAHVhQ30DE63ADHWlUOynU/e1pLpAN5NxldNpedEOqIXkhXQ2f6fqx5Spe
         WIh8bxughpvWMGBinKf5uzoVATlXhn2fS21zagmXGcmVRiXGZjHiA0PNspUq62A8o+an
         vkr2BpNRcbQrqYAg0nSdrhJpGxRjYZJfnY7EvhB6sHOzg6eLDBUtQNdRbqB6UFaZePhy
         JSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        fh=y3IUjJNNAcsVlcNmusaNpBGSb3cXG/tCSY4UmvXmY8M=;
        b=ZZJXO9s47VYlIET6uUo8m+9n4CLrl1OtW9yznYZfON46cBCl9CSvpqUZYQ3FGUvP+m
         p+euvzDdC77GrhZLaly+dQLqK/ukpZmncIk8ZQAzlusTGfoYc50lWILVpDKmHq0aZusc
         oQJfwOqCGoRBlGQAzVQV+bvVZXvgBXaoLw51S2bEx8FqhNNZe2gkbPicChr1OZjVbji6
         j4Dnxt1Q8UCB3CjnBSvnp61/22e8VEPxDrKBjIChLL+FFtuCMTRA90kwCw3PTlLPL/Lm
         u4JuJkpmjFp2y7vI51P2TetG7J2afGoYb3q1KEXWvpVHWa61Xm0ATOaOw+mWCFdxvY8q
         UZyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769758061; x=1770362861; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        b=fh5gs2mOefhKtu/aNX/0lo38C6YM+sNO3xHY5s9hLT7M/MsOOdJWBl1BmMbsU8uBaQ
         TuC9S9oTO4IFahvUMaoTQAuM4YXQPaT/eMzMA1JqthmLimzFn5r1Ybfwp5FOA5+uZtJ6
         YGfeqmb50eYTcN467NpPthWw8dLUB3IbrnxmHyPiH1JhyM5sfZaV3BBZ2zGx9iPrm5TN
         8RnfRgbETLFq1hZ3Jz0YuFHQXLAd4aSOzEVr5DxwF93oh12dB6HRmbFWfuITcj1RAwc1
         xTVGwYZtXBC1EGaprhjKfCgDxOd7Ast3MeHVgKhPxx0W5o7B9PpmW5/xqcdNA+USywbt
         cGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769758061; x=1770362861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u1WR5ODyKHxb0v/kKAHtZd8QE/NKwhLOL+jqvJJiv/A=;
        b=ek6fWAeOWk/k6toL3UEaYQREhEoDyBIz3HqN8QMETZungw39iORX4XfPu0yu5pbcSK
         mv30dn7BvwjqdFtfQKDOMiKRXbHdv4ralmahfQ/OJdHrwd0ohxEIWUlyYw7A/GCLmu5L
         /1MSA2MqoWSF6BVOlzI90IGqliaCPMaXt/sEo/IubvTs9gz4bznV/M7R5UNAZgG+T4Id
         qxwHYVg24xax9PRojAa1ASF36Sh/5Flr3pwdl3gYDxD3ed1WHMMo4LqVBlzXnX0daOMF
         is1W3PKmDXxu9qLGjdkCG65g64wiD6zDuJCi4HdyFKStsf1bsb4t1bOftQKqLrrvULFL
         D2Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWwU9v8SsYRNgRrspZjRYFjc6X3C3MSdUlVhxwnK6RkIeZHGjK5sZZLW2qdhCK9TuyneSk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOEo+rOzL009rhsHjXATdEpMXrfxO3mBERFzbVfIiaauPcNfMn
	s5qK+3sUC970YonZ3EkhSlylRXBN6VHm2xo5IRB2n5JHb3VyaaRlbkk0vnd2N6adLX2S5EhIZGD
	ePV1RJF5lfg8ImFkN97gzs8RBhNUjjOo=
X-Gm-Gg: AZuq6aJU+zIBMcOgjRtAtVYlzUDscPCi2aR7tWLB7ycivzi46BzVfHJr6pQDyQuptsE
	q5qn5bjm7hpwQyFXlfnzBp8lZ9/5ieshj2crTdB26/w3Gb8JfSqLtmIYmtC7c0ej1U/HMB1Rr+2
	7fPTmAZ8WaJXHmasKTdPoVD7k0nbz3K0FzhptTpS8sA8jT7HCJEkq3sInwS3xZ1QZ8JZfwEXvch
	vuoAFQHfOIW/Yv1PUDtExJ0WqF9+Pc1RZAZxtTsON6nWOgc5ZYvO6ChEKsnwwDJ9+oViVCD5m4N
	/S4o2HDrPNZb/XqIoy/4mbSL5LTvxHWR6V0tSrScLQ6w4yBz74k8amLqh+fx1ZD3Ui808OqGhSf
	O0d2PuYGCgmWRaA==
X-Received: by 2002:a05:7301:5f8c:b0:2ae:5db9:f32c with SMTP id
 5a478bee46e88-2b7c88d96d3mr823727eec.26.1769758060694; Thu, 29 Jan 2026
 23:27:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com> <20260130054330.3462544-3-shengjiu.wang@nxp.com>
In-Reply-To: <20260130054330.3462544-3-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 30 Jan 2026 09:27:28 +0200
X-Gm-Features: AZwV_Qgjn1kkHIU5h0wzpNnEdB_ncps3lPvcrbigVIp1umd_Brl0rdk5oiMuE6E
Message-ID: <CAEnQRZC_6xRRi6y2t0MGe8udTPYWg9XEBFrxhFCbKYBCCD=OeA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 7:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Add a compatible string and clock mapping table to support ASRC on the
> i.MX952 platform.
>
> The clock mapping table is to map the clock sources on i.MX952 to the
> clock ids in the driver, the clock ids are for all the clock sources on
> all supported platforms.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

At this point imx952 has the issue with dma request not cleared you fix
in patch 3/4.

So in order to avoid this you need to swap patches 2 and 3.  And in the
newly patch 3 you will fill fsl_asrc_imx952_data with correct value
for start_before_dma.

Thus we also keep everything working for bisection.
