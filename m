Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2059F1CC89A
	for <imx@lists.linux.dev>; Tue, 19 Nov 2024 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732029932; cv=none; b=F1y9eivzFtfHDF38ua1BBPkdUwlOt1iPNWWKU8RG4q9elTeL6jtQKQjfFI8RyYpAqdfh5w8ruW8eIh4V/Ya3WpKnEf/KjQImMbVJ9juEHeaAuAxTdf24keKtzdks4WaCs2Os90+37meVwo4lIN0r1FET/lKR6TA+YiQJDi52MBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732029932; c=relaxed/simple;
	bh=VH6iOtx79DeGUGJ4jw8WfbN0aFWGMbAWjSxfxYMIkoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rv/DMCHCVJ38raB5xuJ3MyLU9vD6ly4tMqhE/AeNtO54WCgYFALLugVz1Mfn8guucXyHbDFzsMUoCg5i57ONvhMfiSKAJAa6u9AdbQ8k/uhQxU0a2oKUsgexieoL1i81tzBxZx8MVARIaLwG2w09dRgtaJGKnzMXKNmxyW/d3gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0wR7IwN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0wR7IwN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ea49a1b4c8so2072168a91.2
        for <imx@lists.linux.dev>; Tue, 19 Nov 2024 07:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732029930; x=1732634730; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlci+2BKdigoipxB8Vb8O10YHCpzCE4DRKacOckTZAU=;
        b=I0wR7IwNVeeqXzIHeatcViegSD3nIRzmZHFUEFoAhq0wvkhZD5EnyvWzskK2V1Tch5
         lJ6Nch2HlnLJmAjKvZbYai5LV2v6ZM32voRUMP9rmgc6DPbvVUA0VpV/OaL1TjVLLrgS
         FgZE7q9z8ubcQYDmhZYcpZIfn9mUuuj0g1rFi7B7IjLyXhUheQt7zsYz3IQ3tSa4i6Xx
         jXL26n5sRXO8XJAdDY+er/HGo3dlaX6ny3NWWvXkTh/7cT4yOnOuELkYk811y6O4BLON
         3sV3KYVngYmq3UBfMDqiyhI3vSz9+sBN0Gh4wptCvlC+S+eIgCQJRzloFP+3B1TsJ3LG
         VvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732029930; x=1732634730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlci+2BKdigoipxB8Vb8O10YHCpzCE4DRKacOckTZAU=;
        b=RDlh2ngnJw67SA7GgqK5YjaTbI94ty2iKaZfhyv6I2FdvNBblNDCpHdS1k7AjCxnSZ
         dGVgnenC0bM+kXVh5nl+zrNepb+cUIVs977Vp4aw6mq7gk9+KLi9Av0F0RY1f23R1KCx
         8aJcKJn29bGjsYs6gRYQ7Bg38lfGLbvIL06kNWNsRT7OdyZRmF2H9pUOvqNfl8bXrrDd
         jOotWfAOJpRYh41k3iLMbXFmN9Ii9FYj5Zgr+nyhECzAG9KqeOVty10CBVr6XqXwjWzJ
         9WPD9k125QRAE3yiH6P7MYTOGa07t/CCYPp6+nH6z1ERQZWgxBMAI6ogmRkIbywiFla8
         1DSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV49O2IQykqOIq6bYdQXhhB0kdo7IX1L3lR+JOxP+NN121sOhGaUMN7zpeT1fWDjVuiJIA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx4Stf1OV5bbivGn4+/J70sU2Zb5ZDckz5f1Ba5tPhgpFRr8JU
	jqLEVzKPlTbD+anf0pgHKyF+BFHFmlhbD1WCqMHq2345P8tBOgOXpxSMM+37YsF92sWlbLU9dsp
	awx05DRguhvi6vWpfCgKmXu2jdns=
X-Google-Smtp-Source: AGHT+IE7/1v+nPPImVoZLSJAIkad+M/ZIXkCwHk4Aqn15nIJP6zl1vdILO2DJvmdjbejL4ELnTacW/VVIHzDh0f9LoI=
X-Received: by 2002:a17:90b:3ecb:b0:2ea:5823:c153 with SMTP id
 98e67ed59e1d1-2ea5823c73dmr11754596a91.19.1732029930342; Tue, 19 Nov 2024
 07:25:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241119130726.2761726-1-daniel.baluta@nxp.com> <Zzyn+i4khAqWBSjS@lizhi-Precision-Tower-5810>
In-Reply-To: <Zzyn+i4khAqWBSjS@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 19 Nov 2024 17:26:35 +0200
Message-ID: <CAEnQRZAG4Piw6NfQC7Yyc5-d2ymfq3YeL=FpV5_hNt26AzRhjQ@mail.gmail.com>
Subject: Re: [RFC PATCH] soc: imx: Add AHB to IP Bridge configuration driver
To: Frank Li <Frank.li@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	robh@kernel.org, krzk+dt@kernel.org, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com, peng.fan@nxp.com, 
	iuliana.prodan@nxp.com, laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 5:00=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Nov 19, 2024 at 03:07:26PM +0200, Daniel Baluta wrote:
> > This is a RFC patch in order to allow AHB to IP Bridge (AIPSTZ)
> > configuration to be restored after a suspend/resume operation.
> >
> > This is particularly useful for aips5 bus where the aipstz
> > configuration is lost at suspend.
> >
> > In order to configure aipstz bridge we register a platform driver
> > that will set default configuration permission at probe.
> >
> > Because AIPS configuration is lost at suspend/resume time we register
> > a power notifier callback that will take care of re-initializing the
> > configuration at resume.
>
> why not use suspend/resume callback? what's happen if devices under AIPS
> suspend/resume before AIPS resume function.

We are attaching to AIPS power domain. So any device that will resume
will have first to power up the domain which in turn will configure the bri=
dge.

So with this it doesn't really matter the suspend/resume order
becasuse the notifier
that will configure the bridge is already register.

But I wonder if there could be a problem if a device goes
suspend/resume before the bridge
probe function gets a chance to be called.

> supposed
>         bridge@30df0000 {
>                 ...
>                 some child node {
>                 }
>
>                 so child node's devies suspend/resume will after bidged's
> suspend resume.
>
>         }
