Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C954582FF
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519552; cv=pass; b=C7rEL9NxgbxaiT4Z9xEBDTFU/oOy6AOoxjrCqet3p/6Uv36PSJr2EdWJWI1V4WzfntmvSzbUNE1nkxOndK/6ncqRQyEpF7RI+/tW42u91RTtq8/wNIY068AAffer6hDGwQh86iyamGX1/OoTYSYI4eEiDnCRu5mAYBsfWI04LdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519552; c=relaxed/simple;
	bh=cyC52QIvAc946stkwp2fCYtvs8A5LUa+yfzkSiYD+NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkZTA/yyn2Hd7WPkz8zFGNbSNqis/E6M7u4vHzWbYIw0KQD18v4NQGglbL40jFvh3tKhuCf6XXQb77r4IzWFgqUG+LaeO5qmtabfN9SKhIHi6rbotHLzRIHb4/jy3hyZHAdT4ob5lD2ii1bCrKv/F+qCUQkBacnPpDQoec82U78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYAB1vW5; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYAB1vW5"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a097f5ab95so1490859a12.2
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 10:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785519546; cv=none;
        d=google.com; s=arc-20260327;
        b=gWaleLUdTk1qyxT6lWmzuSAHYXL8tIPuT4vUOJuniKNwXiz0MUjhcApZ7WjL8rqAiN
         RknaONEblrGDZ9gcx/4TP7Wa3hCcBx/b3Fep9DwxKy45lGjEHvG1izD/v2uWY/6NFvoM
         rjvdjIAFyJaEWRSKC4wXK9+UXVU6DDMTu4KodJL8ehdgOywjlxgSGGLgUEA1nDT86D9/
         WmfXSZrXxWihzVaLtMP33XZxcq6GJcshumlZFcoh84vgVr2rBnGRQTs7nVTk+r5e1bto
         1PmRcpSfTAazCeoRWkFIIACG8CIfzCPVefzpv9MxZxOIh3AnVb/X1BCx6WXsp+HnkGS7
         2jWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZKPK3Lozq5k72vaIYhpUr0DfMfr4X72+opwX+zWoeuo=;
        fh=ImPbI5bQVxPZt0FHhwZcRVrIt197FIEy6u7L29a/bNY=;
        b=fEwRd0xVsbO6u06FnzlcUbF1HRP0287Mn4NhXTHg5avSC8nCoNSz7vjgp2bGCmlqPq
         Udyv9IXfp9e2L4sFsMT/+V8p21qU4OvOxPBUE0UYCpt0UKyw9MzZG2q6RuxLAMK35GlR
         y32M/ZERMLLcb0hqHFVh92I7SQvA9ph/LQb2vCVOFPkv9WR1/oK21/6L4ifhlv8infjl
         MOy4mygRy2iViKOcaLd6i0oVkL1J21noG67pdzZ35R9VUPKpY53JqR4dDQkUgelBHfHU
         UHIuAfxYmc4avWsV3mTHlkd0BAm7qbleQJb5zNRCewRSneUlm7bpLghAv8gYS9BzM1Kb
         afCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785519546; x=1786124346; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZKPK3Lozq5k72vaIYhpUr0DfMfr4X72+opwX+zWoeuo=;
        b=RYAB1vW5o7ZBUa+O1+IW4eJmxkW+c92JVV1gCLqWt1y4J2WScYwzpLHYRxtc0A9rmC
         ESZyUpUH2LDFJkV+vpN49gRJUkIH8EZazMa64xtNDxk3Ni1Qi7QxzF3lQnj4qJqpW7Op
         76dMCw3YW7H1Vc9I1qjrJ65WA/YWwA/AKrsTN9gZOgs1U9VFWyQGWtjJW8764y3N5LJg
         Y7YCRQtBNoxhamjbMYLNtaruOgdI0imI4LXwK+k7IHhtJLDe1HOPXl4cHSMgNyptMH+U
         Yw0fk9711Lt2QNwGLk/xcjd8e6uBh/sWQRW/XjCrRHtTcU8WhB3SVU7m9p2cVyMbQAxD
         RwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785519546; x=1786124346;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKPK3Lozq5k72vaIYhpUr0DfMfr4X72+opwX+zWoeuo=;
        b=KVixJmcm92lY5qrgRH2oV5RADFeAOPA+osm577tSazZi9nyiNXPqHLXj90Fl3ePWn7
         yontB16W1iegvmKVpQg5AnomSJT2yfRyGZC9TfYQ6fRuu+f5RuFIGXenrvsNdvzzYlwt
         bcJdZOXoDjYltD6MBtaRL4AuCh/zwilGD7xDybvSIa7o3Z0UhDwvNb59IeLstXi62GKX
         N8a87ZVjKb+Hr94XzdbuUK9X/FOMHl62sx4paHr2Ow1E80XvaGCHZJtL3cVeexF/T0TZ
         cxH0g95eyzJbYEO7DujQQpzWfs9F99eXmZNB7bGKDK5HxmsCj8rgJxyPy4TOD9F5DyJE
         cc9w==
X-Forwarded-Encrypted: i=1; AHgh+RplWyd9Cs+9v0EJQC2JgE5ZG0baPNY+TFOwGEHf2/jCwFDZ5857XM3xUeuvd7BaQSJ+Eus=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyOR3xAfmy4SozWYW/8vwuVwbdfrktHp+AT1JfHqbc8c75foRc
	yxrW+ji+VZr4OOkfJgvLkSAevH/axo5Y0ctB9+kWGdIRzMK+NwqAp0Dwt4cuuxhusvCY5Ayvz0P
	R+jqrlXTUYfDGY4XC3IleuL5DXhHva2U=
X-Gm-Gg: AR+sD12/ZUUNk2//MT5hXiXjhS51wdvQcUN5WS7Ak6JTFE5YNJ4PLtz4j5OeMindOEo
	0vXbxS/pZKpAZ5n2lPW+7yWPkR4vNQuj6Co/He6jIXTGNnRDJp6/XAyGXQ75L1Ye8bbESxHG6pt
	knRYU5LL0syKt3j6GUd0hiH9m9WWRKT/0igqvoSM7WhlpL7hPcRTEZpGHosF+JQVN5n9//QecYt
	B5RCrzRvMPvhbMziLP0R6UX84fXVd402SZEmVKt0RtEh5/cpw2Zxr6xmXOW0pO+IVClC3dc/4n4
	Q9aQpvPOe2pWWjscKcbRuBNX575fsF3XbCXBJs7DIbTHv1fbE/glQ2KdLM5mhPjXdEDOGXCh2tC
	hnG1Lo08Yvnvkj//6IiWZ4+Zc2QYIP776iqcKv6Dkoy9vP8Kyu7xkFjXBxHoMNCZiwG6Zsq2xf5
	R7GsNZ1FsoBlhnd7Gg/jtIQ4oMvXqd/32ftSYDvlCwjL3CkpzCN6i7i1I=
X-Received: by 2002:a05:6402:44d8:b0:6a0:669c:f817 with SMTP id
 4fb4d7f45d1cf-6a0a7d09ad1mr308929a12.24.1785519545533; Fri, 31 Jul 2026
 10:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729012320.616174-1-rosenp@gmail.com> <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com> <amy2z-H4Kc9LNPdP@SMW015318>
In-Reply-To: <amy2z-H4Kc9LNPdP@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 31 Jul 2026 10:38:53 -0700
X-Gm-Features: AUfX_myrzQUIm57x6XaoMMeRgWVR16mYNp4NjINehAI0dwJX54vSD1Y3o8VhEE0
Message-ID: <CAKxU2N-mnt1PRWXWbmQ58Z373CAMBU-0ixKAeEAuqiojq-2HxQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 7:53=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> > On Thu, Jul 30, 2026 at 11:49=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com=
> wrote:
> > >
> > > On Tue, Jul 28, 2026 at 06:23:20PM -0700, Rosen Penev wrote:
> > > > We need to tear down the irq before edac_mc_free() to avoid a use a=
fter
> > > > free on teardown as request_irq uses mci as dev_id.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/edac/fsl_ddr_edac.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_eda=
c.c
> > > > index f4cc89b26954..f1ddd1f47f2a 100644
> > > > --- a/drivers/edac/fsl_ddr_edac.c
> > > > +++ b/drivers/edac/fsl_ddr_edac.c
> > > > @@ -601,7 +601,7 @@ int fsl_mc_err_probe(struct platform_device *op=
)
> > > >
> > > >               /* register interrupts */
> > > >               pdata->irq =3D platform_get_irq(op, 0);
> > > > -             res =3D devm_request_irq(&op->dev, pdata->irq,
> > > > +             res =3D request_irq(pdata->irq,
> > > >                                      fsl_mc_isr,
> > > >                                      IRQF_SHARED,
> > > >                                      "[EDAC] MC err", mci);
> > > > @@ -639,6 +639,7 @@ void fsl_mc_err_remove(struct platform_device *=
op)
> > > >
> > > >       if (edac_op_state =3D=3D EDAC_OPSTATE_INT) {
> > > >               ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> > > > +             free_irq(pdata->irq, mci);
> > >
> > > here already disable hardware irq. Just call
> > > synchronize_irq() to make sure pending irq handled.
> > AI disagrees with this suggestion:
> >
> > The reviewer's suggestion to just call synchronize_irq() instead of
> > free_irq() is problematic for two reasons:
> > 1. Shared IRQ: The handler is registered with IRQF_SHARED. Disabling
> > the DDR controller's local IRQ output (ddr_out32(..., 0)) prevents
> > this device from asserting the IRQ line, but other devices sharing the
> > same IRQ line can still trigger it. Without free_irq, the handler
> > remains in the shared action list and can be called with a dangling
> > mci pointer after edac_mc_free() =E2=80=94 the very UAF this patch aims=
 to
> > fix.
> > 2. free_irq already synchronizes: free_irq() internally calls
> > synchronize_irq() after removing the action from the descriptor. An
> > explicit synchronize_irq() before free_irq() would be redundant.
>
> You post too quick, I have not seen this mail yet.
>
> devm_free_irq() here. and add comment why need explicit call it.
Needing to explicitly call devm_free_irq kind of defeats the purpose of dev=
m.

Explicit ordering in this case makes more sense to me, especially with
the ddr_out32 calls.

There's actually a second benefit to the non devm version. The devm
version prints an error message on failure. The normal one does not.
The significance is that the driver prints its own message.
>
> Frank
>
> > >
> > > Frank
> > >
> > > >       }
> > > >
> > > >       ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> > > > --
> > > > 2.55.0
> > > >
> > > >
