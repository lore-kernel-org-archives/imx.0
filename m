Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA222F7AC0
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760981061; cv=none; b=Rxx1uhJw6KohjyKsXPQTMR9Vi0vV0fIzdT92OMr7KchDuqik/S4lNpp1cHwcSeiSEa2Z2vX/9YAVhWXXvuMnNJWawrc8Rhm5zg8/dmBCmYSN9z4/prVRo5voK8xXxe8klx9bftkx/1cvkmobl7y3T+T54KAbozO/dffMqdZsGqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760981061; c=relaxed/simple;
	bh=hydKm2NZFUTr/tv1313cV/5VEAs1svpkfDCqMkUr4gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WL+hthN5zuBfOQkpPas9i26xPEz5sTyKziFHycLKAumUKwZeYGoX9ELkkOCuJZQrIhlWedU6A3zelv9Pno1mEz1OtLRJnrYtmA06keW0dGKjtdyKBfvcT/7tlqeRii21mGSFu087tX9178msdURh7Z4AYVXgZUl3Er3wvHCTAR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+XNDEvj; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+XNDEvj"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37777912161so46811151fa.1
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760981058; x=1761585858; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJL3ymzyML+diLAVT9nhgdl7Vx9TWLZbPp7QEm8FssI=;
        b=i+XNDEvjdnmfB9E0S0nNx0jQsgm8ZrKhkvqevJcPaQ8le9H1qjCjP+2SFBS1XlE18z
         mdoW3u+8FsA60iZ9OGhA3aLxwlHM7fS3BSkrgl7PV8BJ7EAFFTCC96akbpxvCOqsqSzX
         R7ji1TJLL7Y3em48m3Ayjs3VJxzB9T3ow5QUoSRj6dB3lGK0/PU0K7XY3zZCkLT364du
         U2WD5pmcCqlz/WjGtUqp6vllrIdnjGBsLZ/ISc4W3o9IEakcQuqkcSquZ1F8RZnOBHfz
         ioYdsEihkDKwh3qkwmmwm2itg299AJ7I4yIQfYHqM5/CiMu7GSY7D8ejmofP+lA1rtu1
         nfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760981058; x=1761585858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJL3ymzyML+diLAVT9nhgdl7Vx9TWLZbPp7QEm8FssI=;
        b=AkpNEYC2t1H3+jV5rS52wVQY81GHww70Q+zMTAxyF48+7t2rHHd2HX4CE1b3FpVR+t
         aJBkpcPtxSv2ri3Tdo04sMK++Q++YwDbW9YLdTp2LX3ueaAB+uGR9TfYt1tgUxCq/b1p
         JCzAkhK2dHJ9ILdpoMG7o+DUfiHgOk/JwQ0JeLungv6llCyPiLwEieF2Cauf3RudTIpS
         +BjUREAEqMt9s/6OpZ0jDAldVmP97S81vpaTNtvOkTV2w5pCOaniyqJqAnhYm1d5NJtl
         RMjzbzVVddLCiPJBQNn6pI2duuTfSphonByF/ei/IDWRpVDcaMSDZM+36PNDJV/RFFEC
         k8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXFm2uAqe3VCeOd9J8MA49t7tMJ/0kXb/QHfxfdusPp3iKLkjWEH/1TjNvi478JMlT6wmk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVCsTXDJvR1EhUhT2v5Et3sZdVZiep35dP2p/WF3JqfaVfmGm+
	lwlEKail8qJaFoaP5FTCrI8vGRDWHbUZmTrAGg6aEm51NDhPtnSEZNYyg0umATJ8aghSOtdiBUP
	5ra1hpiZushOYMc62/6V15ehdJs1YsEs=
X-Gm-Gg: ASbGncsX4Pl3j35TKC+fq+n28M1SSVdKwSFfPQwjfFcsmdaRahrOGe/7HnNdN/VcZDZ
	7OjBo63yQkwH4w7OJk+IyzsY4ZQsm3A3kKgkdQymQPS1nC3m5i5CVIWRAg9WwbKnPM5w77v6Zu1
	0ebgi6G6amycS2fTnM236LhPvzvmYs/6izTYEiGYg8Z9E3CadjYpLY4hQxnBc4zBu73RUffIJNj
	9JJj61LxXQZVonmeL+bWvXctDcoMt2PetemPgEBspd35djC7cl1ZfnTpihxU6+1T+CXbcfmPQOO
	i3pQVttQzEQm4HLI
X-Google-Smtp-Source: AGHT+IFGvquo7dKjulQge3D4nLth2WI8das3/MTTYuoViw5UYS7r0NQDoBhHAaPE++J0d5/68a7BWV0yZERz90yIgHQ=
X-Received: by 2002:a05:651c:1990:b0:375:f6b9:c948 with SMTP id
 38308e7fff4ca-377978d7927mr37082001fa.15.1760981056694; Mon, 20 Oct 2025
 10:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013205155.1187947-1-festevam@gmail.com> <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
In-Reply-To: <4bd512fd-b3df-484a-8a04-a1ed066c42fa@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 20 Oct 2025 14:24:05 -0300
X-Gm-Features: AS18NWDxC1BDffoJ0EW6ktW9w7SITyz7Fejydue0HKFG2UIjYNHc8u5VIdoiknI
Message-ID: <CAOMZO5AGRejEwNvkH0Di0HVi8QPduTeCSud+_GqOkD4tqEcsdA@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
To: Liu Ying <victor.liu@nxp.com>
Cc: marex@denx.de, stefan@agner.ch, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Liu,

On Tue, Oct 14, 2025 at 1:12=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:

> Strictly speaking, I don't think i.MX6SX LCDIF is compatible with i.MX28 =
LCDIF
> because at least i.MX28 LCDIF has the version and debug{0,1,2} registers(=
at
> 0x1c0, 0x1d0, 0x1e0 and 0x1f0) while i.MX6SX LCDIF hasn't.

There are some DT users, such as Barebox that matches against
fsl,imx28-lcdif, so we cannot remove it.

In my first attempt,  I tried removing it:

https://lore.kernel.org/linux-devicetree/20241028180844.154349-2-festevam@g=
mail.com/

but this was rejected due to potential dtb compatibility breakage:

https://lore.kernel.org/linux-devicetree/4addc413-dd13-4867-8c49-45539af7b4=
5b@pengutronix.de/
