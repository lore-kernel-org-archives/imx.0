Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7A422256F
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569173; cv=pass; b=C7x7kjvL3n4/jadf9IlKc7nXpPGRIMvzCkRf0iaWFOUIrz4u+Ud6D0CfhdfdNHpuYpDSQIdLsCLR7wiKOcpx9gCDVk5sbFwA9UXXGW86vkV+wNoyFszBWbmaSNajkEeUZg92akY4pmUvEYyyGV4rKnZoTuDxa6GO1KOD5ClAWOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569173; c=relaxed/simple;
	bh=5QKkZmeT7DXJGFJhrM4fZXkVbNqAw/WPTCXP1ArbBe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKk9bMfP+UxKEPo336UaLN/Q9YALxx8HgNVjgXGKgyo0tHjBgH5muOiI+NC+Q4DxKxi2YAlIj0e5qvkKuwLI87dXpvzjcA06Nhog8rOg10LJH2nNwLdONqLJaB8mvl0m5498JXOmVgkfMImA3jVqIqlFm4EBH6Saxg6aS8JAIAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eH93QrZd; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH93QrZd"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-121bf277922so2621574c88.0
        for <imx@lists.linux.dev>; Fri, 16 Jan 2026 05:12:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768569172; cv=none;
        d=google.com; s=arc-20240605;
        b=BMF3L6yMNtS9bNLbcCR8n6cD8v0VPH82NgV+FbRJ2BawlmDrIeZ+H3XJvdWA3PnNRD
         eMCxmg8hocbcoC7YjJw+sa6JoouawOBNkwSrFkVpFTE1U96N/FSfscW5OIGSk1uk+qcu
         9eVPooRLKqqmzlsTL7nFZAozyfC94iArNWMCd8Pisz2J9JJ5Qv+sVK9QHeQtq/8GGt59
         RvrVFXmQPju5E62lpMr64yynaTXrbBpQk+vG2M0YtXnCjehCD62MdhAyYshn7N08ZMic
         hGO47PhSaolU6u/GslONvi8DtFbUnzpzNsUzFHacB3FMwwJHnXTT26zHIdp4RNg4SZWw
         CFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03j7E/5lSgdBFIcHFHyLJRuwczvGgB4tG0icSZxNhK4=;
        fh=ZHHX4GEbF2LWnnOASqO6dxeijE52D1OuJGCyIaPIGQI=;
        b=bvI3uB8qOJkMDn099kZhbKJQ3+7FH/FF0pSe2ooFI6BZbfSllL3qqZqIew/jwljNaP
         5s+/jMbcpq0VQUnklgnty8KEbneO/21Cq4+BWdWYY85Pw7m1viKoJWw0tnSjnvjHCML/
         fG4fSH2Xx4Gkf0FY6eyKeUDKY3Py+QRsx6u0HDJuSdAwqchDuGH3ckf01B7EheRKrcIf
         jV2c9+qMHDSr5RhvRqYaNMCzP6AiQFfJg0tNzWT/anxVmcjPHirRyR/TmHy8ZdYMV6sr
         PHqMhLu6P58+xh9mRqFGqzU2GaZtFMu+oQl1DV3J/h4OxkrFhmFoNZpx858VHk152jrv
         Ttig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768569172; x=1769173972; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03j7E/5lSgdBFIcHFHyLJRuwczvGgB4tG0icSZxNhK4=;
        b=eH93QrZdt9C+eCrD1I2DeyiaV3xntTpP262unNvySP/wfsq/wONeY/gO5qNd1Z3r9O
         Tuct/IxzMb/jwOuDNio98PsUnUk5MJ6jOjc3igluSFnrSuxwAp2fKB0Y+kJpsNT9hJrV
         cCon92uH1z/ZxfzwUFrOJF8mECPmQWZKu+wtEwCgbKklki2gGM1s5234P3OTYH/rzGod
         G0BNcDwSLxSWkY9SglCq2/GItBQ+w9aJloZSDX7HCNNxp63BI8uZnm2Jh04AwUeDJyEE
         izPeTW+ru0/2Zl5lVayXhFmKRQDCqLY+0fRXd0GyK4NfpsPUgKpsRl+PLPLhOYWdIpII
         5ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569172; x=1769173972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03j7E/5lSgdBFIcHFHyLJRuwczvGgB4tG0icSZxNhK4=;
        b=Zqs/NT1RTcNEUaVQUgS9eVRqKxBw8SRZ/qyM7K5WJECo7yFN4KJlrdn+oPt7U0fpqi
         uBYFTpn0jzsHHEJopdxdiDzUTAF1JCE2ShNAhQg4IQjZrWl0TqXBJDVkmmBtNXO1mUT9
         VV4vXor3oKryxLryn+fhHrCRFAq4OQ86iYn/wzbqF0cjgoa4Bq2uaTq5dZHnTMkzoWLk
         qxGgg2DC5VYkA7RRn3GPQLonAnL8GzdXp71YiIbsR7RlgNcUAemKfdvfDGMdMKHp8nNx
         f2CjXHYhI+p9gUtDUvhLOf0zz05y6+6HCGsXGLwjl0f94nWURRRDoSLOCrgltA+TJ6b8
         uKJA==
X-Forwarded-Encrypted: i=1; AJvYcCW46zd7ma2dSrVRpowuQuCGZopSgMs6Km3+RL+TwNOl2lDob2Z623NY8yC7TklZQImbz3A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzJUbJeIOtYOWbSzo2tN+II9ohfMBgbDBJXJx3FPKmO8bxmijY
	q+Xy3/cHpcgeYSODs/2sE8N9d3alwZj2RdUGH4snKKVXbg5X/Tmbb6JIF42hBpJjqL+mVF+YSqQ
	fxRHCZCsHzoz0VJPUXzGsXen7wPlv1uQ=
X-Gm-Gg: AY/fxX5kZdpo0KbiWRCExh37hOyx3pAx0Di9uu39VUoKRmbBG4SV3INFJxu3QqIpczq
	6fbW3S/gcQw3GCAD6wcbApuXG94lkab8UXLUyapXWstbKYCgltT96OquspnX8SKiq/X+6C7g0Yt
	pjOs8aMhmY/FraDyCEvoBU9wowKM+11mMOK2Lv7FStcjkaJzRFIynvZcbjg7+IcdoQFM5wZywog
	15nbIHHIb8XtsMINl6u7AbohgwIZnhQpwQPN2IlPEdXz2Skor9XX1dCA0XBE4+/UrdbiN/qnr/P
	o3HumK9xRMXpS0wSDG8eThf8m6bJIFAyZPm26ShYdDxSHTr6QjB+kpsd6k1ERG053btdcY8RPVM
	oqmmu2eBoWw==
X-Received: by 2002:a05:7022:618d:b0:11b:9386:826a with SMTP id
 a92af1059eb24-1244b37be53mr2062623c88.47.1768569171566; Fri, 16 Jan 2026
 05:12:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
 <CAEnQRZD2CvQLO2hBDbX2H8PeeNkzQmLoK6jzeF6HKw8HHa8ukg@mail.gmail.com> <aWo3PZni1Pb9T6FI@bywater>
In-Reply-To: <aWo3PZni1Pb9T6FI@bywater>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 15:15:32 +0200
X-Gm-Features: AZwV_Qhavkf8CkCe2llxYLM2ksgSNEeosl9zOuFKwiRZDMiSYX1oM1egYm13IpQ
Message-ID: <CAEnQRZC4QVV-AmMAdQHujTtJu2Lk8MQ=J3NRAFLQ1tZAPE6tOA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx91-11x11-frdm: fix CAN transceiver gpio
To: Francesco Valla <francesco@valla.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 3:04=E2=80=AFPM Francesco Valla <francesco@valla.it=
> wrote:
>
> Hi Daniel,
>
> On Fri, Jan 16, 2026 at 01:40:11PM +0200, Daniel Baluta wrote:
> > On Thu, Jan 15, 2026 at 8:25=E2=80=AFPM Francesco Valla <francesco@vall=
a.it> wrote:
> > >
> > > According to the HW schematic, the CAN transceiver does not have an
> > > enable pin but a silent one. Fix the GPIO property name and polarity.
> > >
> > > Fixes: b4bf5e55899e ("arm64: dts: freescale: Add FRDM-IMX91 basic sup=
port")
> >
> > Just for clarification GPIO 23 is connected to a pin named CAN_STBY.
> > So I wonder if it isn't
> > better to use standby-gpios instead of silent-gpios?
> >
> > I am looking at FRDM-IMX91 schematic file SPF-94610_A1.pdf.
> >
> > But on the other hand we have
> >
> > static const struct can_transceiver_data tja1051_drvdata =3D {
> > =C2=BB       .flags =3D CAN_TRANSCEIVER_SILENT_PRESENT | CAN_TRANSCEIVE=
R_EN_PRESENT,
> > };
> >
> > So TJA1051 is not advertised as having a stdby flag.
>
> Regardless of the name of the net, the functionality of a standby vs a
> silent pin is very different. In this case, since the TJA1051 is
> including a silent pin (pin S in he datasheet [0]), I think it's better
> to declare it that way.
>
> In case someone adds the support for a phy-oriented listen-only mode
> (which is something I am thinking), this wouldn't break the integartion.

Makes sense.

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
