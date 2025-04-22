Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A0281360
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 13:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327682; cv=none; b=NX3F9YexM+TEZIy/0bkN+Dygtq7ntWX4AqaoivbT+vRD3TSGvgUCF5YU5aMaRDWS7xfg193STexz2V6tGaWHNAOYjh7vNKZ9ijp0aH2irOi4wkGyJFJDIs8wYSXvyBOxUnZEcSikNMlWQMPlNwdbK29bmi7k5wqj+vOc7T+xOkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327682; c=relaxed/simple;
	bh=471gRc3HzjQUQw4PVwLo7uOoZBgByN/FB/87Co4jC+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Le/IpaLkkAStICWl6bNgJbqWQHdCazKA34XeA8BfT1K45dkdLB/WWg4fvOiIaRL6FSYZkRNRlhv3qF9VKea7XUtyjx6kW6M3JR5a6mk1eODl8lG32uWpngziYVift8l3WFLT/oC7pFojcw322SMGjYmtsFlRuX/+l5cSMAxQvTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OMm34r/a; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OMm34r/a"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abec8b750ebso749626466b.0
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745327678; x=1745932478; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zqq1b+/6XeRHzzRXttJKkEQgtsEyG1k8HuMNcYU8Wk=;
        b=OMm34r/aus8youPCvrT8qA8KR68fY4xOrJNOxPSoaLKdaqQjEYEdf7XjkB/PLydsH2
         XQrWKhbfUkQmcMqk09GFLgiEiBpMVJOdx+AetE6hsrSNr2IUUhv2XMyt7S5qJOPJPZgQ
         kHcaOMis6mYqKbib+elOqJjfzUChkVR7+RS5zKZdk0bPYvIO6bqyk4CBILBwCXPjTZCe
         17g8Splvq2JZ916SZqx/6FvK9crqt+B7gKM7yJFfvOwf7NEOBcsVwj8VkekyCaG5MDCo
         S8XAuHQ3i0XnV6YUmJcdbGcKhTjKwWzYr2wbtVUjsRD9gUIjs90ZGQX4rBmGWKc6REGU
         0bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745327678; x=1745932478;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zqq1b+/6XeRHzzRXttJKkEQgtsEyG1k8HuMNcYU8Wk=;
        b=MKkUUdK91R0S1uYtArETnsc6IYaSsmqTJ55C/FAjXJSKxoByIcXwr/D8By8B1otblk
         cBbMM3gpoh7NWu4AmOZcJqYiUDmxQFmdCM3T/umbjrChTJtpyYY7EFe9vfMb2he8ObPS
         ouzYP/u/vdp5qPzAP+mOJ4OGYJA/N5exgKlUdciTWNO5RH0h4F+K6rvihPq1dzfdKdX8
         293gGkvg5PZtan407MDtepqM3tdbLGwSz638FmHx9Gq0WsjldV2kYi9fiZzRrPpJ5o37
         IlshoDKyUgXbFwxfsMupBmcqIrkefzibmQZKL8gnYhUjMBssGb0yiHbJHnEfO6IkjpAY
         mp7g==
X-Forwarded-Encrypted: i=1; AJvYcCWnbW7gDVCQgx3w4gUEx6Q08QPLRMOmF4/W2WyWTJSxXTZH+vAP5i9XmegbehCYKDy3aCk=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm75IKUfB93HivKMK3JJ73dpkuoSZxRoSAc63QFR7KsIZkRum0
	PtbbS2ed2BFLI1IDF5je2jov3krCTncON06SQzaJzFnY7a4fCG7qGNBhe/GUx0A=
X-Gm-Gg: ASbGnctN/rXpCOvyQe6OrxQz8+6/b/zWgryNqwlzikcr6tctlBJtdR0RBekPNUc+/le
	+ur9HASlMm8rww5O0Wq7plhp4QRj3xfyw4S/pI8K+Im8fd7ke7vj4icLty07oHWLl/snmC/RRCJ
	8KDfvDVcupI/XjB71p+eYgRR2UQUC/nZadJNAFRp695K2jrOrvwLevZ6XHsbBlw9s90SyWVvEvV
	AIyTcKu0ZtmNmbSjdy9RiTk8spdV620kQhhe33V1R5ABtxdrgehhHbWeTKMq74HWb3fHuUC095b
	OCCxib2Th8cQH7WKEaTzYYeJXnLOH50dCqBg4w==
X-Google-Smtp-Source: AGHT+IHTXXC4b0G4QfA+kk60IhLLae377q0zTFxBB+eBZqx0IkvXugcFNIxSpugNQp492BWJKEid2g==
X-Received: by 2002:a17:907:1b17:b0:acb:3f1d:ca7e with SMTP id a640c23a62f3a-acb74af0066mr1171765766b.8.1745327677594;
        Tue, 22 Apr 2025 06:14:37 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef49e40sm650708166b.139.2025.04.22.06.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:14:36 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:14:34 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 00/18] Support spread spectrum clocking for i.MX8M
 PLLs
Message-ID: <aAeWOryhXosM0Rat@linaro.org>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
 <20250314093503.GD12210@nxa18884-linux>
 <CABGWkvq2X9L6P39K5OeQW4+c2OmSYGHN03mUW-96U5okO1CK5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvq2X9L6P39K5OeQW4+c2OmSYGHN03mUW-96U5okO1CK5A@mail.gmail.com>

On 25-04-11 10:38:17, Dario Binacchi wrote:
> On Fri, Mar 14, 2025 at 9:27 AM Peng Fan <peng.fan@oss.nxp.com> wrote:
> >
> > On Thu, Mar 06, 2025 at 12:27:49PM +0100, Dario Binacchi wrote:
> > >This version keeps the version v9 patches that can be merged and
> > >removes the patches that will need to be modified in case Peng's
> > >PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> > >The idea is to speed up the merging of the patches in the series
> > >that have already been reviewed and are not dependent on the
> > >introduction of the assigned-clocks-sscs property, and postpone
> > >the patches for spread spectrum to a future series once it becomes
> > >clear what needs to be done.
> > >
> > Although I give R-b, there is an idea just come out in my mind that this
> > might break OS distribution that use firmware(e.g. U-Boot) to publish
> > device tree for Linux Kernel, such as ARM System-Ready complaint OS.
> > I overlooked this point in previous patchset reviewing.
> >
> > Since this patchset is to move anatop stuff to a new driver to reflect
> > the HW truth.  And requires new entries in CCM node, so old bootloader
> > with new kernel will not boot for OS distribution, such as Fedora/openSuse.
> >
> > Not sure how to keep backwards support as before. Leave to maintainers
> > to say if they are ok with this.
> 
> Many thanks to Peng for the review, and a gentle ping to the maintainers.
> This series has been ongoing for a few months and has reached version 10,
> thanks to the reviews from Krzysztof and Peng.
> I kindly ask you to consider it as well.

Hi Dario,

Please rebase and resend. I intend to apply the clk ones. Hope Shawn
will apply the DT ones as well.

Thanks for this effort and sorry for the delays.

Abel

> 
> Thanks and regards,
> Dario
> 
> >
> > Regards,
> > Peng
> 
> 
> 
> -- 
> 
> Dario Binacchi
> 
> Senior Embedded Linux Developer
> 
> dario.binacchi@amarulasolutions.com
> 
> __________________________________
> 
> 
> Amarula Solutions SRL
> 
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
> 
> T. +39 042 243 5310
> info@amarulasolutions.com
> 
> www.amarulasolutions.com
