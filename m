Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79033287504
	for <imx@lists.linux.dev>; Thu, 22 May 2025 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940765; cv=none; b=TKARxsxlB49eyqPtzJKiqLGY8p8ih+Jsl0zPl433jvbsPDfkjrapuOJKPi8iLOcDyH7uQ5ieToygXpZFlt0Af8xoVzB4iHDy2yFUnVaYAJ063CI/NZxOgV7y9AqxkZZMX8pZsN/vq+S96SLPoygrd/j39s6URDW4+Pc3IHm791M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940765; c=relaxed/simple;
	bh=fFa+XHgjPqFLyF5EjVk/o8grCR8OeDIEJejOPFDEFq4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LYIe0TMz1tWXJNcu3Wv9hFpYa3Gz0RQBQgjBs+oAmjXBAs9z6vEyiVQLipgEObdrnVwUA5oWArhx3NT3vVUd0rxCm/7aCe73MD7V6VaZtSIAr8xmd02Y72DgJK1i1K2qaOOZUAOqOfg1QLRCU5x3mHbe3+Np1Jz0NDtTPaCTB88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=dMa1W3Md; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="dMa1W3Md"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f8cb6b3340so87008116d6.1
        for <imx@lists.linux.dev>; Thu, 22 May 2025 12:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747940762; x=1748545562; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uAfLd2+eW+OIWxtnxvjxahlHfrrw/biV9Jvjs+l5fkc=;
        b=dMa1W3MdaDDtW0gC6YoMDDsRy6SxZN8xKHnT13WQ84ZjoAyBby3YpKk41hjtxJErAj
         zYEys6mHMR6C36dMWxji5gZkMJJb33gcSt+GqSXa/GfN4Cg5fizfPtkRILwDWQUNGpNg
         vaQ6bugSJ9/45sXoZzrPx6AW7jqnG88Qzw58nHAZ3iW40MVt8+3tQWp3leTGDFya8R0w
         mjM17lzfdq+nLcr7gr/qYVotF7qlahj/t5odO2rajkHH3YiWwqxe3l1L+xusSqnTLoLL
         4O0sMPe4tNuAESZknN4I2qq1wzo6T4AqLpofLxbVCevgjqMXKHlDO4q8kKJYduuH7qKs
         viPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940762; x=1748545562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAfLd2+eW+OIWxtnxvjxahlHfrrw/biV9Jvjs+l5fkc=;
        b=Qj5t+nnRtOfZ9wFZ+SHg1WYlaRbB0Yjr05MslxfRDTodTYEkQhngpnq6xHtxdSrVGP
         NWFROha4ty/PlqyV5O4NixbaY/qDq3/sayHqvsMhmSQ6MVKplNg4PX2TLbS/Y5cHXqvM
         7IxlPWRdFgSthHtiw+VgoB1hert7VXt0o5uRU5BGew/1H90KDR6jHyJ360gmKgPTCb25
         /c73FxbJ/lPr2Mf5FA9OnOsQEileo10xxufDYt3+pjw+fnAPO06AL4gDr+MXihstZNJs
         SZYsMZeLTF8U6PmxRE+3v3RFHSXa//W7il+0TbEYWlAQy6WWXcew8HIBiJ9C/ItnhEdq
         TQ8w==
X-Forwarded-Encrypted: i=1; AJvYcCVM4zySIEfYDGXqf+7vrurCYvL7Shce/PkkiBsd3rq/zTXXhvxnDLiomRWg89iTuc8RVeU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAkcBb35Ub9GgZPdzjwz0CQnKWr1cGN4MAuWEiRLkbsm6G0yvP
	XiEmoAaVHlrOVxZpLlBOt++Yql8sqPH+V8dD6SZRLsWLcc4Bx8XjxF1HTxiFq2IUQXc=
X-Gm-Gg: ASbGncuBmBoHnP/CF0/6HbMYjZSOfA4rDeg8sGZy6EP8QJgh6uOnROgZgPhVARG3r14
	msq5fZjZwAX39nxkNLi9fftbzJvy4MXcpxljxoIS+/mIQmn2ie4Hqsc7vdbDw4NHFSsk+YIiEIv
	lPCBrzY3lk6liubmPzjZEG2ap8w4/Ca+bpZR9Jim2vxF1TjDGF/A13U8tAsTKXJnKgluu+7dYf6
	4zveHP/DT44Z/NLJcDoCUa7g6XoNW/y4lQ+xs8xElJf2/eCLI8EkxHw+Chtd1OViPvXfrJIOY1W
	HCP97FmoIWd5X1EVxB8fGzYEQZumcBZLaVBGlCxlVj0Ha+3QOeI+X56g
X-Google-Smtp-Source: AGHT+IFMHoWCgYSKrp77j14dN4ezA6lfoJ+4Q+N0FgBs+1y4jyW6o9IHP3m48s9bZ43HqbDB/3wpZw==
X-Received: by 2002:a05:6214:402:b0:6f2:c7b0:3b16 with SMTP id 6a1803df08f44-6f8b2c32addmr375505626d6.6.1747940762274;
        Thu, 22 May 2025 12:06:02 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096dda9sm102909986d6.71.2025.05.22.12.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:06:01 -0700 (PDT)
Message-ID: <8b18533170e7ba395c574de69768dcc27f718767.camel@ndufresne.ca>
Subject: Re: [PATCH 1/1] dt-bindings: media: convert fsl-vdoa.txt to yaml
 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo	 <shawnguo@kernel.org>, Fabio Estevam
 <festevam@gmail.com>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org
Date: Thu, 22 May 2025 15:06:01 -0400
In-Reply-To: <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
References: <20250411213601.3273670-1-Frank.Li@nxp.com>
		 <174448105342.1415739.9619142538994119426.robh@kernel.org>
		 <aC9xv08a5k5Pz1t+@lizhi-Precision-Tower-5810>
	 <b97c254c5169acb32b9f65f71b363a3eb1cfc8a2.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi again,

Le jeudi 22 mai 2025 =C3=A0 14:57 -0400, Nicolas Dufresne a =C3=A9crit=C2=
=A0:
> Hi Frank,
>=20
> Le jeudi 22 mai 2025 =C3=A0 14:49 -0400, Frank Li a =C3=A9crit=C2=A0:
> > On Sat, Apr 12, 2025 at 01:04:14PM -0500, Rob Herring (Arm) wrote:
> > >=20
> > > On Fri, 11 Apr 2025 17:36:00 -0400, Frank Li wrote:
> > > > Convert fsl-vdoa.txt to yaml format.
> > > >=20
> > > > Additional changes:
> > > > - Add irq.h and imx6qdl-clock.h in example.
> > > >=20
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > =C2=A0.../bindings/media/fsl,imx6q-vdoa.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 42 +++++++++++++++++++
> > > > =C2=A0.../devicetree/bindings/media/fsl-vdoa.txt=C2=A0=C2=A0=C2=A0 =
| 21 ----------
> > > > =C2=A02 files changed, 42 insertions(+), 21 deletions(-)
> > > > =C2=A0create mode 100644 Documentation/devicetree/bindings/media/fs=
l,imx6q-vdoa.yaml
> > > > =C2=A0delete mode 100644 Documentation/devicetree/bindings/media/fs=
l-vdoa.txt
> > > >=20
> > >=20
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >=20
> > All:
> > 	Anyone pick this patch?
>=20
> Thanks for the highlight, this is stuff from before my time and I had not=
 associated it
> with CODA initially. I've picked it now.

Actually, before I do so, any of the following warnings should be addressed=
 ? I effectively don't
see a clear entry for that bindings, but could have miss-read and there is =
a second warning,
which based on having Rb is likely false positive ?

---
[[ATTACHMENT|junit/./0001-dt-bindings-media-convert-fsl-vdoa.txt-to-yaml-fo=
rma.patch checkpatch.err.txt]]
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#21:=20
new file mode 100644

WARNING: DT binding docs and includes should be a separate patch. See: Docu=
mentation/devicetree/bindings/submitting-
patches.rst

total: 0 errors, 2 warnings, 0 checks, 42 lines checked
---

Nicolas

>=20
> regards,
> Nicolas
>=20
> >=20
> > Frank
> > >=20
