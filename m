Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7171F51C33B
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 20:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196110; cv=pass; b=nMpqcm7Eog6NKizxEMOtplnrDlueF55BJfbNffgmxHtxO4R8wiS6T9jDji0Mi8tmR06uAW/YaAPOV/7Utf0s7Lhziue+6jyk652Xl317ou1B2ZkxuEg1PKnJz7ZdPfhJKLV3ScEgQlVA2YE5HUqEXZMo/Ai7eTCAfYZpmKmEZpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196110; c=relaxed/simple;
	bh=Lo63KNDxHLfQPbHehQEJ2TckClhkCTu4ZWquj/U3zkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5MX7stXuBabRgO7THoie8l3JfwpzXo3wD9WGw/5Xkd27lwMQ2YPSMkZ6ZVMjQYoWl57K9QcDwiLgXgFKMw71ajo1eLy8CwRVl5cllp1oRtS2rA4+p1lG+bdTTq3I78l84lVpOf1/vUmF/MpuKPbyzxgZAN0CR7euEQjuo2M1A4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fj5uuj43; arc=pass smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fj5uuj43"
Received: by mail-pz2-f41.google.com with SMTP id 41be03b00d2f7-cc50d1b048eso917558a12.1
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 13:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790196107; cv=none;
        d=google.com; s=arc-20260327;
        b=SPvMV8B3Es1aIWz/8/xOuFO14h0UazDqFJhFRoX4XI4QrNYnNSuXjfXKsfZG6M6tNV
         IxOMitfVPP/Tv4i0RPwCjAy5EWt8gx238cc3PTp9j3DWNAEYNQqKqse1iPiPY17olVwv
         jJiLRO2/Xel7uc6uYBKA+YtT8m79KCRLHK9iNvz/8L4pfswfUEAeEcpKaPVpxQj4WGzk
         xqr/1Sua/7PU0rhUF9M/xZW/7758c4zrhQju4c9ZZKm9qg+cZqmlwPmJCndIKw4wEFOi
         hf1cy4Ztzjo5PAHfRGWVD5O/O3K4HITOtlslOu4h4xMxgXSMZsXQA02hoyuF0VQgTHsu
         bzPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Rk90bsYMJt5ZclNkQTVUd9tGxjSt+PKuql/N4zT35M=;
        fh=92TzYmFlWlsMs3BSMdCjekJM7Ou7Gbr7M17tb7y+bEA=;
        b=raWy+Pm6C8B4fTi0ph60kT/QzNTzmZGT3RHNF99M100aNxbdpd5UmfZ0h6mUOGu7/g
         AQ/Qj3+jAy2orLoOVlmyTLrPRJqDL/TgRC0tizGhaHc2lgKxjh2qrDlgyXBbzXcilV7p
         Y5GGhqsZ6aiEOZsnOFU4YiuPs7rmptvjTk1mpn5GZBehNHjouN9kD2PakSYQIGo7qzkS
         1MTXMJSRiEByWbiAWo7bNZh30ZioB16JtQtwWb+1IqVqEYDsWoypxXN8an+Amkys3Jes
         uPODMYjI/hq7iFinXxVR4N+SQ2vpHQinF/sXdwu75DvEwJqGn9WJhbv6EucydxqiXUCu
         vDRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790196107; x=1790800907; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Rk90bsYMJt5ZclNkQTVUd9tGxjSt+PKuql/N4zT35M=;
        b=fj5uuj434dQhWMBRsnRFA/nu8FFgaOaoOgX1YxCON+R4LFf8OAR+TGhOooxFGHPtU1
         JtC6nAMnJ83LIW56TtUhSeRA6Vp8xFwCOycTr1Pl50tWiS4wy21sQFPlESdfhHXHnUrM
         sNHXJkjMJ68YDP4eSRvclhoqSfYfnAf8KFLpksFg+9ocEM8q6BHs4I1254HMkkTqpITj
         4FWX0eOY2DJejrWXN4OwJVvaxEgo+w7V99GdFRrZcYh3/uCNwIeNcx9EV39ANVpTn8U9
         Lp0HvEV+oR8xqF4coA/bXTFJmToIkRNMoRu9oxmsdcCkuZg1fnQtwfE7GkOxoLgAVeGw
         oajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196107; x=1790800907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Rk90bsYMJt5ZclNkQTVUd9tGxjSt+PKuql/N4zT35M=;
        b=I6p0dMeYdU6vmIjx6whbGj0ZceCDp8ebf8AnRgXo34A0+Tp8Gh14eSPk+t3JHHqiNN
         15Uo7KmVmLOAfd+Nuo+q0nrp0v8GUGfrYaZu7dn5SffDNxINjeNllwtREkl34U+mYMZO
         QHR1ggczO/4yfljX5Vfa5/RiX4tmZOCSF1ekkdSA6lK4i0p7OZsDdAd1phZ0gO6rm0G7
         UxfSmxSfS12NgtBuSn/Fj0BBgM6UFmH4DeYGKgZJimjvA7eYm2hg3g6Kyruh7B2gbyA2
         g5vt/CK7K33dX70+n5+LfjImOIeyW8EA4j3OQh5ooIDTn7UWCjyAM8u2bsMBFJlwlWSV
         wUeg==
X-Forwarded-Encrypted: i=1; AKwUvBwSHUjZx3LFFubZrl32CG80nJmClLRdOLXDYgr+c+8E1EMIf+/7oOz3KJSDEvcGwUiM1nM=@lists.linux.dev
X-Gm-Message-State: AFuF++l4Ej7P9MG1oxCti/IN/EiGFrEyriO7t3Z31ty1pl6Vo7gWeiBO
	4az0PWtQK8Z9QYC6Zcb+a3yHS9v90YJUN5gY6rrsJXxD4OgGoasz7CKDbNNTLmXBZdN/HouGQqg
	9pEibfkkvZxEAlsaBueYNxVTYxgqCH2w=
X-Gm-Gg: AYBFou0RY+j7so8xODYL4qcynAF/aIc6/vlGU7zrV4duVmzdXRF43E7mfLkoD36945Q
	YIN8IL9EpQtBbIU81ZGu66md0sJHlwofwBEUlDAWgrFWw4lx0bU92XWUZiiSoJFLvhUboQXRZGt
	SvEb3I5tB5tpuCyj0ppO/5ckQ0E/rLU6VY9dYaxYqwCK/2yK5+TiZ/MfkzmQfurQCUovCdpai+N
	ivyHMwxyUH9208gnIK7KyqOaFWxRG+Iky5oyzwr86Nb/KCJ8dWdlSPiJxjXSk6z8wzYrlHPgbu8
	qjCT+bmmnLngGmpsUrQ3ChhCUmyUlt1j9aP+eLNAwqKOtlE4oLHq6GzwcRK4DCLY10QOBFySWRz
	7ZVRN/MjxVZVVoSY9/gkvoe8M4LOiGPsbgpm/ljgo
X-Received: by 2002:a05:6a20:d522:b0:3dd:f9ff:f88 with SMTP id
 adf61e73a8af0-3de0ea1cc41mr281016637.59.1790196106915; Wed, 23 Sep 2026
 13:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819144458.253967-1-joaofl@gmail.com> <2026092313-snare-goggles-ed1c@gregkh>
In-Reply-To: <2026092313-snare-goggles-ed1c@gregkh>
From: =?UTF-8?Q?Jo=C3=A3o_Loureiro?= <joaofl@gmail.com>
Date: Wed, 23 Sep 2026 22:41:09 +0200
X-Gm-Features: AcwNN1Vp4K1x9c17_VZLSp1YwuVUe8d-gHRrdZOHa6Ix1f3X9Cm2yhfxp6piCjw
Message-ID: <CAJMWnCiJsNXsEe9JWDGBzHBGiUToco31ysoHF_Loj-9=YMQ3GQ@mail.gmail.com>
Subject: Re: [PATCH] serial: fsl_lpuart: add support for GPIO-controlled modem lines
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Sherry Sun <sherry.sun@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Alexander Dahl <ada@thorsis.com>, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 02:53PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 19, 2026 at 04:44:53PM +0200, Jo=C3=A3o Loureiro wrote:
> > --- a/drivers/tty/serial/Kconfig
> > +++ b/drivers/tty/serial/Kconfig
> > @@ -1301,6 +1301,7 @@ config SERIAL_FSL_LPUART
> >       tristate "Freescale lpuart serial port support"
> >       depends on HAS_DMA
> >       select SERIAL_CORE
> > +     select SERIAL_MCTRL_GPIO if GPIOLIB
>
> Why not depends?

Because SERIAL_MCTRL_GPIO is a hidden symbol.  It is declared as a bare
"tristate" with no prompt at the end of the same Kconfig file, so it can
only ever be enabled by a select.  With "depends on SERIAL_MCTRL_GPIO"
nothing could ever satisfy the dependency and SERIAL_FSL_LPUART would
become unselectable.

The dependency is also not a hard one.  serial_mctrl_gpio.h provides
no-op static inlines for the !CONFIG_GPIOLIB case, so fsl_lpuart still
builds and behaves exactly as before when GPIOLIB is off; the GPIO modem
lines are an optional extra rather than a requirement.  A depends would
silently drop LPUART from those configurations.

Finally, this is what every other user of the helpers does:
SERIAL_ATMEL, SERIAL_IMX, SERIAL_SH_SCI, SERIAL_STM32, SERIAL_MXS_AUART,
SERIAL_SA1100, SERIAL_CLPS711X and SERIAL_AR933X all spell it as
"select SERIAL_MCTRL_GPIO if GPIOLIB" in the same file, so this keeps
fsl_lpuart consistent with them.

Thanks,
Jo=C3=A3o
