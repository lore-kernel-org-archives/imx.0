Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947B74534AE
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519235; cv=pass; b=FfmBrdC7XMAQen4gMgpOifikW0RTjExbBXQaOqYv0O4hqiGVM0LJv6CK4WofJathRkLjrt3gr4f6T/3MW+Yq7ZvAuCmgRrkBVG5gE8PrR6shDXMnH1OrIu6Q5uVUXMI+RiNlmg0QVao3k3ts36bMoPz07ubmAmBoOCn1veR5Z4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519235; c=relaxed/simple;
	bh=2GrMnRyqgn8yviiospUwkG7JcWQ9bwrkHGCB1AIyY1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4VKX5qzOcgcqrq+rRLVY2indfq0ZevZhC6ErnHjMZ7hY0zIEORLsHUEon0+9Ra3iIgX84tS46/VU+oI0qTJ8CAgCArLM1CUlx/ZzVUTXrNbKnyuLyOh8Vw0fbGSn98ITnGtjKHDgwsnYxgaiGpq38z4KUam4b/1YL7fakNDZxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kK1Zad3G; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kK1Zad3G"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso2064421a12.3
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 10:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785519229; cv=none;
        d=google.com; s=arc-20260327;
        b=fIwP7yZ3Yh1F6e88Kda3ARroDw5ADs1CuJmq9t8EBub7sYf+7AdNUTKwPJK2Wyp6ig
         9xaF3HTi5leuEcCjD2jP7ms9fFo7anuax4SYo1i9YbHUEGIrTDMz8/6ghp0v/T3EjUZF
         0FQQHXJg3OjzXR5FALtZPoO2v9Apqu9LGsx0E9EDQV8RjKYDRF8at5x06pG6GaFxuTa9
         vplUKvjQ9cNg3+YX2Kn/4mXFFm8NX9JxcaQm461OuUU1Tuc0cO3ZzgzLswoCxMGnvxJE
         SDyxrHEWUPIDJjeGb6tcGEcMGv4DhiUu47tydREts4Xy5LZoywIkTnDt2ykNHXGPBkE7
         3FnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PcmIIvcbB0qGHPWiDBHv4eEQq5GVkHmXinev6TD5uXU=;
        fh=LoabO0j6xY4rPdY12cmEF967it4T5P7YJEMRYv12wRM=;
        b=F62fX7pxD73JkG81+8497BsInYvXkitIP0bzButjxT+McJ665I9EYZuMpODrvOIpjt
         QGdcX5hAAFxB95OoeKWu4LUOXEW/MefNJ6PjlwY1vzhoXmW/yWIo3SbRmTdozJXAJZaI
         7rbYUreFyZ0tj8FqIxsyI8sKprl3bDsWXm63rzj9ekfzmpFmfoPQHGHcmfNoa1R28u4F
         +E5YkJnzYLTQx7PAbiqFoly/AqKb2hpzEHClqU9i4XdXSOuuNlzE6Ao2pe17EICz8Utl
         kGQj/P2tl8fUIcWeKu9/qgC8SoAS4nd571XPgvYpGHZVmILw9vfFioZB9RIN1YB4z7qj
         DW3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785519229; x=1786124029; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PcmIIvcbB0qGHPWiDBHv4eEQq5GVkHmXinev6TD5uXU=;
        b=kK1Zad3GNCjQ5TYGmTRQQ7QhaDTBrShRZLZc5ZP6DHpqXYaNVT7I1Q40I2+WTei6xL
         uugyHQBpBg0vbTKirnYbj4QRYrFyomAAsIeEK8scKMWzA5Yb8a8zFX5wsOc0hMpEO9HC
         TmaOVALih7Mn5zJVsAkzGVYITUEwQi51n9ISkI0En4Z7DE+nuYu5xs6TbycOv4E33rws
         SfEjIXpWHUiE0byreaVOXUp7IKTDfdVpZ90R2kg2BM+7MNGZQi4HDTvcPLqhew+WbiIJ
         ZMtZfi9Adj2JYJYerlFIPeO86ZddLFs56Ph1+lN//DJxyNQ/Z1VnVpapBDprHuShUhBR
         7yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785519229; x=1786124029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcmIIvcbB0qGHPWiDBHv4eEQq5GVkHmXinev6TD5uXU=;
        b=bmGcRN/BLxwqNbxJoASDuLyCA7uz+ybSuDFn43Q3OmZiNI2TOQ3GGmvyGn0om09N8x
         evnPjBTJHL9k71yTDV8IVUtvMwrXRSSUpqhDaYtfKa4rTLLo6t2fRYm8P1+si68VNq5F
         HtnUfO73aozagrRaEImQ2RNqaIao+qpuy7upmwx+wAMnk60eXux2YOfj+gWjhMNJ8foX
         pzfcN2hcm9/hvN7GEsQVMqtR86MXIEUDabGo5hMpVkrX3igrxs/2k7hMwQnbQ2IDNj5B
         xyTEC3K6PRTA62Zrpyhj+2GEM+gpTnSHzDAaGT9POKz/pYrYKdXAAW1rr+zuG6BGkn4R
         HRxw==
X-Forwarded-Encrypted: i=1; AHgh+RrEVKoYFAldINFjZid6mKmhWX++jYFnJ/BUSA2A6lMD2LSDiRlQlSnkg8kJ1Jni2DhZteo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yynixg14zeOb5RdElqBLf89htzEPl+Iax8aOm9KOgvgCGWeCPEU
	Fy1ijuoXNgEv0F0wcphFszrJ2X8oAUadWDe2QXhClXrJyhjuDqy1WgX/iQ1jaVKWF+p5NqKSJhk
	HoNIYnosga77caR9GwYpAlgCLzUiTqOk=
X-Gm-Gg: AR+sD12GwFmxZHv/5Tk2kqQbAFom/06PqgCZ5UVoDM0JvrxJKR2XPnyXBN+lH3qFvQz
	vvvBznyWSoZ9WgHWMj6WYQOXArsMZ+xvOWrWK6CgbY2vcLB+XudLHvRppVhfsABnr4ubwnbu/rZ
	84RtiXdjyZx8Alm9QLI2qYeKZniqVOvtIEznAhgy6x2axWAIt9qrjrQfz1IcSSL0/WppKCmP2hj
	vTHOeer+p3rwtD45Z1u0RFeDXISheRhKLDWcQhfmuZwMW7sjB3YSVdFDk/Ear9u6kGe0Yu4QOmN
	WuM4GYoYF63Sz/sn5Qpq5bolrg+VWAtxkHrTIjRUfCCvCSIUrWScvYvVIP01YZ9y9tBvqJTn06y
	2FXUezAgjZNkqKo6VKOkAp+7V3MlVNUu2mVVNyYIsMAwyy+H8bxY9uDouXFrUlXLg+M5a8KqFVj
	s1hrpJ8MnpllQi0m1iCq9yiUTvwmRS9jGoRE2KuXocvBeIpVQDRW2TnWkBeLhyuvGl9Q==
X-Received: by 2002:a05:6402:3882:b0:69e:2585:7e6 with SMTP id
 4fb4d7f45d1cf-6a0a7d0274emr358248a12.30.1785519228943; Fri, 31 Jul 2026
 10:33:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729012320.616174-1-rosenp@gmail.com> <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>
 <20260731003650.GLamvuIgDKrojvA7Yr@fat_crate.local> <CAKxU2N-GnnSqTPPSYwpXiNRNdP+qdJWf+ueaNQQWNKvXWag3wQ@mail.gmail.com>
 <amy7R6W5aJ58t6fy@SMW015318>
In-Reply-To: <amy7R6W5aJ58t6fy@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 31 Jul 2026 10:33:37 -0700
X-Gm-Features: AUfX_myS_XgghhnEdjsO8mX4UIlPQBCy3ps5SVm87UE3VfhsoJ1tEnuNxGsp_tA
Message-ID: <CAKxU2N-KCz2UAKY77fUb9G_ReV-yRJhZogcZkvL4N_N6nrGWnw@mail.gmail.com>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Tony Luck <tony.luck@intel.com>, "open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 8:12=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Thu, Jul 30, 2026 at 05:44:34PM -0700, Rosen Penev wrote:
> > On Thu, Jul 30, 2026 at 5:37=E2=80=AFPM Borislav Petkov <bp@alien8.de> =
wrote:
> > >
> > > On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> > > > > here already disable hardware irq. Just call
> > > > > synchronize_irq() to make sure pending irq handled.
> > > > AI disagrees with this suggestion:
> > >
> > > How about you try to parse what AI says and verify it yourself?
> > Makes sense to me.
> >
> > The alternative is to use devm_add_action_or_reset for edac_mc_free.
> > I'd rather not do that.
>
> This one should work, of add devm_edac_add*() version to simplufy probe a=
nd
> beanfit other EDAC driver.
That's probably appropriate.
>
> Frank
>
> > >
> > > --
> > > Regards/Gruss,
> > >     Boris.
> > >
> > > https://people.kernel.org/tglx/notes-about-netiquette
