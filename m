Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C585145A1B
	for <imx@lists.linux.dev>; Fri, 16 Aug 2024 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723850080; cv=none; b=OxdlzYc3WJr67RD+ifxI0yS1uG/a8J9TwZ6JwNxQH5sdA5Gl3oSkPhhxkC0lGxiWelaDFxSVmfIm0yGxKF5fj7VQC5hTfACjzgUOFIat9vwBIARo1R0IPd+fde4P0zgfpUMJAn48nO63qLJL+ncOZiWLmK14DDcMcPiHtHD3crE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723850080; c=relaxed/simple;
	bh=CqGF+vIIR37/TO1jmzSxW7Ztfy1Ee1V06lXhLznk3pU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4oKU45yS8jkb6QSpRXrsJrs7KZqA7d6nd38q2inWCjtg9fs0QrthaXYwEw3USstXal19dZ1R2hJKIwSPyIB9fiwcSG4p8pT4c4MeHHv1xq6aREBYR5eBYGZ6ktIIPwF8KejAY4DXid9BnAD0Tk3x29/3TeZ7w8csPEf5bEe9Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net; spf=none smtp.mailfrom=lixom.net; dkim=pass (2048-bit key) header.d=lixom-net.20230601.gappssmtp.com header.i=@lixom-net.20230601.gappssmtp.com header.b=lNgd3gEY; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=lixom.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20230601.gappssmtp.com header.i=@lixom-net.20230601.gappssmtp.com header.b="lNgd3gEY"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-450059a25b9so23802271cf.0
        for <imx@lists.linux.dev>; Fri, 16 Aug 2024 16:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1723850078; x=1724454878; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueNzYl5S7O1PRoMwwd5P/GZe77RoSlXmg5l4LsdO/TU=;
        b=lNgd3gEYbIIU5j9rvaavXUlc5u17foD15Ed13wMAozgGX+pVfsGSE1d55bc0VITZyI
         0rPtKaspyAGlxxzqmzgI+xOzQbpI0UyKAxv0PuKr3JUDdYx8wcPxslDwjuEupu2L7q9e
         BM+EGelYNPxYkq4x7eNSWGKCPppj0NTDqSc+pNtmj3vlnEQaZO1xyYpIXxr5u4+m+FTm
         MOYbzzkO5KSKehe/SYNLM5S+1is/usSemWZ1YCveFu14HA8FQAG91om4Fsl94D68h7Id
         61u+6GX7DFnD+Mgcs7+gOW5Xc8UMSDzaf7PwTNY64KYcuNa5kHUO2EWhkrPvhE1g/GJv
         a8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723850078; x=1724454878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueNzYl5S7O1PRoMwwd5P/GZe77RoSlXmg5l4LsdO/TU=;
        b=fjDkmY7UFKlvIW5VTYjfIt6FQ4BPDbQ3QBwyMl7vkU34v0WkNdTI8ugL5pGfKTCiI6
         XQtvwmxBpg5ydTmSRgqp23lLVgCsm1cv3MWEJM9203ewz5euItxIb2rO/099JApsjDsA
         aNmEaEJVFSr4q8crEySBmZPhb6o4bkLOGltw0SrJlk1x9ZtHzt1KzCF04m/FJlOIR6YO
         XDzy+jYGPm4dzW9Q8bDFOrQmd/ScFB4GVHnxENXw5/+3fJWLJVTT+YkRMD9PKNd0ineJ
         fgZusj/Nhe+lFPo5O8bAMsrjdpX8Wosvq/08PjiDueuKV5r3xnlA8Omqb/ZNYEiSV4+U
         gQCg==
X-Forwarded-Encrypted: i=1; AJvYcCVIk7M4ojamCmv/XE5iz8BeK4laYzbgU8naTSAsPaBv1vLoIQA13ZqQWocje7Py9rc1fZ9qa1LK4F3CRkH2FGLnfC89
X-Gm-Message-State: AOJu0Yz/hO8GVSmannAbyy4dMzoOLADtZbj88gzEp9ql6qDExB8A9Rpr
	rF2XOfwUnlqZkbtVC+cxOy1cNC09hamhnS4SOX6oI5UPaNQvYF1lNi75GNj3MzOrOo0xu1DeMJA
	339R5D5xyNn967XttL41gYrObVYzXFDQSuxdpTw==
X-Google-Smtp-Source: AGHT+IF49VekPZCw/4NwZB0RcuzNygPEhsTRH8TcXdf45Xfzx0CgPlfWgMUjL+tdTNoBeYol1xBY8xm7kkQpO93mfF4=
X-Received: by 2002:a05:622a:14d:b0:44f:ff65:97be with SMTP id
 d75a77b69052e-4536787bea2mr152143891cf.14.1723850077946; Fri, 16 Aug 2024
 16:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zr+H3gHZ/B7zTKBW@lizhi-Precision-Tower-5810> <20240816181500.GA69082@bhelgaas>
 <Zr+lslEn4cfBJ0A3@lizhi-Precision-Tower-5810>
In-Reply-To: <Zr+lslEn4cfBJ0A3@lizhi-Precision-Tower-5810>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 16 Aug 2024 16:14:27 -0700
Message-ID: <CAOesGMi9F2S4LP5pp0tR4Ax0uf3z5cOgG6UKB3r3hAmjrC9gFQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] MAINTAINERS: drop NXP LAYERSCAPE GEN4 CONTROLLER
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Zhiqiang.Hou@nxp.com, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 12:17=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Aug 16, 2024 at 01:15:00PM -0500, Bjorn Helgaas wrote:
> > On Fri, Aug 16, 2024 at 01:09:50PM -0400, Frank Li wrote:
> > > On Fri, Aug 16, 2024 at 11:12:31AM +0530, Manivannan Sadhasivam wrote=
:
> > > > On Thu, Aug 15, 2024 at 03:15:52PM -0600, Rob Herring wrote:
> > > > > On Thu, Aug 15, 2024 at 9:53=E2=80=AFAM Manivannan Sadhasivam
> > > > > <manivannan.sadhasivam@linaro.org> wrote:
> > > > > > On Thu, Aug 08, 2024 at 12:02:17PM -0400, Frank Li wrote:
> > > > > > > LX2160 Rev1 use mobivel PCIe controller, but Rev2 switch to d=
esignware
> > > > > > > PCIe controller. Rev2 is mass production chip. Rev1 will not =
be maintained
> > > > > > > so drop maintainer information for that.
> > > > > >
> > > > > > Instead of suddenly removing the code and breaking users, you c=
an just mark the
> > > > > > driver as 'Obsolete' in MAINTAINERS. Then after some point of t=
ime, we could
> > > > > > hopefully remove.
> > > > >
> > > > > Is anyone really going to pay attention to that? It doesn't sound=
 like
> > > > > there's anyone to really care, and it is the company that made th=
e h/w
> > > > > asking to remove it. The only thing people use pre-production h/w=
 for
> > > > > once there's production h/w is as a dust collector.
> > > > >
> > > > > If anyone complains, it's simple enough to revert these patches.
> > > >
> > > > My comment was based on the fact that Bjorn was not comfortable in =
removing the
> > > > driver [1] unless no Rev1 boards are not in use and Frank said that=
 he was not
> > > > sure about that [2].
> > > >
> > > > But I think if Frank can atleast guarantee that the chip never made=
 into mass
> > > > production or shared with customers, then we can remove the driver =
IMO. But that
> > > > is up to the discretion of Bjorn.
> > >
> > > I think Bjorn's request is impossible task. Generally chip company se=
nd
> > > out some evaluted sample to parter, which use these sample to built u=
p
> > > some small quantity production. Chip company have not responsibility =
to
> > > call back this samples. There are always some reasons to drop mobivel=
 and
> > > switch designware, it may be caused by some IP issues which can't mat=
ch
> > > mass production's requirememnt. Such informaiton already removed from
> > > nxp.com. Only Rev2 left.
> >
> > If you're reasonably confident that nobody will notice the removal of
> > support for Rev1, we can include that in the commit log and just
> > remove it.
> >
> > The original commit log basically said "we don't want to support Rev1"
> > without any indication of where those parts went or whether anybody
> > might care about them.  But if Rev1 only went to partners for
> > evaluation and we don't expect end users to have them, I think it's
> > reasonable to say that and remove the code.
>
> Thanks, I just find 2020 Yang li try to drop dts part in below thread:
>
> https://lore.kernel.org/all/CAOesGMhz8PYNG_bgMX-6gka77k1hJOZUv6xqJRqATaJ6=
mFbk6A@mail.gmail.com/
>
> Olof Johansson raise concern about their HoneyComb.
>
> I added Olof Johansson in this thread. I think HoneyComb use evaluation
> chip to build some small quaitity boards.
>
> As my best knowledge, rev1 should have some big problem. I can't find any
> detail about these because rev1 informaion already cleanup totally. I don=
't
> prefer continue use risking rev1 chip.

I paid good money for my HoneyComb, and while it was an early system,
I certainly wouldn't expect it to stop working because some maintainer
is bored of supporting it. It's clearly been commercially sold as
systems.

Mind you, I can't remember last time I powered on my system any more,
since I mostly use the Ampere board or VMs on my Mac for ARM linux
work when needed, but that doesn't mean I want to send off the
HoneyComb to recycling.

Don't regress your users. Thanks.


-Olof
