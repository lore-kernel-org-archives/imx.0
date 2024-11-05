Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8148318DF89
	for <imx@lists.linux.dev>; Tue,  5 Nov 2024 10:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730803724; cv=none; b=q1dZv1owZCgCsKJj8C3G89Ui506sMjqpRoqvnZaXMI4Eq56e76aaTIMPyHHXMPx5uEEEoFG//at/bEfDiT5GLUrGG4CNNwHAJjuwh/MSLccQ9he9o/GDRc9JUkTEKIQQvcElfl10IXiJll80/t9qtZ40g0XMZn7Wo8n01XyvTbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730803724; c=relaxed/simple;
	bh=Htljkb5sM4UHGgyg7DdW14XUQpoZ89uy5qDRXjOLODo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZiUfXTgXt9eAiPN19bX5MT1Wl/csmdxAKbWh3ykZbU4B4DUHac/UOt9JwiwnhsmNEx9Tr9SW6Y5lLpxEGG3qV5JRnLSnEQMO0u9ozZfIlapiTgHH2kzd9L6d74V8GdfjEBpzPjIV+kpyAXETHuENQ1f/P9XUMPMdAkVbLEAXD9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jvyxrr5u; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jvyxrr5u"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb5743074bso42887111fa.1
        for <imx@lists.linux.dev>; Tue, 05 Nov 2024 02:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730803721; x=1731408521; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEyErTaFotgB2UGJ1zywSwEt27+ao/0XQEozI2hYQys=;
        b=Jvyxrr5uMeAP9yEA60b7rIilHlxxdomMGKAbYDwodVXcZysSfkMGcLd599fLsvTPqH
         Gvfgx0Zam0pWxReHBH9N+HbTmmfkwQshAvAUro4fQefKHU+EYx4K1M9pjx3S8HGeeAvA
         eY2vS7WKuyoJADNmK090Hu4MdBNajqpApYBInk1/JQFPWuCtW0gRtQ4MA8TzyKd0mpIR
         qOv6Raju8Ldo0dBJMEYsV7S6LX2JesVLeoV5se+vpAD9zTwOWyTjY7dQbm9DEQ3bKZuU
         QhdFAva5MG/LDJLmzHwGuSDMalD7QZwFRx5B7rDk+fEBu2KClXpztBV07vlBeH8PxaWJ
         hQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730803721; x=1731408521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEyErTaFotgB2UGJ1zywSwEt27+ao/0XQEozI2hYQys=;
        b=AoMBT8H9xc12JGKUveA+1LdvDmhT0b6DBp3R2Y+JzueE4FneOh8aAR+rEItA3LtWeY
         bPW5OPhSlfR8XR+vowHL2TY1KKnO1eKBKpkIQvuhUxMG2MKynoHtOFv16LjdshP2JSDX
         ecDBtJRr4QOtPFq9kzQzUXKT4T6LktnFlpyn2/QbyS4tm6bh6HQtsWJquI5o/NZoiD9M
         Zlxysv3tzVhXCeayAezFztn0ZYCjqoiZVKxdJ5d2Yj856AudauULXNUuG+V5KFcHVZ1F
         VsK8cq/JxyxXWkoK6s/thjA6TEHaB5ERWuBWadyEOVy8AKgnpNi6A6v1Ir1t2Dg4I7CJ
         tt4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUI2dOZpI4BxUCd0umGx9MVuyisH3TEG57/bxlwU4WMIicFdZl/ZRgyWOthbk9ECd40XqA=@lists.linux.dev
X-Gm-Message-State: AOJu0YynedWA/H2o89HfExQVyuvRpO3lndh4alOeOMyCJkB/QjDxHqZm
	/Y74Hwr7UQuGgvC0XMgQWOQW1W5fMfbPN4n+IYtqj2i7x0s7W8K8b6D6t2VQ/Zx2zgTQ9MwiZey
	ZpJnrojEj60N5MFMHl0tpa9XW2x4=
X-Google-Smtp-Source: AGHT+IG8lyaNErIet7KUEx+3Ey0QVQ7V/6TntPE+9Abi+rJ104OGSqERWvIyDPQsR/HAb5AxwbvCpdFNKdNm6ESk1Ss=
X-Received: by 2002:a05:651c:158d:b0:2fb:4b0d:9070 with SMTP id
 38308e7fff4ca-2fdef25741dmr57407361fa.10.1730803720362; Tue, 05 Nov 2024
 02:48:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023185841.1183706-1-festevam@gmail.com> <20241024-pep-proud-d714705c9ddf@spud>
In-Reply-To: <20241024-pep-proud-d714705c9ddf@spud>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 5 Nov 2024 07:48:28 -0300
Message-ID: <CAOMZO5BSZ4YAZ7Lqa3eGP9Wx=Ed7cgug==_UZqc7F57=XCJv3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: fsl,imxgpt: Fix the fsl,imx7d-gpt fallback
To: Conor Dooley <conor@kernel.org>, robh@kernel.org
Cc: tglx@linutronix.de, daniel.lezcano@linaro.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, Oct 24, 2024 at 2:05=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Wed, Oct 23, 2024 at 03:58:40PM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > imx7s.dtsi correctly describes the GPT node as:
> >
> > compatible =3D "fsl,imx7d-gpt", "fsl,imx6dl-gpt";
> >
> > Document the fallback compatible to be "fsl,imx6dl-gpt" in the bindings=
.
> >
> > This fixes the following dt-schema warnings:
> >
> > timer@302f0000: compatible: 'oneOf' conditional failed, one must be fix=
ed:
> >       ['fsl,imx7d-gpt', 'fsl,imx6dl-gpt'] is too long
> >       'fsl,imx1-gpt' was expected
> >       'fsl,imx21-gpt' was expected
> >       'fsl,imx27-gpt' was expected
> >       'fsl,imx31-gpt' was expected
> >       'fsl,imx7d-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', =
'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
> >       'fsl,imx6dl-gpt' was expected
> >       'fsl,imx7d-gpt' is not one of ['fsl,imx6sl-gpt', 'fsl,imx6sx-gpt'=
, 'fsl,imx8mp-gpt', 'fsl,imxrt1050-gpt', 'fsl,imxrt1170-gpt']
> >       'fsl,imx6sx-gpt' was expected
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Can you apply this series via your tree?
