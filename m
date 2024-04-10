Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797E6522E
	for <imx@lists.linux.dev>; Wed, 10 Apr 2024 00:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712709730; cv=none; b=t1K+jFNUVnMGOXc+BDSSFivk9KysDhfyr5+TzZ98e8Uzwa+4D2F8gL2lBCoAxURkUumvm6jWDpKfas197JxyuJ/90nvBO6u+Afiz/TikqDuNqS93fi18HWTdA338tEqAF+y+28v7tWTEvuQMKv6SQhcdnSWDQLl3GmvVaTofo5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712709730; c=relaxed/simple;
	bh=6n12Zu2PXd66Y71IlQLtaUfwzP6yoiw9IUKTbil8GRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhxlFrpoSB97ek7DPe6QEQK+h/ZGORTEu7KHhzHjUfZ1RwXasTo4mcswX+RiZOi70T2fjShUtUWpApGRGQgie8N3jeGxXzrAGTjruRhGItk/34A4SiiMd1ltNCbayVz+Cd0Exff8AmzGzHrSEbrTETxjsQ7ueDqRcUYfHVBQCbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vGZXwK2A; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vGZXwK2A"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-434ffc2b520so68341cf.0
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 17:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712709726; x=1713314526; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E707FZfqJXCBcA2uPBas1hK+jmqbfEZiGJ11/cbpPtU=;
        b=vGZXwK2Az4sRUD27gVW8sBrcK6F66Ozq4Eo0zzc9IKDG+Ogxa/Merh2/SZGtnNv+UH
         VyGX7/XcEg2PqDw5bUcW36oLd0d8SxOwUDQUQ2HCqaRD/fenfHFaV0hPCFaNVCBaERRu
         Tx+oVxWioktTIE0yMhWBonEh57dajeMkO6FIgtn3/rcNm/SpfnBbIlrT58kE5QCy5Wjp
         c9djGhWuGV1H8N/fYu5n0PGMWrhlchJAjBHOqLnAIxTYODijEf3R7KF9efriIf7ARafb
         txscSv3aQC1r6k05iIbmJjdxxuX/1hwkKvqQViCSw4DDm8HtReaWmEsPDl4h79Ome1KV
         763g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712709726; x=1713314526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E707FZfqJXCBcA2uPBas1hK+jmqbfEZiGJ11/cbpPtU=;
        b=V3GDrgl7nTcfigz9N9AbxXYK80XRBMWJUSRAcXc38vND+VdHvYkFvnx9w+/pSahpFN
         ykh/A82jao7zh3V8SifHJc+su75mhkcKh6kUEZc1ybNa7Vx2CPpdMDeKb5+ExpqjULSl
         45QF0tQnFoQuule41YitTKHY/1x1H8/RPxoujCR9AW5jNs06iljH4uidzVbdl1Gyj6Rc
         TBJFFEcY9B7JRKX92KS23hnvwz44P6FmR5JNvrAtmAGN8TaB2KBRpmwuT4CWz3xYq83S
         kgYgWfdWfhusmZ77DCWivebbGFoJf8cEc1Hq4t6CmQ2ipOk/UEHpbu8SzXAxfCGDeuvC
         cVUw==
X-Forwarded-Encrypted: i=1; AJvYcCVUpnMMsoQKCAFltwvSvaWr6WjW+aI460ajEwP+plZNZwfpkbcJyIqBnzEeowiWzwBWC4992u5+NexjrtsVuGs3p8bm
X-Gm-Message-State: AOJu0Yz94LCXoDuALr4cRhjqgRmrntxcJ+OVNOK1Gaov99LXixa+jcNr
	rThW9/0fD7tzkrYd/8ZM3+4j8AgKgZPPaDzxaRX4rkvgk87SrFF5JMKlCr+LJ2/6E+3w01wBkOg
	mIaOYNv7Itp9RO1VjTRcGpBqV3FNjt0L/RTdn
X-Google-Smtp-Source: AGHT+IE6pOiRvKwazX638Ih8wKd7cvEo05JqQcXWWafVxMVp5G/KiIGH74/vCv7oIW4NbZNraz/tqKumu97CziTEeuU=
X-Received: by 2002:a05:622a:1cc3:b0:434:6677:7311 with SMTP id
 bc3-20020a05622a1cc300b0043466777311mr50389qtb.17.1712709726223; Tue, 09 Apr
 2024 17:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240409053704.428336-1-saravanak@google.com> <CAMuHMdVL4xUMARcze=ZyZA=Hi3=nvfZ34juSKG7cgA5ygxASaw@mail.gmail.com>
In-Reply-To: <CAMuHMdVL4xUMARcze=ZyZA=Hi3=nvfZ34juSKG7cgA5ygxASaw@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 9 Apr 2024 17:41:30 -0700
Message-ID: <CAGETcx84fpe4KgrbOr15DYmCKLqdDVHn1DdkVRT8FjBW3qBLXw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] fw_devlink overlay fix
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 8:10=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Saravana,
>
> On Tue, Apr 9, 2024 at 7:37=E2=80=AFAM Saravana Kannan <saravanak@google.=
com> wrote:
> > Don't bother reviewing this patch. It needs to be tested and possibly
> > refactored first.
> >
> > Geert and Herve,
> >
> > This patch serious should hopefully fix both of your use cases
> > [1][2][3]. Can you please check to make sure the device links created
> > to/from the overlay devices are to/from the right ones?
>
> Thanks for your series!
>
> After applying the first patch (the revert), the issue reported in
> [1] is back, as expected.
> After applying both patches, applying[A]/unapplying[B]/reapplying[C]
> overlay [4] works as without this series, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Note that the state of /sys/class/devlink/ after [C] is still not the
> same as after [A], as reported before in [5]:
>   - platform:e6060000.pinctrl--platform:keys link is not recreated in [B]=
,
>   - nothing changes in /sys/class/devlink in [C].
> But that issue is not introduced in this series.

Thanks for the testing and additional info! Looks like I'll need to
make more changes to accommodate more cases. I'll send out v3 once I
figure it out, but it should continue working for you.

-Saravana

>
> > [1] - https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8=
x6=3D9F9rZ+-KzjOg@mail.gmail.com/
>
> [4] "arm64: dts: renesas: ebisu: cn41: Add overlay for MSIOF0 and 25LC040=
"
>     https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers=
.git/commit/?h=3Dtopic/renesas-overlays&id=3D222a4936b0d3dabd43bdffb3a57842=
3bff97b02d
> [5] https://lore.kernel.org/lkml/CAMuHMdXNoYH8PJE1xb4PK-vzjXtOzrxNJoZhsHT=
-H4Ucm=3D7_ig@mail.gmail.com/
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
