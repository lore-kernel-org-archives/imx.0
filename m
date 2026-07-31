Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CE537997A
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 20:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530384; cv=pass; b=ErVS9XaxsXEbKACOhoTyO7xTWQEb41yMrlQidqY5hDd6Frrw1o5i/XeSE63ymV2zUYviF9jZ0EGjV/bZDVUxebDpJJM5+JwFOLKQGEqt34grc0KC/DJg7UwLZvUOB1B3o3b0+GL04+O+5xFlEw4Q3glIvcVcdAn7E8oTsgdercU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530384; c=relaxed/simple;
	bh=H8MZFv0NlxX8AAFiW92wo8pS7F9Nxis4TWuHY0ym0Ls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FTxm/C0f25EWC+Byqd71YKRILV4YCAoKvHy2b9pjIr++6UN+dNfikkRlY4bOgCAO1xGlbJ4Qxr5pTgr7wTYmwcY0iaSNHmKe9w1o4TIHLWnbiojsPQRGCTMzGiHmXIDDoxuJqsf9Ksf6oRIRDy+a8J4VgDJJT0ltxI5ZqOfZvaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4EhRfum; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4EhRfum"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69fc6a09b5aso2574604a12.3
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 13:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785530380; cv=none;
        d=google.com; s=arc-20260327;
        b=rJY/QET0D72aItagCOii9p1MWw8QWU+7afW7blij7rBcJNtaGuj+R0ZEuWUKRnpvOM
         q9XbNa6L9eFst4wP+qS/PQSkAI6Adfc3XYA9S38Bl+2y+f7Y/U6Qi1+ikuccr/cD+34S
         bRwagDb8qQhEyfBg9a0FX7fZAVHu2U8fBJBTSwuv7AnFq5vPQA9H0ZAIxkq7AkHakZZA
         a94bN3gb7SgfOpNIEMdzuAWb7b/iSfR1FikTKsJDHOjzo5obnTAouilW3Xxo7klQxoZE
         bxVDVyUuYiYGN/ezjNuFdr3KEPgGskvDjj8A58QC8skGFIAOWm8xPiKuVG0KHUWuW2mQ
         aozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNr3QEOyUa22hJiDCuM7GWGwzbMpwlCTnE3ShI9qpY8=;
        fh=rgPBt4LZZJ+f0Zmj96yfRVIDr0EhOes4XvRa8G7eSKg=;
        b=SSMsWA9kFQ94thIR0u5UQOnwxypcyp3DsiS87FklCX/xUwqIW4E1/Qm+/EByi5Pni1
         HhIdajZ6uPxq2ZQhLhKc6TmPeT8Z2FMntT0ZKA5gK4viucvebPh27vAZAHDpCPKqCaWc
         TPDnynhmWWxwBj1nGjs3cuPA4XIi7GjvxjPDB27FlDijswFVk3cJ+9fAqIItxW/rM80v
         RfBv1KDVvUtTddxxpkc23EEfMUBJwEoDFqjsl3sYc38OP4z+HQjDb8OMEg8rmnj23EGR
         BJPL5v4a7b7Tq7ll6WIpNfEI5TnBh0MwV4uF2EQGswy+KpXsY/BvJvOgzoDuTfjMx7os
         s4rw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785530380; x=1786135180; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNr3QEOyUa22hJiDCuM7GWGwzbMpwlCTnE3ShI9qpY8=;
        b=W4EhRfumj3QZ6KmvUVPUuNLtXNjVbEaJmbYaqPzbOmaQ3zlUqZSghE2QzrsUZtrCoU
         MyOcyVvQ/m9lka0fXCX1rwk20Z2wR8UO9kmUWF3fbzzfdyAcDR6cWgQ2DT2YtTQFXtTH
         CD9QILhipL6joQPFGel7ldpcBlX7xzu34q4Za1+oPoAY9i1g32ZLx4XXYTtaIYlD3WPF
         UtCUTdky7QG7oMUhfBGehzOnDNsQr6UZVNm7LLBCU18eMEz3lxcFnIKNBfKBx3P/yPY3
         uFI046kiBBSAu/36tA3zNqqPsYiuGRLpaEOGeEjvf1aZ2ePDC/ngNEExlQRtkF1y4NYX
         EM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785530380; x=1786135180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNr3QEOyUa22hJiDCuM7GWGwzbMpwlCTnE3ShI9qpY8=;
        b=C85+wHTPVE5q1EnLLVExT1ekTVOgi9qI2oBfNa1tp8sB5cwWUAHtmHn6oEblccz4E+
         KBzPO2LE4H/bVBGkCZBk/wqga8tWt1EkElorfNioySfqVZNGhRjWgx9lcmPY55QKMObA
         0OUlwmlCGqbOiYBPCWgY2/cvTkNdPgV4MR4DacDiVZy2JO7MveDIAzmjhyOAdzg3PVsP
         bF6693uysTxgai4MJuUAQT+/3V/roL6uXENUHXFdyXPQ3wpWjnKyFCore/5/BDIBDWtM
         rDZcH16qbQa0/Y1giIcrMyuspHBdAZP73hMuGNGUYBFBW31ris0LqQ2BYa6aJaKLImDp
         k1/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqEyO8GA5zTYtV9J2pU7Wiwyhp5CfDWWKQhrF8PApUHGFYtg1+x+t/5ey9FniRU8tCqVxM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8kSR3GNPf0TtudqW/tqYymLKJu1Oh3q75x4dHorzL2Lkm61mK
	54JuHF0PA3gouWkZj1nCIO6/dYjsdQTRNSFcWqEKjeE3SsboKTw4DphX60axekNQlnBuf5dxtay
	GcgN4NWqadehrYjWYx2eiiP6PE0wco3Y=
X-Gm-Gg: AR+sD11pJ00D/GuQil64oAbGOgR4UQbNuo1WJUfjoyySvEKJO7hPel9ZtHSvMJ8D+ei
	eDmlvPX/TfGUM/ExA5iXhS6sJx4PtN8JskxhgBAON1uuhpV/sTR5e69+UaC33E6pwwDIvS6aMZ5
	1EYSd5hOxTCUSE4N8MWW5kgbAh4LBzpP34kb1SXEzzWP3DSBCJkKi3XArEipuWECnFx7OSw7YKW
	Gx0K/qbY3qUL1hMN3UCXToC40WD4Ze+EV+SYYz1ph5KO+fC0ooNt6SjB/Id/gKdWRuwAOxqzM2E
	lG3bqRC95KITVhSt3/83h9tJQJFNqfI6IuSv28hL4Hz6rWJOOJ09h0pOJ8kTpfOQnaAWgLBFV0/
	Kq7hxfPxZ9SDlurCek3ZZ7UMYQ+8eWRfuLZ3jZp17xOBQ4MEVoJbgmULocdtn40MaUTq9QPJwp7
	SBNN4aIYJbBn06+aXQeeCp1ARiivXbT4TELhEZGWCYevKzZQsKiosWqmk=
X-Received: by 2002:a05:6402:40c9:b0:698:56e7:8eb3 with SMTP id
 4fb4d7f45d1cf-6a0a7c72578mr560606a12.14.1785530380407; Fri, 31 Jul 2026
 13:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731012130.1212640-1-rosenp@gmail.com> <20260731012130.1212640-4-rosenp@gmail.com>
 <amy3yueMqBFVCz3T@SMW015318>
In-Reply-To: <amy3yueMqBFVCz3T@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 31 Jul 2026 13:39:28 -0700
X-Gm-Features: AUfX_mytarzAXc_eavVZLWZPAYjlwauapJxxWfxCCdbUg0_v8GNzgaIDe_yz5Tw
Message-ID: <CAKxU2N_+tBqqngTepnTQy7his_2UTAAc36cMjgfZsOG94ryt+A@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] EDAC/fsl_ddr: restore MC error registers on probe failure
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, York Sun <york.sun@nxp.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 7:57=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Jul 30, 2026 at 06:21:30PM -0700, Rosen Penev wrote:
> > fsl_mc_err_probe() clears FSL_MC_ERR_DISABLE and, in EDAC_OPSTATE_INT
> > mode, sets FSL_MC_ERR_INT_EN to enable error reporting. If a later
> > initialization step fails and jumps to the err/err2 labels, the cleanup
> > only frees driver memory and does not restore these hardware registers.
> >
> > This leaves the memory controller configured to generate interrupts whi=
le
> > no handler is successfully registered, which can cause an unhandled
> > interrupt storm on the shared IRQ line. Restore FSL_MC_ERR_DISABLE,
> > FSL_MC_ERR_INT_EN and the SBE threshold in both error paths.
> >
> > Do not pre-initialize orig_ddr_err_disable/orig_ddr_err_sbe to 0; the
> > err path must only restore registers that were actually modified.
> > Split the error labels so early failures (before the first hardware
> > write at line ~~580) jump to err_free, which does cleanup without
> > touching hardware registers. Save orig_ddr_err_sbe alongside
> > orig_ddr_err_disable so the err label correctly restores both
> > registers, avoiding stale bootloader state clobbers.
> >
> > Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=3D1;
> > drivers/edac/fsl_ddr_edac.o compiles cleanly.
>
> You can put this after ---, this is redunctant, every patch must pass
> build.
Will remove.
>
> Frank
> >
> > Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85=
xx")
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/edac/fsl_ddr_edac.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> > index c505fb268474..139277c4e2f0 100644
> > --- a/drivers/edac/fsl_ddr_edac.c
> > +++ b/drivers/edac/fsl_ddr_edac.c
> > @@ -577,23 +577,22 @@ int fsl_mc_err_probe(struct platform_device *op)
> >       pdata->orig_ddr_err_disable =3D ddr_in32(pdata, FSL_MC_ERR_DISABL=
E);
> >       ddr_out32(pdata, FSL_MC_ERR_DISABLE, 0);
> >
> > +     /* store the original SBE threshold */
> > +     pdata->orig_ddr_err_sbe =3D ddr_in32(pdata, FSL_MC_ERR_SBE) & 0xf=
f0000;
> > +
> >       /* clear all error bits */
> >       ddr_out32(pdata, FSL_MC_ERR_DETECT, ~0);
> >
> >       res =3D edac_mc_add_mc_with_groups(mci, fsl_ddr_dev_groups);
> >       if (res) {
> >               edac_dbg(3, "failed edac_mc_add_mc()\n");
> > -             goto err;
> > +             goto err1;
> >       }
> >
> >       if (edac_op_state =3D=3D EDAC_OPSTATE_INT) {
> >               ddr_out32(pdata, FSL_MC_ERR_INT_EN,
> >                         DDR_EIE_MBEE | DDR_EIE_SBEE);
> >
> > -             /* store the original error management threshold */
> > -             pdata->orig_ddr_err_sbe =3D ddr_in32(pdata,
> > -                                                FSL_MC_ERR_SBE) & 0xff=
0000;
> > -
> >               /* set threshold to 1 error per interrupt */
> >               ddr_out32(pdata, FSL_MC_ERR_SBE, 0x10000);
> >
> > @@ -621,6 +620,11 @@ int fsl_mc_err_probe(struct platform_device *op)
> >
> >  err2:
> >       edac_mc_del_mc(&op->dev);
> > +     ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> > +err1:
> > +     ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> > +               pdata->orig_ddr_err_disable);
> > +     ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
> >  err:
> >       edac_mc_free(mci);
> >       return res;
> > --
> > 2.55.0
> >
> >
