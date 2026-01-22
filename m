Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB6730FF03
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 08:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072253; cv=pass; b=tY37RSWLg1G7/49pYqzkTaamN02Q6pzOUE4Kb+IuU2dassuhhWZT/vugV2X4WO44M9WoE6sVTTUk+yvjx1obHgZaKVQ7QTGCC/v6hLJufKLFwaUrB0uRO5uIZ9aG4WLnEULESiqXQ6EBzzFsn81HohDkWP27uzjRoC9mJzGUUvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072253; c=relaxed/simple;
	bh=3J6gYorDtO7mNp6Qmg57Ase80b6wKmggy4kn3B0XUVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpdDcH/gXfVLvwB14GGjMJynOpWMOybSkhJKWgGoaYTGbrv6XzMWn1MwK3TLTv7zoR7f/1r0zFZCCIWJxu7gGXhhoksCR3NRADIGqdh4HQmTwMF75otDG3i/DJav/7MKm4v64s3Yso6Ey8dAsTBb1MHYkNtMw8Up618DivsI1EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiCwtVL/; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiCwtVL/"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1233b172f02so1097285c88.0
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 00:57:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769072251; cv=none;
        d=google.com; s=arc-20240605;
        b=Ok74KxCwVAh3KmdTo1iXUspw4U36K09HjTn7/BJ7IGZT2OZNWbSao1AIk72nKDOOv+
         l29dqhpooqe8qKqeWdLJ9Ryb8rxfm2EDf5cPQ5l54WIvVCWDv9wxe+TtWBkZjljw4y0T
         hhfNZQkRJVZn/liiK0D4R2v5pw5xzLZ5A7860zv809VsCId7NKKK01Cx0hI2fEQMloL/
         /12rx78g9xnQWnWF6B3VmWyCdwOKwE/EjDTzZVQXA5SXypnsCOgu3pCsfiLkD/OjmLkD
         WERf4fGYWnMWPO9xhqIRRfc9z4yIkD+1Yng94YzQYvFjw34zTtDy6hH1yO13pxWrCFfY
         5sBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3J6gYorDtO7mNp6Qmg57Ase80b6wKmggy4kn3B0XUVM=;
        fh=W9K4s/CmEotK2/i7AtKrBdeQennNwXxDTYbo2E4Xpxk=;
        b=c4MJN3tIV7LaajSQg/HF45jdAuogmrCN0+Kiv6JFCRckPdjeKBmaPsWV98KEs20Lgw
         Upaof2mitO4n0hXfmkIQLYebn9AYRH11DEwSFcR7Bsk6QTjyh5lB4qRffXG5iw7vx3Wf
         fKNtFsPYNOcxmk01m5ZoMO30l4b5rMDW04aqmnd02y/Cgkdrsu+k7PZhDVrLoC+azVTL
         S4z83+otdXTMsq7XM355Rinh/BrcVPYibLYYPEQ2JsByJsh+eH2rxnducywypJAuq1ud
         IDl5WIfKGyD+w5+IfDqyn2f50hFTjteUEPwzWUw5YolA1GYqbXytCwTG2friEOURHurp
         1GtQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769072251; x=1769677051; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3J6gYorDtO7mNp6Qmg57Ase80b6wKmggy4kn3B0XUVM=;
        b=AiCwtVL/2mKHENte9Fu+XHuCGCwB7lvl+kFTp15xWvKSyFgUfVqQGlJF/QX0w4AM1C
         /2ntHTFikWmUy+0q78op2xop+sj26WmyL8wVUS6AZtoOZA3p5f+ScScUxh29jAijjyYD
         SbtSCXDmMM+xTOkb5i8cIgCGTcd04JC4rSgG/LuA0Pl673jGApklN5B+b7fKOZNRsXDF
         csWq+oI28p7wuz1mnF5n9iyG/cbsB772HclMYpjZRG6IQ39T/ua0TUmC+6L/sxV4TU+r
         CC2lj8WKimEfuV+mQeS/epdNUXMPzOX2jXB/vaMzQqK8Mu6eVoJBn/b/BCOtCdxl+2NB
         7nmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769072251; x=1769677051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3J6gYorDtO7mNp6Qmg57Ase80b6wKmggy4kn3B0XUVM=;
        b=dg//afax1gq9VdZa2XkfNtkfw/MW8AY+Pbqs5fUgS81BsI+9ORT7HBLgNxsN8VcCTW
         9GSjuBMJ+qFYGFAknZPnVQluIVR1EWG3nL922hKtkVeXC5asftJ8B3Y1Ioj3B6Ob1X9x
         GetshDXM9ze9PEwwBK1UxFKUY0KZZcx9OFPcPnE0o+7xlCfGFZsef9Hc8YTcS+53MypF
         0AR7hMhR4UBrYV7+f0qZoq3ka6grw/nn2CumEICdBIZkEFLZh5/TFlKFbfrSgBJtNuvy
         Qry1rOwevgXzJ1I9T5B1edy/HBmstlnErrkdK5CXRfL/c3G3suTkhe1uYlRiNGwfI6Sc
         4j2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUifYJeqP519v4hMJ99R91KRa0QLVktiPMTG9gWLaaOK3+EciuxOyklnUsffCqnMDroQcY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbyLGPWfj0mXrpm7M/JUvhjuj050FnAJySBUC2rc7rj1NZdkBj
	W1dru1RK4YTuFV2YIR2DHXkykjl3y5778PY300xZ5oiQ6nCCrmJSK7W0+5FfDvVqq17uzRHBcT7
	vwMTuSJJ7BOidWNUNEdNpfV7zlbHTf2o=
X-Gm-Gg: AZuq6aKfv3+/9a6E9RQiI4/Y0UVhV5FM4GVtozYrXgFy2rLqJCyAXvqDnyocK2ZVwJO
	Gr5656LtkOFl4iIv0Q5x2IgbAIA4AFTlproOVZNwPZxXbDLzkHNuvFzCQJUuYIqoBgFpHrSU2l1
	zswwYlYsneAeDzAxCt2E27Yw1hfn14zErE6Q57CcadlA+MsTR0zxaOw+BPHFBY0/sxRy/ekkI3E
	pOnlD/J7U370i6F9ok5LrOH2lGTSNB4g4Rkrsjs9eYMxW7JBlV55VaaHfdU4nEsd+3ldOMr8zuW
	pEbMoXPTPgWueK0Rh1WhUJLJ7dD44nU11PEgEWFU5jd+et8VHQ2omhHjIc0BAq154eosPNfuijK
	TgGMzyyiBaw==
X-Received: by 2002:a05:7022:f86:b0:123:3364:2ca8 with SMTP id
 a92af1059eb24-1246aac4ac7mr5540316c88.39.1769072250797; Thu, 22 Jan 2026
 00:57:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120-imx8mm_gpu_power_domain-v2-1-be10fd018108@nxp.com>
In-Reply-To: <20260120-imx8mm_gpu_power_domain-v2-1-be10fd018108@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 22 Jan 2026 11:00:08 +0200
X-Gm-Features: AZwV_QizKXTxpcD509WTM7FJXkGnjUZe72Tjh_1y1VK3GaZGPTzVAx6Yhm6EfFE
Message-ID: <CAEnQRZDo3Y+m3+Pdq3QTaPi0M71NGAc40NxCw0c-GUuAQ5ZRhQ@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: imx: gpcv2: Fix the imx8mm gpu hang due to
 wrong adb400 reset
To: Jacky Bai <ping.bai@nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 7:54=E2=80=AFAM Jacky Bai <ping.bai@nxp.com> wrote:
>
> On i.MX8MM, the GPUMIX, GPU2D, and GPU3D blocks share a common reset
> domain. Due to this hardware limitation, powering off/on GPU2D or GPU3D
> also triggers a reset of the GPUMIX domain, including its ADB400 port.
> However, The ADB400 interface must always be placed into power=E2=80=91do=
wn
> before being reset.
>
> Currently the GPUMIX and GPU2D/3D power domains rely on runtime PM to
> handle dependency ordering. In some corner cases, the GPUMIX power=E2=80=
=91off
> sequence is skipped, leaving the ADB400 port active when GPU2D/3D resets.
> This causes the GPUMIX ADB400 port to be reset while still active,
> leading to unpredictable bus behavior and GPU hangs.
>
> To avoid this, refine the power=E2=80=91domain control logic so that the =
GPUMIX
> ADB400 port is explicitly powered down and powered up as part of the GPU
> power=E2=80=91domain on/off sequence. This ensures proper ordering and pr=
events
> incorrect ADB400 resets.
>
> Suggested by: Lucas Stach <l.stach@pengutronix.de>

Correct tag here is:

Suggested-by: Lucas Stach <l.stach@pengutronix.de>

Also, no need for a new line between tags.
>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
