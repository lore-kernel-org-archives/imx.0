Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C4A39FCD
	for <imx@lists.linux.dev>; Mon,  4 Mar 2024 11:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709552481; cv=none; b=b+o1W5/ARDyfRbbWj4GyLQSbHtmjCdDevNU1T8gm9xDwfsoEyT0ub5NPtyrYtZXs1NTROZtVJ1SvhtGTRYKvvf/EBUJ1DyBFiRnHrMyGupG5Pa64qLC/IiD1IsF2W90cQSJSvrZ73BAmYctnjzvr9J6U/AIMBG4PRYFvvAtlF3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709552481; c=relaxed/simple;
	bh=cYUSVmUyifdM6nM2L9Q0Fp5Qhn4DCDVKnUNjXiArGkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fF5o85AKv7cE0i2GWbym2GaxOXeizz24jVTup1XFH2ilr7DiPRG1ej9gJ1U4c5ATfQO0bBU7Has9XWkCMiX2lUKC0KKKz5HW5MHYYbtdtrsF4RIfBwl5J7PmUlRQEUAfjs40BiMb6F8wq54EXrLBpnn6a4C8GkoAAhApzYpC36Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6Xsb2m/; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6Xsb2m/"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a45670f9508so69348466b.0
        for <imx@lists.linux.dev>; Mon, 04 Mar 2024 03:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709552478; x=1710157278; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYUSVmUyifdM6nM2L9Q0Fp5Qhn4DCDVKnUNjXiArGkU=;
        b=c6Xsb2m/K3EpLuI32sLK8rAQvyrhhFEa42uxZkwGM5UZWDS+tGYbpxa4nGpMSgXFfd
         5UEDVke9i+k5TkeE/qoBtvQEnHFDgpTdEy5M+/mBhTgZjdjiv84WYeogfJ3yuLYdtGyo
         cfmBUOMD+YRN39HwnVY2LUKcJ3BIolrDdsMir2paGaNAh16Dn/Ktz7h6lRGJuw2rXNeI
         u/k0BgYF0UKFJ4YmsHnuXsTChRlVov4tcWIz/aDxQjlFStux+BJHz9KTkxZGsGFHqKMq
         0iK1E/qcL+kBg+5ewEXE8OoTdwpn0oYh8SS0zjdM5FdEdE8GoPFvFcQboYUG/CPE4m0R
         L19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709552478; x=1710157278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYUSVmUyifdM6nM2L9Q0Fp5Qhn4DCDVKnUNjXiArGkU=;
        b=GsEIZXR4Qp6m+X8jIZhc+iB1O5F1fY0b6PDZHk00mT60UXm6jljFDlhaiUEVVyPbdK
         giXIAVdIMXWtgLnguEeZiluqVWIYqXgKRRK2ia7gN7DmwHX/uJ1sVyCaKTio/EeZsNi4
         AP6ZU2VYgGju54nQMGg7ITaTrk8r637731fxuq+itIuRDtziGn3frJ/2fLoQYx2a4DDw
         3zjO5PxIsBeeca1ePfeQLt7WImSTtXIYpiYmUfI1ujYi/y80aRLBHxfYzYo8Wf5UW09w
         ySats8ZJP5QnzqAz7WnF9mB4ISDNiOfM9G4Sj/RrIjInJ0FWJTUDDDs3BnNKQRhwliUm
         u7zg==
X-Forwarded-Encrypted: i=1; AJvYcCUt802t6DgFjUx53J8DkEJ8kyhjduKsMyx8naYwSLsYQuSDJ66qDGGJPsGi/AK1UmNYdBXCYvDlJ++8uILfdkueTKye
X-Gm-Message-State: AOJu0YzBdfmPbpNA7+efeVFy8TOeSquiM3zYdB6+aGd31BedWYoYv31b
	usBsDAtmy4Bs7WvBpFzkbt+RU3CrMou6Fs56LQUIrtQIVNY1Odm93ZlMhRukgxEJgfxiAOiCITJ
	AvyOatfwWrHkXh7RzDYMr9JC8ePI=
X-Google-Smtp-Source: AGHT+IFmtUOyrS0e7mKw+lMMoMxfQ/YtHECP4CbZJ2nw54XaxiiPhL5Y89uhub/Ny/OhES4OZfvtxUI+UzxFM+Y17uQ=
X-Received: by 2002:a17:906:f81b:b0:a3e:d7fe:4c4d with SMTP id
 kh27-20020a170906f81b00b00a3ed7fe4c4dmr6225743ejb.57.1709552477581; Mon, 04
 Mar 2024 03:41:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240303-sdma_upstream-v1-0-869cd0165b09@nxp.com>
In-Reply-To: <20240303-sdma_upstream-v1-0-869cd0165b09@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 4 Mar 2024 13:41:05 +0200
Message-ID: <CAEnQRZCtxbHB--ZwkCtfF2RG+7GYkSjH6r6KY1wrp=H3Y2-_8w@mail.gmail.com>
Subject: Re: [PATCH 0/4] dmaengine: fsl-sdma: Some improvement for fsl-sdma
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, Nicolin Chen <b42378@freescale.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Joy Zou <joy.zou@nxp.com>, 
	Vipul Kumar <vipul_kumar@mentor.com>, 
	Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>, Robin Gong <yibin.gong@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 6:33=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> To: Vinod Koul <vkoul@kernel.org>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: NXP Linux Team <linux-imx@nxp.com>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: imx@lists.linux.dev
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Looks good to me. For all patches in the series.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
