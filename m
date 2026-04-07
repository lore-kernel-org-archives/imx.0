Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D1E39A7FE
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552400; cv=pass; b=RYeL1tMUL3vRH5eV8/DpmXiQNSj1bfwJ7OHi9qWQiGxDug7CabPIz5HWjflQo301o9E88FIdrA657EMmX7WeChOB7H6YDWHmGytQgPwC/ApumPGo4a0jsGjcZcEtSzZNaAbEKep2rsoke6eiJSwo70gaKykj2VT8vucmDyiLJIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552400; c=relaxed/simple;
	bh=25yQAIFt7Ha3kKfsPY3wnNdVrSBPt9Jwl6avN4mv/d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGh6MFLGWkn6epICAdbNOg3MK1l19s+/PMkpr3SjXR1vAXyilCTtab0777GQDBZRfWn++VutVINwVcgLgjpBN7VFFAz3BypXIxKxz+JbroUC4Ydy2h8oY6gwUvuJxhWrePKtydilteLWo0I+1+hUh8xPle14lJ4xkdIthOgbMc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6f579xy; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6f579xy"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c76b95e652bso1470728a12.3
        for <imx@lists.linux.dev>; Tue, 07 Apr 2026 01:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775552398; cv=none;
        d=google.com; s=arc-20240605;
        b=CwKtXAC8i2dyMXzHhwGweKD8IFN16tNYuf6Iq+n7pHdqQFvJxRhVSOR5+Z5DNvG091
         kO4fWbuc79GUeZAOD8DFWpxG76ESyfC4clUgR2RoPUA/Kjd34OEO9T4DdXGGNPqvI8O8
         BPQnTEKwz1fOH/B8zREBfx7QWW3jrjVoPjtq+J25HUQMR004KNn1BL2/KzVF4XteO06j
         CUqkYX+m8v2liJaeEVPI3XzBgI+9ocviY6qSWHYo+12+NvOfmDlgAZkCy0YNqiXRFyfb
         cmlBe8H9j/GFkJXdzSw23/0FhMadiDFl6cpuZRxouYZLon9EJxf5LhBz+OUpKobmCiB6
         JAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1FUUrHlD4/8A6iagGC51ep+aqzKDjd9WvkYuFmV48gE=;
        fh=7aOb4QtP/cb1A01Z2VBtw6uefM3qiXkMZda1b9JybRM=;
        b=jLKg+sVTeoumAMO7h6v7yyZdocaTZOzKAfrJOOrp0QGUDfcqScudzbTKmVPXL3E8vi
         DsTuVQyxfrKYmJjgJN/7lwC51lhMegtZEUExHuyGCeKUNAyf7IPP6CVBO1k6ROYRkzlk
         PBn72xu/obBSNokK4+QEn3NpBeoG979OiOrmcrkj0ESVodF0Ss3MZndfASMJku5xYQi0
         lwA8aBSTvurXdBSPRfZAaYHehW+0BmB6H+MHqhgNwbu9mkhBy6sg3u4UoYB7H69125bO
         I9uYGge+VtWD2KLhXMk+PgMBpLcWccHfL+1iPZ2SjpW850vLhNpTYHtyeOycQA+bwV1J
         C0KQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775552398; x=1776157198; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FUUrHlD4/8A6iagGC51ep+aqzKDjd9WvkYuFmV48gE=;
        b=X6f579xy0uHdNrGNMx1d3dkNVKE9ieSfYnH/ngw9iIMcp+gsl1wVy3Cme/J7y9EemD
         /yr7q12wGhfnFplE55eGhiZnAJSOpTJqaNxpKqqv8aI1AEzCraoVwIjWvotekOvTzmOd
         BluAzjlkfHsXi4t6zVFy7d11fuE/R3f0vrXYj2s2bnEpuphc3qB3RKE8xLcgJyRzo+cC
         F99UNOR3g/+7tdpcws/EAV5VTqbTOSstjlOHSJdq0+9VFOUwl+3R5pNBv9GeLcKzpcud
         fWbJJCmYQ+qsRtKO26J1D6GQ5QFqB07L55kN32ebH30uzE7HXwS8xNxeqHHzmOgu3ggW
         FklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775552398; x=1776157198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1FUUrHlD4/8A6iagGC51ep+aqzKDjd9WvkYuFmV48gE=;
        b=dfKM9uOq1a8yr+mUQtSG0vjhQ1l27Lx3EFWw359PpE72SISpPoriiiopqAir/Wqz59
         I2pqU7dqdhwWuw0b+ntUjOB9XJ6PZwCgfsXlfhtpAFBnQPCJuHEa60MmVAMkEgxhkg7Y
         do1/2a4pxrm5HkBSZyXVXaWIuv1JeSlTtnMfzsHWK1SDkij8h2s/B1lD2S92uDjHDEaH
         GM5xb83/AoAo4p/A5wjAh8MpEy8Tv3BPkSytFOr4uFMxLx1eBCB8txnuHVTPvuYBSg2Q
         v7iuPs/KZmg4BO1bzDOmTJokyHj4WBpA/YCDFZBlBZFJbhZA2XOo8IESA3ICbInKEGa8
         JdoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuS86oh5O1V0hpUfGijT4T1UoJLA3u32X63VB8DZyTNsWDi3qYBfxWuWW+eFExt+NNYrc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrwliz1PgEaMGg34NVOX9M0K1HhHka+T8oOVfYDCw2IQK1qcXX
	W1m2X9PbFmyQdMnHkGDLRFyBqUPwdbWw91J7iTdskB4tW0Qpd5eO0sNXYWnmTh/oKcl5qSWQ3ff
	H0jRjt5ucB+pXN2i194118dCHLIm7Erk=
X-Gm-Gg: AeBDiesVGVl0zUFWDVo95EP3WT70a14+Nuw1PcJo5uwKdz3ZLaRTghkt/VlQXVveb2K
	debA5WgdY2pLGG6WLRjCPj0vAIeK5lASXs0ynPCWF0r0pdpymATTSBRmvDe+jhDFqhuOmqBHSpF
	1UwOJGZvnkRs9jEjdLGSGoJFZEmBPioczDtYZl3QULDNtL4SlenGfA2ProOj8jdC88n9Yxx7lXJ
	UAh/EBf2okmIeoN+X6H1UicSb2JAP3SvgwjjKrZGRRJ+HDDoC1S3kass9sr7Ly3ZAu0nK0P7kgz
	p6iS1x8=
X-Received: by 2002:a05:6a20:7d9c:b0:39b:f750:a6f5 with SMTP id
 adf61e73a8af0-39f2f096af1mr16119897637.51.1775552398252; Tue, 07 Apr 2026
 01:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407032755.2758049-1-shengjiu.wang@nxp.com> <6r7ih7wz7xn44c7c2ukohy3fgp3tpo222jh7ocxacccrvywz3i@mddoznil6way>
In-Reply-To: <6r7ih7wz7xn44c7c2ukohy3fgp3tpo222jh7ocxacccrvywz3i@mddoznil6way>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 7 Apr 2026 16:59:46 +0800
X-Gm-Features: AQROBzBBoCuAnujBQ031UhhobhyiC_USVqwzk7ad0Ee4NBRI7paALb3klLHUGi8
Message-ID: <CAA+D8AONNCbbH_GLgc80+ac_ozbLUpYv5HWG3VsOYaYeSoEh8w@mail.gmail.com>
Subject: Re: [PATCH v2] dmaengine: imx-sdma: Refine spba bus searching in probe
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, Frank.Li@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	dmaengine@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 4:31=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> On 26-04-07, Shengjiu Wang wrote:
> > There are multi spba-busses for i.MX8M* platforms, if only search for
> > the first spba-bus in DT, the found spba-bus may not the real bus of
> > audio devices, which cause issue for sdma p2p case, as the sdma p2p
> > script presently does not deal with the transactions involving two devi=
ces
> > connected to the AIPS bus.
> >
> > Search the SDMA parent node first, which should be the AIPS bus, then
> > search the child node whose compatible string is spba-bus under that AI=
PS
> > bus for the above multi spba-busses case.
>
> Sorry but I've to NACK this, I already fixed it in a more robust way by
> checking the consumer sdma node.
>

I think you refer to this one:
https://lists.infradead.org/pipermail/linux-arm-kernel/2025-September/10618=
24.html

I tested it,  but there is an issue. I replied to that thread, not
sure you received my message.

> +static int sdma_config_spba_slave(struct dma_chan *chan)
> +{
> +       struct sdma_channel *sdmac =3D to_sdma_chan(chan);
> +       struct device_node *spba_bus;
> +       struct resource spba_res;
> +       int ret;
> +
> +       spba_bus =3D of_get_parent(chan->slave->of_node);
With asrc p2p case, the chan is requested by __dma_request_channel(),
that the chan->slave =3D NULL, Then there will be a kernel dump here.

That's the reason I sent this fix.  But if you can fix the above
issue, I am ok to drop
my fix.  or could you review my fix?, which is simpler.

Best regards
Shengjiu Wang

> Regards,
>   Marco
>
>
> > Fixes: 8391ecf465ec ("dmaengine: imx-sdma: Add device to device support=
")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2:
> > - add fixes tag
> > - use __free(device_node) for auto release.
> >
> >  drivers/dma/imx-sdma.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> > index 3d527883776b..36368835a845 100644
> > --- a/drivers/dma/imx-sdma.c
> > +++ b/drivers/dma/imx-sdma.c
> > @@ -2364,7 +2364,9 @@ static int sdma_probe(struct platform_device *pde=
v)
> >                       return dev_err_probe(&pdev->dev, ret,
> >                                            "failed to register controll=
er\n");
> >
> > -             spba_bus =3D of_find_compatible_node(NULL, NULL, "fsl,spb=
a-bus");
> > +             struct device_node *sdma_parent_np __free(device_node) =
=3D of_get_parent(np);
> > +
> > +             spba_bus =3D of_get_compatible_child(sdma_parent_np, "fsl=
,spba-bus");
> >               ret =3D of_address_to_resource(spba_bus, 0, &spba_res);
> >               if (!ret) {
> >                       sdma->spba_start_addr =3D spba_res.start;
> > --
> > 2.34.1
> >
> >
> >
>
> --
> #gernperDu
> #CallMeByMyFirstName
>
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    =
|
>
