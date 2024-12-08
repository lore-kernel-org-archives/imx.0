Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F2014F9F9
	for <imx@lists.linux.dev>; Sun,  8 Dec 2024 15:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733673300; cv=none; b=XSKhSt9K7CYxdAHISyGQ2qPA1+eYxe8ZuTW0d5lmRFYaK6OZ6e0ODGYHzmsPytSL65O5P6ONbeg1lgxT0G4d1of8gKSmFH2/CU5XwBeMgrpp3dc+P1zUMsIf53r5qkAXzaR8giR3A9aS24kDQ9Wp4jjkPXzotKAtT86oJ0yTf3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733673300; c=relaxed/simple;
	bh=sLGXgrOtyFUCSrAr0PZXAw3CO+iv36B75V8uwsPkqk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hx/xLeQCkuTY3KP8Vkuubpaagkufy1p7jHIKbTRPuS9Ib/41o63KYakF+iXhwm48/DE2k5fFWTvuih9YzdIE14l1WVKcNpAoM7PRFm01SV7HDzmSUPge3W2ts1UARmdP7EV5AQTX97mnqzQq3+ETcfKTp0kQT+di9olV+/ms3ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wlOADmis; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wlOADmis"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ceca0ec4e7so4348413a12.0
        for <imx@lists.linux.dev>; Sun, 08 Dec 2024 07:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733673296; x=1734278096; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8Ir5Ze5F+Cakp++YqE/4K5mzAf5gGTj0H2toLbkGXQ=;
        b=wlOADmisk7OnKaRN3G/0x+aZTsN6FxpDPf7KeAAL0R0e+45fiGp3SDgPYAwXH2kfKc
         YyIRWvgR6kNpa5hUw0qQb2OI/vcwMgyjmdi3DNTnfh2PvOfS0otzubjBeiQEz49QL5vq
         SQbVN6HiyyhloSNzaPVavJ7Llw7LFKkzgOsINHXpVq1QvcDVFwnl7ka79Yhz74maNy6U
         ByI+bVlWI2eYJsyRbuvyGndrszFJicPG69cXumTiEoR2J75GaAwhLc9Il10Of3eGYcz9
         gws9KiuJgC9Nz88UimIcdQ5YrediksZag/Vru70Lm/6H9BdCx5EXi/JOdJiELWEgrAtf
         yC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733673296; x=1734278096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8Ir5Ze5F+Cakp++YqE/4K5mzAf5gGTj0H2toLbkGXQ=;
        b=C3VjhkMjYEWfoZEchUd0EJpcFA08EdMVGzdjB0Jm3+9JKdr+uMjHDHWPv//ETv8BuD
         w97e3UrkVrRXRLfEC2VN4n3cUMQMtcjUpdMRzrBCrqTbf7y1ptvXse/XsvDFvwYWforG
         YjGWGAeHO5nsV+NDbiGiBjfbSAi5e4iADaKKKKJvIVkpGX2qnT/mLzyEeuHmbZXzKxsH
         yxMAe9Bd7+2pzyEM8qnqLCQYIO0RJEBbaSu9QtEp/eBmye2xnzfk1ICCan72EHYf6E4u
         pSLXSNVKKGym6J3x//u108O+6wqmWdR+xZkjrRV6WY5doDqOegnHQj2rFLcFxtwYXKOb
         gDxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcSYcAVm024ORgvgvTxCn2/ubdxR70DfSB8OHum2WDyGiP1i5P4Xrfzjn18rHoHuwRdKk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTaN8HloIMHEjooKd85ufEVPg/CcM8cWm4xAWlGthJSecchkSB
	vTapIz5HcEBMGna6bo9iyw5ROK+zOmHjAuJuNapAEKFAC/Nea5WxZ7M/64q0FTUsZSSumkh73FB
	59zKUvpH7sqWvkPNcXvbPUbbjMVPeP/GO6Q9v
X-Gm-Gg: ASbGncuHnlhWOI95sqT8LA/2WEccKbGi6XV6gPmy8pp8Az5hXf3BnE88I5MsnNxIvmz
	s07JFBl39PYwRZYT9hvGMgSXVwL4Gdhk=
X-Google-Smtp-Source: AGHT+IHNDCZtWupPE2CKmpqwWgSSxU8NjMFFGRWVi+JYDVnnaUFSF2Bl/ZJ1PGYqEOpPVp+J3GCHhK5AwFATV2K8lgg=
X-Received: by 2002:a05:6402:4586:b0:5d0:bf27:ef8a with SMTP id
 4fb4d7f45d1cf-5d3be715323mr8666902a12.26.1733673295651; Sun, 08 Dec 2024
 07:54:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241204052932.112446-1-wei.fang@nxp.com> <20241204052932.112446-6-wei.fang@nxp.com>
 <Z1W2lp5jNPqJZi4C@shredder>
In-Reply-To: <Z1W2lp5jNPqJZi4C@shredder>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 8 Dec 2024 16:54:44 +0100
Message-ID: <CANn89i+E+kCZCNBtu=XnyLHsMNF=Ks9BkK1+qTQNxrPDQX-Mcw@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND net-next 5/5] net: enetc: add UDP segmentation
 offload support
To: Ido Schimmel <idosch@idosch.org>
Cc: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, 
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, frank.li@nxp.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 8, 2024 at 4:09=E2=80=AFPM Ido Schimmel <idosch@idosch.org> wro=
te:
>
> On Wed, Dec 04, 2024 at 01:29:32PM +0800, Wei Fang wrote:
> > Set NETIF_F_GSO_UDP_L4 bit of hw_features and features because i.MX95
> > enetc and LS1028A driver implements UDP segmentation.
> >
> > - i.MX95 ENETC supports UDP segmentation via LSO.
> > - LS1028A ENETC supports UDP segmentation since the commit 3d5b459ba0e3
> > ("net: tso: add UDP segmentation support").
> >
> > Signed-off-by: Wei Fang <wei.fang@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > v2: rephrase the commit message
> > v3: no changes
> > v4: fix typo in commit message
> > v5: no changes
> > v6: no changes
> > ---
> >  drivers/net/ethernet/freescale/enetc/enetc_pf_common.c | 6 ++++--
> >  drivers/net/ethernet/freescale/enetc/enetc_vf.c        | 6 ++++--
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/d=
rivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> > index 82a67356abe4..76fc3c6fdec1 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> > @@ -110,11 +110,13 @@ void enetc_pf_netdev_setup(struct enetc_si *si, s=
truct net_device *ndev,
> >       ndev->hw_features =3D NETIF_F_SG | NETIF_F_RXCSUM |
> >                           NETIF_F_HW_VLAN_CTAG_TX | NETIF_F_HW_VLAN_CTA=
G_RX |
> >                           NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBAC=
K |
> > -                         NETIF_F_HW_CSUM | NETIF_F_TSO | NETIF_F_TSO6;
> > +                         NETIF_F_HW_CSUM | NETIF_F_TSO | NETIF_F_TSO6 =
|
> > +                         NETIF_F_GSO_UDP_L4;
> >       ndev->features =3D NETIF_F_HIGHDMA | NETIF_F_SG | NETIF_F_RXCSUM =
|
> >                        NETIF_F_HW_VLAN_CTAG_TX |
> >                        NETIF_F_HW_VLAN_CTAG_RX |
> > -                      NETIF_F_HW_CSUM | NETIF_F_TSO | NETIF_F_TSO6;
> > +                      NETIF_F_HW_CSUM | NETIF_F_TSO | NETIF_F_TSO6 |
> > +                      NETIF_F_GSO_UDP_L4;
> >       ndev->vlan_features =3D NETIF_F_SG | NETIF_F_HW_CSUM |
> >                             NETIF_F_TSO | NETIF_F_TSO6;
>
> I didn't see any wording about it in the commit message / cover letter
> so I will ask: Any reason not to enable UDP segmentation offload on
> upper VLAN devices by setting the feature in 'ndev->vlan_features'?

Going to back to my commit, it stated that net/core/tso.c was only
dealing with basic stuff.

Adding vlan support would need some changes there, I guess this should
be done if there is enough interest and testing.

    commit 3d5b459ba0e3788ab471e8cb98eee89964a9c5e8    net: tso: add
UDP segmentation support

    Note that like TCP, we do not support additional encapsulations,
    and that checksums must be offloaded to the NIC.
