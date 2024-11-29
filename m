Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94F318E34A
	for <imx@lists.linux.dev>; Fri, 29 Nov 2024 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732879101; cv=none; b=ZNgwRvbF9fCWHQmoZHr3ivkUTAOuRwAP3wsWRHv74ce9rPULRy4kzECszctoc4U2XoLoBzM04w3NgCZQVFoBBo172f50SR9XLdq+jGSAeJzYuW51iZ5eiauFNT9Sq436FpKRDx3ai1fkzyBlKvCCbpvfEODLTmw7Er8L4zUnTI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732879101; c=relaxed/simple;
	bh=LOU65vm/LSIomsbDKHI2BR+2CFwDzAWKrSYahD7R3ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1BIiMYuR+ObNOTL6vMgh7rWmTiYSsZ7jJHK308MUETQwgCS3QvDxU76HSgXMUEBeHA2TZOwXX9Kvm5rT0u5Lt7pqoCyVQffR3XH76NoGFTJxDqDtL+ndcAzNqmd7v675KHZX1Oj9iEH2KbTCxxobtC4YJv1dnADy0Sal9RtAck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpRHI6Ad; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpRHI6Ad"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53dd0cb9ce3so1449963e87.3
        for <imx@lists.linux.dev>; Fri, 29 Nov 2024 03:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732879098; x=1733483898; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOU65vm/LSIomsbDKHI2BR+2CFwDzAWKrSYahD7R3ms=;
        b=DpRHI6Ad12UOgQEM8Ipl5gC/MLjh7SJZgLoLoQqEIebQIcRScODVRjUwzDE7lMOMg6
         6IVibz0PQ5czuq48IYayGbHT3N2PfevG81cLZd8eWSKijYO+013jAJQV3FdMqP8yHkJI
         HLAT5FIsDytcb0F0z1J4Sa94obm3Itb37o+twg5D1BcESfh+BaWhkIlHeGkyLbkCHXfP
         ctvqDc9f0t1O2Y/L49/UI4gmoAes9TdB1G0/6dMItrgmTymrgLqT6v82cknt2pyUDjpj
         fUKjIlufosxDfYgWln3VcDD0WGmbYaEz/QWKykC6XlkATR+j/+oAsCT08nr7erEa2y2f
         hd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732879098; x=1733483898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOU65vm/LSIomsbDKHI2BR+2CFwDzAWKrSYahD7R3ms=;
        b=gVPWlDykTfTqhqQHt/Dkzaw1dBwCcROCCEYfqRT4ZUoj771jVaqAIaEaGuVUEEPMHu
         GhMzlZvM3vX10H5nk/c1Wu4W6H0p1eqn1cGTRKK1pn4+Nwt/88Ern6p181qdHOURJ8Nt
         /BFn2Jo32EKvX6QFCPx3v9shwJxtjPGTZs8OTyBshBy2fVFEs87r85CZdttmS9Dy886M
         Eqg/ZSrmIrcvG9O+mjPZD/FbWukq1anFgNdTYMgcE/oTX+wWQpS8ft58fhouHGDJmbmh
         8MMmO4C0e/aFkLPXWVd4YDoyT190EAFRT5WpdbaLmZBV2u7wTSOMMHpYNvNz06+7S/x0
         3oUw==
X-Forwarded-Encrypted: i=1; AJvYcCUR5tAHZ2wobncW918Sn/oC9W2KveqdWujVUwOl7IwLW/nXSdmJVDIUR+BPesBRNahtKT4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCox+zGdZopLkME5pwkUSGvlmzo0NWhSrv9dkm/tob+SGFjQjJ
	YB5n+AE4Z9iEKty1NlzIJdJvLGip4peEYlYR2raml56tGFolKlPCHcFDdxpsh3GhxYLJjJC+LTH
	/1LoPtPLJPzM+RUlvhtyzhSp1RU0=
X-Gm-Gg: ASbGncvmhfSbgix4xxsb4JpLvZaEICNOHwrfrK3Du/p3vjo3X0ryeNBXCFNsM5uuQ73
	4TcVLm1OlHZOrmxc5t9GkbpNofbXk+3YbaCmADY2nIbhXvlrF9wabXwse++iN5BA=
X-Google-Smtp-Source: AGHT+IGaUUHzoanhVPRPEfEi0nJkI5YEmDKHNF2hGMFhFR6CkwGEiLoh9eXbuUcramkmRyujAOMQr9l0pEIc/VPNtF4=
X-Received: by 2002:a05:6512:3d1d:b0:53d:ed16:7a43 with SMTP id
 2adb3069b0e04-53df00d3d4emr4322112e87.17.1732879097468; Fri, 29 Nov 2024
 03:18:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127190605.1367157-1-festevam@gmail.com> <CACRpkdbJgrwzh_D5=71dMPOx3jgbyUJOiP-+16JUdL79zDEbTA@mail.gmail.com>
In-Reply-To: <CACRpkdbJgrwzh_D5=71dMPOx3jgbyUJOiP-+16JUdL79zDEbTA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 29 Nov 2024 08:18:06 -0300
Message-ID: <CAOMZO5CRJrY=E4bZG1aBDh6H-+rrtL-n2SEuEuzC7MN1zDvqvw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
To: Linus Walleij <linus.walleij@linaro.org>
Cc: shawnguo@kernel.org, linux@armlinux.org.uk, s.hauer@pengutronix.de, 
	esben@geanix.com, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux@roeck-us.net, arnd@arndb.de, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Fri, Nov 29, 2024 at 7:15=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> Fabio are you pushing this in through the SoC tree as it's ARM-only
> or am I expected to push it through pin control?

17d210018914 ("ARM: imx: Allow user to disable pinctrl") comes from
your tree and Arnd sent an Acked-by,
so I interpret it as it should go through your tree.

Could you please apply it via the pinctrl tree so that it can land in
6.13-rc1 to avoid the regression?

Thanks
