Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DCE3859E3
	for <imx@lists.linux.dev>; Sat, 28 Mar 2026 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774696532; cv=pass; b=fFAUBB+/4xNzom4fv/LFILnj8xA+f15jcPyoap5CgzOZmRMlg4+E31aP56UCccPKfDYDTggMGV+SG9dj2nslRExrTwWqXARavk65ZDqEJIflzcvEIIqrBhrj3kjX2SznwvVLoyhNIDDLl9Rd+7WEANzZNfv3RAllZVoNMZaRF2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774696532; c=relaxed/simple;
	bh=GMvNtChBKJjdwyS/+GTl13oTZyqcxPbtMIjyiOqLNgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1rBE+tGUB2yvPSjxu1Zx9bvWu6UMxhiyUlfVMJ0cpc+xgNrvjd7PQptY+gKLAQjlcRtwjg/jC1QtnRGl0/8TX6HgTY5jPi3l2q3+S4MPpP4rb+DHTF4yvkiVSrMK9J8BgoMqOygPmYFNITxEGxFNIRz7MJwsfnqZ2A/C2+zHls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IunRdYx0; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IunRdYx0"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-40ede943bf0so1874046fac.2
        for <imx@lists.linux.dev>; Sat, 28 Mar 2026 04:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774696530; cv=none;
        d=google.com; s=arc-20240605;
        b=bsR/OM6pL0XmZLEoIa5/0wH6cuYxqcBqvUK9SItBRT30CHgqL+3PwqBY7gmhW5n7Bf
         Lnr08CDkyqSmEWCT8B5v+vXxhslIKTWMyVcDrX5IoCbmsUW8bNzrMCbnSOgVGrn2KAuE
         cK6tMQ16pNE1hCAQwNi2dTfOT18ZSF4KSwpHXd4clyuVoa/0c8+SlSE6wfWHz9SuoIzI
         hTlDw6tbAX3OYk4IYrllK3QcWEVazqZdwfSVufIwg85r91u/qecVF8XNUaZ/B+wl25NZ
         INpAQoXX68dXMAH5WR0aNp6Cg+zCOlSK+t0XLkxvT+eUwFIL9xQ8vvjjcM7VLUmHMpya
         rA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cncPSoLfsUFWH5ZGfrEC9emTM1DT6AlrNfIAu40YnfY=;
        fh=Gg2Ti29bJAXqIpAkfnFwM/hu6ZQ1isin6Dg1vI3NUOo=;
        b=MIDk8gbaoYuju4ckPWwJupXQvHoGh0p459AohxROCn1arIPwKvzez0SnMoahOZ13Ip
         MCXaQjACjqoljgrjxu1X2bh5vOKcBObrpg42BPkCWifEMBKlQXJGyFwoGeqk92M2ib0Z
         mPf/aBh/DsD/M7Gg0ND0dw/sjKi6HVjJsXL5/8IRYA20NpO/SX67MyC8u6/7caQnrUuz
         K9VWicN/aBgHv0joSbiKE+wGxvLlLX56KZY7VEi70eaovRT2RGHxkIz9rHW1tJbcxZte
         FDCTgNup6Tt2HshInMPc0Z4rBhBI0UrzRw4r0oz7sgJWW/DuRkKfk1eJq3sbJ4Imh1l6
         2LhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774696530; x=1775301330; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cncPSoLfsUFWH5ZGfrEC9emTM1DT6AlrNfIAu40YnfY=;
        b=IunRdYx0dIxO1Pe5D+FvXlrMyTVDYBrACPkRiKjcarP1jJdO/mxYAIcHX5IgSnsrTB
         YVq5gHfnvcQvg2uYpAxZDZlSURR/zWbKc4yojThIXLPjImQoWO1hsfEq+qFWc13HGNFZ
         20/3SVx00Oyw3dMtdpaAg5vqqV+Mj2BEG2G91KS11aVN3yO7MNPOraBN5IuumlABTSxf
         P03JM3gs3PNNBxPz0BeupCBP7wJ9yN4NDQOPpBv38D65cg/+3Enz4AaEB3C0cwIAj8m/
         rL8Wwz7BH6HcuXS5c23Spys/98OofKxJsSLtKLwvaZsQQGpKZrPjH2SxwS4kGA07dBh6
         ELSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774696530; x=1775301330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cncPSoLfsUFWH5ZGfrEC9emTM1DT6AlrNfIAu40YnfY=;
        b=azbjeAR3CMdyy4v3NUj9ioqdcoW/GbmsBSSsjJdEzTvn1zIbk23Hwt9KG3uz7GcjBK
         gehcOnt99I8l4AX6KnVg2LZZsZfn5p2CIGuswyyxYN6uuDj+09HDGmtrSbTEQ7DOjYme
         +7tRxJI55VeZ0HOHah2L5Jfj1aBlKRDMVuUBvU2unslxS8LyWbpziGXZ/SOrXwvQI1cs
         AhnsoGH3M7wp8Q97n44r0fSgyhbJtFaSBTX3BmoSzKQ+FwdT8os96eXDsATuIVbp498K
         E8V8VOmcrpWD8fXRRSaCjw02y9FT1/qkAg8qA3WjfKstvSBlyvjX51C6T8QEP5wSz69B
         dslQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxyyFXuJOQLoGf3S41WP+2yAavcMAWYdJmip9NHmhxapV6JbPIXbXSEnGlJA3JkkNEO0U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8zE0alQS08dpWj+d6F2Yv63qPTRr493RZIhVBZv+62e3esr33
	mB6hnQ6E4u8E6dGhXwsLxA0AlOmePAq5iGlMeZqg3eX0rgRiiiTAJRFq9H4sCYqaBgpUglx4yvU
	ESl5FrzwWQnfQ4vq2dm4Lw6cCSHE5Rzw=
X-Gm-Gg: ATEYQzwSaLheIQGq51s2qfKcVYA2LhYIl2P2k9wNzRg6zlbzhQwJ07vE57Q2T/2DPsV
	pOiWogc13XQ7bMqt9rSnvJokMo5roFTnz4PQlG09W/CtDU35AahcFTcUG0zBFSWPsbfWQASDKHY
	j+aOMj8T4I8D4bblUrieb0fMlyUvEwNCC6PimF/AzdfI6l/XPqehX8ITOQ9+DmOMxT+tc2UceRT
	uuHHP8n/xdCE+bbTfuuUOn5uksHaQymLfbNMbFVdnJBCBALAkVXVteExyQufZuvgSp4LeS2/lM0
	aLXzb3abuNVlRouV19c1YKIlkEDJiI8stoVqsA==
X-Received: by 2002:a05:6871:341b:b0:409:57ae:54e4 with SMTP id
 586e51a60fabf-41cec068104mr2925514fac.9.1774696529587; Sat, 28 Mar 2026
 04:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260327222711.268132-1-devnexen@gmail.com> <20260328100010.41236-1-devnexen@gmail.com>
 <2026032803-tree-stubbed-1e9b@gregkh>
In-Reply-To: <2026032803-tree-stubbed-1e9b@gregkh>
From: David CARLIER <devnexen@gmail.com>
Date: Sat, 28 Mar 2026 11:15:18 +0000
X-Gm-Features: AQROBzADIpiaAdAsSWDXr_2MGaRWWGqF3eyfR0B6mVPGw_ItYK7BztzM9d0l-jY
Message-ID: <CA+XhMqw+pR3fLGbysq3FnfpH+b2GtmdhSjjgCKhTwfZFrF0_0w@mail.gmail.com>
Subject: Re: [PATCH v2] media: nxp: imx8-isi: fix memory leaks in probe error
 paths and remove
To: Greg KH <greg@kroah.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	jacopo@jmondi.org, aisheng.dong@nxp.com, guoniu.zhou@nxp.com, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 28 Mar 2026 at 10:21, Greg KH <greg@kroah.com> wrote:
>
> On Sat, Mar 28, 2026 at 10:00:10AM +0000, David Carlier wrote:
> > mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
> > frees it on any probe failure path or in mxc_isi_remove(), leaking the
> > allocation on every failed probe and every normal unbind.
> >
> > Additionally, when mxc_isi_pipe_init() fails partway through the
> > channel loop or when mxc_isi_v4l2_init() fails, the already initialized
> > pipes are not cleaned up =E2=80=94 their media entities and mutexes are=
 leaked.
> >
> > Fix both by adding kfree(isi->pipes) to all probe error paths and to
> > mxc_isi_remove(), and cleaning up already-initialized pipes in the
> > err_xbar error path.
> >
> > Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> > Signed-off-by: David Carlier <devnexen@gmail.com>
> > ---
>
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.ht=
ml
> for how to do this properly.

Apologies for the confusion =E2=80=94 I wasn't submitting this for stable
inclusion directly. The Cc was added based on CI bot feedback since
the Fixes target is in the
  stable tree, but I understand the correct flow is to let it go
through the maintainer tree first and let the Fixes tag handle stable
backporting.

Cheers.

>
> </formletter>
