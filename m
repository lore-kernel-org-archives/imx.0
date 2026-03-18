Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C1C3321A2
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853568; cv=pass; b=IJty5GxqcmH6fCqnE79bkgCtUZjonj92uW5XEyzaE0spmA8D0ne/I4289revIT1edXrVMp65QwbxkLXA76J9ZsYKqOgzfhk0W9lYqrtmk3EVVrRoRw5QYO7zNpBZU3UeTOIxvVA5oKpEbXxDNtYTp3+PrUq31LznsgErYgVtIc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853568; c=relaxed/simple;
	bh=Hz8E05LdBGmu2bfAFeryryBDZivcDYI8jWINoREv7ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6tRMfd30kHBR9q+ePt2n/iffqE4Mut4s6tygGNQs/x1eTaNAVM6sqxDiMU/SAt7Wzn5F/m08DQ47Ioj+jSpD1+JgW88aoNXeb9ymGvee/+U0vry7s7jpn3HkfKqnEX+Xtw7Va+Ux5JZnXidIdY3xAcLPlHj/T+R6A1ReKlssxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TAVit3Pw; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TAVit3Pw"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-666ee394529so197491a12.1
        for <imx@lists.linux.dev>; Wed, 18 Mar 2026 10:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773853565; cv=none;
        d=google.com; s=arc-20240605;
        b=frsFnI30yNw3qgprNq1ZIQHw4MBm61g/xUQXALE8d7y3St3NtApcQSmcUxVJDrSjg0
         WicNj/T9m+bzahPOFZvcyr78ptXyKMNmb/aYLbwo2k3/0tEKFh3jmCdT3wpc8/ydxv0m
         IWObSadC6dyG33MeOwr6hD2bwdcicpXOD/+9DvkpjTA8mdZbSaZrjlaROmGWfLZoQr1J
         Qes2nnUvfOupuEKzAt0v6l1flVGmSuTeIykDmWdFO/Dag0zUhwvmEDwb2yZ0PvgW3s70
         yH1m/Tp5Pe+/GZVw3fFeoR7Cv6RO97J/WVi9hqHmuFBVqpSJvu6a3VIFmGLVd03+ZHdF
         wOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kATEDVmGF0/O9M3x0zcBp1yfg6DAeXFmwwnXfMoTIKM=;
        fh=Z259bDxeOR3BadN63qK0uxjJSFdkBXcl6c2Ihn6Lez4=;
        b=CTOHhWP4j/E8qDAj+BWJZrSQYUAOjgM6fv3OS2M5/uekPH/9nLhrnM2GZR2oSQPI+F
         xnUtTsYnBaiV9EASLHpwFqJP3VAEHlLpRi3FK36BG5UrDCrXzp+suuUGR070yzGW91lo
         vn62JO6e3SlcQ49tCftmozUMQcHrLU3rI5+xr6o+wgz7cJdGWnDsS61puvmyKD8K4q/C
         RJA1HGWMSkic2ByQh2bNeLPArMDG8qNlsyTuRJDQDatu25H4raHxwI3Ed9/W6HXT9Ce5
         ZVl2+n3QWdB2eerR188vm3m6ymeBmbiC1KVKzvw5ynDWSI2XJzT/Vk3YOaItNFu+rpQa
         EGDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773853565; x=1774458365; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kATEDVmGF0/O9M3x0zcBp1yfg6DAeXFmwwnXfMoTIKM=;
        b=TAVit3PwYpUEgPNulcvH1e0S9/aEP/u4KFCmC3mezATI2nLgGy9RsA2J/37RA6PeMT
         mU4h39wTrz88JtPAWcW44GLBBetc81JcPnaY0FU8q5ju+c0F5exVAWzUt3TgUlF8VhQ4
         nAIXjivzO876yZutBp+xZ/nWMRuGAo8JdPFR88xAiXgsw4PewVsh/yokD08Fqonjb7K6
         71Ec2mBaTbF2BWdpo2Qzd/po8fDx7Nl+8hoWNANpA6g8fFhx4tZee4wdUD7MrwqvcQ8W
         WI84j7YdabyhGaol4nN02Qc7MeFDeGGMEh89uhS7ijbwSVQmUbFPk1qDI4kXwSnHl0Oz
         Nmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773853565; x=1774458365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kATEDVmGF0/O9M3x0zcBp1yfg6DAeXFmwwnXfMoTIKM=;
        b=gmGmfwCwaaCX2XCUwAovbl7Gvqxx2pe6VlP/K8z9ofifF7ox+Ij8zLPHweOpTdwTte
         2VJOgI4V+6UDqaCwKia2Hsb2j9ViUBdFsdsq48Kd2Hg2xrwRRQX+j/FWrrHTtIRR+C8O
         zXQ5n0QYkrBaCWenYlS+qryphh+vOixOCAwQt7eAK2oHXJ6j4Le2XQcrOpTJbIbYLEfh
         WIIHZRlQHuXJfiCi+vv9wb1W2uZ4FqbKOq97o8eXM1orNnGbt4WoLSk0rEwJ+JoVGmEi
         fUODt3D6JJP5p8A6ygtTT5FcKlBop9dn9rR8n/LgPBnSULT71W6AqTYzOq7FHlLZgF7X
         IhAw==
X-Forwarded-Encrypted: i=1; AJvYcCX1iPHy6wA1sRk671V1fjX5+pULCkdPa+6Y9im3c89PeGeDbdGBpd6lSknBTGZhquv7lNA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp92Qr/WdesPCwYZHB0T0OI56SuEz1QFDPkImiv7m9TVKJ+dPd
	sAUm+GtNuZVSXQ6dIKoiiR0guHSfQGsu+4VD/yJJdtSjHhK9InsSFeovufaurXi8nmoJ3V8p8lJ
	crm+6sWUGd5dhWwPy63XV5Q6ZFV7nMlHOMQ06LY8=
X-Gm-Gg: ATEYQzzMtvEOfcOgFG8JaqbeDNAMuYoXOipzLd8eIEH7tYKIAyYKHJ9w6CpclVGeNjB
	hbiM+2adxX7vA5VDKPJenIVN17L5rm3MY3FmtJ+xdBQzTyQacMQkG3v6zns7fQIk1AgO7IxZOGW
	riKTcoXH5UFuCcfkAqLn0MZRZUFe+ZbLDQzd9U+RtRmPDSZD/tjyrFh42hA4bwLrclAwQXEEJvg
	h0OZ/milJ9KCAD0qlJLTRcvgyrwSi7SiooaNpJ0mg3+zUrG+WKAf9l6ro/AAX8aYXkzWMrruzUS
	Eb6D7ntYTepz07+I5dp0g7RkCbRbGE3LzvU=
X-Received: by 2002:a17:907:9946:b0:b73:4d06:bc8 with SMTP id
 a640c23a62f3a-b97f4b60eefmr194003266b.53.1773853564611; Wed, 18 Mar 2026
 10:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318073330.115808-1-guwen@linux.alibaba.com>
In-Reply-To: <20260318073330.115808-1-guwen@linux.alibaba.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 18 Mar 2026 10:05:52 -0700
X-Gm-Features: AaiRm51pAIUhiIslZYeLgnI5zv3XevZ8aLuUPYbmBN9fBas0fAu2t7Z9AQkAyFw
Message-ID: <CANDhNCoFxsXdP7d6nbLTFLOrB_4GnDvhF4O6ZGyvGEVoqV4U2g@mail.gmail.com>
Subject: Re: [PATCH 0/2] ptp: split non-NIC PHC drivers into the
 clock/timekeeping maintenance domain
To: Wen Gu <guwen@linux.alibaba.com>
Cc: tglx@kernel.org, tglx@linutronix.de, richardcochran@gmail.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, anna-maria@linutronix.de, frederic@kernel.org, 
	daniel.lezcano@kernel.org, sboyd@kernel.org, vladimir.oltean@nxp.com, 
	wei.fang@nxp.com, xiaoning.wang@nxp.com, jonathan.lemon@gmail.com, 
	vadim.fedorenko@linux.dev, yangbo.lu@nxp.com, svens@linux.ibm.com, 
	dwmw2@infradead.org, nick.shi@broadcom.com, ajay.kaher@broadcom.com, 
	alexey.makhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-fpga@vger.kernel.org, imx@lists.linux.dev, linux-s390@vger.kernel.org, 
	dust.li@linux.alibaba.com, xuanzhuo@linux.alibaba.com, mani@kernel.org, 
	imran.shaik@oss.qualcomm.com, taniya.das@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 12:33=E2=80=AFAM Wen Gu <guwen@linux.alibaba.com> w=
rote:
> - Following the model used by NTP related code, this series lists tip.git
>   (timers/core) as the integration tree for emulated PTP clocks in the
>   MAINTAINERS entry. Guidance from clock/timekeeping maintainers
>   (Thomas Gleixner, John Stultz, Anna-Maria Behnsen, Frederic Weisbecker,
>   Daniel Lezcano, Stephen Boyd) on whether this is the appropriate workfl=
ow
>   for this class of drivers would be appreciated.

While I'm sure it would be good to continue to CC folks, I'm not sure
if the timekeeping maintainers would be the right folks for these
driver/ptp/ changes to flow through.
Thomas has been doing the heavy lifting for a long while and I'd not
want to put more on his shoulders.

Richard is listed as the maintainer for drivers/ptp/, is there any
reason for it not to go through him?

thanks
-john
