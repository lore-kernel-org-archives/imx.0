Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5700C1519B1;
	Wed,  5 Feb 2025 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770650; cv=none; b=akexzXq1bOj8/xzxD5bItOL4J2jwRP1ExpYdZAj+5tv1X/zLVnE62TISMqnEhndVCagzrBLYTwfBe81v2VrEpPbMD/j6Y2zrNX2QgStMRPIJDGVK71El2ApTrGfX1u7ct5k5J9AHlJWkM1GidQBqt5cNP7iT/wJQPuq2CHth/pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770650; c=relaxed/simple;
	bh=sYJYR75W/X4qiJx7MQ0584FcrNzNgCuv19cJ2nI5CB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQqAI09t9qIWrHhTguaA79GOibqE+8b7ApfF9CHAPw9P91ksNq6q8+pxsaMksNGiKE/b08Mz2dL25OQf9CfBUgiIgf4ygPP4exJbEe2AJ30wjPh1pol3j7Fhez2RVaDwFoFTCIir7nrH0i7TQgAKA/IjEeAe64m7xSWWr/l2tnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVk0ywNI; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVk0ywNI"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5439a6179a7so1076599e87.1;
        Wed, 05 Feb 2025 07:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738770646; x=1739375446; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5pjtlFBbyV2tkO66ddvoUngY8TmcZcq3HnlQUDSPEI=;
        b=HVk0ywNIFcY6hPiyHZjaE0TR9N3Y5p+y6Hy2lLcTzWW/q00aMNZOCbuO/wa8snGi8E
         9WOVjmwbjS1ILSkh0UuSUep2UQ2Y14mISy4/+NsnD8n+IXDSTOiWETkhvjX6pMbbYzjP
         6PAWbUWFCYzL59IN/kchxNQq28Cs7FmLbrilh5qzEgl+n5Hs4/PXtCRqnUnnbPKxLfXw
         fICycRNE4Dcjuu5p97pTsWrfwK9aUSkjN7NO53KRYjxKK3rcdzNGpxf95LKD0Lat4nx2
         G32IST2bOZyowhv37mjKG3P7BI+ioyXWSya7JGZFbB6aioHQ+cLwPtTFZAglGezjZ6Wu
         XP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770646; x=1739375446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5pjtlFBbyV2tkO66ddvoUngY8TmcZcq3HnlQUDSPEI=;
        b=i/WZvzL9U23yo9OE9wtQ8eBr6h+4OyY1BgMAwhGybDdg1imdBdwvHH22oOmgB7/KFO
         p6WTi364Ww7cuJSR8SaWgIphqzYWoMtVgITeWaWFsJt8eMYheWGPLFJvQOhURH6nM64w
         EtzF24+P7kLWd746ICk5KsVmsqyHYgKpLGr6IJ+8T2IoiawnMpVx+DfyDcsgjx9AFJwg
         gVLPBK+oDA5YG+Q4y6ocsAaD2Ajvya/ls+Abt6qf8lj0Rb+RCGRJ9ybaWNZbSqwf9Z2H
         +QJk4q0D0VUbmDDnZ0kjwyoMnpzlm3ednMmDjcaB/4dM4/zI00KTRZ9DrZGEwJsuWCpB
         ug2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYwNNsRvMyvEuFqqMm+vaEfe40PQefHf+62P2Eego/bANvZOt1DUHBYP8trwpJW0zVnmE=@lists.linux.dev, AJvYcCVscAqJ0STyyXE3OKcUtTDCF+irkJKsGKKDdO0xdOW3xbnGi3gdbAKzIkP52bQAxYgcnwrC@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw6A+8+uVm1Xyd94rWEPPB/pJE+KnFKLOxHUVzUsRfTAx5YcXs
	Ftt7W62JbSMtilBhuvsrETOsLGDnH2WPiBrgJey8P7vodDkrQIGM1jCCAX4b+tbN3UGSPRP/K5B
	vQdAlHHrhSlAJlPpUI4hetG2iy4w=
X-Gm-Gg: ASbGncutEho7sOTJfAfe3hHxHrkON/JI3MVq9Df7rR9spuBSmDkiKZR7YHzj5DIYqpP
	v//Q4iC9YFWYWLQQImZr/lsuP5tklgWkrnjtj/GLhovfWEkV7V+Q+t2W+j/PsdJxip78yL32z2N
	E37WTxB9sdcQFMA43sbFo5v4OY+Ww=
X-Google-Smtp-Source: AGHT+IFDxYIl5oogc4aOzvhvY0HAoYIntif84wA755oePAmAkgyhvnAbag537ru1gnMM2wW5pU4RYFXtdOqt55rYnMU=
X-Received: by 2002:a05:6512:3c8f:b0:543:bb69:c635 with SMTP id
 2adb3069b0e04-54405836109mr1109351e87.15.1738770645990; Wed, 05 Feb 2025
 07:50:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
In-Reply-To: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 5 Feb 2025 12:50:34 -0300
X-Gm-Features: AWEUYZlFLXiepv_yE9yXJ9KlWCIpZy_t6h9dHVFhvb1GQAbeKkvQGMigDUgxkZw
Message-ID: <CAOMZO5Ar_-_H+Kwv_=ScoABqLzfEHX=3=JxrpPfiD2QmDt4=QQ@mail.gmail.com>
Subject: Re: [PATCH resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sudeep Holla <sudeep.holla@arm.com>, Mark Brown <broonie@kernel.org>, soc@lists.linux.dev, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 11:52=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The i.MX System Controller Management Interface firmware is only present
> on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about this driver when configuring a kernel without
> Freescale i.MX platform support.
>
> Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
