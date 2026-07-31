Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5825737B3FE
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 20:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530541; cv=pass; b=lBV8hJGwNp6+ZfitPtWfHCNTZOoQiYexg6xADi/9X+7pZP9Ttex9QXrviGDVHv2nCHB0gRivS6z9VirkbOOe6RVKLEdJbvbTaspgTmAjIThmGPsG6BQqgvgx9Rp5mNz59woCgZmjE1EM4ibUSPXAslQ47qKmrKHFcNajcKkR0Ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530541; c=relaxed/simple;
	bh=7vtKbsGW/x+aEcUG/DByJMD5kHjm3wDzypG6yIAZ2mM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8C2pnFgwgk+8/6kOuydR+VdQcIzyRopIBRw0Pbs+rEhL7G45a5ejgPOU2ztfI6AJbllq9bHhwaH30/BT56wAGTsJ05orBsN7riCn1SGVNIcADStqFi87X+XjiknAWLNAri6+RFiEEP8mMsGqCjdA0rabU97nme0HW/KUvAyVpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AV3FfxJw; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AV3FfxJw"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a08a2b7e5bso1046348a12.1
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 13:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785530538; cv=none;
        d=google.com; s=arc-20260327;
        b=EjdnxjnvuUiApLNQ3RL6xL/xX7itKG5p7wbySzOMuukiR9NkmocuXdkaou6GKvhieS
         D3d6kQ3LmiI9xOsyLfxqZQLSK0C6er/M/9za7aN5lc0/TLi84QnNhlYjinILdxk1uKpN
         MARVOeSDprtTK8FzRgaNRxxBG6oIDWJTt9vW7RxY1uuJDNejuc3JuhTICnaRuW+Y3qjD
         ZTsDu3UlimgUTqBy0Nm9noNtzyOrf6Y/ykciDVaBNhrLgcr0W30dL29VHzmhHWWyyCqJ
         tma5xiYaYbR5yEcrZJix2h34LSBobjyzHqX4kTmlBMALiWUdFA17EmeOLND8HW6DaMdw
         w/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p9PW7ELIrPOBtuIev7qS9tSOJ+TEbZEaawZ9Z+OQlmY=;
        fh=orUy/APikPLrSKRtBnpyneb27vb0FK29nIecqxxpcM8=;
        b=M9cFs+TVDDZRqt2F7jsgi8xYgBeHm9O5/hhqfoBjouatZVUD7ZY7aSo1ILRDs/0tab
         GumIabJ503vOh1e2I4GtH10JmSY4tczSxQwFxeQSzNP8zDLhpHgZdZNfUvllKcYZvR2o
         EnMSIfpo5hYmQKkedsb2tfQgNah2CuztDLs52u9UanGjb66DRcm+TqYKXM5WQtL6alx7
         zdl/i+zGwRseA6CtxqzDfCkMyPw0I90qBMt6cgAy9zGr29BRrydRFNILZN5KPyAo/wQc
         H03Jos3sJW37h0yWn2QYv1Q57ti9u0AS/kYvyn2WM9/9FDpRA1TmD7xWDM1+si8o9Dhy
         ESiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785530538; x=1786135338; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p9PW7ELIrPOBtuIev7qS9tSOJ+TEbZEaawZ9Z+OQlmY=;
        b=AV3FfxJwfP9fK+RpF5cJp/xeP6Plpk/EgJs4s+QV/fcjBI/TLrDHHCsBJt3N74BFih
         i3kClp1lktX51NtYy+2192c7E2NRfolF6JTA8Vl/lYelI/WrnwcnXnZVLM8mFzUmr926
         S1inWhOps2wDZvb5R2uGSPM/7mIBMlkOJI+c/F1f5NxHbe9b1ii8iO2IUtmNEEeIRc0g
         TvnrQzAkmtGZJOFAVKI9GYJGTLfTAH7Ik977wtPVZ9whH6vo/STfjb5oA0ZRQOhSLHX9
         6UZHW+GsRsbxTWm9a42Rj4YyuXABuuuZhpuoLcaM13R2sCvCLmRC87dv7YUxzVo9rL8G
         83QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785530538; x=1786135338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p9PW7ELIrPOBtuIev7qS9tSOJ+TEbZEaawZ9Z+OQlmY=;
        b=sOWqFxaiywURr44bmxbgaYZQMvgahs1WQRQellW6OmiDc4wLD2AguEvsHHo0lvpiJ1
         HhkiWrxjVXvwUTx4an6gNnKI2AySLliOhH2m/8sosj6WWcqBkSDikfGmMlRunSZYNmRv
         EMCqsV1HAckZJ9eZRDy4aOajZITjMjbeD9pqT77aR9NMU/+6dZMgP+wOIMo7WUPU/Yyl
         81/miuowE3LAmeKWAd7Zn7v3McRzz+BPNJvVqfaq17/Ko/ebeihINqM3XpI+3lJkr7uw
         HH8S3mH+jWHAN0Aq1MQO6jYMd8HSJULCTdjnKLrxdzYPmte4SnxwmfSehCtYuQM2rhhz
         1Qqw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4zxjomEYcTjbb3PKJGzI/5BjrDGfS0Vbyj/hKKNcq6guKYkoHvtFLLtmrZ0yVEZ1EsUo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+XiqbAxBkLsPK12KdX5g49/750ppD0DBf6VISISoBDQKEwvlE
	/zhOUd50EbPUQoWqln5inK5faTu2NBqSYeAWNO++agRVt6xgdliCwlEXqovqz0Jr+Kk60SJlKtF
	80hvQqhqZ0bocnhOvNVi32q0oVjzW9QI=
X-Gm-Gg: AR+sD11kMl6w1NActGfyihpvUokR0cLwNHNiboef7er/0fRffJTrWcdXEYcnd6jvTpN
	UY48zuraOtl17kz0V/mrVuxwjkUXKpeZ7lLw7uEn+25rpxswSWNrKA1qZFCCV6quCmhc30O74dJ
	54i42U5xVYz5N8xCFICfjA0f+nTXVU7SmnIiw6JPsBFEjVrvEjzq/hYx+tNfrmC300QSRUdk/b9
	6qvucG2TT+xdT6y9deOS1C7VkIBfJyib12xuhv7hbhdLElTiqNuZwOO7Pg1ritDYzlKQ+u4lBUR
	jJvyxJSg2ERo1VA3tzTsR/1lnSRYLjxp6BddlQ+ihOej46YQd9K6ValAp/5gqwuVB2kfi4iH4fS
	oLX1/5+RVYrG94Ip5rNgJIkdF5m3p+lCLPmDdTXAR8FOuDWbiPvyrHcVCry3UICKQzHwG4s9mgt
	QdeTL+4/SVJx2lNBtdQQYVGLsl01QR4MqUzXvxNx/OwWpOobWrHkJgzog=
X-Received: by 2002:a05:6402:4581:b0:69e:3822:98ac with SMTP id
 4fb4d7f45d1cf-6a0a7bf5e8fmr524858a12.18.1785530538465; Fri, 31 Jul 2026
 13:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729012320.616174-1-rosenp@gmail.com> <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>
 <amy2z-H4Kc9LNPdP@SMW015318> <CAKxU2N-mnt1PRWXWbmQ58Z373CAMBU-0ixKAeEAuqiojq-2HxQ@mail.gmail.com>
 <amztmJ8Lj9aUoPhH@SMW015318>
In-Reply-To: <amztmJ8Lj9aUoPhH@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 31 Jul 2026 13:42:05 -0700
X-Gm-Features: AUfX_mwxn8MaxJaQCyq0XQH-eKalWFtXFmRuXfQuMVU3uIv9wUtkx5EJmL6Fr9Y
Message-ID: <CAKxU2N-8bB_BkKzYO0cGbWF1grmc4UW=V5F_kjFYGQruhxG_zQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 11:47=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Fri, Jul 31, 2026 at 10:38:53AM -0700, Rosen Penev wrote:
> > On Fri, Jul 31, 2026 at 7:53=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com>=
 wrote:
> > >
> > > On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> > > > On Thu, Jul 30, 2026 at 11:49=E2=80=AFAM Frank Li <Frank.li@oss.nxp=
.com> wrote:
> > > > >
> > > > > On Tue, Jul 28, 2026 at 06:23:20PM -0700, Rosen Penev wrote:
> > > > > > We need to tear down the irq before edac_mc_free() to avoid a u=
se after
> > > > > > free on teardown as request_irq uses mci as dev_id.
> > > > > >
> > > > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > > > ---
> > > > > >  drivers/edac/fsl_ddr_edac.c | 3 ++-
> > > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr=
_edac.c
> > > > > > index f4cc89b26954..f1ddd1f47f2a 100644
> > > > > > --- a/drivers/edac/fsl_ddr_edac.c
> > > > > > +++ b/drivers/edac/fsl_ddr_edac.c
> > > > > > @@ -601,7 +601,7 @@ int fsl_mc_err_probe(struct platform_device=
 *op)
> > > > > >
> > > > > >               /* register interrupts */
> > > > > >               pdata->irq =3D platform_get_irq(op, 0);
> > > > > > -             res =3D devm_request_irq(&op->dev, pdata->irq,
> > > > > > +             res =3D request_irq(pdata->irq,
> > > > > >                                      fsl_mc_isr,
> > > > > >                                      IRQF_SHARED,
> > > > > >                                      "[EDAC] MC err", mci);
> > > > > > @@ -639,6 +639,7 @@ void fsl_mc_err_remove(struct platform_devi=
ce *op)
> > > > > >
> > > > > >       if (edac_op_state =3D=3D EDAC_OPSTATE_INT) {
> > > > > >               ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> > > > > > +             free_irq(pdata->irq, mci);
> > > > >
> > > > > here already disable hardware irq. Just call
> > > > > synchronize_irq() to make sure pending irq handled.
> > > > AI disagrees with this suggestion:
> > > >
> > > > The reviewer's suggestion to just call synchronize_irq() instead of
> > > > free_irq() is problematic for two reasons:
> > > > 1. Shared IRQ: The handler is registered with IRQF_SHARED. Disablin=
g
> > > > the DDR controller's local IRQ output (ddr_out32(..., 0)) prevents
> > > > this device from asserting the IRQ line, but other devices sharing =
the
> > > > same IRQ line can still trigger it. Without free_irq, the handler
> > > > remains in the shared action list and can be called with a dangling
> > > > mci pointer after edac_mc_free() =E2=80=94 the very UAF this patch =
aims to
> > > > fix.
> > > > 2. free_irq already synchronizes: free_irq() internally calls
> > > > synchronize_irq() after removing the action from the descriptor. An
> > > > explicit synchronize_irq() before free_irq() would be redundant.
> > >
> > > You post too quick, I have not seen this mail yet.
> > >
> > > devm_free_irq() here. and add comment why need explicit call it.
> > Needing to explicitly call devm_free_irq kind of defeats the purpose of=
 devm.
> >
> > Explicit ordering in this case makes more sense to me, especially with
> > the ddr_out32 calls.
> >
> > There's actually a second benefit to the non devm version. The devm
> > version prints an error message on failure. The normal one does not.
> > The significance is that the driver prints its own message.
>
> It may need goto if add logic after request_irq(), I want to make probe
> code clean enough.
>
> Error message doesn't mattter, we can remove it.
>
> I suggest use other method, let use devm add action to make free irq befo=
re
> free mci.
ACK. A couple of other drivers suffer from the same issue.
>
> Frank
>
> > >
> > > Frank
> > >
> > > > >
> > > > > Frank
> > > > >
> > > > > >       }
> > > > > >
> > > > > >       ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> > > > > > --
> > > > > > 2.55.0
> > > > > >
> > > > > >
