Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E308BE6C
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 01:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729732193; cv=none; b=P9/IdD7+KJ4k7MF2wIzGf2SkHLGYQPotXMWSlC6xO3Rt34x/QB66Nl9NuRbgoGhzB+rF6+DCE0kjEb7+KrpHyOdDcqnrGjWDEBkocUzogLvis7vJYcleir3tz/CWaGdNbo2wKJc1oLvJmVl6755T4zHOPcDjlaWcG8Vfn+xXR/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729732193; c=relaxed/simple;
	bh=Wg9Wp5kk0vEFCDe4okqM3rWzYPqqTfbIGApRoVaMR14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSakhJMOXTAWwYO5MsOA9nXinhjkpbmMYt92eAbQFjD0CSAhe2aE2/EOq9Uvg3WkIX1NV1WOk00Cfd8yMwwr2/FFjTKq9FcA7zMnEtpQxCYw3sS2ph4PIJ/vZKPFGf2MD2ulLZ3Om6LN4vaKFxhy8hW2RsrG0KXMRZBjAK5QGeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FljqJ7aC; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FljqJ7aC"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb49510250so3571241fa.0
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 18:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729732189; x=1730336989; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbcd5uRapQhQxq5MJJTWR2sL5XsG0N0yna5jn5lare0=;
        b=FljqJ7aCAWoUapL2JaXyYdYDBZDdxC3e7wTSlSQD/66oB5i4jI3NHdUkHcJLHMNtiK
         MflXCZ49X3yYHUX5n6eM9XbumbbdXKTRp1JjmJGLoLl167rUuqSNIvqIENMLBIeVLtAq
         1AJkL9bHNFz3c2Y0VfgQoLDt8Mb2Z/2JcQ0wK/ytp0Yx0MsB/1kz7O7/sBntRgP1dm6q
         rrPgpTRQm1i3UMj5v5aHIVUlMAPn0uwqY9JyDOIWNg/gEYrlD6/givCBcDbug7lqQVDd
         9T8fNuBHIliFBv5rBZtSZjYi3xpbkpXEFaWMLJIYwElGBsRh2h4FQqbKxuGHSwjRwm9D
         rO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729732189; x=1730336989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbcd5uRapQhQxq5MJJTWR2sL5XsG0N0yna5jn5lare0=;
        b=Kd8YwIqnNrWEc/deDzuS/GCoHNaDVJIqnPrJ76+Zh5JSrHHfyDOCDbQOBKQPBcjiMM
         dK45hd2CkmO/Xorsbq666tR014ghmQS0D3oLdwddTxXlEJ9Aqd1PT3eMO9LBxsrXhelb
         hXLb6k+0q4uM/DaAzivwB7EtIcR0KVdiKBJr+e4h7sLPQAeD2IdFWeTd5t9qwz/O3I4n
         IIeasKGnoZgybf6JydiXacbVdqFqQYdhjvRLPtSgavdKSt3JkgOLbPnNjNonA1Zzl/0o
         cl8zFU4uRxnAplosRU9CPkvaSNEaN+F+uOdYVYr1+meypeedwrYZKVLuR/uEvx4Ipwbr
         cCPw==
X-Forwarded-Encrypted: i=1; AJvYcCXUKpkiu2J3+i2KyyhD0PnYzXI89WXiX2t5xL6+BEmMSpsPoyuH0M15ZVUcnSL7DAJyrks=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu+19uQodAAXcet/nj8z9sFI2PKsG4EJ66JL6HYTvTqyQsOGyy
	eyTbLLNq9j0OLx8kve9166eoSijyiDdntegUZQMim07oaOFKcMtnBrRJ+3EJXZq4q/1LlSNgiXG
	EL4AJVw+8eOxspvrxKVTDpyncYtg=
X-Google-Smtp-Source: AGHT+IF2Ax60z242ilbI2EuA61CSMux8GznaUwVN4gBzSDilDhsogRyUKPdE6YgVBW9AvJpAlEtab7CwKd3munRiSXs=
X-Received: by 2002:a05:6512:23a9:b0:539:e6fc:4170 with SMTP id
 2adb3069b0e04-53b1a33ca83mr2476739e87.32.1729732189049; Wed, 23 Oct 2024
 18:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de>
In-Reply-To: <20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 23 Oct 2024 22:09:37 -0300
Message-ID: <CAOMZO5Ar0Pa6RpjmXkX4cd4oao3ggbs4a+OsSp==PGO1CV_-RQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] nvmem: imx-ocotp-ele: fix reading from ELE OCOTP
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sascha,

On Wed, Oct 23, 2024 at 5:12=E2=80=AFAM Sascha Hauer <s.hauer@pengutronix.d=
e> wrote:
>
> Commits b2ab0edaf484 ("arm64: dts: imx93: add nvmem property for fec1")
> and 0d4fbaffbdca ("arm64: dts: imx93: add nvmem property for eqos")
> introduced NVMEM cell bindings for reading MAC addresses from the ELE
> OCOTP. This doesn't work as expected due to bugs in the driver:
>
> - imx_ocotp_reg_read() interprets the incoming offset as 32bit word
>   offset, but it really is in bytes which means the driver reads bogus
>   values whenever the offset is non zero
> - imx_ocotp_reg_read() reads wrong results when the offset is not 32bit
>   word aligned
> - MAC addresses are stored in reverse byte order in the ELE OCOTP, we
>   have to swap the order before passing them to the upper layer
>
> This likely went through unnoticed because the bootloader normally adds
> the MAC addresses to the ethernet nodes and in this case they are
> preferred over the NVMEM addresses.
>
> This series fixes these issues.

Patches 2, 3, and 4 should have a Fixes tag and Cc: stable.

Thanks
