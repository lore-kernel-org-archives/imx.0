Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D061C396B68
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 12:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772023700; cv=pass; b=OijjoN+/RXXf9t18hpwQPsuUMcSgzSW9ZJMJUl9f5FTKAeyZqZkCEklCFbMwwEfW2b3dcHJg+e2jP0OJ3ewJBKSpcmxrWO2Bn0b7b5r+IIlXOJ+3toZUpCKZp4BGRlV9RlGxCba/Se/TbmaJEmN7aTtL4ugqMWQ1DRWJzHz6FCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772023700; c=relaxed/simple;
	bh=FWJDMCjotwL8+vidfq72dRHNjqIZCF30W4A6P7seh6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cl+Is0ykSS5MXS3uksM8PHlBTF9FjaMUGZEAbhW3YjqnFL2oZLjM0Izs5TH4Cyf9L1cMWqAHtNrS/AoqnwYgLQ6H0OrkBAX803ylhRw+fudkV7M1gcD+GHg47F+WZaKplDvw8YnqSSfKBl5pyS0Z0BAJHOZZrnF5H33TrcHz8Y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTi1iGsv; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTi1iGsv"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70bc5b4e86so1522796a12.0
        for <imx@lists.linux.dev>; Wed, 25 Feb 2026 04:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772023699; cv=none;
        d=google.com; s=arc-20240605;
        b=O/OqX+epkZvCEbPM6vd/hH4Y33h8YeH2XekGkFkae75Z5wHxrGf9XLacFIkBxr5ERN
         MKDJQtRpk/+l5w1S8oLQNVoM3YiygO+5h0HF+nE6W8UTwcAcYHJ3aKJJM0Now/ReU8q4
         Q5wgkJOKY0laHIJpe0NO18HFd506pRF9wcRyuiLc+nNU6jqK25hmU4doK25eNUN9xWqT
         o72vu9T/nvHULk9kMRq4bgsy5RYRoEQprHFNrLKvbOrQ0oNVGzhMCnUGKBHuQQUaeAUB
         wpXhgGkhlJWS43i0nTUVLAFWukfcTlXP2jT6zdqembnboEQykDSuHLihffVwEguf8q7v
         p+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0joXdqCmpjckjOnaHr+/OVg5l+LX4VW8NWHw8AyruZ0=;
        fh=uciz/f48tVymjAIm4ePQ7bI/NET8D3OxOkgcHHgjsXE=;
        b=JfWXiN5K9tiXLhUrEtVtNAOC+pKHEE6dUhQdetzEl36zp+A7oyWBBpCNCDvCKDksLs
         BJm1i7riipN0xt9iFS8QH+zB6cw6HfpS2wdOu31v/vUnkq9xc9xJnCVQeRUVNRKwAxl/
         EtsX5ymQ+nevtSLLPuN44N7SpYBkPNcppmYJ1yuQPce2ImIlxr46s9MTBacnLXXdjFua
         wyj5Rd3UG1hrJDhn3W9QAAJkIjez6iu8Zyl+YUPH+ujDotgvzniv2npimEu0EPvMTlM5
         GdTQCvK0Xmt3XoXtELjwpEUSsK2Yzq8D8MAHA0dGMjYNvkH5GfBEh/tNYFrxqlWvZ96y
         aOyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772023699; x=1772628499; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0joXdqCmpjckjOnaHr+/OVg5l+LX4VW8NWHw8AyruZ0=;
        b=WTi1iGsvlDZSpnmal+ZFWtyKWDkiGBma5Zd8XHGtZbztbTnqkJZVUTjjGtc1VIvgae
         qPkbD5m9o8AGaR4BrL0iL2g9FrO0I+aDliARsxRkSwZ4wbhBiD4yLYTMoWUj6+4wjEN6
         ywoVRwsoZ0dhmHeHPj44UO3NF2+X9JxPLvyJUUVKUBiudzMzo1Be8yQiasGbFGhJtSb6
         j+crlUqnFmSMVDSyOF47QRWN+OnQalP/ZWhIkFm9NinkG06esFnnIc5gj9Y6IR6wpopc
         KT9fN9/gDtoqjGNMPkH5WD8/7vnW1ti+3DMekwcrt7cDc54+qG4L/thqF+yvaLjzP1Iq
         q2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772023699; x=1772628499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0joXdqCmpjckjOnaHr+/OVg5l+LX4VW8NWHw8AyruZ0=;
        b=EZiQ71KGJemN8ozWqookjr4kTm+ZnZMkWXX4j8rDl63WDonRpSZPd98j9HSKmWgOh/
         om30P0rC7XyCwUHWSVYzkXOTZBnLIef3dSbawDbQUKiZBBPMtJ7w7Ke+6Cn3Tl21iygg
         za8Wly8gHTHSNC7hrNJlVe0cIgAi92/MtguKp3jka2fE1OW8LgeDYaqmDSv7oX4cVbwV
         wsQvlHDmHvKlImMie6n/jhqdR0gB3bMUEIiD00gU0e1yHee8ALbp0cJOsc5EHQ3QbrwU
         o1ra5r66mC4W1s0Gh4UqA8m9nKEOsB0weHYxZAkkdpCj9efOhiTdek84zdMnRyXt6NIR
         hY+g==
X-Forwarded-Encrypted: i=1; AJvYcCWdZcwXcbu1YVgSKLjhLxTF4f4rTbOXcFGQPPP+fOzBQCtitWfpLqRsMNTrk5cpAcOpCGA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbZvLelRfhozNtFOhWmRpo01EW4qO+EAfv4dxDDuIteelFfd3A
	H6Ag7n7CB/jzrWAXqVWCh4UWcWBQVGoP0MMlM6GbZDfUmOtcJNg9X9Gkrc1zGmSwd1UKA7FhU64
	jvvF1FwRVBdknBD6QL2L6oXfLK9f9P9g=
X-Gm-Gg: ATEYQzw0WCcF/raHrUmj5N9JbtpHvoIA45WB5DF0AWcQRhm97k2p4EU5AjY8FF38inn
	kz7qWCi/8/2MftpO5uVbwnd5velwvM8t2KYRfA0BFt+D8sKT2XiNattwKPR4Y6bABxIZKAfmb91
	e3+5coBBO78Ga0QaQZb29Di5F4c4HKLC0W+8gYpuDpT3PGZ3pPE+eIJQTEAZEC4foUl9h6YXXPF
	m7SVW00vrvcKDdjys+SCQmIcy/KOIYaoz96w1qFzWjemdrBDBH0TMvCwsOO5sOt3fuy8Z3UAm0Y
	krnFK20DlH69xA8iQw==
X-Received: by 2002:a17:90b:4a4b:b0:354:c602:a573 with SMTP id
 98e67ed59e1d1-35928bc4ed5mr108304a91.27.1772023699139; Wed, 25 Feb 2026
 04:48:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224094527.169215-1-shengjiu.wang@nxp.com>
 <20260224094527.169215-3-shengjiu.wang@nxp.com> <409f6214-7ffd-4076-a658-f4005adbe101@kernel.org>
In-Reply-To: <409f6214-7ffd-4076-a658-f4005adbe101@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 25 Feb 2026 20:48:06 +0800
X-Gm-Features: AaiRm53oiJrh-4UikRVcBaU7QuDhh_o55M-8VgnZYHqUuq2eisQEPvQ0Y1s59EE
Message-ID: <CAA+D8APngdt0vx6MJ7Knj_-0Ngr=1czTeDZruhqA6c7zRSfeDQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: add support for NXP i.MX8MP audio board
 (version 2)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, daniel.baluta@nxp.com, 
	dario.binacchi@amarulasolutions.com, alexander.stein@ew.tq-group.com, 
	Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, y.moog@phytec.de, 
	josua@solid-run.com, francesco.dolcini@toradex.com, primoz.fiser@norik.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 6:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/02/2026 10:45, Shengjiu Wang wrote:
> > +
> > +&ecspi2 {
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +     cs-gpios =3D <&gpio5 13 GPIO_ACTIVE_LOW>;
> > +     pinctrl-0 =3D <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> > +     pinctrl-names =3D "default";
> > +     status =3D "okay";
> > +
> > +     spidev1: spi@0 {
> > +             compatible =3D "rohm,dh2228fv";
>
> NAK
>
> You don't have there. Stop faking up hardware. NXP received this comment
> multiple times already.

Sorry,  didn't notice this was a fake device before and didn't check
the history in
community.
Thanks for pointing it out.  I will remove this node.

Best regards
Shengjiu Wang
>
> Best regards,
> Krzysztof
>
