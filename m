Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0E5188CB2
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723483794; cv=none; b=O/NDk5rRJUoo7nj+hnoGpuHbifJxJOoa8J/A3TSk/qFHr6PF75D5HSLwnez98nN4TTZIAOQXPc6CRb+ezFH2KyOpl5zzNt525tJEfRWYNXb/siJ6yhygC8RBGfUEh8igS6Y0rSIo5UpTOyIutOdINZeJwu3ld17OIaTbdu0s/b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723483794; c=relaxed/simple;
	bh=ZMRNbjL+wxtlYnhgMC1O+M2KBcMWEJ4sd49/ahmx+Wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKzZKgwLVfPNDPs4+SarZ3EFErOiIBtQ1PwA6bkx6GVypRsoBP7e32ssA/XbSKcJOVa9uwIYRiu0qeiTUn/QIso0GnCNFAcFlzO5aslZZ8yayVoakAOatAjR6V81gwRxXQO33R0i+D0p7Qb4r90Teb7pJvyu8vXlDvPL3g5+2lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dj4B7ErO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dj4B7ErO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E362C32782
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 17:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723483793;
	bh=ZMRNbjL+wxtlYnhgMC1O+M2KBcMWEJ4sd49/ahmx+Wc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dj4B7ErO/CP6ZLdD536O+BA6aLuIyPIfsgR1Gi5jpzdsrUNydzLsFM1hTgeTNNJDQ
	 QhkS9M8zyYg9YiZZA3gNI4GQtVOQdrIIGv53+egr0WRYmqm0jK3UhbbIOud2X4o5u2
	 /X99Uwy9XH1y/9SHCn0LBaisV/HvNIdg5uRGs5d/3DbD7RRstL5qUjXSKsvsPx6Gl3
	 T31zoIJWA7Pf8Rur3ZbcEfns6XDaaQk3veMxfRESCy39mXz1ECygNh+nSig5ZkMBEu
	 askEcqSawLJ9NcfNiHiWLMJ7SJbzNzffPUZIK2hVBQcGG4a1ixvAyCk3BZNpb3AOxL
	 /hma3ZiwBmT+g==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f1a7faa4d5so36323471fa.3
        for <imx@lists.linux.dev>; Mon, 12 Aug 2024 10:29:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeBZ0zau/PqkBLRi5I8ul77ZmeSQp9bUWSWHaMlo4q3+wpewpqaGRrQ859OqVCGTubZqk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5brCWMLBd0N94lic7+DfK6x1ZpzIObAqhYPrdfv8tWqyrB7K/
	OfKAhx4mCcNiiK/s+fPvthyjjGTB4EKXGLxbY4kWEq8ctFua8VQz+UusgmvwhtVIS5CAqY6/SkM
	xe36bQ1MEme8woADYEAkUsAj/2g==
X-Google-Smtp-Source: AGHT+IE9wc5/vzAjDKeN2XhVueDGhex+PvvstDZfZq09zwIkHu1hg7cHE20vFxpTUw1TOpUPaqzN59nU/oMrltfDIoU=
X-Received: by 2002:a2e:851:0:b0:2ef:307a:9988 with SMTP id
 38308e7fff4ca-2f2b7178816mr6174081fa.35.1723483791791; Mon, 12 Aug 2024
 10:29:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808153120.3305203-1-Frank.Li@nxp.com> <20240808-frosted-voicing-883f4f728527@spud>
 <ZrTphsdTZVsbiGo/@lizhi-Precision-Tower-5810> <20240808-linoleum-evasion-ad7111a2afc4@spud>
 <ZrTvB/3GGIhEOItT@lizhi-Precision-Tower-5810> <20240809-freewill-compactor-4f441a4a60bb@spud>
 <ZrZNzqDKUaOqzl7k@lizhi-Precision-Tower-5810>
In-Reply-To: <ZrZNzqDKUaOqzl7k@lizhi-Precision-Tower-5810>
From: Rob Herring <robh@kernel.org>
Date: Mon, 12 Aug 2024 11:29:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLzvEpXbTk0XjPuErz2nRaTXX1DP9WG8yshULcVv0bS-Q@mail.gmail.com>
Message-ID: <CAL_JsqLzvEpXbTk0XjPuErz2nRaTXX1DP9WG8yshULcVv0bS-Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: lx2160a: Change PCIe compatible string to fsl,ls2088a-pcie
To: Frank Li <Frank.li@nxp.com>
Cc: Conor Dooley <conor@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 11:11=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Aug 09, 2024 at 04:07:25PM +0100, Conor Dooley wrote:
> > On Thu, Aug 08, 2024 at 12:15:03PM -0400, Frank Li wrote:
> > > On Thu, Aug 08, 2024 at 04:55:14PM +0100, Conor Dooley wrote:
> > > > On Thu, Aug 08, 2024 at 11:51:34AM -0400, Frank Li wrote:
> > > > > On Thu, Aug 08, 2024 at 04:34:32PM +0100, Conor Dooley wrote:
> > > > > > On Thu, Aug 08, 2024 at 11:31:20AM -0400, Frank Li wrote:
> > > > > > > The mass production lx2160 rev2 use designware PCIe Controlle=
r. Old Rev1
> > > > > > > which use mobivel PCIe controller was not supported. Although=
 uboot
> > > > > > > fixup can change compatible string fsl,lx2160a-pcie to fsl,ls=
2088a-pcie
> > > > > > > since 2019, it is quite confused and should correctly reflect=
 hardware
> > > > > > > status in fsl-lx2160a.dtsi.
> > > > > >
> > > > > > This does not begin to explain why removing the soc-specific co=
mpatible,
> > > > > > and instead putting the compatible for another soc is the right=
 fix.
> > > > > > Come up with a new compatible for this device, that perhaps fal=
ls back
> > > > > > to the ls2088a, but this change doesn't seem right to me.
> > > > >
> > > > > It can't fallback to fsl,ls2088a-pcie if fsl,lx2160a-pcie exist, =
which are
> > > > > totally imcompatible between fsl,ls2088a-pcie and fsl,lx2160a-pci=
e.
> > > > >
> > > > > Previous dtb can work just because uboot dynamtic change fsl,lx21=
60a-pcie
> > > > > to fsl,ls2088a-pcie when boot kernel.
> > > > >
> > > > > fsl,lx2160a-pcie should be removed because Rev1 have not mass pro=
ductioned.
> > > >
> > > > Please re-read what I wrote. I said to come up with a new compatibl=
e for
> > > > this device, not fall back from the existing fsl,lx2160a-pcie to
> > > > fsl,ls2088a-pcie.
> > >
> > > According to my understand, It needn't add new compatible string if n=
othing
> > > difference. for example, it use fsl,vf610-i2c for all i2c without add
> > > new soc-specific fsl,lx2160-i2c.
> >
> > No, you should have soc-specific compatibles regardless. Just because
> > you got away with it once, doesn't mean I'm not going to complain about
> > it here!
>
> Rob:
>         What's current policy for this? Not only for this one. If new SOC
> appear such as iMX10 (maybe many derived chip i.MX101, i.MX102...), there
> are bunch of IPs, Do we need add fsl,imx10* for everyone, which most part
> is exactly the same as old one and bloat binding doc.

Yes, you do. Do you really know that something in the design hasn't
changed? Have you compared the RTL between the versions? The only way
to deal with quirks without changing the DT everytime is by having
specific compatibles *upfront*.

The "bloat" is never that much because the IP really always changes.
QCom wanted to (and did) use IP version numbers for the same reasons.
Guess what, the IP version number changed on almost every SoC.

The exceptions are really if different SoCs are just different
packaging or fusing.


In this case, I'm inclined to say just match what u-boot creates, but
please make that abundantly clear with a comment in the .dts file and
explain the situation in the commit message. OTOH, just adding a new
"fsl,lx2160a-dw-pcie" compatible with "fsl,ls2088a-pcie" fallback
doesn't hurt, and we can just move on from creating a special case.

Rob
