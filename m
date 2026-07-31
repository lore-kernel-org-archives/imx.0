Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D51329D267
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 00:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785458690; cv=pass; b=ej2jjHZBFtWxN3IyxRLFhR2w/CgaB/MCl41/TqkLj9ZYsu1Vnq+YzXBkgnBnNnXvvN7Sv3TRaRAp7QA8NCTn1shGToifTRhBdXxfcs6MUAbalDOZDWtq3nDXXn3l9Vz0wLq3tX045gc7MNFYVcb4+hclMwQCRZ2ssP4UIuKRBXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785458690; c=relaxed/simple;
	bh=RmSPxtW+2H8QmEj+sRUMEzP5pT+izkC/Fv7T35kBDf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GhrxUUche2dzM2q5Bt2rBdd8O2vTaM89uwf0s2orIly6faf2MeqG616IzTkI/Cp+cs9cu9fIitgbrHurD1EzPu7ljTlxW5FMpBhS7IsMMv2/BZE3B8/ac3RiKyrx6+6+cmYjWhohJaEisW6AF6JUzBNYB6lZ8LvnfFCjz8rmK/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbnLk6+B; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbnLk6+B"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69fc6a09b5aso722738a12.3
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 17:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785458686; cv=none;
        d=google.com; s=arc-20260327;
        b=bBylnmaqKqk5RcoHUHDgnAVAVc2X3Mza2zmtSN/gELfpUi+GHz6m+hvBbWblL0MNdy
         QYLETWbiRz4AA0uxezSke6SaF7qmMVXasrx4yWFTHW+TSzqMENqGCV8U0ySu0YAe4/GP
         i7n0aE9/bAFgE/ABwqNlqcbb7YOU0J6VQJ4qQxgWyx5jGOzwAzWdAcRX/nq0u/CYSWvS
         kniEkES9vJU4yTmX6jfHA6+y8S9pQxq4uct1tLeR8w6tKji+y3BHxx9aboJQXZS1vSrV
         hGlen2BRAalzKWeigECKCt9Xkbtbk7bdlhhtn/veyO6jWCw9nEc+ir3tCdjrMUT5/ErO
         6Kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hg0QOEkG4vYtInjORlmzxyaD1qxCibtY4OrHLFhf3HE=;
        fh=ypqXhmK/XGat5Cj9lZPPX/+V6G1AjhJz7Mihl06ogv8=;
        b=MNGcKgDlXqEfbog+g8dBg90sKaRW8hFZZM4ERkHrfNAsujAXjzsWUDmF2SQ/BqdYJ4
         TpLP6L67cm0cLgoFNPgl/wGeqECkoc7CajBQn7waD4snLfYr3OsTFrvCD1R4r5luNgBC
         qgZTnX8Jy9PA6CsGedx7MckW33wJd12z08Yl9jAs9zpPjU3UkDom90xVIrWzAh6LJaDI
         hXXrMfnU30f09vB33fxZlPnCb2JipKLrmbVRLGD/qLmUhQ9YBgda1gsIiCJ+NUFNlbtJ
         X7EHAUjgGX7NHfrvwbL8ke+52MuzcuNiMa9dQJj9Bs5cNrW9M3gUP0BOohMWHnRlHBJM
         R21g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785458686; x=1786063486; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hg0QOEkG4vYtInjORlmzxyaD1qxCibtY4OrHLFhf3HE=;
        b=cbnLk6+BgGcJvaQDavHY4DiK/HpAmeMTepXq9cTaCLBI3RlX9GRLhlc+kM+OgFVh/K
         AUNb4SsW4Vg7JJ6HBm9tglLbmou1TE+3HYu7eMq4ps2+zN7I8jdZYeCKk9iiommZOeES
         fz1Hgv55Pq83lka/CrXkQsds3Ymp9dJg+ed8WNHAHoek060DytU2zhTXrp0eZbBBOlGB
         7I6zZMRKF7WaWdI1DAsYMK9zqo5kINcwwycJG0AlbfOrX3YTZ8+AFBbWLZaRAel56lDs
         kHcG+Prbt2k14JWifULhV1BPjm1acPKP8uOAx8pnMZ1AxL0NxrZMzjFSU9MlBCxVwbnI
         eTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785458686; x=1786063486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hg0QOEkG4vYtInjORlmzxyaD1qxCibtY4OrHLFhf3HE=;
        b=qo734QP6kSswwmwjtbtHBNOFSUY4y+6IEoB1ewpVbtjnol+WelGHY/K4rLhd/vbtFr
         YGYN7ae5px1HlCt9UWnNGe3ppfO3lC4yuVX95ADhVFsMQtTEx3AxH74fzMr90sunMcDb
         j5rLmJKsiDIIiuj3yZ4bkXANnuC4r61/zmDYfk50bRBJub85xex+D6/Yz9kg7BbASefG
         aSeETER5oShMpf3sVqpuY0BLNrjbJJAKAK+GGJHZcPqrGYC2IQvEM2vLkj7TASV/xGNS
         oOz7gRNJJztfemFxmubMGbZwJRzUB3M8mNXQPNNoWZtO3t8EIqY0qGgywbFI++ZK0kj6
         n5ug==
X-Forwarded-Encrypted: i=1; AHgh+RrF8kanMT81FvgBO8lHHpkQZOyimBQJw8dkSOZkzekltGLY6ojtKy1q9J0Ua0P8uK7idAM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwX1JkuqJEP1AaSh95y/AP3Mi0rMPRhOsHrOxi+LMlB3e3MfREM
	qfSaOO6uc9eTS0TQE20ryZ6cFLoMg6cZ4D6hEmrSGxoicoAQdokMyqWJQm1t6RdDugcS2UacU0J
	aF3EX0qsi8GkuuXs+Fd2FvSgvYoKwQDamJJn/
X-Gm-Gg: AR+sD10MHKkHcozDxeOVe7o9owv7F8za8tEzjIXeXLDERro70HyJZzWnVIkdRN5P4MJ
	3bn2pPynkzUl5zM0/R8bmSy/q3mffuJW/iruvUONXEfT1akRw7Q4S6FbMMH2Ia68Ulrdc7+Yq7F
	6nV2L/+Dl+15P/2TihxYfsXxMSoBngiQlB9kqH18aoHmRXG27j5zpmHCs5coF6m+xFD412e1qd9
	Y44WYByRyqbAHiRnBn1Ybbx4W010/jH53+tJIc7MXZtp3Cp6Zy6WNn7lVpDYX25tmbXeu9cFeDX
	G5pmWZsoAFbtwm4VjOmieCenX9RGCaQvsdLBIqHgQHmI+xEvkwFVCGQNBfgFn2TE6gvnuK8GIJN
	n2bDoAhFri5jz3PhdhdSxPIB7ETkJhEjNb96+IwHk3dkQhVX2GvPUOsHoadbcoQ1NrMEfYFB8uz
	LDHXBkShxJNEcTmn4Kxs/mRlrwNQnRF0Fnn//l/xyU3+RzzzSqqYDbzjg=
X-Received: by 2002:a05:6402:2423:b0:6a0:923a:cfe7 with SMTP id
 4fb4d7f45d1cf-6a098d2167dmr6769a12.37.1785458685636; Thu, 30 Jul 2026
 17:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729012320.616174-1-rosenp@gmail.com> <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com> <20260731003650.GLamvuIgDKrojvA7Yr@fat_crate.local>
In-Reply-To: <20260731003650.GLamvuIgDKrojvA7Yr@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 30 Jul 2026 17:44:34 -0700
X-Gm-Features: AUfX_mxgQSCcsnyTFzeRTEP6B69fhRmRVOHrIZ4lirPD8ZJQL1uhaxN7k2m99dQ
Message-ID: <CAKxU2N-GnnSqTPPSYwpXiNRNdP+qdJWf+ueaNQQWNKvXWag3wQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
To: Borislav Petkov <bp@alien8.de>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-edac@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Tony Luck <tony.luck@intel.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 5:37=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> > > here already disable hardware irq. Just call
> > > synchronize_irq() to make sure pending irq handled.
> > AI disagrees with this suggestion:
>
> How about you try to parse what AI says and verify it yourself?
Makes sense to me.

The alternative is to use devm_add_action_or_reset for edac_mc_free.
I'd rather not do that.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
