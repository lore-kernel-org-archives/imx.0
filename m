Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94CB5D47A
	for <imx@lists.linux.dev>; Wed,  6 Mar 2024 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709713491; cv=none; b=uzKnHiPb6jupzt4BFbow24sT2dlCeuAXLJ5rcE8OHuzOmYsiA4EXAXSP0q5NfnWKH3/8qhVNiq5nNDnufZOjUn/z5w0s+oJdQIm+dbIOLriSbkEVHTW0rwych0ZKsrXVz43xPTQGrJnkwINZWSPIL6NRJo+YL6WNzg/ipdXIECM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709713491; c=relaxed/simple;
	bh=k/HbIqiXk/wu0mDYWVOYPq1UOLi4MM2rdQIq1/sN4pM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUZXP3hOZpCT7IfFZFmmWfXDhmZpTXOF3McoiLmp0ljX6gvTTdt0eau8bDTdpj+01jAC4w1Cp9bEFoVtCTrdR/QAu9ZJmS0vV1RYzqObAatV9XD2JFku0pEpVocPpkfMPalz1z5Bl2ZpFXJM3XlylPUO6h6ZuQ0LR5WwRyQzNbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NU1tWGDQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NU1tWGDQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a449c5411e1so656533066b.1
        for <imx@lists.linux.dev>; Wed, 06 Mar 2024 00:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709713488; x=1710318288; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/HbIqiXk/wu0mDYWVOYPq1UOLi4MM2rdQIq1/sN4pM=;
        b=NU1tWGDQeorK2J+puCIjXw7JIs7P4fGL3BfdcdsvGquUFOpFEoXOQsCmuEjNdLZcqj
         mo4oJoERxvJffPeI3FfwW4Ww6sYshkxnZtSNM5KnOp6QCaIlKljyANG/NGJD4A5Af22v
         6shxS8iAhEBOGGfau1Rt1MPk7hhwZ4iSE3DhDVsfvjp12AKk3TN6A/vbhyUgkhSoj3FX
         6P14e8wfB7zT8ES0RbRU3b0niyP0mN695D2pa21CocQkh7VEwshDPdBMi56zphwnyPSJ
         H9p4FdinJgbQywZBWV45rczRqmS/STqXmICkTd+51vRWrtvNWoK2oJlTdMDLpiMlbalt
         EeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713488; x=1710318288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/HbIqiXk/wu0mDYWVOYPq1UOLi4MM2rdQIq1/sN4pM=;
        b=j69wzITuneXFlC124UHjeo4YqHxmb09hSuwRuEotVrpYzExt3uIwRfgNgUMIZP8Exn
         hRzVQIzQOJTfVcJhx+w0942cW6pvSV2UYmD2XQc9NfKCcToEEPI2s8UXzgAB0AYXRr8p
         dhAtCNrEet2bAUuhp5L5L0yNfvDeJYlblPNc9Cdi59a0jFSoZMwrxDH7Pg6djN/05Vqn
         NplJQVHYK7uBBuDadZzKq00L5vbaxjg1wR+Dlp2xlHM6Nj8nibS9VmHH88lrq6B5Le7n
         NJYWJfSu1irfZ/8nG5HjdAvzgtSRS77lzUDDvSXLgQLkR4Y6iXG0uIC5EhDeX9265ABU
         +/ew==
X-Forwarded-Encrypted: i=1; AJvYcCXwGx1wnDRViLdl0kXoGzmxHkNgAZPaTlTLO2i9j1ZD14D/o55l4l1UN5oG3MIhNHDb34v5AyhCHLQ1q5HtkAoXNRAm
X-Gm-Message-State: AOJu0YyCrwMWLp+3o0Aa66sIXeswXsRwSf5/qNn0ltVYHFRhL2zkDRJu
	QNJ7tVIJwxl1TDGOw+c7V8wuhVaMBSD+3BJfQLNtg22+RSwdTHRYFfsn0AigRj9KAch2sqc+vBj
	N1AcwgocZRgpOEOxU/cYxgpF6b6Y=
X-Google-Smtp-Source: AGHT+IF1Fv26nqs+0M2KpaCDTRPR7Ax7eaJRl9mRZxqdztpvBOx3KHsG5Lj8D313IqZflw5h/azi5NbJ/GfBtDmQU3A=
X-Received: by 2002:a17:906:d9d0:b0:a41:315b:94d9 with SMTP id
 qk16-20020a170906d9d000b00a41315b94d9mr8666736ejb.71.1709713487809; Wed, 06
 Mar 2024 00:24:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240303-sdma_upstream-v1-0-869cd0165b09@nxp.com>
 <20240303-sdma_upstream-v1-4-869cd0165b09@nxp.com> <CAOMZO5A60zG+1u0NYPFaLsAgCxcF1RxxybVeatovTGj07oxqBA@mail.gmail.com>
 <Zec8nYk6gzx9IxOS@lizhi-Precision-Tower-5810>
In-Reply-To: <Zec8nYk6gzx9IxOS@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 6 Mar 2024 10:24:35 +0200
Message-ID: <CAEnQRZCZk4_Vc10dV3qbk56jtO3Rb7hhghz2zqzg6_gbyvxD4Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] dmaengine: imx-sdma: Add i2c dma support
To: Frank Li <Frank.li@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, Robin Gong <yibin.gong@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 5:39=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Mar 04, 2024 at 08:12:09AM -0300, Fabio Estevam wrote:
> > On Mon, Mar 4, 2024 at 1:33=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrot=
e:
> > >
> > > From: Robin Gong <yibin.gong@nxp.com>
> > >
> > > New sdma script support i2c. So add I2C dma support.
> >
> > What is the SDMA firmware version that corresponds to this "new SDMA sc=
ript"?
>
> sdma-6q: v3.5
> sdma-7d: v4.5
>
> >
> > In which SoC has this been tested?
> >
>
> imx8mp and imx6ull.


This information should be present in the commit message.
