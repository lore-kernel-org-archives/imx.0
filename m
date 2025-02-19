Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD0B1DEFE1
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973238; cv=none; b=hfvVg1YOS53aYSz4pOb1UZT6e0uKGfXxo94m8ontDSsZEEpHfgOpMH1DqERx0WCx77jouw0WEH04FRH2nO9PrPcrKrzSbdpXgUDpbKg2FQ0/QK+fne0r8TbfC8AA+1aH9k5aIj6VZGs5+sfuf0HUew08fa+PsgIPTw08Vp4OALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973238; c=relaxed/simple;
	bh=EBGIkFOMA3Q9uBedxQ7Ytmbg+ijF5b4a8hOe1QEXg2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IRlNgDVd6PTLhpt7sfnd8RBrv8j6KfE0t4YzbEyMxy6VpNmPtStF6swzNFH9qngTZdPAVmHCbMA6b0WtjabxQ0CBMa2IpkibdDVnaGfr9zYfl89K+QCb9Tk7zcn7TycAq/mdMWroCmfas1OLKQUuSYXipoUj/0OSKdmXeG2KfoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJr5bxGq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJr5bxGq"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-546237cd3cbso3404585e87.0
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 05:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739973234; x=1740578034; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6t37BQHYg5C29qODMPAidihVqNJ54EsapTzOiph9W0=;
        b=mJr5bxGqHfv/WqNSq4x7HhbuZsXFzMVagLcckVQHw4qMpsJVT5bpkt/vJvkziXzLev
         IAg9NPobHB00Xsx6pjseSZY4eOT4IdFcOH+eBrErifsj2iIiiSPTPu1Jrn7Ap5N+DG6D
         kc6t7+xOkf56UJtIeLB7OfBsg5HxK3d51TDdW1SFwGBFEBcJx0cZopv2ppTcpWUAllBi
         rj4tZRVyPD7PfIDWIsyMz9B2lSjKsh3fc2uOyBZLqsgTWpUyPE9NNVsx61ItIrP2zNuz
         IzEC4ewCjcdfWTz3sECuGQcaNgf4u9+kPZ8Vh3/TKDBkFvDatOgaq/1o8UJgAcW0ljgY
         BnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739973234; x=1740578034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6t37BQHYg5C29qODMPAidihVqNJ54EsapTzOiph9W0=;
        b=ZgRT++enm6d0GIadghAmmTH3UH7cVpUYMLzk5iqekDxrXBLUXGdbu1HE8ZIY5Xncz8
         Hl8VvasMTZMr8azh3G0t4ZRlFdpjqpvxqIKyR+ASy3kaLGhuJDgzODjBzgNvKgPKExyi
         k/j9E8fx3ZW5Yp0/Xv3zjIJT/xe6sjxxIdASjOOi5tahxbbUdkelsQcqMnZMZMbl/93s
         1IrmBuBQjLbrGsslT9dCw+CUnkEome5KjUU84VzuUDi0tFk5s1cq9+wcjj9bZBB1hzGv
         WLJATyjmnWsuR1eMGIAhboHqQVeWNFRhLvV6clM69i+85tOYP0sQYG4DYEgPKcb48Hqs
         B3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVBFnL84oPtdHAemT/D4Gbz4QdmsQ2ADFkEe1e1m6AcMC2SQDkUmCpVmBKFrRjyLyJRHN0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLrXhXEBsMG6sCei/iexBmzj0NNPTKKby6UDtxYsGz/5lt24HZ
	gD93e8UzNudituvU0D7oOppwdJarhSEu2HKZjSjLtDji2+4Ub/8O0XM5ikPB3U2Hv556qOkmLa3
	mC/GS0awDwKKJC+o80iF1O+8z8LA=
X-Gm-Gg: ASbGnctV8k3vhM+VqS/YiZPnPTST4mvtAlq853Jn1MJeBBnfJL1F5Ya9qcea0YTcukI
	pKat8UB5jlvuOsz+g3bLNwP7zgbmfjfo5Xwnb79VIc4ZMmmcViBDgxiRlEF9iq7jeH3Wz2uRCbT
	w5msNQyq8X3vJr83s6xJpbMVw8A94=
X-Google-Smtp-Source: AGHT+IEfa6BU1Og4EYBhPdGzQ8AbNlSEs40TcyE4AyfYRci4Yh7JUHFGkcpocxJ2mslPN8Wgy1hRW5VA2U7L8Kutmic=
X-Received: by 2002:a05:6512:3b9e:b0:545:2f6e:32fa with SMTP id
 2adb3069b0e04-5452fe55430mr5275021e87.21.1739973234258; Wed, 19 Feb 2025
 05:53:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250219133221.2641041-1-florin.leotescu@oss.nxp.com> <20250219133221.2641041-4-florin.leotescu@oss.nxp.com>
In-Reply-To: <20250219133221.2641041-4-florin.leotescu@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 19 Feb 2025 10:53:42 -0300
X-Gm-Features: AWEUYZkJFhBHdwEt5veSqP7xF0ysRoigYMPW5u1lRGmZYIM_SaXIS4HOYQ74S6A
Message-ID: <CAOMZO5AfsHqyo3a+hmfprOnNJEzMzC81GuzBxtrt_F9cHufAtg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: hwmon: emc2305: Add YAML binding
 documentation for emc2305 driver
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	viorel.suman@nxp.com, carlos.song@nxp.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Florin Leotescu <florin.leotescu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 10:26=E2=80=AFAM <florin.leotescu@oss.nxp.com> wrot=
e:

> +description: |
> +  The driver implements support for Microchip EMC2301/2/3/5 PWM Fan Cont=
roller.
> +  The EMC2301 Fan Controller supports only one controlled PWM fan channe=
l.
> +  The EMC2305 Fan Controller supports up to 5 independently
> +  controlled PWM fan drives.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - hwmon,emc2301

As Microchip is the manufacturer, this should be: microchip,emc2301
