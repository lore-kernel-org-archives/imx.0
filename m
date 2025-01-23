Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BD820C481
	for <imx@lists.linux.dev>; Thu, 23 Jan 2025 09:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625032; cv=none; b=stNI5fazz0fVJAeQOXrmIeaHOKDqhcErdJ5KDKkirwcJ7KNqJLzAKto3TESZ0tR8h9Dl74Yq/xeD916BXwzbfb05JfPvwXU5CoO0eC1pCXs0cxQx1aTPxZy1OhIbv0/UKsX7rvbCLCzFtBycYAZMkEWzE9TpwI2DWb4XlPMy9ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625032; c=relaxed/simple;
	bh=ORES4doKXC6OgsgwMH6RHCDGLKFDrfrIs5G5ttL2Zzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6w8S4x81EHvnCOAttdh1iAakoZGShkRtlSaLrwuTHaY6sgZyiDNEkuOSoBc7o4L8EqTD5/o4zvPQo+kSlwonHkkJOfa/QtOFNYdvhj88+34qZIk8YRhabKfapIh7N9l3RQ+aCU9zrSRqFYP2FZEI79MCoXUY+LLi7GdaB+26Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXko7kwu; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXko7kwu"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f78a4ca5deso1004682a91.0
        for <imx@lists.linux.dev>; Thu, 23 Jan 2025 01:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737625031; x=1738229831; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGdtcyOuxt2RT9+lwZ49StADKtuaRGfqxJOX+UkuwVA=;
        b=bXko7kwuhI8bdIRQ80x2h+CpCz6taxqFUDQNYQXhpilC4Baf9ofGW+HJpxw/3Z2qMo
         vWhEeXJ5kHhjSsDedb54YvgzNCFysrfRWU9zUKYFl4cGqbCahESzMouI98bEhnNNia+h
         nz2ZZpTlFgiTQaXP3FhiVvXCLqSozr0PYSUUzCC6zVzRes5acIqPMKv2sz+h+bkjwR7a
         8NHZyJaXp0w92HJAVw0D6B5bEZYFu9JXvRM4IZUJ8KNT33w6/XxanXBQe2EJEegYizTk
         2JtGS+KUh/qsYFY4GGIJklbwJIdNd9osxwSHVNCTvbnYfCkjiX0DcPt0WYjbsznaeM8V
         TB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737625031; x=1738229831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGdtcyOuxt2RT9+lwZ49StADKtuaRGfqxJOX+UkuwVA=;
        b=hWZxFatqIZQ6LTiV8qlPByBV3VeHkIT5aHN+FBnYQUuK7N2oAw5G9XmfU2aQJWCBCp
         M1e75RapLEP4fgJm7iephG//LKun7v97EtM6AYldPpJsPALFGTz4bJQhQhjExLGKr8Dj
         jgYyILq3+Gb0VJvqebz36vimZ3XGyKRy1gKnA9xFRp6yIaJpEwqLjmeE+kRIbBhxR3Za
         ZgBr1AKzJwn5ZzokCb3HcnG/ZOUPaudu+y3LQ9sQKSMG84EpTkxIXqnmSCn4iPp4BZr6
         4em3ZsCgnkCjgguydkVmOmKI3RC5SnV/ERW3witAZ+Zuvxx64I73jQ/fFhWzFzMLLjey
         eaLA==
X-Forwarded-Encrypted: i=1; AJvYcCVmY9P7Du6CktYw7atxlYAHkNEDyIV95yXhYQJEcYEpmJJPV7bdQ85hXGtY53+eXTNvL30=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHqswK8R1miFkwJZ3w0+vnevNeLHBbCpvZkatJvKxSMMnzXh+8
	r/lSdwVQipmVPlmGKH4dv8SrdqeOX2vlA85LR7UGw7fFvBaQ4qRXsdGXG9jYNHR7mE7WUw+CaCE
	EN+I+VR+1kwTFtwV2veyuhn+VqRw=
X-Gm-Gg: ASbGncstz2Hv4GoB2CXD0vB9a7o8iY0vB3liA8KOqX5irKB6+aQxbgAk8mzwhBEBT1n
	HKeV/T94zQjQWRuAr+WARubQyJcoQLT/rwS58IcbNvNeCkIe2qdu2mBqweuTs7vc4LuDy
X-Google-Smtp-Source: AGHT+IEnMgFwe2uphGhaoA/OBA129gWwd+aCRTnCgaLxT5Yp1e4QddEuW/hTHVRtS543vNaOnT6OHl9roo9y4uSZvco=
X-Received: by 2002:a17:90b:1f8b:b0:2f6:539:3cd8 with SMTP id
 98e67ed59e1d1-2f782ca2291mr40437766a91.18.1737625030669; Thu, 23 Jan 2025
 01:37:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250122163544.1392869-1-daniel.baluta@nxp.com>
 <20250122163544.1392869-3-daniel.baluta@nxp.com> <Z5FNHnwvN+KeUrFY@lizhi-Precision-Tower-5810>
In-Reply-To: <Z5FNHnwvN+KeUrFY@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 23 Jan 2025 11:38:33 +0200
X-Gm-Features: AbW1kvb34GC_SCM7VSYzvFkZxRTCBRs29V4lQG1E1goV8dBrP-L8T9eLKeGMl2A
Message-ID: <CAEnQRZDcjwK39Ed00+mJw-epcUw2BV3snXsOBQ6-Mk-DXaxCdQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: SOF: imx: Add mach entry to select cs42888 topology
To: Frank Li <Frank.li@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	broonie@kernel.org, shawnguo@kernel.org, conor+dt@kernel.org, 
	peng.fan@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	Liam Girdwood <liam.r.girdwood@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 9:55=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Jan 22, 2025 at 06:35:42PM +0200, Daniel Baluta wrote:
> > After commit 2b9cdef13648 ("ASoC: SOF: imx: Add devicetree support
> > to select topologies") we select topology to be used by the board
> > compatible string in the dts.
>
> I am confused. why not use "sof-imx8-cs42888.tplg" in imx8's dts instead
> use board's compatible string "fsl,imx8qxp-mek-bb".
>
> More and more boards will be added in future. This file will become bigge=
r
> and bigger!

Hi Frank,

So you mean create a dts property named e.g sof-tplg-name and read the
topology name from dts?

dsp {
       firmware-name=3D"sof-imx8.ri";
       tplg-name =3D "sof-imx8-cs428888.tplg";
};


This was our first approach but then we aligned with the community on
using compatible to match
for properties like default fw path, default tplg path, fw name, tplg name.

Now dts should somehow describe the hardware not the software (e.g
tplg binary) used on that platform.
The growing number of boards will not be a problem, each one will have
a compatible in the dts.

But the concern here is how we describe a hardware setup where we have
a CPU board + a baseboard
like it is the case for cs42888 codec?

Our approach was that in our dts or overlay dts that describes SOF
with cs428888 codec to put the exact
compatible "fsl,imx8qxp-mek-bb" and match it with static vector in SOF
driver that you see in this patch.

SOF core relies on the compatible string in order to identify the
correct tplg_filename for example.

thanks,
Daniel.
