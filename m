Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0ED221F34
	for <imx@lists.linux.dev>; Sat, 10 May 2025 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746899843; cv=none; b=L4Xmz1r4tvaXEMBs65JGbhxLg+wTRZj60jj2DvAusE7TTyTqNkAANWMpdYRG9YSUxRzh94s5pQPv9rVvuL+rijXsWQ+45kOAoUtu+iwg4tJHQEjADvEbhmnAfO9ccCti8TdSygsqq6s1cC/nTcCvKDseT+ZbcFJ3/QtIF1s/Cu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746899843; c=relaxed/simple;
	bh=WjgGUfr6X08qxQK3zfVrb3aTo/x2kOH4Dzdn/sVCI8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoOTuRplzAL2Xa5N1ektQJ9rsuUWTD3EcaDsMPjyNqHxbiHWRZM6cxvI11qb7D05YJq4Y31k2CR7vKGK8zGResntxHsowuLg2C6QmCKEZP6UCCkyYkultjbabjPkFYMDQg394cwKG2s4QQ9NGfHyqvn1hYFWj5B/HERs40+38Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgO/7O3H; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgO/7O3H"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so4154619e87.2
        for <imx@lists.linux.dev>; Sat, 10 May 2025 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746899839; x=1747504639; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjgGUfr6X08qxQK3zfVrb3aTo/x2kOH4Dzdn/sVCI8Y=;
        b=EgO/7O3HSiYTWac6XN9naL0TZlxMJoHcFHfTBPNSdzQO71kseDocnTGgnJxUYRMtnA
         OC0qoIAiw/sqNAKqZO/eXrvwrk/9PN1sQhgMGR/2B9t33jpepfzKeTSOW2jHnpqQAqcL
         e9RvN6XK83WbKCl78wlaPKVU0+2eodcJdJpiG7ApDNmZ5D76bI3tomjnB0BnW/H7Plka
         wlCWSM2h7ITc99YTkagP+bQGtpv0ikOfZn+0Hy6fK5mG/H7ZBSDTWWZ09BNC/FdFJ0Up
         p+MXkBZBvfP/6nlT9IDArjs+RcJRzF1X66FiRFpW0N5BHm5Kyxb5iTEpm+hGoH1Alhz0
         roKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746899839; x=1747504639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjgGUfr6X08qxQK3zfVrb3aTo/x2kOH4Dzdn/sVCI8Y=;
        b=hPOvvCHqkE56q7BEn0d8Rx3wDLSUFa9ppZHxeymD/EC8GhGk/IIfTC/SiCBXcpXIJE
         rLlTsgLXrSz+Ppm1IoWBHXX8DQJ/sOnfQc5+jMBAeweT79v73/Z8tZFnivVnF908bZuR
         2O7mgGFmh4oezDzj7vW/nFkJxjUP5L55r1qmdV07ixHcDc7EqNuGGGQbT1SjwWrWZ9Zz
         jmWys+I0MJnsYXY/FH95gZXKjklPyL7jht3Of7GgTYGl3arTBHUtY5oBpgeHevw1JLOj
         HHmfWMqL3QzkYDpFcIVs2dfnv5zzShywALhpRO3kLXq0XLOhM0yZeDOnK+N3xCVJbU/O
         Z09w==
X-Forwarded-Encrypted: i=1; AJvYcCV+Jao6eYfFazDZoCX+3ATtuCTa2RqIC4OeyTAtxrDN3DuXaXqa4+sxGPIWk6YbjL1U0+c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRnOYvIo/m5Q05yPWstcqmMjZQJQALLV4Mh2zTCreiCSFNN6by
	UUjC2wL+hJRoB23+olTe01b1B5SFrnIAAzG806v1EZGT4+PUpnHLkBYavaePfRqKCeq/EntP3vU
	8OFwsXQqrP+UFXDi3crkKZT4HVJQ=
X-Gm-Gg: ASbGncv8/rNw4E81t5ql63NtjTiBTyhcC4uL6b6cd2gKYR1yOhZjOYNM4GokccOdtE6
	9Qb3j1rjS91eq8ymQ1qHYCoKkEd5oF3XWG1Fy2U3JKcALP0zdxHQI5FQVY16E274JrYJpd1oMRy
	fBFhr+5TFNGUISaVmgOwq4EpTaGnlNpSC+pFquCUqyE7vBYcJBNUGvIb2cqm+vYvx6
X-Google-Smtp-Source: AGHT+IF3Z7tQbN2UvUVUBVdgIrJ9vuxONRjESM/OBLUWaAOZrCvSkzujqqR6dmG4HVeFUAwt4imd8+AAeDimdibevQg=
X-Received: by 2002:a05:651c:30c6:b0:30c:7a7:e874 with SMTP id
 38308e7fff4ca-326c4569ba6mr34455471fa.11.1746899838943; Sat, 10 May 2025
 10:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250510011806.13470-1-benato.denis96@gmail.com> <20250510011806.13470-2-benato.denis96@gmail.com>
In-Reply-To: <20250510011806.13470-2-benato.denis96@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 10 May 2025 14:57:07 -0300
X-Gm-Features: AX0GCFu_Mc34XZBVrE6yFFGghE4cYWVtNs10oUnBiwd7enOu-iz8bicOZ1AybT8
Message-ID: <CAOMZO5A1oRcUuNVcr_kcKz0SZqGc-AHzLR+__gRQEaV__xKbsw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
To: Denis Benato <benato.denis96@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 10:18=E2=80=AFPM Denis Benato <benato.denis96@gmail.=
com> wrote:
>
> Define CONFIG_ARCH_NXP so that CONFIG_ARCH_MXC won't be disabled
> as it depends on CONFIG_ARCH_NXP.

This is not correct.

$ make imx_v4_v5_defconfig
#
# configuration written to .config
#
$ cat .config | grep CONFIG_ARCH_MXC
CONFIG_ARCH_MXC=3Dy

CONFIG_ARCH_NXP is an arm64 option.
